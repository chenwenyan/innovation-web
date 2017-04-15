package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
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
import java.util.Date;

/**
 * ProjectController
 *
 * @author: wychen
 * @time: 2017/4/10 13:24
 */
@Controller
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private SchoolService schoolService;

//    @RequestMapping(value = "/project",method = RequestMethod.GET)
//    public String toList(HttpServletRequest request,HttpServletResponse response,
//                         Model model){
//        List<Project> projects = Collections.emptyList();
//        List<School> schools = Collections.emptyList();
//        try{
//            projects = projectService.listAll();
//            schools = schoolService.listAll();
//            model.addAttribute("projectList",projects);
//            model.addAttribute("schoolList",schools);
//            model.addAttribute("user",request.getSession().getAttribute("user"));
//            return "management/project/list";
//        }catch (Exception e){
//            return "error";
//        }
//    }

    @RequestMapping(value = "/project",method = RequestMethod.GET)
    public String toList(HttpServletRequest request,HttpServletResponse response,
                         Model model){
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
            return "management/project/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project",method = RequestMethod.POST)
    public String toSearchList(HttpServletRequest request,HttpServletResponse response,
                               Model model){
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
        String year = request.getParameter("year");
        try{
            schools = schoolService.listAll();
            model.addAttribute("schoolList",schools);
            projects = projectService.queryBySearchInfo(name,charger,teacher,schoolId,year,offset,pageSize);
            model.addAttribute("projectList",projects);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/project/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model){
        List<School> schools = Collections.emptyList();
        try{
            schools = schoolService.listAll();
            model.addAttribute("schoolList",schools);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/project/add";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project/add",method = RequestMethod.POST)
    public String newProject(HttpServletRequest request,HttpServletResponse response,
                          Model model){
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        try{
            if(projectService.checkExistByName(name) == 1){
                model.addAttribute("msg","该项目名称已经存在！");
            }
            projectService.newProject(name,charger,teacher,schoolId);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/project";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project/edit",method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request,HttpServletResponse response,
                         Model model,Integer id){
        Project project = new Project();
        List<School> schools = Collections.emptyList();
        try{
            project = projectService.queryById(id);
            if(project == null){
                model.addAttribute("msg","该项目不存在或者已被删除！");
            }
            schools = schoolService.listAll();
            model.addAttribute("schoolList",schools);
            model.addAttribute("project",project);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/project/edit";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project/edit",method = RequestMethod.POST)
    public String updateProjectInfo(HttpServletRequest request, HttpServletResponse response,
                                 Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        try{
            projectService.updateProjectInfo(id,name,charger,teacher,schoolId);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/project";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/project/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request, HttpServletResponse response,
                             Model model, Integer id){
        Project project = new Project();
        try{
            project = projectService.queryById(id);
            if(project == null){
                model.addAttribute("msg","该项目不存在或者已被删除！");
            }
            projectService.deleteById(id);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/project";
        }catch (Exception e){
            return "error";
        }
    }

}
