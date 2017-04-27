package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.School;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.mapper.SchoolMapper;
import com.nenu.innovation.mapper.UserMapper;
import com.nenu.innovation.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * UserServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/2 11:17
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SchoolMapper schoolMapper;

 
    public void newUser(User user) throws Exception {
        try {
            userMapper.newUser(user);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

 
    public boolean checkLogin(User user) throws Exception {
        if (user == null) {
            return false;
        }
        try {
            boolean bl;
            bl = userMapper.countByUser(user) > 0 ? true : false;
            return bl;
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

 
    public boolean checkExistByName(String username) throws Exception {
        try {
            return userMapper.checkExistByUsername(username) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("检测用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

 
    public List<User> listAll() throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.listAll();
            for(User user:users){
                setSchoolName(user);
            }
            return users;
        } catch (Exception e) {
            System.out.println("显示用户列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

 
    public int count() throws Exception {
        int sum = 0;
        try {
            sum = userMapper.count();
            return sum;
        } catch (Exception e) {
            System.out.println("用户计数出错！");
            throw new Exception(e.getMessage());
        }
    }

 
    public void setStatus(int id, int status) throws Exception {
        if (status > 0) {
            try {
                userMapper.setStatus(id, status);
            } catch (Exception e) {
                System.out.println("设置用户状态出错！");
                throw new Exception(e.getMessage());
            }
        }
    }

 
    public void updateUserInfo(int id, String username, String password,int schoolId) throws Exception {
        if (id > 0 && username != null && password != null) {
            try {
                userMapper.updateUserInfo(id, username, password,schoolId);
            } catch (Exception e) {
                System.out.println("更新用户信息出错！");
                throw new Exception(e.getMessage());
            }
        }
    }

 
    public User queryById(int id) throws Exception {
        User user = new User();
        try {
            if (id > 0) {
                user = userMapper.queryById(id);
                setSchoolName(user);
            }
        } catch (Exception e) {
            System.out.println("根据id获取用户信息出错！");
            throw new Exception(e.getMessage());
        }
        return user;
    }

 
    public void deleteById(int id) throws Exception {
        try {
            if (id > 0) {
                userMapper.deleteById(id);
            }
        } catch (Exception e) {
            System.out.println("根据id删除用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

 
    public List<User> queryBySearchInfo(String username, int status) throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.queryBySearchInfo(username, status);
            for(User user:users){
                setSchoolName(user);
            }
            return users;
        } catch (Exception e) {
            System.out.println("根据名称和状态查询用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

 
    public List<User> listByPage(int offset, int pageSize) throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.listByPage(offset, pageSize);
            for(User user:users){
                setSchoolName(user);
            }
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("根据页码获取信息列表出错！");
            throw new Exception(e.getMessage());
        }
    }

    public User queryByNameAndPassword(String username,String password) throws Exception{
        try{
            return userMapper.queryByNameAndPassword(username,password);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("根据用户名和密码查询用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    private void setSchoolName(User user) throws Exception{
        try{
            if(user != null){
                School school = schoolMapper.queryById(user.getSchoolId());
                user.setSchoolName(school.getName());
            }
        }catch (Exception e){
            System.out.println("给用户设置学院名称出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
}
