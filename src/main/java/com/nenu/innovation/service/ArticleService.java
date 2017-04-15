package com.nenu.innovation.service;

import com.nenu.innovation.entity.Article;

import java.util.List;
import java.util.Date;

/**
 * ArticleService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface ArticleService extends AbstractService{

    /**
     * 显示文章列表
     *
     * @return
     * @throws Exception
     */
    public List<Article> listAll() throws Exception;

    /**
     * 文章计数
     *
     * @return
     * @throws Exception
     */
    public Integer count() throws Exception;

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
    public void newArticle(String title,String content,int typeId,int creatorId) throws Exception;

    /**
     * 更新文章
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void updateArticleById(int id, String title,String content,int typeId,int creatorId) throws Exception;

    /**
     * 根据查询文章信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Article queryById(int id) throws Exception;

    /**
     * 根据id删除文章信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(int id) throws Exception;

    /**
     * 根据条件查询文章
     *
     * @param title
     * @param creatorId
     * @param typeId
     * @return
     * @throws Exception
     */
    public List<Article> queryBySearchInfo(String title,int creatorId,int typeId) throws Exception;

    /**
     * 更新阅读次数
     *
     * @param id
     * @throws Exception
     */
    public void updateReadNum(int id) throws Exception;

}
