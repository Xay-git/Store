package com.sweet.modular.statistical.model;

import lombok.Data;

import java.math.BigDecimal;
import java.util.List;

/**
 * 项目统计
 */
@Data
public class CategoryStatistical {
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
    private BigDecimal categoryAmount;
    /**
     * 项目明细
     */
    private List<CategoryStatisticalList> list;
}
