package com.sweet.modular.statistical.model;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Data
public class CardDateDetails {
    //日期
    private String dateYmd;
    //时间
    private String dateHms;
    //用户名
    private String dateCardUser;
    //卡金
    private BigDecimal dateCardAmount;
    //赠金
    private BigDecimal dateCardGiveAmount;
    //开卡 or 续卡
    private Integer selltype;

    //排序日期
    private Date datedesc;

}
