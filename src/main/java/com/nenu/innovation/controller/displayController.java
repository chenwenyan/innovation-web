package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.service.ArticleService;
import com.nenu.innovation.service.ProjectService;
import com.nenu.innovation.service.SchoolService;
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
 * displayController
 *
 * @author: wychen
 * @time: 2017/4/11 20:59
 */
@Controller
public class displayController {

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main(Model model) {
        return "display/main";
    }

    @RequestMapping(value = "/searchProject", method = RequestMethod.GET)
    public String searchProject(Model model) {
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        try {
            projects = projectService.listAll();
            schools = schoolService.listAll();
            model.addAttribute("projectList", projects);
            model.addAttribute("schoolList", schools);
            return "display/searchProject";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public String toMatches(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        List<Article> matches = Collections.emptyList();
        int typeId = 1;
        try {
            matches = articleService.listByType(typeId);
            model.addAttribute("matches", matches);
            return "display/matches";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String toProjects(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        List<Article> projects = Collections.emptyList();
        int typeId = 2;
        try {
            projects = articleService.listByType(typeId);
            model.addAttribute("projects", projects);
            return "display/projects";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/plans", method = RequestMethod.GET)
    public String toPlans(HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        List<Article> sqshsjs = Collections.emptyList();
        List<Article> kyfcs = Collections.emptyList();
        List<Article> kycgs = Collections.emptyList();
        int sqshsj = 3; //暑期社会实践
        int kyfc = 4; //科研扶持
        int kycg = 5; //科研成果
        try {
            sqshsjs = articleService.listByType(sqshsj);
            kyfcs = articleService.listByType(kyfc);
            kycgs = articleService.listByType(kycg);
            model.addAttribute("sqshsjs", sqshsjs);
            model.addAttribute("kyfcs", kyfcs);
            model.addAttribute("kycgs", kycgs);
            return "display/plans";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "more-articles", method = RequestMethod.GET)
    public String moreArticles(Model model) {
        return "display/more-articles";
    }

    @RequestMapping(value = "article-detail", method = RequestMethod.GET)
    public String articleDetail(Model model) {
        return "display/article-detail";
    }

}
