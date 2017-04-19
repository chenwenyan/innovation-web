package com.nenu.innovation.test;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.UserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * UserServiceTest
 *
 * @author: wychen
 * @time: 2017/4/2 21:08
 */
public class UserServiceTest extends AbstractTestCase {

    @Autowired
    private UserService userService;

    @Test
    public void newUser() throws Exception {
        User user = new User();
        user.setUsername("user7");
        user.setPassword("123456");
        try {
            userService.newUser(user);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void listAll()throws Exception{
        try {
            List<User> list = userService.listAll();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void count() throws Exception{
        try{
            userService.count();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void checkLogin() throws Exception{
        User user = new User();
        String username = "admin";
        String password = "123456";
        user.setUsername(username);
        user.setPassword(password);
        try{
           userService.checkLogin(user);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void checkExistByUsername() throws Exception{
        String username = "user1";
        try{
            userService.checkExistByName(username);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void setStatus() throws Exception{
        int id = 2;
        int status = 1;
        try {
            userService.setStatus(id, status);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void updateUserInfo() throws Exception{
        int id = 5;
        String username = "user_5";
        String password = "111111";
        try{
            userService.updateUserInfo(id,username,password);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

}
