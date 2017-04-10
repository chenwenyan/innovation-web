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
    public void newArticle() throws Exception{
        String title = "目送3";
        String content = "《目送》散文集共由七十三篇散文组成，是为一本情感性的文集。书中，龙应台写父亲的死亡、母亲的衰老和失智；写对父母的怜惜和体恤，写兄弟携手共行，儿子的离别，朋友的牵挂；写自己的失败和脆弱，失落和放手，以及一个人的走路、赏树、观鸟、拍照、生活等。从牵着孩子幼小的手、情意满满的亲情，到青春后期孩子与自己渐行渐远的背影；从陪着年迈母亲如带着女儿一般，思及自己也曾是父母眼前一去不返的背影，龙应台娓娓道来。正如作者所说：“我慢慢地、慢慢地了解到，所谓父女母子一场，只不过意味着，你和他的缘分就是今生今世不断地在目送他的背影渐行渐远。你站在小路的这一端，看着他逐渐消失在小路转弯的地方，而且，他用背影默默地告诉你，不用追。”[1] ";
        int typeId = 1;
        int creatorId = 1;
        try{
            articleService.newArticle(title,content,typeId,creatorId);
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
