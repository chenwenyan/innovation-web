package com.nenu.innovation.test;

import com.nenu.innovation.service.ArticleService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * ArticleServiceTest
 *
 * @author: wychen
 * @time: 2017/4/8 14:25
 */
public class ArticleServiceTest extends AbstractTestCase{
    @Autowired
    private ArticleService articleService;

    @Test
    public void listAll() throws Exception{
        try{
            articleService.listAll();
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void count() throws Exception{
        int sum = 0;
        try{
            sum = articleService.count();
            System.out.println(sum);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void listByType() throws Exception{
        int typeId = 1;
        try{
            articleService.listByType(typeId);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void listByKeywords() throws Exception{
        String keywords = "国创";
        try{
            articleService.listByKeyWords("%" + keywords + "%");
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }

    @Test
    public void updateArticleById() throws Exception{
        int id = 3;
        String title = "目送3";
        String content = "《目送》散文集共由七十三篇散文组成";
        int typeId = 1;
        int creatorId = 1;
        try{
            articleService.updateArticleById(id,title,content,typeId,creatorId);
        }catch (Exception e){
            throw new Exception(e.getMessage());
        }
    }
}
