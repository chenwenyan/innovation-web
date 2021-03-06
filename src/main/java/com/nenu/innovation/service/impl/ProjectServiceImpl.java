package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.mapper.ProjectMapper;
import com.nenu.innovation.mapper.SchoolMapper;
import com.nenu.innovation.service.ProjectService;
import com.nenu.innovation.utils.ReadExcelUtils;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.Collections;
import java.util.List;

/**
 * ProjectServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
@Service(value = "projectService")
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private SchoolMapper schoolMapper;

    @Transactional(rollbackFor = {Exception.class, RuntimeException.class}, propagation = Propagation.REQUIRED)
    public void newProject(Project project) throws Exception {
        try {
            projectMapper.newProject(project);
        } catch (Exception e) {
            System.out.println("新增项目出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }


    public int count() throws Exception {
        try {
            return projectMapper.count() == null ? 0 : projectMapper.count();
        } catch (Exception e) {
            System.out.println("统计项目数目出错！");
            throw new Exception(e.getMessage());
        }
    }


    public boolean checkExistByName(String name) throws Exception {
        try {
            return projectMapper.checkExistByName(name) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("检测项目是否已经存在出错！");
            throw new Exception(e.getMessage());
        }
    }


    public List<Project> listAll() throws Exception {
        List<Project> projects = Collections.emptyList();
        try {
            projects = projectMapper.listAll();
//            for (Project project : projects) {
//                setSchoolName(project);
//            }
            return projects;
        } catch (Exception e) {
            System.out.println("显示项目列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Transactional(rollbackFor = {Exception.class, RuntimeException.class}, propagation = Propagation.REQUIRED)
    public void updateProjectInfo(int id, Project project) throws Exception {
        try {
            projectMapper.updateProjectInfo(id, project);
        } catch (Exception e) {
            System.out.println("根据id更新项目信息出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }


    public Project queryById(int id) throws Exception {
        Project project = new Project();
        try {
            project = projectMapper.queryById(id);
//            setSchoolName(project);
            return project;
        } catch (Exception e) {
            System.out.println("根据id查询项目出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Transactional(rollbackFor = {Exception.class, RuntimeException.class}, propagation = Propagation.REQUIRED)
    public void deleteById(int id) throws Exception {
        try {
            projectMapper.deleteById(id);
        } catch (Exception e) {
            System.out.println("根据id删除项目信息出错！");
            throw new Exception(e.getMessage());
        }
    }


    public List<Project> queryBySearchInfo(String name, String charger, String teacher, int schoolId, int startYear, int endYear, int offset, int pageSize) throws Exception {
        List<Project> projects = Collections.emptyList();
        try {
            projects = projectMapper.queryBySearchInfo(name, charger, teacher, schoolId, startYear, endYear, offset, pageSize);
//            for (Project project : projects) {
//                setSchoolName(project);
//            }
            return projects;
        } catch (Exception e) {
            System.out.println("根据条件查询项目出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }


    public List<Project> listByPage(int offset, int pageSize) throws Exception {
        List<Project> projects = Collections.emptyList();
        try {
            projects = projectMapper.listByPage(offset, pageSize);
//            for (Project project : projects) {
//                setSchoolName(project);
//            }
            return projects;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public int countQueryBySearchInfo(String name, String charger, String teacher, int schoolId, int startYear, int endYear) throws Exception {
        try {
            if (projectMapper.countQueryBySearchInfo(name, charger, teacher, schoolId, startYear, endYear) == null) {
                return 0;
            } else {
                return projectMapper.countQueryBySearchInfo(name, charger, teacher, schoolId, startYear, endYear);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("条件查询计数出错");
            throw new Exception(e.getMessage());
        }
    }

    @Transactional(rollbackFor = {Exception.class, RuntimeException.class}, propagation = Propagation.REQUIRED)
    public JSONObject readExcelFile(MultipartFile file) throws Exception {
        JSONObject result = new JSONObject();
        String msg = "";
        int code = 1;
        //创建处理EXCEL的类
        ReadExcelUtils readExcel = new ReadExcelUtils();
        try {
            //解析excel，获取上传的事件单
                //至此已经将excel中的数据转换到list里面了,接下来就可以操作list,可以进行保存到数据库,或者其他操作,
                List<Project> projects =  readExcel.getExcelInfo(file);
                if (projects != null && !projects.isEmpty()) {
                    for (Project project : projects) {
                        if(projectMapper.checkExistByName(project.getName()) > 0){
                            msg = "项目名称有重复，请检查表格数据！";
                            code = 0;
                           break;
                        }else{
                            projectMapper.newProject(project);
                            msg = "上传成功！";
                            System.out.println("上传成功");
                        }
                    }
                } else {
                    msg = "上传失败，请检查表格数据！";
                    code = 0;
                    System.out.println("上传失败，请检查表格数据");
                }
        } catch (Exception e) {
            e.printStackTrace();
            code = 0;
            msg = "导入excel模板出错";
            System.out.println("导入excel模板出错");
            throw new Exception(e.getMessage());
        }
        result.put("msg",msg);
        result.put("code",code);
        return result;
    }

    private void setSchoolName(Project project) throws Exception {
        School school = new School();
        try {
            school = schoolMapper.queryById(project.getSchoolId());
            if (school != null) {
                project.setSchoolName(school.getName());
            } else {
                project.setSchoolName("无");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("设置项目的学院名称出错！");
            throw new Exception(e.getMessage());
        }
    }


}
