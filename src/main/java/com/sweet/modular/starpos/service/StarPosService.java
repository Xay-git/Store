package com.sweet.modular.starpos.service;

import java.util.Map;

public interface StarPosService {
    public Map excutePay(String amount,String authCode,String payChannel);
    public Map refundBarcodePay(String orderNo);
}
