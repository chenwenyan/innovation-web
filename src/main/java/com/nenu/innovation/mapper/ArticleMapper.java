package com.nenu.innovation.mapper;

import com.nenu.innovation.entity.Article;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * ArticleMapper
 *
 * @author: wychen
 * @time: 2017/4/8 12:48
 */
public interface ArticleMapper {

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
    public List<Article> listByType(@Param("typeId") Integer typeId) throws Exception;

    /**
     * 根据关键词模糊搜索
     *
     * @param keywords
     * @return
     * @throws Exception
     */
    public List<Article> listByKeyWords(@Param("keywords") String keywords) throws Exception;

    /**
     * 新建文章
     *
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void newArticle(@Param("title") String title,@Param("content") String content,@Param("typeId") Integer typeId,@Param("creatorId") Integer creatorId) throws Exception;

    /**
     * 更新文章
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void updateArticleById(@Param("id") Integer id, @Param("title") String title,@Param("content") String content,@Param("typeId") Integer typeId,@Param("creatorId") Integer creatorId) throws Exception;

}
