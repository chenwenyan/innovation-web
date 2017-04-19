package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.entity.Type;
import com.nenu.innovation.service.ArticleService;
import com.nenu.innovation.service.TypeService;
import com.nenu.innovation.service.UserService;
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
        try {
            articles = articleService.listByPage(offset, pageSize);
            int count = articleService.count();
            users = userService.listAll();
            types = typeService.listAll();
            model.addAttribute("articleList", articles);
            model.addAttribute("userList", users);
            model.addAttribute("typeList", types);
            model.addAttribute("pageNo", pageNo);
            model.addAttribute("count", String.valueOf(Math.ceil(count / 10) + 1));
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "management/article/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article", method = RequestMethod.POST)
    public String searchByInfo(HttpServletRequest request, HttpServletResponse response,
                               Model model) {
        List<Article> articles = Collections.emptyList();
        List<User> users = Collections.emptyList();
        List<Type> types = Collections.emptyList();
        try {
            String title = request.getParameter("title");
            int creatorId = Integer.parseInt(request.getParameter("userId"));
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            String year = request.getParameter("year");
            articles = articleService.queryBySearchInfo(title, creatorId, typeId);
            users = userService.listAll();
            types = typeService.listAll();
            model.addAttribute("articleList", articles);
            model.addAttribute("userList", users);
            model.addAttribute("typeList", types);
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
        try {
            articleService.newArticle(title, content, typeId, 1);
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
            User user = (User) request.getSession().getAttribute("user");
//            int creatorId = user.getId();
            int creatorId = 1;
            articleService.updateArticleById(id, title, content, typeId, creatorId);
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
            }
            articleService.deleteById(id);
            model.addAttribute("user", request.getSession().getAttribute("user"));
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
            model.addAttribute("user", request.getSession().getAttribute("user"));
            return "management/article/detail";
        } catch (Exception e) {
            return "error";
        }
    }
}
