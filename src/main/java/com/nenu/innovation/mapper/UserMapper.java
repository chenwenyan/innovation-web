package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * UserMapper
 *
 * @author: wychen
 * @time: 2017/4/2 11:16
 */
public interface UserMapper {
    /**
     * 添加新用户
     *
     * @param user
     * @throws Exception
     */
    public void newUser(@Param("user") User user) throws Exception;

    /**
     * 统计该用户的数量
     *
     * @param user
     * @return
     * @throws Exception
     */
    public int countByUser(@Param("user") User user) throws Exception;

    /**
     * 检查用户是否存在
     *
     * @param username
     * @return
     * @throws Exception
     */
    public int checkExistByUsername(@Param("username") String username) throws Exception;

    /**
     * 获取所有用户列表
     *
     * @return
     * @throws Exception
     */
    public List<User> listAllUser()throws Exception;
}
