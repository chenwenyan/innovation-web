package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.Type;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.ArticleService;
import com.nenu.innovation.service.TypeService;
import com.nenu.innovation.service.UserService;
import com.nenu.innovation.utils.NumUtils;
import com.nenu.innovation.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.List;

/**
 * ArticleController
 *
 * @author: wychen
 * @time: 2017/4/8 12:49
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private UserService userService;

    @Autowired
    private TypeService typeService;


    @RequestMapping(value = "/article", method = RequestMethod.GET)
    public String toList(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Article> articles = Collections.emptyList();
        List<User> users = Collections.emptyList();
        List<Type> types = Collections.emptyList();

        String title = (request.getParameter("title") == null) ? null : request.getParameter("title").trim();
        int creatorId = (request.getParameter("userId") == null) ? 0 : Integer.parseInt(request.getParameter("userId"));
        int typeId = (request.getParameter("typeId") == null ) ? 0 : Integer.parseInt(request.getParameter("typeId"));
        int isAudited = (request.getParameter("isAudited") == null) ? -1: Integer.parseInt(request.getParameter("isAudited"));

        try {
            articles = articleService.queryBySearchInfo(title,creatorId,typeId,isAudited,offset, pageSize);
            users = userService.listAll();
            types = typeService.listAll();
            model.addAttribute("articleList", articles);
            model.addAttribute("userList", users);
            model.addAttribute("typeList", types);
            model.addAttribute("pageNo", pageNo);
            int sum = articleService.countQueryBySearchInfo(title,creatorId,typeId,isAudited);
            model.addAttribute("count", NumUtils.ceilNum(sum,pageSize));
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            model.addAttribute("title",title);
            model.addAttribute("creatorId",creatorId);
            model.addAttribute("typeId",typeId);
            model.addAttribute("isAudited",isAudited);
            return "management/article/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model) {
        List<Type> types = Collections.emptyList();
        try {
            types = typeService.listAll();
            model.addAttribute("typeList", types);
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            return "management/article/add";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article/add", method = RequestMethod.POST)
    public String newArticle(HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        String title = request.getParameter("title").trim();
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String content = request.getParameter("content");
        Article article = new Article();
        try {
            if(articleService.checkExistByName(title)){
                model.addAttribute("msg", "文章名称已存在！");
                model.addAttribute("isRedirect",true);
                return "management/article/add";
            }
            User user = UserUtils.setUserSession(request,model);
            article.setTitle(title);
            article.setTypeId(typeId);
            article.setContent(content);
            article.setCreatorId(user.getId());
            article.setSchoolId(user.getSchoolId());
            articleService.newArticle(article);
            model.addAttribute("user", user);
            return "redirect:/article";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article/edit", method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request, HttpServletResponse response,
                         Model model, Integer id) {
        Article article = new Article();
        List<Type> types = Collections.emptyList();
        try {
            types = typeService.listAll();
            article = (Article) articleService.queryById(id);
            model.addAttribute("article", article);
            model.addAttribute("typeList", types);
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            return "management/article/edit";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/edit", method = RequestMethod.POST)
    public String updateArticle(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content");
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            if(articleService.checkExistByName(title)){
                model.addAttribute("msg", "文章名称已存在！");
                model.addAttribute("isRedirect",true);
                return "management/article/edit";
            }
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            articleService.updateArticleById(id, title, content, typeId, user.getId());
            return "redirect:/article";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/article/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request, HttpServletResponse response,
                             Model model, Integer id) {
        try {
            if (articleService.queryById(id) == null) {
                model.addAttribute("msg", "该文章不存在或已被删除！");
                model.addAttribute("isRedirect",true);
//                return "management/article/list";
            }
            articleService.deleteById(id);
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            return "redirect:/article";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/detail", method = RequestMethod.GET)
    public String toDetail(HttpServletRequest request, HttpServletResponse response,
                           Model model, Integer id) {
        Article article = new Article();
        try {
            article = (Article) articleService.queryById(id);
            if (article == null) {
                model.addAttribute("msg", "该文章不存在或已被删除！");
            }
            model.addAttribute("article", article);
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            return "management/article/detail";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/audited", method = RequestMethod.POST)
    public String audited(HttpServletRequest request, HttpServletResponse response,
                           Model model) {
        int isAudited = 1;
        Article article = new Article();
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            article = (Article) articleService.queryById(id);
//            if (article == null) {
//                model.addAttribute("msg", "该文章不存在或已被删除！");
//            }
            articleService.setIsAudited(id,isAudited);
            User user = UserUtils.setUserSession(request,model);
            model.addAttribute("user", user);
            return "redirect:/article";
        } catch (Exception e) {
            return "error";
        }
    }
}
