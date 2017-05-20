package com.nenu.innovation.service;

import com.nenu.innovation.entity.User;

import java.util.List;

/**
 * UserService
 *
 * @author: wychen
 * @time: 2017/4/2 11:17
 */
public interface UserService extends AbstractService {
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
     * 获取用户列表
     *
     * @return
     * @throws Exception
     */
    public List<User> listAll() throws Exception;

    /**
     * 设置用户状态
     *
     * @throws Exception
     */
    public void setStatus(int id, int status) throws Exception;

    /**
     * 更新用户信息
     *
     * @param id
     * @param username
     * @param password
     * @throws Exception
     */
    public void updateUserInfo(int id, String username, String password, int schoolId) throws Exception;

    /**
     * 根据名称和状态查询用户
     *
     * @param username
     * @param status
     * @return
     * @throws Exception
     */
    public List<User> queryBySearchInfo(String username, int status) throws Exception;

    /**
     * 根据名称和密码获取用户
     *
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    public User queryByNameAndPassword(String username, String password) throws Exception;

    public List<User> listByNameAndPage(int offset, int pageSize, String username) throws Exception;

    public int countByName(String username) throws Exception;


}
