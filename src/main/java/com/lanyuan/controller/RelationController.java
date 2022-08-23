package com.lanyuan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/relation")
public class RelationController {

    @RequestMapping("/toList")
    public String toList(){
        return "/relation/list";
    }

}
