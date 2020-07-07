package com.sweet.modular.starpos.model;


import lombok.Data;
import lombok.experimental.Accessors;
import org.hibernate.validator.constraints.Length;
import org.springframework.beans.factory.annotation.Value;

@Data
@Accessors(chain = true)
public class StarPos {

    /**
     * 操作系统 3直连
     */
    private String opSys = "3";
    /**
     * 字符集 00 gbk
     */
    private String characterSet = "00";
    /**
     * 机构号
     */
    private String orgNo;
    /**
     * 商户号
     */
    private String mercId;
    /**
     * 设备号
     */
    private String trmNo;
    /**
     * 商户单号 交易流水号
     */
    private String tradeNo;
    /**
     * 交易时间 20170527153245
     */
    private String txnTime;
    /**
     * 签名方式
     */
    private String signType = "MD5";
    /**
     * 签名域
     */
    private String signValue;
    /**
     * 版本号
     */
    private String version = "V1.0.0";



}
