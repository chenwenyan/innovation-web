package com.nenu.innovation.service;

import com.nenu.innovation.entity.Type;

import java.util.List;

/**
 * TypeService
 *
 * @author: wychen
 * @time: 2017/4/10 9:00
 */
public interface TypeService extends AbstractService{

    /**
     * 新增类型
     *
     * @param name
     * @param assistantCode
     * @throws Exception
     */
    public void newType(String name,String assistantCode)throws Exception;

    /**
     * 显示类型列表
     *
     * @return
     * @throws Exception
     */
    public List<Type> listAll() throws Exception;

    /**
     * 根据id获取类型信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Type queryById(int id) throws Exception;

    /**
     * 根据名称获取类型数目
     *
     * @param name
     * @return
     * @throws Exception
     */
    public int countByName(String name) throws Exception;

    /**
     * 根据名称查看类型是否重复
     *
     * @param name
     * @return
     * @throws Exception
     */
    public boolean checkExistByName(String name) throws Exception;

    /**
     * 统计类型数目
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;

    /**
     * 更新类型信息
     *
     * @param name
     * @param assistantCode
     * @throws Exception
     */
    public void updateTypeInfo(int id, String name,String assistantCode) throws Exception;

    /**
     * 根据id删除类型信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(int id) throws Exception;

    /**
     * 根据类别名称和助记码查询
     *
     * @param name
     * @param assistantCode
     * @return
     * @throws Exception
     */
    public List<Type> queryBySearchInfo(String name,String assistantCode) throws Exception;
}
