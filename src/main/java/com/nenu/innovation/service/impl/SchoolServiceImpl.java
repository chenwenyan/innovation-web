package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.mapper.SchoolMapper;
import com.nenu.innovation.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * SchoolServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
@Service(value = "schoolService")
public class SchoolServiceImpl implements SchoolService{

    @Autowired
    private SchoolMapper schoolMapper;

    @Override
    public void newSchool(String name) throws Exception{
        try{
            schoolMapper.newSchool(name);
        }catch (Exception e){
            System.out.println("新增学院出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int count() throws Exception{
        try{
            return schoolMapper.count();
        }catch (Exception e){
            System.out.println("统计学院书目出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int checkExistByName(String name) throws Exception{
        try{
            return schoolMapper.checkExistByName(name);
        }catch (Exception e){
            System.out.println("检测学院名称是否已经存在出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<School> listAll() throws Exception{
        List<School> schools =  Collections.emptyList();
        try{
            schools = schoolMapper.listAll();
            return schools;
        }catch (Exception e){
            System.out.println("学院列表显示出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void updateSchoolInfo(int id, String name ) throws Exception{
        try{
            schoolMapper.updateSchoolInfo(id,name);
        }catch (Exception e){
            System.out.println("更新学院信息出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public School queryById(int id)throws Exception{
        School school = new School();
        try{
            school = schoolMapper.queryById(id);
            return school;
        }catch (Exception e){
            System.out.println("根据id获取学院信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void deleteById( int id) throws Exception{
        try{
            schoolMapper.deleteById(id);
        }catch (Exception e){
            System.out.println("根据id删除学院信息出错！");
            throw new Exception(e.getMessage());
        }
    }


    @Override
    public List<School> queryBySearchInfo(String name) throws Exception{
        List<School> schools =  Collections.emptyList();
        try{
            schools = schoolMapper.queryBySearchInfo(name);
            return schools;
        }catch (Exception e){
            System.out.println("根据名称搜索学院信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<School> listByPage(int offset, int pageSize) throws Exception{
        List<School> schools = Collections.emptyList();
        try{
            schools = schoolMapper.listByPage(offset,pageSize);
            return schools;
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

}
