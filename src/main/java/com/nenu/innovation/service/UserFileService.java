package com.nenu.innovation.service;

import com.nenu.innovation.entity.UserFile;

import java.util.List;

/**
 * UserFileService
 *
 * @author: wychen
 * @time: 2017/4/28 14:39
 */
public interface UserFileService {

    /**
     * 新增文件
     *
     * @param userFile
     * @throws Exception
     */
    public Integer newFile(UserFile userFile)throws Exception;

    /**
     * 更新下载次数
     *
     * @param id
     * @param downloadNum
     * @throws Exception
     */
    public void updateDownloadNum(int id, int downloadNum) throws Exception;

    /**
     * 根据id删除文件信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(int id) throws Exception;

    /**
     * 根据id查询文件信息
     *
     * @param id
     * @throws Exception
     */
    public UserFile queryById(int id) throws Exception;

    /**
     * 根据id查询文件信息
     *
     * @param articleId
     * @throws Exception
     */
    public List<UserFile> queryByArticleId(int articleId) throws Exception;

}
