package com.nenu.innovation.service;

import com.nenu.innovation.entity.Project;
import net.sf.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * ProjectService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface ProjectService extends AbstractService {

    /**
     * 新增项目
     *
     * @param project
     * @throws Exception
     */
    public void newProject(Project project) throws Exception;

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
    public void updateProjectInfo(int id, Project project) throws Exception;

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
    public List<Project> queryBySearchInfo(String name, String charger, String teacher, int schoolId, int startYear, int endYear, int offset, int pageSize) throws Exception;

    /**
     * 条件查询计数
     *
     * @param name
     * @param charger
     * @param teacher
     * @param schoolId
     * @return
     * @throws Exception
     */
    public int countQueryBySearchInfo(String name, String charger, String teacher, int schoolId, int startYear, int endYear) throws Exception;

    /**
     * 读取excel表格
     *
     * @param file
     * @return
     */
    public JSONObject readExcelFile(MultipartFile file) throws Exception;
}
