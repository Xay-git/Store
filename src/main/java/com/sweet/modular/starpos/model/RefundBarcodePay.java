package com.sweet.modular.starpos.model;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class RefundBarcodePay extends  StarPos{
    private String orderNo;
}
