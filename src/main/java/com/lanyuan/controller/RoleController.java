package com.lanyuan.controller;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Role;
import com.lanyuan.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    RoleService rs;

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1")Integer pageNum, @RequestParam(defaultValue = "2")Integer pageSize, Map m, HttpSession session, Role role){

        if(role.getRolename()!=null){
            session.setAttribute("search2",role);
        }else{
            role = (Role) session.getAttribute("search2");
        }
        PageInfo<Role> p = rs.show(pageNum,pageSize,role);
        m.put("p",p);

        return "/role/list";
    }

    @RequestMapping("/toAdd")
    public String toAdd(HttpSession session){
        return "/role/add";
    }

}
