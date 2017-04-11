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

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String main(Model model) {
        return "display/main";
    }

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public String searchProject(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
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

}
