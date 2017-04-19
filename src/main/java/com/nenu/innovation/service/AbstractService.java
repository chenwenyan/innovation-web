package com.nenu.innovation.service;

import java.util.List;

/**
 * AbstractService
 *
 * @author: wychen
 * @time: 2017/4/14 20:33
 */
public interface AbstractService {
    /**
     * 根据页码显示实体列表
     *
     * @param offset
     * @param pageSize
     * @return
     */
    public List listByPage(int offset, int pageSize) throws Exception;

    /**
     * 根据id删除实体
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(int id) throws Exception;

    /**
     * 根据id查询实体
     *
     * @param id
     * @throws Exception
     */
    public Object queryById(int id) throws Exception;

    /**
     * 计数
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;

    /**
     * 检查名称是否已经存在
     *
     * @param name
     * @throws Exception
     */
    public boolean checkExistByName(String name) throws Exception;

}
