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
        user.setUsername("user4");
        user.setPassword("123456");
        userService.newUser(user);
    }

    @Test
    public void testListAllUser()throws Exception{
        List<User> list = userService.listAllUser();
        System.out.println(list);
    }
}
