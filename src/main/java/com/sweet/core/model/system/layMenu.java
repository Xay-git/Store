package com.sweet.core.model.system;import lombok.Data;import lombok.experimental.Accessors;import java.util.List;/** * 左侧导航栏 */@Data@Accessors(chain = true)public class layMenu {    public String menuId;    public String title;    public String parentId;    public String icon;    public String url;    public boolean spread;    public List<layMenu> list;}