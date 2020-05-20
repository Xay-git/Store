package com.sweet.modular.sell.model;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

@Data
@Accessors(chain = true)
public class SellSort {
    private String name;
    private BigDecimal amount;
    private Long count;
    private Integer type;
}
