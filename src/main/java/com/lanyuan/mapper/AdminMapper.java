package com.lanyuan.mapper;

import com.lanyuan.pojo.Admin;

import java.util.List;

public interface AdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);

    Admin login(Admin a);

    List<Admin> show(Admin a);

    //根据用户名,查询用户信息
    //Admin selectByUsernames(String username);
}