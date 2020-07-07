package com.sweet.modular.starpos.service;

import com.sweet.modular.starpos.model.BarcodePosPay;

import java.util.Map;

public interface StarPosService {
    public BarcodePosPay buildPay(String amount,String authCode,String payChannel);
    public Map excutePay(BarcodePosPay barcodePosPay);
    public Map refundBarcodePay(String orderNo);
}
