package com.sweet.system.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sweet.system.entity.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sweet.system.model.XmSelect;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
public interface RoleMapper extends BaseMapper<Role> {
    //通过用户名查询角色
    List<Role> findRoleByUserName(@Param("userName") String userName);
    //角色分页数据
    Page<Role> customPageList(Page page, @Param("param") Role role);
    //删除角色菜单表角色Id数据
    @Delete("delete from t_role_menu where rid = #{roleId}")
    Integer deleteRolesById(@Param("roleId") String roleId);
    @Delete("delete from t_user_role where rid = #{roleId}")
    Integer deleteUserRolesById(@Param("roleId") String roleId);
    //通过角色Id查询菜单
    @Select("select a.mid,b.PARENT_ID pid from t_role_menu a left join t_menu b on a.mid = b.menu_id where rid = #{roleId}  order by create_time asc")
    List<Map<String,String>> getMenusByRoleId(@Param("roleId") String roleId);
    //获得权限多选下拉框数据
    @Select("select role_id value,name from t_role order by create_time asc")
    List<XmSelect> getXmSelect();


}
