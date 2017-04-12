package com.nenu.innovation.controller;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * UserInterceptor
 *
 * @author: wychen
 * @time: 2017/4/12 9:52
 */
public class UserInterceptor implements HandlerInterceptor {

    @Override
    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object obj, Exception err)
            throws Exception {
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response,
                           Object obj, ModelAndView mav) throws Exception {
        response.sendRedirect("/login");
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
                             Object obj) throws Exception {
        Object user = request.getSession().getAttribute("user");
        System.out.println("用户登录：" + user.toString());
        if (user != null) {
            return true;
        }
        return false;
    }
}
