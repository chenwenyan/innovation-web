package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.mapper.ArticleMapper;
import com.nenu.innovation.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

/**
 * ArticleServiceImpl
 *
 * @author: wychen
 * @time: 2017/4/8 12:45
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public List<Article> listAll() throws Exception{
        List<Article> articles = Collections.emptyList();
        try {
            articles =  articleMapper.listAll();
            return articles;
        } catch (Exception e) {
            System.out.println("显示文章列表出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public Integer count() throws Exception{
        int sum = 0;
        try {
            sum = articleMapper.count();
            return sum;
        } catch (Exception e) {
            System.out.println("文章计数出错！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public List<Article> listByType(int typeId) throws Exception{
        List<Article> articles = Collections.emptyList();
        try {
            if (typeId > 0) {
                articles = articleMapper.listByType(typeId);
            }
        } catch (Exception e) {
            System.out.println("根据类型显示文章列表出错！");
            throw new Exception(e.getMessage());
        }
        return articles;
    }

    @Override
    public List<Article> listByKeyWords(String keywords) throws Exception{
        List<Article> articles = Collections.emptyList();
        try {
            if (keywords.length() > 0 && keywords != null) {
                articles = articleMapper.listByKeyWords(keywords);
            }
            return articles;
        } catch (Exception e) {
            System.out.println("根据关键词查询失败！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void newArticle(String title, String content, int typeId, int creatorId) throws Exception{
        try {
            if (title != null && content != null && typeId > 0 && creatorId > 0) {
                articleMapper.newArticle(title, content, typeId, creatorId);
            }
        } catch (Exception e) {
            System.out.println("新增文章失败！");
            throw new Exception(e.getMessage());
        }
    }

    @Override
    public void updateArticleById(int id, String title, String content, int typeId, int creatorId) throws Exception{
        try {
            if (title != null && content != null && typeId > 0 && creatorId > 0) {
                articleMapper.updateArticleById(id, title, content, typeId, creatorId);
            }
        } catch (Exception e) {
            System.out.println("更新文章失败！");
            throw new Exception(e.getMessage());
        }
    }
}
