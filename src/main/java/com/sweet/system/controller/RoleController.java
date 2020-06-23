package com.sweet.system.controller;


import com.sweet.core.model.ResultBean;
import com.sweet.core.model.system.LayuiPageInfo;
import com.sweet.system.entity.Role;
import com.sweet.system.entity.RoleMenu;
import com.sweet.system.service.RoleMenuService;
import com.sweet.system.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author wxl
 * @since 2019-11-20
 */
@Controller
@RequestMapping("/admin/role")
public class RoleController {

    @Autowired
    RoleService roleService;

    @Autowired
    RoleMenuService roleMenuService;

    @RequestMapping("")
    public String roleList(){
        return "/system/role/role";
    }

    @RequestMapping("/role_edit")
    public String role_edit(){
        return "/system/role/role_edit";
    }
    /**
     * 配置角色页面
     * @param role
     * @return
     */
    @RequestMapping("/role_menu")
    public String role_menu(){
        return "/system/role/role_menu";
    }

    /**
     * 获得角色数据
     * @param role
     * @return
     */
    @RequestMapping("/getRoleDetail")
    @ResponseBody
    public ResultBean getRoleDetail(String roleId){
        Role role = roleService.getById(roleId);
        return ResultBean.success(role);
    }
    /**
     * 修改角色数据
     * @param role
     * @return
     */
    @RequestMapping("/editRole")
    @ResponseBody
    public ResultBean editRole(Role role){
        roleService.saveOrUpdate(role);
        return ResultBean.success(role);
    }

    @RequestMapping("/delRole")
    @ResponseBody
    public ResultBean delRole(Role role){
        roleService.deleteRole(role);
        return ResultBean.success(role);
    }

    /**
     * 获得角色分页数据
     * @param role
     * @return
     */
    @RequestMapping("/getRoleList")
    @ResponseBody
    public LayuiPageInfo getRoleList(Role role){
        return roleService.findPageBySpec(role);
    }
    /**
     * 获得角色对应的菜单
     * @param role
     * @return
     */
    @RequestMapping("/getAuthority")
    @ResponseBody
    public ResultBean getAuthority(String roleId){
        List<Map<String,String>> list = roleService.getMenusByRoleId(roleId);
        List<String> topMenuList = new ArrayList<>();
        List<String> menuList = new ArrayList<>();
        list.stream().forEach(map->{
            String pid = map.get("pid");
            String mid = map.get("mid");
            if(pid.equals("0")) {
                topMenuList.add(mid);
            }else{
                menuList.add(mid);
            }
        });

        Iterator<String> iterator = topMenuList.iterator();
        top:while (iterator.hasNext()) {
            String topMenuId = iterator.next();
            for (int j = 0; j < list.size(); j++) {
                String pid = list.get(j).get("pid");
                if(pid.equals(topMenuId)){
                    iterator.remove();
                    continue top;
                }
            }
        }


        if(topMenuList!=null){
            menuList.addAll(topMenuList);
        }
        return ResultBean.success(menuList);
    }
    /**
     * 设置角色对应的菜单
     * @param role
     * @return
     */
    @RequestMapping("/setAuthority")
    @ResponseBody
    @Transactional
    public ResultBean setAuthority(String roleId,@RequestParam(value = "menuIds[]")String[] menuIds){
        roleService.deleteRoleMenuById(roleId);

        if(menuIds.length>0){
            for(String menuId:menuIds){
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setRid(roleId);
                roleMenu.setMid(menuId);
                roleMenuService.save(roleMenu);
            }
        }
        return ResultBean.success();
    }

}
