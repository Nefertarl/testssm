package com.lanyuan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspController {

    @RequestMapping("/toLogin")
    public String toLogin(){
        return "/login";
    }

}
