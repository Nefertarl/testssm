package com.lanyuan.controller;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Role;
import com.lanyuan.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //验证
    @RequestMapping(value = "/checkRolename",produces = "text/html;charset=utf-8")
    @ResponseBody
    public String checkRolename(String rolename){
        Role u = rs.findByRolename(rolename);
        if (u==null){
            return "角色没重复";
        }else {
            return "角色不可用";
        }
    }

    @RequestMapping("/doAdd")
    public String doAdd(Role u){
        rs.addRole(u);
        return "redirect:/role/show";

    }

    @RequestMapping("/doDelRole")
    public String doDelRole(Integer id){
        int n = rs.doDelRole(id);
        return "redirect:/role/show";
    }

    @RequestMapping("/doBathDelRole")
    public String doBathDelRole(Integer[] ids){
        rs.doBathDelRole(ids);
        return "redirect:/role/show";
    }

}
