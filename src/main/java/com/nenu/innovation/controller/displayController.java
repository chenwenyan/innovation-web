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

    @RequestMapping(value = "/searchProject", method = RequestMethod.POST)
    public String searchProject(HttpServletRequest request,HttpServletResponse response,
                                Model model) {
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        String schoolIdStr = request.getParameter("schoolId");
        if(schoolIdStr == null){
            schoolIdStr = "0";
        }
        int schoolId = Integer.parseInt(schoolIdStr);
        try{
            schools = schoolService.listAll();
            projects = projectService.queryBySearchInfo(name,charger,teacher,schoolId);
            model.addAttribute("schoolList",schools);
            model.addAttribute("projectList",projects);
            return "display/search-project";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/search-project", method = RequestMethod.GET)
    public String toProjectList(HttpServletRequest request,HttpServletResponse response,
                                Model model) {
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        try{
            projects = projectService.listAll();
            schools = schoolService.listAll();
            model.addAttribute("projectList",projects);
            model.addAttribute("schoolList",schools);
            return "display/search-project";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/matches", method = RequestMethod.GET)
    public String toMatches(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        List<Article> hlw = Collections.emptyList();  //互联网+
        List<Article> cqc = Collections.emptyList(); //创青春全国大学生创业大赛
        List<Article> tzb = Collections.emptyList();  //挑战杯
        List<Article> matches = Collections.emptyList(); //总比赛
        try {
            hlw = articleService.listByType(1);
            cqc = articleService.listByType(2);
            tzb = articleService.listByType(3);
            model.addAttribute("hlw", hlw);
            model.addAttribute("cqc", cqc);
            model.addAttribute("tzb", tzb);
//            matches.addAll(hlw);
//            matches.addAll(cqc);
//            matches.addAll(tzb);
//            concat(matches,hlw);
//            concat(matches,cqc);
//            concat(matches,tzb);
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
        List<Article> kyfc = Collections.emptyList();  //科研扶持
        List<Article> cyy = Collections.emptyList();  //创业园
        List<Article> qyzc = Collections.emptyList();   //企业注册
        List<Article> kycg = Collections.emptyList();   //科研成果

        List<Article> plans = Collections.emptyList();  //总计划
        try {
            sqshsjgg = articleService.listByType(4);
            kyfc = articleService.listByType(5);
            cyy = articleService.listByType(6);
            qyzc = articleService.listByType(7);
            kycg = articleService.listByType(8);
            model.addAttribute("sqshsjgg", sqshsjgg);
            model.addAttribute("kyfc", kyfc);
            model.addAttribute("cyy", cyy);
            model.addAttribute("qyzc", qyzc);
            model.addAttribute("kycg", kycg);
//            plans.addAll(sqshsjgg);
//            plans.addAll(kyfc);
//            plans.addAll(cyy);
//            plans.addAll(qyzc);
//            plans.addAll(kycg);
//            plans = concat(plans,sqshsjgg);
//            plans = concat(plans,kyfc);
//            plans = concat(plans,cyy);
//            plans = concat(plans,qyzc);
//            plans = concat(plans,kycg);
//            model.addAttribute("plans", plans);
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
//        List<Article> projects = Collections.emptyList(); //总立项
        try {
            gjjcxcyxljh = articleService.listByType(9);
            kylx = articleService.listByType(10);
//            projects.addAll(gjjcxcyxljh);
//            projects.addAll(kylx);
//            projects = concat(projects,gjjcxcyxljh);
//            projects = concat(projects,kylx);
            model.addAttribute("gjjcxcyxljh", gjjcxcyxljh);
            model.addAttribute("kylx", kylx);
//            model.addAttribute("projects", projects);
            return "display/projects";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "more-articles", method = RequestMethod.GET)
    public String moreArticles(HttpServletRequest request,HttpServletResponse response,
                               Model model) {
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        List<Article> articles = Collections.emptyList();
        try{
            articles = articleService.listByType(typeId);
            model.addAttribute("list",articles);
            return "display/more-articles";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "article-detail", method = RequestMethod.GET)
    public String articleDetail(Model model,int id) {
        Article article = new Article();
        try {
            article = articleService.queryById(id);
            if(article != null){
                articleService.updateReadNum(id);
                model.addAttribute("article",article);
            }
            return "display/article-detail";
        }catch (Exception e){
            return "error";
        }
    }

    private List<Article> concat(List<Article> list1,List<Article> list2)throws Exception{
        for(Article article : list2){
            Collections.addAll(list1,article);
        }
        return list1;
    }
}
