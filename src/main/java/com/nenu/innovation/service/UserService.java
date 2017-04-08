package com.nenu.innovation.service;

import com.nenu.innovation.entity.User;

import java.util.List;

/**
 * UserService
 *
 * @author: wychen
 * @time: 2017/4/2 11:17
 */
public interface UserService {
    /**
     * 添加新用户
     *
     * @param user
     * @throws Exception
     */
    public void newUser(User user) throws Exception;

    /**
     * 判断用户是否可以登录
     *
     * @param user
     * @return
     * @throws Exception
     */
    public boolean checkLogin(User user) throws Exception;

    /**
     * 检查用户是否存在
     *
     * @param username
     * @return
     * @throws Exception
     */
    public boolean  checkExistByUsername(String username) throws Exception;

    /**
     * 获取用户列表
     *
     * @return
     * @throws Exception
     */
    public List<User> listAll()throws Exception;

    /**
     * 用户计数
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;
}
