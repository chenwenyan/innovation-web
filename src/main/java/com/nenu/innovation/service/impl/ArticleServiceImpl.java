package com.nenu.innovation.service.impl;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.entity.Type;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.mapper.ArticleMapper;
import com.nenu.innovation.mapper.SchoolMapper;
import com.nenu.innovation.mapper.TypeMapper;
import com.nenu.innovation.mapper.UserMapper;
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

    @Autowired
    private TypeMapper typeMapper;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private SchoolMapper schoolMapper;

    
    public List<Article> listAll() throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            articles = articleMapper.listAll();
            for (Article article : articles) {
                setArticleTypeAndCreatorAndSchool(article);
            }
            return articles;
        } catch (Exception e) {
            System.out.println("显示文章列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public int count() throws Exception {
        int sum = 0;
        try {
            sum = articleMapper.count();
            return sum;
        } catch (Exception e) {
            System.out.println("文章计数出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public boolean checkExistByName(String name) throws Exception {
        try {
            return articleMapper.checkExistByName(name) > 0 ? true : false;
        } catch (Exception e) {
            System.out.println("检查文章题目是否已存在出错！");
            throw new Exception(e.getMessage());
        }
    }

    
    public List<Article> listByType(int typeId) throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            if (typeId > 0) {
                articles = articleMapper.listByType(typeId);
                for (Article article : articles) {
                    setArticleTypeAndCreatorAndSchool(article);
                }
            }
        } catch (Exception e) {
            System.out.println("根据类型显示文章列表出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
        return articles;
    }

    
    public List<Article> listByKeyWords(String keywords) throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            if (keywords.length() > 0 && keywords != null) {
                articles = articleMapper.listByKeyWords(keywords);
                for (Article article : articles) {
                    setArticleTypeAndCreatorAndSchool(article);
                }
            }
            return articles;
        } catch (Exception e) {
            System.out.println("根据关键词查询失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public void newArticle(Article article) throws Exception {
        try {
            if (article.getTitle() != null && article.getContent() != null && article.getTypeId() > 0 && article.getCreatorId() > 0) {
                articleMapper.newArticle(article);
            }
        } catch (Exception e) {
            System.out.println("新增文章失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public void updateArticleById(int id, String title, String content, int typeId, int creatorId) throws Exception {
        try {
            if (title != null && content != null && typeId > 0 && creatorId > 0) {
                articleMapper.updateArticleById(id, title, content, typeId, creatorId);
            }
        } catch (Exception e) {
            System.out.println("更新文章失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public Article queryById(int id) throws Exception {
        Article article = new Article();
        try {
            article = articleMapper.queryById(id);
            setArticleTypeAndCreatorAndSchool(article);
            return article;
        } catch (Exception e) {
            System.out.println("根据id查询文章失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public void deleteById(int id) throws Exception {
        try {
            articleMapper.deleteById(id);
        } catch (Exception e) {
            System.out.println("根据id删除文章失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public List<Article> queryBySearchInfo(String title, int creatorId, int typeId,int isAudited, int offset, int pageSize) throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            articles = articleMapper.queryBySearchInfo(title, creatorId, typeId,isAudited, offset, pageSize);
            for (Article article : articles) {
                setArticleTypeAndCreatorAndSchool(article);
            }
            return articles;
        } catch (Exception e) {
            System.out.println("根据条件查询文章失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public void updateReadNum(int id) throws Exception {
        try {
            if (id > 0) {
                articleMapper.updateReadNum(id);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public List<Article> listByPage(int offset, int pageSize) throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            articles = articleMapper.listByPage(offset, pageSize);
            for (Article article : articles) {
                setArticleTypeAndCreatorAndSchool(article);
            }
            return articles;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    
    public List<Article> listByTypeAndPage(int typeId, int offset, int pageSize) throws Exception {
        List<Article> articles = Collections.emptyList();
        try {
            articles = articleMapper.listByTypeAndPage(typeId, offset, pageSize);
            return articles;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
    
    public int countListByTypeAndPage(int typeId) throws Exception {
        try {
            return articleMapper.countListByTypeAndPage(typeId);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public int countQueryBySearchInfo(String title, int creatorId, int typeId,int isAudited) throws Exception{
        try {
            return articleMapper.countQueryBySearchInfo(title,creatorId,typeId,isAudited);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public void setIsAudited(int id,int isAudited)throws Exception{
        try{
            articleMapper.setIsAudited(id,isAudited);
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public List<Article> listThree()throws Exception{
        List<Article> articles = Collections.emptyList();
        try{
            articles = articleMapper.listThree();
            return articles;
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    private void setArticleTypeAndCreatorAndSchool(Article article) throws Exception {
        try {
            Type type = typeMapper.queryById(article.getTypeId());
            User user = userMapper.queryById(article.getCreatorId());
            School school = schoolMapper.queryById(article.getSchoolId());
            article.setTypeName(type.getName());
            article.setCreatorName(user.getUsername());
            article.setSchoolName(school.getName());
        } catch (Exception e) {
            System.out.println("设置文章类型、创建者名称和学院名称失败！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
}
