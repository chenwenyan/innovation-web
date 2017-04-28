package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.UserFile;
import com.nenu.innovation.mapper.UserFileMapper;
import com.nenu.innovation.service.UserFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * UserFileImpl
 *
 * @author: wychen
 * @time: 2017/4/28 14:45
 */
@Service("userFileService")
public class UserFileServiceImpl implements UserFileService{

    @Autowired
    private UserFileMapper userFileMapper;

    public Integer newFile(UserFile userFile)throws Exception{
        try {
            return userFileMapper.newFile(userFile);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public void updateDownloadNum(int id, int downloadNum) throws Exception{
        try {
            userFileMapper.updateDownloadNum(id,downloadNum);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public void deleteById(int id) throws Exception{
        try {
            userFileMapper.deleteById(id);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }


    public UserFile queryById(int id) throws Exception{
        try {
            return userFileMapper.queryById(id);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
}