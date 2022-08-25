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

    @Override
    public Role findByRolename(String rolename) {
        return mapper.findByRolename(rolename);
    }

    @Override
    public int addRole(Role a) {
        return mapper.insertSelective(a);
    }

    @Override
    public int doDelRole(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public void doBathDelRole(Integer[] ids) {
        mapper.doBathDelRole(ids);
    }

    @Override
    public List<Role> selectRoleAll() {
        return mapper.selectRoleAll();
    }

    @Override
    public void removeRes(Integer rid) {
        mapper.removeRes(rid);
    }


}
