package com.nenu.innovation.controller;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * indexController
 *
 * @author: wychen
 * @time: 2017/4/2 15:49
 */
@Controller
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String toIndex(){
        return "/index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String toLogin(HttpServletRequest request,Model model){
        if(request.getSession().getAttribute("user") != null){
            User user = (User)request.getSession().getAttribute("user");
            if(user.getUsername().equals("admin")){
                return "index";
            }else{
                return "index";
            }
        }else{
            return "login";
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) throws Exception{
        try{
            if(userService.checkLogin(user)){
                request.getSession().setAttribute("user", user);
                return "redirect:index";
            }else{
                model.addAttribute("msg","登录失败，请重新输入！");
                return "login";
            }
        }catch (Exception e){
            model.addAttribute("error", e.getMessage());
            return "login";
        }
    }

    @RequestMapping(value = {"index"}, method = RequestMethod.GET)
    public String toIndex(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if(user != null ) {
            return "index";
        }else{
            return  "redirect:login";
        }
    }

    @RequestMapping(value = "error")
    public String toError(){
        return "error";
    }
}
