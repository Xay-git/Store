package com.sweet.modular.starpos.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.sweet.core.util.HttpClientUtil;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.starpos.model.BarcodePosPay;
import com.sweet.modular.starpos.model.RefundBarcodePay;
import com.sweet.modular.starpos.util.StarPosUtil;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class StarPosServiceImpl implements StarPosService{
    @Override
    public Map excutePay(String amount, String authCode, String payChannel) {
        BarcodePosPay barcodePosPay = new BarcodePosPay();
        barcodePosPay.setAmount(amount);
        barcodePosPay.setTotal_amount(amount);
        barcodePosPay.setAuthCode(authCode);
        barcodePosPay.setMercId(StarPosUtil.mercId);
        barcodePosPay.setOrgNo(StarPosUtil.orgNo);
        barcodePosPay.setPayChannel(payChannel);
        barcodePosPay.setTradeNo(IdWorker.get32UUID());
        barcodePosPay.setTrmNo(StarPosUtil.trmNo);
        barcodePosPay.setTxnTime(StringUtil.getDateStringNow());
        Map posMap = createSignVale(BeanUtil.beanToMap(barcodePosPay));
        String res = HttpClientUtil.doPostJson(StarPosUtil.gatewayUrl, JSONUtil.toJsonStr(posMap));
        return JSON.parseObject(res);
    }

    @Override
    public Map refundBarcodePay(String orderNo) {
        RefundBarcodePay barcodePosPay = new RefundBarcodePay();
        barcodePosPay.setMercId(StarPosUtil.mercId);
        barcodePosPay.setOrgNo(StarPosUtil.orgNo);
        barcodePosPay.setTradeNo(IdWorker.get32UUID());
        barcodePosPay.setTrmNo(StarPosUtil.trmNo);
        barcodePosPay.setTxnTime(StringUtil.getDateStringNow());

        barcodePosPay.setOrderNo(orderNo);
        Map posMap = createSignVale(BeanUtil.beanToMap(barcodePosPay));
        System.out.println(JSONUtil.toJsonStr(posMap));
        String res = HttpClientUtil.doPostJson(StarPosUtil.gatewayRefundUrl, JSONUtil.toJsonStr(posMap));
        return JSON.parseObject(res);
    }

    public Map createSignVale(Map posMap){
        posMap = StarPosUtil.sortMapByKey(posMap);
        StringBuffer sb =StarPosUtil.getValueStr(posMap);
        sb.append(StarPosUtil.signkey);
        String signValue= SecureUtil.md5(sb.toString());
        posMap.put("signValue",signValue);
        return posMap;
    }
}
