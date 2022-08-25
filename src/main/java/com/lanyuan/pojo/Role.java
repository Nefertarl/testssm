package com.lanyuan.pojo;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable {

    //一个角色 对应多个用户
    private List<Admin> adminList;

    private Integer id;

    private String rolename;

    private static final long serialVersionUID = 1L;

    public List<Admin> getAdminList() {
        return adminList;
    }

    public void setAdminList(List<Admin> adminList) {
        this.adminList = adminList;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", rolename=").append(rolename);
        sb.append("]");
        return sb.toString();
    }
}