const api = {    // 公共接口开始    //获得用户的左侧导航菜单    getNav:() => {        return request.fetch("/admin/common/navTree");    },    //获得角色多选数据    getRoleXmSelect:()=>{        return request.fetch("/admin/common/getXmSelect");    },    //获得菜单树    getMenuTree:()=>{        return request.fetch('/admin/common/menuTree');    },    //登录    login: (data)=>{        return request.post("/admin/auth/loginSubmit", data);    },    //注册    register: (data)=>{        return request.post("/admin/auth/registerSubmit", data);    },    // 公共接口结束    //获得菜单表格树    getMenuTableTree: () => {        return request.fetch('/admin/menu/tableTree');    },    //获得所有菜单    getMenulist: ()=>{        return request.fetch('/admin/menu/menulist');    },    //添加/修改菜单    editMenu: (data) => {        return request.post("/admin/menu/editMenu", data);    },    //添加/修改菜单    deleteMenu: (data) => {        return request.post("/admin/menu/delMenu", data);    },    //获得菜单详情    getMenuDetail:(menuId) => {        return request.fetch("/admin/menu/getMenuDetail", {menuId: menuId});    },    //获得机构树    getDeptTree: () => {        return request.fetch('/admin/dept/tree');    },    //获得所有机构    getDeptList: () => {        return request.fetch('/admin/dept/list');    },    //获得机构详情    getDeptDetail:(deptId) => {        return request.fetch("/admin/dept/getDeptDetail", {deptId: deptId});    },    //添加机构节点    addDeptNode: (deptId) => {        return request.post("/admin/dept/addDeptNode", {deptId: deptId});    },    //添加/修改机构    editDept: (data) => {        return request.post("/admin/dept/editDept",data );    },    //删除机构    delDept: (id,title) => {        return request.post("/admin/dept/delDept", {deptId:id});    },    //添加/修改用户    editUser: (data) => {        return request.post("/admin/user/editUser", data);    },    //删除用户    delUser: (data) => {        return request.post("/admin/user/delUser", data);    },    //添加/修改用户    resetPassword: (user) => {        return request.post("/admin/user/resetPassword", user);    },    //添加/修改用户    editPassword: (data) => {        return request.post("/admin/user/editPassword", data);    },    //获得用户详情    getUserDetail:(userId) => {        return request.fetch("/admin/user/getUser", {userId: userId});    },    //获得用户角色    getUserRole:(userId) => {        return request.fetch("/admin/user/getUserRole", {userId: userId});    },    //获得角色详情    getRoleDetail:(roleId) => {        return request.fetch("/admin/role/getRoleDetail", {roleId: roleId});    },    //添加/修改角色    editRole: (data) => {        return request.post("/admin/role/editRole", data);    },    //添加/修改角色    delRole: (data) => {        return request.post("/admin/role/delRole", data);    },    //设置权限    setAuthority(roleId,menuIds,fun){        return request.$postData("/admin/role/setAuthority", {roleId:roleId,menuIds:menuIds},(res)=>{            fun(res)        });    },    //获取权限    getAuthority:(roleId) => {        return request.fetch("/admin/role/getAuthority", {roleId: roleId});    },    //获得文件列表    getFileList:(ids) =>{        return request.fetch("/admin/common/getFiles",{fileIds:ids});    },    //获得数据字典类型列表    getDicTypeList:() =>{        return request.fetch("/admin/dictType/getDictTypeList");    },    //根据类型map获得数据字典    getDictList:(data) =>{        return request.post("/admin/dict/getDictListByTypeId",JSON.stringify(data),'json');    },    //根据类型map获得数据字典    getDictDetail:(dictId) =>{        return request.fetch("/admin/dict/getDictByTypeId",{dictId:dictId});    },    //获得当前登录人对象    getLoginUser:() =>{        return request.fetch("/admin/common/getLoginUser");    },    getCardList:() =>{        return request.fetch("/admin/card/getCardList");    },    getTechnicians:() =>{        return request.fetch("/admin/user/getTechnicians");    },    dict:{        comefrom:'072bc1f49bd310dfbe5773062e83684f',    },    dictDetail:{        comfrom:'6bf2f9bf0e35e5578ddecc7f2d763ed1'    }}