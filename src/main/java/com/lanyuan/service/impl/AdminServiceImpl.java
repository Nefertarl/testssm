package com.lanyuan.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanyuan.mapper.AdminMapper;
import com.lanyuan.pojo.Admin;
import com.lanyuan.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper mapper;

    @Override
    public Admin login(Admin a) {
        return mapper.login(a);
    }

    @Override
    public PageInfo<Admin> show(Integer pageNum, Integer pageSize,Admin a) {
        PageHelper.startPage(pageNum,pageSize);
        List<Admin> list = mapper.show(a);
        return new PageInfo<>(list);
    }

    @Override
    public Admin findByAcunt(String account) {
        return mapper.findByAcunt(account);
    }

    @Override
    public int addUser(Admin a) {
        return mapper.insertSelective(a);
    }

    @Override
    public int doDelUser(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public Admin findById(Integer id) {
        return mapper.findById(id);
    }

    @Override
    public void doBathDelUser(Integer[] ids) {
        mapper.doBathDelUser(ids);
    }

    @Override
    public int doUpdateAdmin(Admin a) {
        return mapper.updateByPrimaryKeySelective(a);
    }

    @Override
    public void removeUes(Integer uid) {
        mapper.removeUes(uid);
    }

    @Override
    public void addUes(Integer uid, Integer[] rid) {
        for (Integer r : rid) {
            mapper.addUes(uid,r);
        }
    }


}
