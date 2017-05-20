package com.nenu.innovation.utils;

import com.nenu.innovation.entity.User;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

/**
 * setUserSession
 *
 * @author: wychen
 * @time: 2017/4/27 13:13
 */
public class UserUtils {

    public static User setUserSession(HttpServletRequest request, Model model) throws Exception {
        User user = new User();
        try {
            user = (User) request.getSession().getAttribute("user");
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

}
