package com.sweet.modular.stock;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.math.BigDecimal;

@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
public class StockDto {
    private Long id;
    private String name;
    private Long count;
}
