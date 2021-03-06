package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.entity.UserFile;
import com.nenu.innovation.service.ArticleService;
import com.nenu.innovation.service.ProjectService;
import com.nenu.innovation.service.SchoolService;
import com.nenu.innovation.service.UserFileService;
import com.nenu.innovation.utils.DateUtils;
import com.nenu.innovation.utils.NumUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Collections;
import java.util.Date;
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

    @Autowired
    private UserFileService userFileService;

    private int pageSize = 5;

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main(Model model) {
        return "display/main";
    }

    @RequestMapping(value = "/searchProject", method = RequestMethod.GET)
    public String searchProject(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        int pageSize = 15;
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int offset = pageNo * pageSize;
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        String schoolIdStr = request.getParameter("schoolId");
        int schoolId = -1;
        if (schoolIdStr != "" && schoolIdStr != null) {
            schoolId = Integer.parseInt(schoolIdStr);
        }

        int startYear = 2010;
        int endYear = 1900 + new Date().getYear();
        try {
            if (request.getParameter("startYear") != "" && request.getParameter("startYear") != null) {
                startYear = 1900 + DateUtils.formatDate("yyyy", request.getParameter("startYear")).getYear();
            }
            if (request.getParameter("endYear") != "" && request.getParameter("endYear") != null) {
                endYear = 1900 + DateUtils.formatDate("yyyy", request.getParameter("endYear")).getYear();
            }
            schools = schoolService.listAll();
            projects = projectService.queryBySearchInfo(name, charger, teacher, schoolId, startYear, endYear, offset, pageSize);
            model.addAttribute("schoolList", schools);
            model.addAttribute("projectList", projects);
            model.addAttribute("pageNo", pageNo);
            int sum = projectService.countQueryBySearchInfo(name, charger, teacher, schoolId, startYear, endYear);
            model.addAttribute("count", NumUtils.ceilNum(sum, pageSize));
            model.addAttribute("name", name);
            model.addAttribute("charger", charger);
            model.addAttribute("teacher", teacher);
            model.addAttribute("schoolId", schoolId);
            model.addAttribute("startYear", startYear);
            model.addAttribute("endYear", endYear);
            return "display/search-project";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public String toMatches(HttpServletRequest request, HttpServletResponse response,
                            Model model) {
        List<Article> hlw = Collections.emptyList();  //互联网+
        List<Article> cqc = Collections.emptyList(); //创青春全国大学生创业大赛
        List<Article> tzb = Collections.emptyList();  //挑战杯
        List<Article> qtbs = Collections.emptyList();  //其他比赛
        List<Article> matches = Collections.emptyList(); //总比赛
        try {
            hlw = articleService.listByType(1);
            cqc = articleService.listByType(2);
            tzb = articleService.listByType(3);
            qtbs = articleService.listByType(11);
            model.addAttribute("hlw", hlw.size() > pageSize ? hlw.subList(0, pageSize) : hlw);
            model.addAttribute("cqc", cqc.size() > pageSize ? cqc.subList(0, pageSize) : cqc);
            model.addAttribute("tzb", tzb.size() > pageSize ? tzb.subList(0, pageSize) : tzb);
            model.addAttribute("qtbs", qtbs.size() > pageSize ? qtbs.subList(0, pageSize) : qtbs);
            model.addAttribute("matches", matches);
            return "display/matches";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/plans", method = RequestMethod.GET)
    public String toProjects(HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        List<Article> sqshsjgg = Collections.emptyList();  //暑期社会实践
        List<Article> cyfc = Collections.emptyList();  //创业扶持
        List<Article> cyy = Collections.emptyList();   //创业园
        List<Article> qyzc = Collections.emptyList();   //企业注册
        List<Article> kycg = Collections.emptyList();   //科研成果

        List<Article> plans = Collections.emptyList();  //总计划
        try {
            sqshsjgg = articleService.listByType(4);
            cyfc = articleService.listByType(5);
            cyy = articleService.listByType(6);
            qyzc = articleService.listByType(7);
            kycg = articleService.listByType(8);
            model.addAttribute("sqshsjgg", sqshsjgg.size() > pageSize ? sqshsjgg.subList(0, pageSize) : sqshsjgg);
            model.addAttribute("cyfc", cyfc.size() > pageSize ? cyfc.subList(0, pageSize) : cyfc);
            model.addAttribute("cyy", cyy.size() > pageSize ? cyy.subList(0, pageSize) : cyy);
            model.addAttribute("kycg", kycg.size() > pageSize ? kycg.subList(0, pageSize) : kycg);
            model.addAttribute("qyzc", qyzc.size() > pageSize ? qyzc.subList(0, pageSize) : qyzc);
            model.addAttribute("plans", plans);
            return "display/plans";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/projects", method = RequestMethod.GET)
    public String toPlans(HttpServletRequest request, HttpServletResponse response,
                          Model model) {
        List<Article> gjjcxcyxljh = Collections.emptyList();//国家级创新创业训练计划
        List<Article> kylx = Collections.emptyList(); //科研立项
        try {
            gjjcxcyxljh = articleService.listByType(9);
            kylx = articleService.listByType(10);
            model.addAttribute("gjjcxcyxljh", gjjcxcyxljh.size() > pageSize ? gjjcxcyxljh.subList(0, pageSize) : gjjcxcyxljh);
            model.addAttribute("kylx", kylx.size() > pageSize ? kylx.subList(0, pageSize) : kylx);
            return "display/projects";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "moreArticles", method = RequestMethod.GET)
    public String moreArticles(HttpServletRequest request, HttpServletResponse response,
                               Model model) {
        int pageSize = 10;
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int offset = pageNo * pageSize;
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        List<Article> articles = Collections.emptyList();
        try {
            model.addAttribute("typeId", typeId);
            articles = articleService.listByTypeAndPage(typeId, offset, pageSize);
            model.addAttribute("list", articles);
            model.addAttribute("pageNo", pageNo);
            int sum = articleService.countListByTypeAndPage(typeId);
            model.addAttribute("count", NumUtils.ceilNum(sum, pageSize));
            return "display/more-articles";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "articleDetail", method = RequestMethod.GET)
    public String articleDetail(Model model, int id) {
        Article article = new Article();
        List<UserFile> files = Collections.emptyList();
        try {
            article = (Article) articleService.queryById(id);
            if (article != null) {
                articleService.updateReadNum(id);
                model.addAttribute("article", article);
                files = userFileService.queryByArticleId(article.getId());
                model.addAttribute("files", files);
            }
            return "display/article-detail";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public String toError(HttpServletRequest request, Model model) {
        return "display/contact";
    }
}
