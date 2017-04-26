package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.Project;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ProjectMapper
 *
 * @author: wychen
 * @time: 2017/4/8 12:48
 */
public interface ProjectMapper {

    /**
     *  新增项目
     *
     * @param project
     * @throws Exception
     */
    public void newProject(@Param("project") Project project) throws Exception;

    /**
     * 统计项目数目
     *
     * @return
     * @throws Exception
     */
    public Integer count() throws Exception;

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
    public List<Project> listAll() throws Exception;

    /**
     * 更新项目信息
     *
     * @param id
     * @param project
     * @throws Exception
     */
    public void updateProjectInfo(@Param("id") Integer id, @Param("project") Project project) throws Exception;

    /**
     * 根据id查询项目
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Project queryById(@Param("id") Integer id)throws Exception;

    /**
     * 根据id删除项目
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据条件搜素项目
     *
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @param startYear
     * @param endYear
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Project> queryBySearchInfo(@Param("name") String name,@Param("charger") String charger, @Param("teacher") String teacher,@Param("schoolId") Integer schoolId,
                                           @Param("startYear") Integer startYear,@Param("endYear") Integer endYear,@Param("offset") Integer offset,@Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Project> listByPage(@Param("offset") Integer offset,@Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 条件查询计数
     *
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @param startYear
     * @param endYear
     * @return
     * @throws Exception
     */
    public Integer countQueryBySearchInfo(@Param("name") String name,@Param("charger") String charger, @Param("teacher") String teacher,@Param("schoolId") Integer schoolId,
                                          @Param("startYear") Integer startYear,@Param("endYear") Integer endYear)throws Exception;

}
