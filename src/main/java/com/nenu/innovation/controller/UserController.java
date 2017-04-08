package com.nenu.innovation.controller;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * UserController
 *
 * @author: wychen
 * @time: 2017/4/8 20:35
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String toList(Model model){
        try{
            List<User> users = userService.listAll();
            model.addAttribute("userList",users);
            return "/userManagement/list";
        }catch (Exception e){
            return "error";
        }
    }

}
