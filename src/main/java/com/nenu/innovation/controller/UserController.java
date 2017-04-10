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
import java.util.Collections;
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
    public String toList(HttpServletRequest request,Model model){
        try{
            if(request.getSession().getAttribute("user") != null){
                User user = (User)request.getSession().getAttribute("user");
                model.addAttribute("user",user);
            }
            List<User> users = userService.listAll();
            model.addAttribute("userList",users);
            return "/userManagement/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String searchByInfo(HttpServletRequest request,Model model){
        String username = request.getParameter("username").trim();
        int status = Integer.parseInt(request.getParameter("status"));
        List<User> users = Collections.emptyList();
        try{
//            if(request.getSession().getAttribute("user") != null){
//                User user = (User)request.getSession().getAttribute("user");
//                model.addAttribute("user",user);
//            }
            users = userService.queryBySearchInfo(username,status);
            model.addAttribute("userList",users);
            return "/userManagement/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/user/add",method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,Model model){
        try{
            if(request.getSession().getAttribute("user") != null){
                User user = (User)request.getSession().getAttribute("user");
                model.addAttribute("user",user);
            }
            return "/userManagement/add";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/user/add",method = RequestMethod.POST)
    public String newUser(HttpServletRequest request,HttpServletResponse response,
                          Model model){
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        User user = new User();
        if(username != null && password != null){
            user.setUsername(username);
            user.setPassword(password);
        }
        try{
            if(userService.checkExistByUsername(username)){
                model.addAttribute("msg","用户名已存在！");
            }else {
                userService.newUser(user);
//                return "redirect:/user/add";
            }
        }catch (Exception e){
            return "error";
        }
        return "redirect:/user";
    }

    @RequestMapping(value = "user/edit", method = RequestMethod.GET)
    public String toEditPage(int id, Model model){
        try{
            User user = userService.queryById(id);
            model.addAttribute("user",user);
            return "/userManagement/edit";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "user/edit", method = RequestMethod.POST)
    public String toEdit(HttpServletRequest request,HttpServletResponse response,
                         Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{
            userService.updateUserInfo(id,username,password);
        }catch (Exception e){
            return "error";
        }
        return "redirect:/user";
    }

    @RequestMapping(value = "user/delete",method = RequestMethod.POST)
    public String deleteUser(int id,Model model){
        try{
            User user = userService.queryById(id);
            if(user == null){
              model.addAttribute("msg","该用户不存在！");
            }else {
                userService.deleteById(id);
            }
        }catch (Exception e){
            return "error";
        }
        return "redirect:/user";
    }

    @RequestMapping(value = "user/setStatus",method = RequestMethod.POST)
    public String setStatus(int id,Model model){
        int status = 1;
        try{
            User user = userService.queryById(id);
            if(user == null){
                model.addAttribute("msg","该用户不存在！");
            }else {
                status = (user.getStatus() == 1 )? 2 : 1;
                userService.setStatus(id,status);
            }
            return "redirect:/user";
        }catch (Exception e){
            return "error";
        }
    }
}
