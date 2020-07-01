package com.sweet.modular.product.entity;

import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

@Data
@Accessors(chain = true)
public class Test {
    private Integer a;
    private Boolean b;

}
