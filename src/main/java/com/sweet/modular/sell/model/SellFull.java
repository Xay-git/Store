package com.sweet.modular.sell.model;

import lombok.Data;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

@Data
@Accessors(chain = true)
public class SellFull {
    private BigDecimal money;
    private BigDecimal realAmount;
    private Integer count;

}
