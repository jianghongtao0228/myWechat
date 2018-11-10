package com.jht.wechat.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

    @RequestMapping("/test")
    public String test(){
        return "login/login";
    }

    @RequestMapping("/test2")
    public String test2(){return "this is my test1";}
}
