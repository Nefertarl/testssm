package com.lanyuan.service;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Admin;

public interface AdminService {

    Admin login(Admin a);

    PageInfo<Admin> show(Integer pageNum, Integer pageSize,Admin a);

    Admin findByAcunt(String account);

    int addUser(Admin a);

    int doDelUser(Integer id);

    Admin findById(Integer id);

    void doBathDelUser(Integer[] ids);

    int doUpdateAdmin(Admin a);

}
