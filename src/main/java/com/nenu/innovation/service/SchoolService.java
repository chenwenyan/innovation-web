package com.nenu.innovation.service;

import com.nenu.innovation.entity.School;

import java.util.List;

/**
 * SchoolService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface SchoolService extends AbstractService{
    /**
     * 新增学院
     *
     * @param name
     * @throws Exception
     */
    public void newSchool(String name) throws Exception;

    /**
     * 统计学院数目
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;

    /**
     * 检查学院名称是否存在
     *
     * @param name
     * @return
     * @throws Exception
     */
    public int checkExistByName(String name) throws Exception;

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
    public void updateSchoolInfo(int id, String name ) throws Exception;

    /**
     * 根据id查询学院信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public School queryById( int id)throws Exception;

    /**
     * 根据id删除学院
     *
     * @param id
     * @throws Exception
     */
    public void deleteById( int id) throws Exception;

    /**
     * 根据条件搜索
     *
     * @param name
     * @return
     * @throws Exception
     */
    public List<School> queryBySearchInfo( String name) throws Exception;

}
