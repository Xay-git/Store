package com.sweet.system.model;import lombok.Data;import lombok.experimental.Accessors;import java.util.Date;import java.util.List;@Data@Accessors(chain = true)public class MenuResult {    private static final long serialVersionUID = 1L;    private String menuId;    private String parentId;    private String menuName;    private String url;    private String perms;    private String icon;    private Integer type;    private Long orderNum;    private Date createTime;    private Date modifyTime;    private List<MenuResult> children;}