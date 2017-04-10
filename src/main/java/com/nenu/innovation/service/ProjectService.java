package com.nenu.innovation.service;

import com.nenu.innovation.entity.Project;

import java.util.List;

/**
 * ProjectService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface ProjectService {

    /**
     *  新增项目
     *
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @throws Exception
     */
    public void newProject( String name,String charger,String teacher, int schoolId) throws Exception;

    /**
     * 统计项目数目
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;

    /**
     * 检查名称是否存在
     *
     * @param name
     * @return
     * @throws Exception
     */
    public int checkExistByName(String name) throws Exception;

    /**
     * 类型列表
     *
     * @return
     * @throws Exception
     */
    public List<Project> listAll() throws Exception;

    /**
     * 更新项目信息
     *
     * @param id
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @throws Exception
     */
    public void updateProjectInfo( int id, String name,String charger, String teacher, int schoolId) throws Exception;

    /**
     * 根据id查询项目
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Project queryById( int id)throws Exception;

    /**
     * 根据id删除项目
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(int id) throws Exception;

    /**
     * 根据条件搜素项目
     *
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @return
     * @throws Exception
     */
    public List<Project> queryBySearchInfo(String name,  String charger,  String teacher,  int schoolId) throws Exception;

}
