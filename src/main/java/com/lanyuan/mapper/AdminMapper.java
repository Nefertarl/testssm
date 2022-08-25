package com.lanyuan.mapper;

import com.lanyuan.pojo.Admin;
import org.apache.ibatis.annotations.Param;

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

    Admin findByAcunt(String account);

    Admin findById(Integer id);

    void doBathDelUser(Integer[] ids);

    List<Admin> selectAdminByRid(Integer rid);

    void removeUes(Integer uid);

    void addUes(@Param("uid") Integer uid, @Param("r") Integer r);

}