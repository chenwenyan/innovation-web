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
    public List<User> listAll()throws Exception;

    /**
     * 用户计数
     *
     * @return
     * @throws Exception
     */
    public Integer count() throws Exception;

    /**
     * 设置用户状态
     *
     * @param status
     * @throws Exception
     */
    public void setStatus(@Param("id") Integer id, @Param("status") Integer status) throws Exception;

    /**
     * 更新用户信息
     *
     * @param id
     * @param username
     * @param password
     * @throws Exception
     */
    public void updateUserInfo(@Param("id") Integer id,@Param("username") String username,@Param("password") String password,@Param("schoolId") Integer schoolId) throws Exception;

    /**
     * 根据id获取用户信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public User queryById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除用户信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据名称和状态搜索用户信息
     *
     * @param username
     * @param status
     * @return
     * @throws Exception
     */
    public List<User> queryBySearchInfo(@Param("username") String username,@Param("status")Integer status) throws Exception;

    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<User> listByPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 根据名称和密码获取用户
     *
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    public User queryByNameAndPassword(@Param("username") String username, @Param("password") String password) throws Exception;
}
