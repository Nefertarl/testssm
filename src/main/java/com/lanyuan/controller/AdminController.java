package com.lanyuan.controller;

import com.lanyuan.pojo.Admin;
import com.lanyuan.service.AdminService;
import com.lanyuan.util.CodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    AdminService as;

    @RequestMapping("/getCode")
    public void getCode(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CodeUtil.processRequest(req,resp); //底层会返回图片,同时验证码存session
        String code =(String) session.getAttribute("randomCode");
        System.err.println("验证码是["+code+"]");
    }

    @RequestMapping("/logins")
    public String logins(Map m, Admin a, HttpSession session, String code){
        String ran =(String) session.getAttribute("randomCode");
        if(ran.equalsIgnoreCase(code)){
            // 把从前台传入过来的密码进行md5加密,和数据库密码匹配
            // 注册功能输入的密码,也需要先加密后存储数据库
            //a.setPassword(MD5.MD5Code(a.getPassword()));
            //admin-->role--->List<Menu>
            Admin admin = as.login(a);
            if(admin!=null){
                session.setAttribute("admin",admin);
                return "redirect:/toHome";
            }else m.put("error","账号密码输入错误");
        }else {
            m.put("error","验证码输入错误");
        }
        return "forward:/toLogin";
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
