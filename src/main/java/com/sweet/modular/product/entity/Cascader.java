package com.sweet.modular.product.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Data;
import lombok.experimental.Accessors;

import java.util.ArrayList;
import java.util.List;

@Data
@Accessors(chain = true)
public class Cascader<T> {
    private String value;
    private String label;
    @JsonInclude(value= JsonInclude.Include.NON_DEFAULT)
    private List<Cascader> children = new ArrayList<>();
    private T other;

    public Cascader(String value, String label) {
        this.value = value;
        this.label = label;
    }
}
