package com.lanyuan.mapper;

import com.lanyuan.pojo.Role;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    List<Role> show(Role a);

    Role findByRolename(String rolename);

    void doBathDelRole(Integer[] ids);

    List<Role> selectRoleByUid(Integer uid);

    List<Role> selectRoleAll();

    void removeRes(Integer rid);
}