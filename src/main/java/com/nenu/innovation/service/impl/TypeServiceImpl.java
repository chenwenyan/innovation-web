package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Type;
import com.nenu.innovation.mapper.TypeMapper;
import com.nenu.innovation.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * TypeServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/10 9:00
 */
@Service("typeService")
public class TypeServiceImpl implements TypeService{

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public void newType(String name,String assistantCode) throws Exception{
        try{
            typeMapper.newType(name,assistantCode);
        }catch (Exception e){
            System.out.println("新增类型出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int count() throws Exception{
        try{
            return typeMapper.count();
        }catch (Exception e){
            System.out.println("统计类型数目出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public int countByName(String name)throws Exception{
        try{
            return typeMapper.countByName(name);
        }catch (Exception e){
            System.out.println("根据名称统计类型数目出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public boolean checkExistByName(String name) throws Exception{
        try{
            return typeMapper.checkExistByName(name) == 1 ? true:false;
        }catch (Exception e){
            System.out.println("检测类型名称是否已经存在出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<Type> listAll() throws Exception{
        List<Type> types = Collections.emptyList();
       try{
           types = typeMapper.listAll();
           return types;
       }catch (Exception e){
           System.out.println("显示类型列表出错！");
           throw new Exception(e.getMessage());
       }
    }

    @Override
    public void updateTypeInfo(int id, String name,String assistantCode) throws Exception{
        try{
            typeMapper.updateTypeInfo(id,name,assistantCode);
        }catch (Exception e){
            System.out.println("更新类型信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public Type queryById(int id) throws Exception{
        try{
            return typeMapper.queryById(id);
        }catch (Exception e){
            System.out.println("根据id获取类型信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void deleteById(int id) throws Exception{
        try{
            typeMapper.deleteById(id);
        }catch (Exception e){
            System.out.println("根据id删除类型信息出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<Type> queryBySearchInfo(String name,String assistantCode) throws Exception{
        try{
            return typeMapper.queryBySearchInfo(name,assistantCode);
        }catch (Exception e){
            System.out.println("根据名称和助记码查询类型信息出错！");
            throw new Exception(e.getMessage());
        }
    }


}
