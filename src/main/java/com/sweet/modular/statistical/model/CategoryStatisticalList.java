package com.sweet.modular.statistical.model;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 项目明细
 */
@Data
public class CategoryStatisticalList {
    /**
     * 项目名
     */
    private String name;
    /**
     * 总个数
     */
    private int count;
    /**
     * 总金额
     */
    private BigDecimal countAmount;
    /**
     * 零售价
     */
    private BigDecimal amount;
    /**
     * 会员价
     */
    private BigDecimal memberAmount;
    /**
     * 男客
     */
    private int man;
    /**
     * 女客
     */
    private int woman;
    /**
     * 散客
     */
    private int userFalse;

}
