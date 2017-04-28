package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.UserFile;
import org.apache.ibatis.annotations.Param;

/**
 * FileMapper
 *
 * @author: wychen
 * @time: 2017/4/28 14:34
 */
public interface UserFileMapper {

    /**
     * 新增文件
     *
     * @param userfile
     * @throws Exception
     */
    public Integer newFile(@Param("userFile") UserFile userfile) throws Exception;

    /**
     * 更新下载次数
     *
     * @param id
     * @param downloadNum
     * @throws Exception
     */
    public void updateDownloadNum(@Param("id") Integer id, @Param("downloadNum") Integer downloadNum) throws Exception;

    /**
     * 根据id删除文件信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id)throws Exception;

    /**
     * 根据id查询文件信息
     *
     * @param id
     * @throws Exception
     */
    public UserFile queryById(@Param("id") Integer id)throws Exception;
}
