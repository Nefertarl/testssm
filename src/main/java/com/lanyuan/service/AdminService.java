package com.lanyuan.service;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Admin;

public interface AdminService {

    Admin login(Admin a);

    PageInfo<Admin> show(Integer pageNum, Integer pageSize,Admin a);

    int add(Admin a);

    int delete(Integer id);

    Admin selectById(Integer id);

    int update(Admin admin);


    //下面这两个方法是利用shiro而增加的两个方法
    Admin selectByUsernames(String username);


}
