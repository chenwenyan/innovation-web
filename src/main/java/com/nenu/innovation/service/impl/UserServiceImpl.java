package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.User;
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

    @Override
    public void newUser(User user) throws Exception {
        try {
            userMapper.newUser(user);
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        }
    }

    @Override
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

    @Override
    public boolean checkExistByName(String username) throws Exception {
        try {
            return userMapper.checkExistByUsername(username) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("检测用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<User> listAll() throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.listAll();
            return users;
        } catch (Exception e) {
            System.out.println("显示用户列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
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

    @Override
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

    @Override
    public void updateUserInfo(int id, String username, String password) throws Exception {
        if (id > 0 && username != null && password != null) {
            try {
                userMapper.updateUserInfo(id, username, password);
            } catch (Exception e) {
                System.out.println("更新用户信息出错！");
                throw new Exception(e.getMessage());
            }
        }
    }

    @Override
    public User queryById(int id) throws Exception {
        User user = new User();
        try {
            if (id > 0) {
                user = userMapper.queryById(id);
            }
        } catch (Exception e) {
            System.out.println("根据id获取用户信息出错！");
            throw new Exception(e.getMessage());
        }
        return user;
    }

    @Override
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

    @Override
    public List<User> queryBySearchInfo(String username, int status) throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.queryBySearchInfo(username, status);
            return users;
        } catch (Exception e) {
            System.out.println("根据名称和状态查询用户信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<User> listByPage(int offset, int pageSize) throws Exception {
        List<User> users = Collections.emptyList();
        try {
            users = userMapper.listByPage(offset, pageSize);
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("根据页码获取信息列表出错！");
            throw new Exception(e.getMessage());
        }
    }
}
