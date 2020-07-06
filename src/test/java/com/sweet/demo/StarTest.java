package com.sweet.demo;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.sweet.core.util.HttpClientUtil;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.starpos.model.BarcodePosPay;
import com.sweet.modular.starpos.util.StarPosUtil;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Map;

public class StarTest {
    public static BarcodePosPay buildPayData() {
        BarcodePosPay barcodePosPay = new BarcodePosPay();
        barcodePosPay.setAmount("1");
        barcodePosPay.setTotal_amount("1");
        barcodePosPay.setAuthCode("134974490920529826");
        barcodePosPay.setMercId(StarPosUtil.mercId);
        barcodePosPay.setOrgNo(StarPosUtil.orgNo);
        barcodePosPay.setPayChannel("WXPAY");
        barcodePosPay.setTradeNo(IdWorker.get32UUID());
        barcodePosPay.setTrmNo(StarPosUtil.trmNo);
        barcodePosPay.setTxnTime(StringUtil.getDateStringNow());
        return barcodePosPay;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        BarcodePosPay barcodePosPay = buildPayData();
        Map posMap = BeanUtil.beanToMap(barcodePosPay);
        posMap = StarPosUtil.sortMapByKey(posMap);
        StringBuffer sb =StarPosUtil.getValueStr(posMap);
        sb.append(StarPosUtil.signkey);
        String signValue= SecureUtil.md5(sb.toString());
        posMap.put("signValue",signValue);
        System.out.println(posMap);
        String res = HttpClientUtil.doPostJson(StarPosUtil.gatewayUrl, JSONUtil.toJsonStr(posMap));
        Map map = JSON.parseObject(res);
        System.out.println(map);
        String message = (String) map.get("message");
        System.out.println(message);
        System.out.println(URLDecoder.decode(message,"utf-8"));

    }
}
