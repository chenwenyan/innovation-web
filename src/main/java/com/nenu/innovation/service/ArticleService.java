package com.nenu.innovation.service;

import com.nenu.innovation.entity.Article;

import java.util.List;

/**
 * ArticleService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface ArticleService extends AbstractService {

    /**
     * 显示文章列表
     *
     * @return
     * @throws Exception
     */
    public List<Article> listAll() throws Exception;

    /**
     * 根据类型显示文章列表
     *
     * @param typeId
     * @return
     * @throws Exception
     */
    public List<Article> listByType(int typeId) throws Exception;

    /**
     * 根据关键词模糊搜索
     *
     * @param keywords
     * @return
     * @throws Exception
     */
    public List<Article> listByKeyWords(String keywords) throws Exception;

    /**
     * 新建文章
     *
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void newArticle(String title, String content, int typeId, int creatorId) throws Exception;

    /**
     * 更新文章
     *
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void updateArticleById(int id, String title, String content, int typeId, int creatorId) throws Exception;

    /**
     * 根据条件查询文章
     *
     * @param title
     * @param creatorId
     * @param typeId
     * @return
     * @throws Exception
     */
    public List<Article> queryBySearchInfo(String title, int creatorId, int typeId, int isAudited,int offset, int pageSize) throws Exception;

    /**
     * 更新阅读次数
     *
     * @param id
     * @throws Exception
     */
    public void updateReadNum(int id) throws Exception;

    /**
     * 按照页码列出该类别下的文章
     *
     * @param typeId
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Article> listByTypeAndPage(int typeId, int offset, int pageSize) throws Exception;

    /**
     * 该类别下的文章数目
     *
     * @param typeId
     * @return
     * @throws Exception
     */
    public int countListByTypeAndPage(int typeId) throws Exception;

    /**
     * 计数
     *
     * @return
     * @throws Exception
     */
    public int count() throws Exception;

    /**
     * 获取格局查询条件得到的个数
     *
     * @param title
     * @param creatorId
     * @param typeId
     * @return
     * @throws Exception
     */
    public int countQueryBySearchInfo(String title, int creatorId, int typeId,int isAudited) throws Exception;

//    /**
//     * 根据审批状态显示列表
//     *
//     * @param isAudited
//     * @return
//     * @throws Exception
//     */
//    public List<Article> listIsAudited(int isAudited) throws Exception;

    /**
     * 修改审核状态
     *
     * @param id
     * @param isAudited
     * @throws Exception
     */
    public void setIsAudited(int id,int isAudited)throws Exception;

}
