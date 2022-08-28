package com.project.instagramcloneteam5.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @GetMapping("/test")
    public String test(){
        String tesStr = "test check";
        System.out.println(tesStr);
        return tesStr;
    }
}
