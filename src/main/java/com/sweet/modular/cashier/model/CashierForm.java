package com.sweet.modular.cashier.model;import lombok.Data;import lombok.experimental.Accessors;import java.math.BigDecimal;@Data@Accessors(chain = true)public class CashierForm {    //项目卖品id    private Long id;    private String name;    private String techId;    private String techName;    private Long memberCardId;    private BigDecimal pushMoney;}