package com.sweet.modular.starpos.service;

import com.sweet.modular.starpos.model.BarcodePosPay;

import java.util.Map;

public interface StarPosService {
    public  final String TxnCode_scanPhone = "N001";
    public  final String TxnCode_refund = "L005";


    public BarcodePosPay buildPay(String amount,String authCode,String payChannel);
    public Map excutePay(BarcodePosPay barcodePosPay);
    public Map refundBarcodePay(String orderNo);
}
