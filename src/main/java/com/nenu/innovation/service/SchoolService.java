package com.nenu.innovation.service;

import com.nenu.innovation.entity.School;

import java.util.List;

/**
 * SchoolService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface SchoolService extends AbstractService {
    /**
     * 新增学院
     *
     * @param name
     * @throws Exception
     */
    public void newSchool(String name) throws Exception;

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
    public void updateSchoolInfo(int id, String name) throws Exception;

    /**
     * 根据条件搜索
     *
     * @param name
     * @return
     * @throws Exception
     */
    public List<School> queryBySearchInfo(String name) throws Exception;

}
