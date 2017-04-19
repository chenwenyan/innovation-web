package com.nenu.innovation.controller;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.UserService;
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
        if (request.getSession().getAttribute("user") != null) {
            User user = (User) request.getSession().getAttribute("user");
            model.addAttribute("user", user);
            return "redirect:user";
        } else {
            return "management/login";
        }

    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(User user, Model model, HttpServletRequest request) throws Exception {
        try {
            if (userService.checkLogin(user)) {
                request.getSession().setAttribute("user", user);
                return "redirect:user";
            } else {
                model.addAttribute("msg", "登录失败，请重新输入！");
                return "management/login";
            }
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "management/login";
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

    @RequestMapping(value = "logout", method = RequestMethod.POST)
    public String logout(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        request.getSession().setAttribute("user", null);
        return "management/login";
    }

    @RequestMapping(value = "error", method = RequestMethod.GET)
    public String toError(HttpServletRequest request, Model model) {
        model.addAttribute("user", request.getSession().getAttribute("user"));
        return "error";
    }
}
