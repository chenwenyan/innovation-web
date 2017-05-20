package com.nenu.innovation.controller;

import com.nenu.innovation.entity.Type;
import com.nenu.innovation.entity.User;
import com.nenu.innovation.service.TypeService;
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
 * TypeController
 *
 * @author: wychen
 * @time: 2017/4/10 13:24
 */
@Controller
public class TypeController {

    @Autowired
    private TypeService typeService;

    @RequestMapping(value = "type/list", method = RequestMethod.GET)
    public String toList(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Type> types = Collections.emptyList();
        try {
//            types = typeService.listByPage(offset, pageSize);
            types = typeService.listAll();
            int sum = typeService.count();
            model.addAttribute("typeList", types);
//            model.addAttribute("pageNo", pageNo);
//            model.addAttribute("count", NumUtils.ceilNum(sum,pageSize));
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            if (user.getSchoolId() == 0) {
                return "management/type/list";
            } else {
                return "redirect:/article/list";
            }
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type", method = RequestMethod.POST)
    public String toSearchList(HttpServletRequest request, HttpServletResponse response,
                               Model model) {
        List<Type> types = Collections.emptyList();
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try {
            types = typeService.queryBySearchInfo(name, assistantCode);
            model.addAttribute("typeList", types);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            model.addAttribute("name", name);
            model.addAttribute("assistantCode", assistantCode);
            return "management/type/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model) {
        try {
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/type/add";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type/add", method = RequestMethod.POST)
    public String newType(HttpServletRequest request, HttpServletResponse response,
                          Model model) {
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try {
            if (typeService.checkExistByName(name)) {
                model.addAttribute("msg", "该类别名称已经存在！");
            }
            typeService.newType(name, assistantCode);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/type/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type/edit", method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request, HttpServletResponse response,
                         Model model, Integer id) {
        try {
            Type type = new Type();
            type = (Type) typeService.queryById(id);
            if (type == null) {
                model.addAttribute("msg", "该类别不存在或者已被删除！");
            }
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            model.addAttribute("type", type);
            return "management/type/edit";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type/edit", method = RequestMethod.POST)
    public String updateTypeInfo(HttpServletRequest request, HttpServletResponse response,
                                 Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String assistantCode = request.getParameter("assistantCode");
        try {
            typeService.updateTypeInfo(id, name, assistantCode);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/type/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/type/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request, HttpServletResponse response,
                             Model model, Integer id) {
        try {
            Type type = new Type();
            type = (Type) typeService.queryById(id);
            if (type == null) {
                model.addAttribute("msg", "该类别不存在或者已被删除！");
            }
            typeService.deleteById(id);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/type/list";
        } catch (Exception e) {
            return "error";
        }
    }
}
