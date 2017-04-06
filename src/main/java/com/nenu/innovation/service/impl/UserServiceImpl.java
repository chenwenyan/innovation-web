package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.User;
import com.nenu.innovation.mapper.UserMapper;
import com.nenu.innovation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/2 11:17
 */
@Service("userService")
public class UserServiceImpl implements UserService{

    @Autowired
    private UserMapper userMapper;

    public void newUser(User user) throws Exception{
        try{
            userMapper.newUser(user);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public boolean checkLogin(User user) throws Exception{
        if(user == null){
            return false;
        }
        try{
            boolean bl ;
            bl = userMapper.countByUser(user) > 0 ? true : false;
            return bl;
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public boolean checkExistByUsername(String username) throws Exception{
        try{
            return userMapper.checkExistByUsername(username) > 0 ? true : false;
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    public List<User> listAllUser()throws Exception{
        return userMapper.listAllUser();
    }
}
