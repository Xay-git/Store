package com.sweet.modular.cashier.model;import lombok.Data;import lombok.experimental.Accessors;import java.math.BigDecimal;@Data@Accessors(chain = true)public class ProductForm extends CashierForm{    private BigDecimal amount;    private BigDecimal realAmount;    private BigDecimal discount;    private Integer productType;}