package com.lanyuan.controller;

import com.lanyuan.pojo.Admin;
import com.lanyuan.service.AdminService;
import com.lanyuan.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;

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

    @RequestMapping("/toList")
    public String toList(){
        return "/admin/list";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/toLogin";
    }

}
