package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * TypeMapper
 *
 * @author: wychen
 * @time: 2017/4/10 9:08
 */
public interface TypeMapper {

    /**
     * 新增类型
     *
     * @param name
     * @param assistantCode
     * @throws Exception
     */
    public void newType(@Param("name") String name, @Param("assistantCode") String assistantCode) throws Exception;

    /**
     * 统计类型数目
     *
     * @return
     * @throws Exception
     */
    public Integer count() throws Exception;

    /**
     * 根据名称统计数目
     *
     * @param name
     * @return
     * @throws Exception
     */
    public Integer countByName(@Param("name") String name) throws Exception;

    /**
     * 检查名称是否存在
     *
     * @param name
     * @return
     * @throws Exception
     */
    public Integer checkExistByName(@Param("name") String name) throws Exception;

    /**
     * 类型列表
     *
     * @return
     * @throws Exception
     */
    public List<Type> listAll() throws Exception;

    /**
     * 更新类别信息
     *
     * @param name
     * @param assistantCode
     * @throws Exception
     */
    public void updateTypeInfo(@Param("id") Integer id, @Param("name") String name, @Param("assistantCode") String assistantCode) throws Exception;

    /**
     * 根据查询类型
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Type queryById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除类型
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据名称或助记码搜索
     *
     * @param name
     * @param assistantCode
     * @return
     * @throws Exception
     */
    public List<Type> queryBySearchInfo(@Param("name") String name, @Param("assistantCode") String assistantCode) throws Exception;

    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Type> listByPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;
}
