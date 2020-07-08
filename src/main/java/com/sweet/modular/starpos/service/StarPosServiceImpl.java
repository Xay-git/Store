package com.sweet.modular.starpos.service;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.sweet.core.shiro.ShiroKit;
import com.sweet.core.util.HttpClientUtil;
import com.sweet.core.util.StringUtil;
import com.sweet.modular.starpos.model.BarcodePosPay;
import com.sweet.modular.starpos.model.RefundBarcodePay;
import com.sweet.modular.starpos.util.StarPosUtil;
import com.sweet.system.entity.Dept;
import com.sweet.system.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Map;
@Service
public class StarPosServiceImpl implements StarPosService{

    @Value("${starpos.orgNo}")
    public String orgNo;

    @Value("${starpos.mercId}")
    public String mercId;

    @Value("${starpos.signkey}")
    public String singkey;

    @Autowired
    DeptService deptService;


    @Override
    public BarcodePosPay buildPay(String amount, String authCode, String payChannel) {
        BarcodePosPay barcodePosPay = new BarcodePosPay();
        barcodePosPay.setOrgNo(orgNo);
        barcodePosPay.setMercId(mercId);

        String deptId = ShiroKit.getUser().getDeptId();
        Dept dept = deptService.getById(deptId);
        barcodePosPay.setTrmNo(dept.getTrmNo());

        barcodePosPay.setAmount(amount);
        barcodePosPay.setTotal_amount(amount);
        barcodePosPay.setAuthCode(authCode);
        barcodePosPay.setPayChannel(payChannel);
        barcodePosPay.setTradeNo(IdWorker.get32UUID());
         barcodePosPay.setTxnTime(StringUtil.getDateStringNow());
        return barcodePosPay;
    }

    @Override
    public Map excutePay(BarcodePosPay barcodePosPay) {
        Map posMap = createSignVale(BeanUtil.beanToMap(barcodePosPay));
        System.out.println("提交至starPos"+posMap);
        String res = HttpClientUtil.doPostJson(StarPosUtil.gatewayUrl, JSONUtil.toJsonStr(posMap));

        return JSON.parseObject(res);
    }

    @Override
    public Map refundBarcodePay(String orderNo) {
        RefundBarcodePay barcodePosPay = new RefundBarcodePay();
        barcodePosPay.setOrgNo(orgNo);
        barcodePosPay.setMercId(mercId);
        String deptId = ShiroKit.getUser().getDeptId();
        Dept dept = deptService.getById(deptId);
        barcodePosPay.setTrmNo(dept.getTrmNo());

        barcodePosPay.setTradeNo(IdWorker.get32UUID());
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
        sb.append(singkey);
        String signValue= SecureUtil.md5(sb.toString());
        posMap.put("signValue",signValue);
        return posMap;
    }
}
