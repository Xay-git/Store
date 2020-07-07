package com.sweet.modular.statistical.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

@Data
public class CardStatistical {
    //卡分类
    private String name;
    //开卡数量
    private Integer cardCount;
    //开卡人次
    private Integer cardUserCount;
    //开卡总额
    private BigDecimal cardAmount;
    //开卡赠送总额金额
    private BigDecimal cardGiveAmount;
    //续卡数量
    private Integer chargedCount;
    //续卡总额
    private BigDecimal chargedAmount;
    //续卡赠送总额
    private BigDecimal chargedGiveAmount;

    private List<CardDateDetails> cardDateDetailsList;

}
