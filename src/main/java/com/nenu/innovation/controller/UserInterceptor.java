package com.nenu.innovation.controller;

import com.nenu.innovation.entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * UserInterceptor
 *
 * @author: wychen
 * @time: 2017/4/12 9:52
 */
public class UserInterceptor implements HandlerInterceptor {

    private static final String LOGIN_URL = "/login";

    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object handler) throws Exception {
        HttpSession session = req.getSession(true);
        // 从session 里面获取用户名的信息
        User user = (User) req.getSession().getAttribute("user");
        // 判断如果没有取到用户信息，就跳转到登陆页面，提示用户进行登陆
        if (user == null || "".equals(user.toString())) {
            res.sendRedirect(LOGIN_URL);
        }
        return true;
    }

    public void postHandle(HttpServletRequest req, HttpServletResponse res, Object arg2, ModelAndView arg3) throws Exception {
    }

    public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object arg2, Exception arg3) throws Exception {
    }
}
