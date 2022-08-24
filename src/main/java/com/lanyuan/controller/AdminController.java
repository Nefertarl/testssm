package com.lanyuan.controller;

import com.github.pagehelper.PageInfo;
import com.lanyuan.pojo.Admin;
import com.lanyuan.service.AdminService;
import com.lanyuan.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@CrossOrigin
public class AdminController {

    @Autowired
    AdminService as;

    @RequestMapping("/getCode")
    public void getCode(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CodeUtil.processRequest(req,resp); //底层会返回图片,同时验证码存session
        ServletContext application = session.getServletContext();
        String code2 =(String) application.getAttribute("randomCode2");
        System.err.println("application存的验证码是["+code2+"]");
    }

    @RequestMapping("/logins")
    public String logins(String account, String password, String code, HttpSession session,Map m){
        ServletContext application = session.getServletContext();
        String ran2 =(String) application.getAttribute("randomCode2");
        Admin a = new Admin(account,password);
        if(ran2.equalsIgnoreCase(code)){
            Admin admin = as.login(a);
            if(admin!=null){
                session.setAttribute("admin",admin);
                return "/home";
            }else m.put("error","账号密码输入错误");
        }else {
            m.put("error","验证码输入错误");
        }
        return "/login";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/toLogin";
    }

    @RequestMapping("/show")
    public String show(@RequestParam(defaultValue = "1")Integer pageNum,@RequestParam(defaultValue = "2")Integer pageSize, Map m, HttpSession session,Admin a){
        if(a.getSex()!=null){
            a.setSex(a.getSex().equals("男")?"1":"0");
        }
        if(a.getAccount()!=null || a.getName()!=null || a.getSex()!=null){
            session.setAttribute("search",a);
        }else{
            a = (Admin) session.getAttribute("search");
        }
        PageInfo<Admin> p = as.show(pageNum,pageSize,a);
        m.put("p",p);
        //调用角色业务层,查询所有角色信息存储起来
        //List<Role> listRole=rs.queryAll();
        //session.setAttribute("listRole",listRole);
        return "/admin/list";
    }

}
