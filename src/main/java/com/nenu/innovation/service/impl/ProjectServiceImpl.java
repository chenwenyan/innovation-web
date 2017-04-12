package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.mapper.ProjectMapper;
import com.nenu.innovation.mapper.SchoolMapper;
import com.nenu.innovation.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * ProjectServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
@Service(value = "projectService")
public class ProjectServiceImpl implements ProjectService{

    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public void newProject( String name,String charger,String teacher, int schoolId) throws Exception{
        try{
            projectMapper.newProject(name,charger,teacher,schoolId);
        }catch (Exception e){
            System.out.println("新增项目出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int count() throws Exception{
        try{
            return projectMapper.count();
        }catch (Exception e){
            System.out.println("统计项目数目出错！");
            throw new Exception(e.getMessage());
        }
    }

   @Override
    public int checkExistByName(String name) throws Exception{
       try{
           return projectMapper.checkExistByName(name);
       }catch (Exception e){
           System.out.println("检测项目是否已经存在出错！");
           throw new Exception(e.getMessage());
       }
   }

    @Override
    public List<Project> listAll() throws Exception{
        List<Project> projects = Collections.emptyList();
        try{
            projects =  projectMapper.listAll();
            for(Project project:projects){
                setSchoolName(project);
            }
            return projects;
        }catch (Exception e){
            System.out.println("显示项目列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void updateProjectInfo( int id, String name,String charger, String teacher, int schoolId) throws Exception{
        try{
            projectMapper.updateProjectInfo(id,name,charger,teacher,schoolId);
        }catch (Exception e){
            System.out.println("根据id更新项目信息出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public Project queryById(int id)throws Exception{
        Project project = new Project();
        try{
            project = projectMapper.queryById(id);
            setSchoolName(project);
            return project;
        }catch (Exception e){
            System.out.println("根据id查询项目出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void deleteById(int id) throws Exception{
        try{
            projectMapper.deleteById(id);
        }catch (Exception e){
            System.out.println("根据id删除项目信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<Project> queryBySearchInfo(String name,  String charger,  String teacher,  int schoolId) throws Exception{
        List<Project> projects = Collections.emptyList();
        try{
            projects =  projectMapper.queryBySearchInfo(name,charger,teacher,schoolId);
            for(Project project:projects){
                setSchoolName(project);
            }
            return projects;
        }catch (Exception e){
            System.out.println("根据条件查询项目出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<Project> listByPage(int offset, int pageSize) throws Exception{
        List<Project> projects = Collections.emptyList();
        try{
            projects = projectMapper.listByPage(offset,pageSize);
            return projects;
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    private void setSchoolName(Project project) throws Exception{
        School school = new School();
        try{
            school = schoolMapper.queryById(project.getSchoolId());
            project.setSchoolName(school.getName());
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("设置项目的学院名称出错！");
            throw new Exception(e.getMessage());
        }
    }


}
