package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Project;
import com.nenu.innovation.entity.School;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.ProjectService;
import com.nenu.innovation.service.SchoolService;
import com.nenu.innovation.utils.DateUtils;
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

    @RequestMapping(value = "project/list", method = RequestMethod.GET)
    public String toProjectList(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Project> projects = Collections.emptyList();
        List<School> schools = Collections.emptyList();

        try {
            schools = schoolService.listAll();
            projects = projectService.listByPage(offset, pageSize);
            model.addAttribute("schoolList", schools);
            model.addAttribute("projectList", projects);
            model.addAttribute("pageNo", pageNo);
            int sum = projectService.count();
            model.addAttribute("count", NumUtils.ceilNum(sum, pageSize));
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            if (user.getSchoolId() == 0) {
                return "management/project/list";
            } else {
                return "redirect:/article/list";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project", method = RequestMethod.GET)
    public String toSearchList(HttpServletRequest request, HttpServletResponse response,
                               Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
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

        int startYear = 2000;
        try {
            int endYear = DateUtils.getCurrentYear();
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
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            if (user.getSchoolId() == 0) {
                return "management/project/list";
            } else {
                return "redirect:/article/list";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model) {
        List<School> schools = Collections.emptyList();
        try {
            schools = schoolService.listAll();
            model.addAttribute("schoolList", schools);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/project/add";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project/add", method = RequestMethod.POST)
    public String newProject(HttpServletRequest request, HttpServletResponse response,
                             Model model) {
        String name = request.getParameter("name").trim();
        String charger = request.getParameter("charger").trim();
        String teacher = request.getParameter("teacher").trim();
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        String type = request.getParameter("type");
        String category = request.getParameter("category");
        try {
//            if (projectService.checkExistByName(name)) {
//                model.addAttribute("msg", "该项目名称已经存在！");
//            }
            int year = DateUtils.getCurrentYear();
            if (request.getParameter("year") != null) {
                year = 1900 + DateUtils.formatDate("yyyy", request.getParameter("year")).getYear();
            }
            Project project = new Project();
            project.setName(name);
            project.setCharger(charger);
            project.setTeacher(teacher);
            project.setSchoolId(schoolId);
            project.setType(type);
            project.setYear(year);
            project.setCategory(category);
            projectService.newProject(project);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/project/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project/edit", method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request, HttpServletResponse response,
                         Model model, Integer id) {
        Project project = new Project();
        List<School> schools = Collections.emptyList();
        try {
            project = (Project) projectService.queryById(id);
            if (project == null) {
                model.addAttribute("msg", "该项目不存在或者已被删除！");
            }
            schools = schoolService.listAll();
            model.addAttribute("schoolList", schools);
            model.addAttribute("project", project);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/project/edit";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project/edit", method = RequestMethod.POST)
    public String updateProjectInfo(HttpServletRequest request, HttpServletResponse response,
                                    Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String charger = request.getParameter("charger");
        String teacher = request.getParameter("teacher");
        String type = request.getParameter("type");
        String category = request.getParameter("category");
        int schoolId = Integer.parseInt(request.getParameter("schoolId"));
        try {
            int year = DateUtils.getCurrentYear();
            if (request.getParameter("year") != null) {
                year = 1900 + DateUtils.formatDate("yyyy", request.getParameter("year")).getYear();
            }
            Project project = new Project();
            project.setName(name);
            project.setCharger(charger);
            project.setTeacher(teacher);
            project.setSchoolId(schoolId);
            project.setType(type);
            project.setYear(year);
            project.setCategory(category);
            projectService.updateProjectInfo(id, project);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/project/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/project/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request, HttpServletResponse response,
                             Model model, Integer id) {
        Project project = new Project();
        try {
            project = (Project) projectService.queryById(id);
            if (project == null) {
                model.addAttribute("msg", "该项目不存在或者已被删除！");
            }
            projectService.deleteById(id);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/project/list";
        } catch (Exception e) {
            return "error";
        }
    }

}
