package com.nenu.innovation.service;

import com.nenu.innovation.entity.Article;

import java.util.List;

/**
 * ArticleService
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
public interface ArticleService {

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

}
