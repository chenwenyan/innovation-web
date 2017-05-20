package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.School;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * SchoolMapper
 *
 * @author: wychen
 * @time: 2017/4/8 12:48
 */
public interface SchoolMapper {

    /**
     * 新增学院
     *
     * @param name
     * @throws Exception
     */
    public void newSchool(@Param("name") String name) throws Exception;

    /**
     * 统计学院数目
     *
     * @return
     * @throws Exception
     */
    public Integer count() throws Exception;

    /**
     * 检查学院名称是否存在
     *
     * @param name
     * @return
     * @throws Exception
     */
    public Integer checkExistByName(@Param("name") String name) throws Exception;

    /**
     * 学院列表
     *
     * @return
     * @throws Exception
     */
    public List<School> listAll() throws Exception;

    /**
     * 更新学院信息
     *
     * @param id
     * @param name
     * @throws Exception
     */
    public void updateSchoolInfo(@Param("id") Integer id, @Param("name") String name) throws Exception;

    /**
     * 根据id查询学院信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public School queryById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除学院
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据条件搜索
     *
     * @param name
     * @return
     * @throws Exception
     */
    public List<School> queryBySearchInfo(@Param("name") String name) throws Exception;

    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<School> listByPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

}
