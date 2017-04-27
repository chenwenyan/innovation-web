package com.nenu.innovation.controller;

import com.nenu.innovation.entity.School;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.SchoolService;
import com.nenu.innovation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
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

    @Autowired
    private SchoolService schoolService;

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String toList(HttpServletRequest request, Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        try {
            if (request.getSession().getAttribute("user") != null) {
                User user = (User) request.getSession().getAttribute("user");
                model.addAttribute("user", user);
            }
            List<User> users = userService.listByPage(offset,pageSize);
            int sum = userService.count();
            BigDecimal count = new BigDecimal(sum / 10);
            model.addAttribute("count", +Math.ceil(count.doubleValue() + 1));
            model.addAttribute("userList", users);
            model.addAttribute("pageNo", pageNo);
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "management/users/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user", method = RequestMethod.POST)
    public String searchByInfo(HttpServletRequest request, Model model) {
        String username = request.getParameter("username").trim();
        int status = Integer.parseInt(request.getParameter("status"));
        List<User> users = Collections.emptyList();
        try {
            model.addAttribute("user", request.getSession().getAttribute("user"));
            users = userService.queryBySearchInfo(username, status);
            model.addAttribute("userList", users);
            return "management/users/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response, Model model) {
        List<School> schoolList = Collections.emptyList();
        try {
            schoolList = schoolService.listAll();
            model.addAttribute("user", request.getSession().getAttribute("user"));
            model.addAttribute("schoolList",schoolList);
            return "management/users/add";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/add", method = RequestMethod.POST)
    public String newUser(HttpServletRequest request, HttpServletResponse response,
                          Model model) {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        User user = new User();
        if (username != null && password != null) {
            user.setUsername(username);
            user.setPassword(password);
            user.setSchoolId(schoolId);
        }
        try {
            if (userService.checkExistByName(username)) {
                model.addAttribute("msg", "用户名已存在！");
                model.addAttribute("isRedirect",true);
                return "management/users/add";
            } else {
                userService.newUser(user);
                model.addAttribute("user", request.getSession().getAttribute("user"));
                return "redirect:/user";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/edit", method = RequestMethod.GET)
    public String toEditPage(HttpServletRequest request, int id, Model model) {
        List<School> schoolList = Collections.emptyList();
        try {
            schoolList = schoolService.listAll();
            User this_user = (User) userService.queryById(id);
            model.addAttribute("this_user", this_user);
            model.addAttribute("schoolList",schoolList);
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "management/users/edit";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/edit", method = RequestMethod.POST)
    public String toEdit(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        try {
            if(userService.checkExistByName(username)){
                model.addAttribute("msg", "用户名已存在！");
                model.addAttribute("isRedirect",true);
                return "management/users/edit";
            }
            userService.updateUserInfo(id, username, password ,schoolId);
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "redirect:/user";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/delete", method = RequestMethod.POST)
    public String deleteUser(HttpServletRequest request, int id, Model model) {
        try {
            User user = (User) userService.queryById(id);
            if (user == null) {
                model.addAttribute("msg", "该用户不存在或已被删除！");
            } else {
                model.addAttribute("msg", "删除成功！");
                userService.deleteById(id);
            }
            model.addAttribute("user", request.getSession().getAttribute("user"));
            model.addAttribute("isRedirect",true);
            return "redirect:/user";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "user/setStatus", method = RequestMethod.POST)
    public String setStatus(HttpServletRequest request, int id, Model model) {
        int status = 1;
        try {
            User user = (User) userService.queryById(id);
            if (user == null) {
                model.addAttribute("msg", "该用户不存在或已被删除！");
                model.addAttribute("isRedirect",true);
            } else {
                model.addAttribute("msg", "设置成功！");
                status = (user.getStatus() == 1) ? 2 : 1;
                userService.setStatus(id, status);
            }
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "redirect:/user";
        } catch (Exception e) {
            return "error";
        }
    }
}
