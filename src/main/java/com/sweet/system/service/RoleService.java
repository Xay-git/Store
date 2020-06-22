package com.sweet.system.service;

import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.system.entity.Role;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sweet.system.model.XmSelect;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
public interface RoleService extends IService<Role> {

    LayuiPageInfo findPageBySpec(Role role);

    Integer deleteRoleMenuById(String roleId);

    void deleteRole(Role role);

    List<Map<String,String>> getMenusByRoleId(String roleId);

    List<XmSelect> getXmSelect();







}
