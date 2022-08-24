package com.lanyuan.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanyuan.mapper.RoleMapper;
import com.lanyuan.pojo.Role;
import com.lanyuan.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleMapper mapper;

    @Override
    public PageInfo<Role> show(Integer pageNum, Integer pageSize, Role a) {
        PageHelper.startPage(pageNum,pageSize);
        List<Role> list = mapper.show(a);
        return new PageInfo<>(list);
    }

}
