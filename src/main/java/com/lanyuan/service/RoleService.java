package com.lanyuan.service;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Role;

import java.util.List;

public interface RoleService {

    PageInfo<Role> show(Integer pageNum, Integer pageSize, Role a);

    Role findByRolename(String rolename);

    int addRole(Role a);

    int doDelRole(Integer id);

    void doBathDelRole(Integer[] ids);

    List<Role> selectRoleAll();

    void removeRes(Integer rid);

}
