package com.sweet.modular.starpos.model;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class BarcodePosPay extends StarPos {
    /**
     * 实付金额 单位 分
     */
    private String amount;
    /**
     * 订单总金额 单位 分
     */
    private String total_amount;
    /**
     * 读取用户微信或支付宝中的条码或者二维码信息
     */
    private String authCode;
    /**
     * 支付渠道
     */
    private String payChannel;
}
