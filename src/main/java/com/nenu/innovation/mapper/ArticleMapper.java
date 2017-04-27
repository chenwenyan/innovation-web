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
     * @param article
     * @throws Exception
     */
    public void newArticle(@Param("article") Article article) throws Exception;

    /**
     * 更新文章
     *
     * @param title
     * @param content
     * @param typeId
     * @param creatorId
     * @throws Exception
     */
    public void updateArticleById(@Param("id") Integer id, @Param("title") String title, @Param("content") String content, @Param("typeId") Integer typeId, @Param("creatorId") Integer creatorId) throws Exception;

    /**
     * 根据id查询文章信息
     *
     * @param id
     * @return
     * @throws Exception
     */
    public Article queryById(@Param("id") Integer id) throws Exception;

    /**
     * 根据id删除文章信息
     *
     * @param id
     * @throws Exception
     */
    public void deleteById(@Param("id") Integer id) throws Exception;

    /**
     * 根据条件查询文章
     *
     * @param title
     * @param creatorId
     * @param typeId
     * @return
     * @throws Exception
     */
    public List<Article> queryBySearchInfo(@Param("title") String title, @Param("creatorId") Integer creatorId, @Param("typeId") Integer typeId,
                                           @Param("isAudited") Integer isAudited, @Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 更新阅读次数
     *
     * @param id
     * @throws Exception
     */
    public void updateReadNum(@Param("id") Integer id) throws Exception;

    /**
     * 根据页码显示列表
     *
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Article> listByPage(@Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 按照页码列出该类别下的文章
     *
     * @param typeId
     * @param offset
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Article> listByTypeAndPage(@Param("typeId") Integer typeId, @Param("offset") Integer offset, @Param("pageSize") Integer pageSize) throws Exception;

    /**
     * 该类别下的文章数目
     *
     * @param typeId
     * @return
     * @throws Exception
     */
    public Integer countListByTypeAndPage(@Param("typeId") Integer typeId) throws Exception;

    /**
     * 根据名称检测名称是否已经存在
     *
     * @param title
     * @return
     * @throws Exception
     */
    public Integer checkExistByName(@Param("title") String title) throws Exception;

    /**
     * 获取条件查询的个数
     *
     * @param title
     * @param creatorId
     * @param typeId
     * @return
     * @throws Exception
     */
    public Integer countQueryBySearchInfo(@Param("title") String title, @Param("creatorId") Integer creatorId, @Param("typeId") Integer typeId,@Param("isAudited") Integer isAudited)throws Exception;

    /**
     * 根据审批状态显示列表
     *
     * @param isAudited
     * @return
     * @throws Exception
     */
    public List<Article> listIsAudited(@Param("isAudited") Integer isAudited)throws Exception;

    /**
     * 修改审核状态
     *
     * @param id
     * @param isAudited
     * @throws Exception
     */
    public void setIsAudited(@Param("id") Integer id,@Param("isAudited") Integer isAudited)throws Exception;

    /**
     * 获取科研扶持 创业园 企业注册 三种类型文章列表
     *
     * @return
     * @throws Exception
     */
    public List<Article> listThree() throws Exception;
}
