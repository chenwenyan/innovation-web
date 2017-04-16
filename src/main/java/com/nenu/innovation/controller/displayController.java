package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Article;
import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.service.ArticleService;
import com.nenu.innovation.service.ProjectService;
import com.nenu.innovation.service.SchoolService;
import com.nenu.innovation.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
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

    @RequestMapping(value = "/search-project", method = RequestMethod.POST)
    public String searchProject(HttpServletRequest request,HttpServletResponse response,
                                Model model) {
        String  pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr)-1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        String schoolIdStr = request.getParameter("schoolId");
        int schoolId = Integer.parseInt(schoolIdStr);
        int startYear = -1;
        int endYear = 99999;
        try{
            if(request.getParameter("startYear") != ""){
                startYear = 1900 + DateUtils.formatDate("yyyy",request.getParameter("startYear")).getYear();
            }
            if(request.getParameter("endYear") != ""){
                endYear = 1900 + DateUtils.formatDate("yyyy",request.getParameter("endYear")).getYear();
            }
            schools = schoolService.listAll();
            projects = projectService.queryBySearchInfo(name,charger,teacher,schoolId,startYear,endYear,offset,pageSize);
            model.addAttribute("schoolList",schools);
            model.addAttribute("projectList",projects);
            model.addAttribute("pageNo",pageNo);
            int sum = projectService.countQueryBySearchInfo(name,charger,teacher,schoolId,startYear,endYear);
            BigDecimal count = new BigDecimal(sum/10);
            model.addAttribute("count", + Math.ceil(count.doubleValue()));
            return "display/search-project";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/search-project", method = RequestMethod.GET)
    public String toProjectList(HttpServletRequest request,HttpServletResponse response,
                                Model model) {
        String  pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr)-1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        try{
            projects =  projectService.listByPage(offset,pageSize);
            schools = schoolService.listAll();
            int count = projectService.count();
            model.addAttribute("projectList",projects);
            model.addAttribute("schoolList",schools);
            model.addAttribute("pageNo",pageNo);
            model.addAttribute("count",String.valueOf(Math.ceil(count/10)+1));
            model.addAttribute("user",request.getSession().getAttribute("user"));
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
        List<Article> qtbs = Collections.emptyList();  //其他比赛
        List<Article> matches = Collections.emptyList(); //总比赛
        try {
            hlw = articleService.listByType(1);
            cqc = articleService.listByType(2);
            tzb = articleService.listByType(3);
            qtbs = articleService.listByType(11);
            model.addAttribute("hlw", hlw.size() > 5 ? hlw.subList(0,5):hlw);
            model.addAttribute("cqc", cqc.size() > 5 ? cqc.subList(0,5):cqc);
            model.addAttribute("tzb", tzb.size() > 5 ? tzb.subList(0,5):tzb);
            model.addAttribute("qtbs", qtbs.size() > 5 ? qtbs.subList(0,5):qtbs);
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
            model.addAttribute("sqshsjgg", sqshsjgg.size() > 5 ? sqshsjgg.subList(0,5): sqshsjgg);
            model.addAttribute("kyfc", kyfc.size() > 5 ? kyfc.subList(0,5):kyfc);
            model.addAttribute("cyy", cyy.size() > 5 ? cyy.subList(0,5):cyy);
            model.addAttribute("qyzc", qyzc.size() > 5 ? qyzc.subList(0,5): qyzc);
            model.addAttribute("kycg", kycg.size() > 5 ? kycg.subList(0,5):kycg);
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
//        List<Article> projects = Collections.emptyList(); //总立项
        try {
            gjjcxcyxljh = articleService.listByType(9);
            kylx = articleService.listByType(10);
//            projects.addAll(gjjcxcyxljh);
//            projects.addAll(kylx);
//            projects = concat(projects,gjjcxcyxljh);
//            projects = concat(projects,kylx);
            model.addAttribute("gjjcxcyxljh", gjjcxcyxljh.size() > 5 ?gjjcxcyxljh.subList(0,5) : gjjcxcyxljh);
            model.addAttribute("kylx", kylx.size()>5? kylx.subList(0,5):kylx);
//            model.addAttribute("projects", projects);
            return "display/projects";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "more-articles", method = RequestMethod.GET)
    public String moreArticles(HttpServletRequest request,HttpServletResponse response,
                               Model model) {
        String  pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr)-1);
        int pageSize = 5;
        int offset = pageNo * pageSize;
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        List<Article> articles = Collections.emptyList();
        try{
            articles = articleService.listByTypeAndPage(typeId,offset,pageSize);
            model.addAttribute("list",articles);
            int sum = articleService.countListByTypeAndPage(typeId);
            BigDecimal count = new BigDecimal(sum/pageSize);
            model.addAttribute("count", + Math.ceil(count.doubleValue()+1));
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
}
