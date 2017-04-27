package com.nenu.innovation.controller;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.UserService;
import com.nenu.innovation.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    @RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
    public String toIndex(HttpServletRequest request, HttpServletResponse response,
                          Model model) {
        try {
            if (request.getSession().getAttribute("user") != null) {
                User user = UserUtils.setUserSession(request,model);
                model.addAttribute("user", user);
                return "redirect:user";
            } else {
                return "management/login";
            }
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) throws Exception {
        try {
            if (userService.checkLogin(user)) {
                user = userService.queryByNameAndPassword(user.getUsername(),user.getPassword());
                request.getSession().setAttribute("user", user);
                return "redirect:article";
            } else {
                model.addAttribute("msg", "输入信息有误，请重新输入！");
                model.addAttribute("isRedirect", true);
                return "management/login";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = {"index"}, method = RequestMethod.GET)
    public String toIndex(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            return "redirect:user";
        } else {
            return "redirect:login";
        }
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        request.getSession().setAttribute("user", null);
        return "redirect:/login";
    }

    @RequestMapping(value = "error", method = RequestMethod.GET)
    public String toError(HttpServletRequest request, Model model) {
//        try{
//            User user = UserUtils.setUserSession(request,model);
//            model.addAttribute("user", user);
//        }catch (Exception e){
//
//        }
        return "error";
    }
}
