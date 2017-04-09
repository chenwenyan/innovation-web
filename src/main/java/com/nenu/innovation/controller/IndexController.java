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

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String toIndex(){
        return "/index";
    }

    /**
     * 去登录页
     *
     * @param request
     * @return
     */
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
            return "/display/login";
        }
    }

    /**
     * 用户登录
     *
     * @param user
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) throws Exception{
        try{
            if(userService.checkLogin(user)){
                request.getSession().setAttribute("user", user);
                return "redirect:index";
            }else{
                model.addAttribute("login_err","登录失败，请重新输入！");
                return "display/login";
            }
        }catch (Exception e){
            model.addAttribute("error", e.getMessage());
            return "display/login";
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

    /**
     * 去注册页
     *
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public String toRegister(){
        return "display/register";
    }

    /**
     * 用户注册
     *
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "register", method = RequestMethod.POST)
    public String register(User user, Model model){
        if(user.getUsername().isEmpty()||user.getPassword().isEmpty()){
            model.addAttribute("msg","账号或密码为空，请重新注册！");
            return "display/register";
        }
        try{
            if(!userService.checkExistByUsername(user.getUsername())){
                user.setType(2);
                userService.newUser(user);
                model.addAttribute("msg","注册成功!");
                return "display/login";
            }else{
                model.addAttribute("msg","该用户已经存在，请重新注册");
                return "display/register";
            }
        }catch (Exception e){
            model.addAttribute("msg", e.getMessage());
            return "display/register";
        }
    }

    @RequestMapping(value = "error")
    public String toError(){
        return "error";
    }
}
