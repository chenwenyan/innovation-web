package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Type;
import com.nenu.innovation.service.TypeService;
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
 * TypeController
 *
 * @author: wychen
 * @time: 2017/4/10 13:24
 */
@Controller
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "/type",method = RequestMethod.GET)
    public String toList(HttpServletRequest request,HttpServletResponse response,
                         Model model){
        List<Type> types = Collections.emptyList();
        try{
            types = typeService.listAll();
            model.addAttribute("typeList",types);
            return "typeManagement/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/type",method = RequestMethod.POST)
    public String toSearchList(HttpServletRequest request,HttpServletResponse response,
                         Model model){
        List<Type> types = Collections.emptyList();
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try{
            types = typeService.queryBySearchInfo(name,assistantCode);
            model.addAttribute("typeList",types);
            return "typeManagement/list";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/type/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model){
        return "typeManagement/add";
    }

    @RequestMapping(value = "/type/add",method = RequestMethod.POST)
    public String newType(HttpServletRequest request,HttpServletResponse response,
                          Model model){
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try{
            if(typeService.checkExistByName(name)){
                model.addAttribute("msg","该类别名称已经存在！");
            }
           typeService.newType(name,assistantCode);
            return "redirect:/type";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/type/edit",method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request,HttpServletResponse response,
                         Model model,Integer id){
        try{
            Type type = new Type();
            type = typeService.queryById(id);
            if(type == null){
                model.addAttribute("msg","该类别不存在或者已被删除！");
            }
            model.addAttribute("type",type);
            return "typeManagement/edit";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/type/edit",method = RequestMethod.POST)
    public String updateTypeInfo(HttpServletRequest request, HttpServletResponse response,
                                 Model model){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try{
            typeService.updateTypeInfo(id,name,assistantCode);
            return "redirect:/type";
        }catch (Exception e){
            return "error";
        }
    }

    @RequestMapping(value = "/type/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request,HttpServletResponse response,
                             Model model,Integer id){
        try{
            Type type = new Type();
            type = typeService.queryById(id);
            if(type == null){
                model.addAttribute("msg","该类别不存在或者已被删除！");
            }
            typeService.deleteById(id);
            return "redirect:/type";
        }catch (Exception e){
            return "error";
        }
    }
}