package com.sweet.modular.statistical.model;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;

/**
 * 员工统计详情
 */
@Data
public class UserTechStatistical {
    /**
     * 技师名
     */
    private String userName;
    /**
     * 总量
     */
    private  int techCount;
    /**
     * 项目名
     */
    private String name;
    /**
     *  开卡 or 续卡
     */
    private Integer selltype;
    /**
     * 个数
     */
    private int number;
    /**
     * 总金额
     */
    private BigDecimal Amount;
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
