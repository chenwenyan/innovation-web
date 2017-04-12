package com.nenu.innovation.controller;

import com.nenu.innovation.entity.School;
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
 * schoolController
 *
 * @author: wychen
 * @time: 2017/4/10 13:24
 */
@Controller
public class SchoolController {
    @Autowired
    private SchoolService schoolService;

    @RequestMapping(value = "/school",method = RequestMethod.GET)
    public String toList(HttpServletRequest request,HttpServletResponse response,
                         Model model){
        List<School> schools = Collections.emptyList();
        try{
            schools = schoolService.listAll();
            model.addAttribute("schoolList",schools);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/school/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/school",method = RequestMethod.POST)
    public String toSearchList(HttpServletRequest request,HttpServletResponse response,
                               Model model){
        List<School> schools = Collections.emptyList();
        String name = request.getParameter("name");
        try{
            schools = schoolService.queryBySearchInfo(name);
            model.addAttribute("schoolList",schools);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/school/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/school/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model){
        model.addAttribute("user",request.getSession().getAttribute("user"));
        return "management/school/add";
    }

    @RequestMapping(value = "/school/add",method = RequestMethod.POST)
    public String newschool(HttpServletRequest request,HttpServletResponse response,
                          Model model){
        String name = request.getParameter("name");
        try{
            if(schoolService.checkExistByName(name) == 1){
                model.addAttribute("msg","该学院名称已经存在！");
            }
            schoolService.newSchool(name);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/school";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/school/edit",method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request,HttpServletResponse response,
                         Model model,Integer id){
        School school = new School();
        try{
            school = schoolService.queryById(id);
            if(school == null){
                model.addAttribute("msg","该学院不存在或者已被删除！");
            }
            model.addAttribute("school",school);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "management/school/edit";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/school/edit",method = RequestMethod.POST)
    public String updateSchoolInfo(HttpServletRequest request, HttpServletResponse response,
                                 Model model){
        String str = request.getParameter("id");
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        try{
            schoolService.updateSchoolInfo(id,name);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/school";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/school/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request,HttpServletResponse response,
                             Model model,Integer id){
        School school = new School();
        try{
            school = schoolService.queryById(id);
            if(school == null){
                model.addAttribute("msg","该学院不存在或者已被删除！");
            }
            schoolService.deleteById(id);
            model.addAttribute("user",request.getSession().getAttribute("user"));
            return "redirect:/school";
        }catch (Exception e){
            return "error";
        }
    }

}
