package com.nenu.innovation.controller;

import com.nenu.innovation.entity.*;
import com.nenu.innovation.service.*;
import com.nenu.innovation.utils.NumUtils;
import com.nenu.innovation.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Collections;
import java.util.List;

/**
 * ArticleController
 *
 * @author: wychen
 * @time: 2017/4/8 12:49
 */
@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private TypeService typeService;

    @Autowired
    private SchoolService schoolService;

    @Autowired
    private UserFileService userFileService;

    @RequestMapping(value = "article/list", method = RequestMethod.GET)
    public String toArticleList(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Article> articles = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        List<Type> types = Collections.emptyList();

        try {
            articles = articleService.listByPage(offset, pageSize);
            schools = schoolService.listAll();
            types = typeService.listAll();
            model.addAttribute("articleList", articles);
            model.addAttribute("schoolList", schools);
            model.addAttribute("typeList", types);
            model.addAttribute("pageNo", pageNo);
            int sum = articleService.count();
            model.addAttribute("count", NumUtils.ceilNum(sum, pageSize));
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/article/list";

        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article", method = RequestMethod.GET)
    public String toList(HttpServletRequest request, HttpServletResponse response,
                         Model model) {
        String pageNoStr = request.getParameter("pageNo");
        int pageNo = pageNoStr == null ? 0 : (Integer.parseInt(pageNoStr) - 1);
        int pageSize = 10;
        int offset = pageNo * pageSize;
        List<Article> articles = Collections.emptyList();
        List<School> schools = Collections.emptyList();
        List<Type> types = Collections.emptyList();

        String title = (request.getParameter("title") == null) ? null : request.getParameter("title");
        int schoolId = (request.getParameter("schoolId") == null) ? -1 : Integer.parseInt(request.getParameter("schoolId"));
        int typeId = (request.getParameter("typeId") == null) ? -1 : Integer.parseInt(request.getParameter("typeId"));
        int isAudited = (request.getParameter("isAudited") == null) ? -1 : Integer.parseInt(request.getParameter("isAudited"));

        try {
            articles = articleService.queryBySearchInfo(title, schoolId, typeId, isAudited, offset, pageSize);
            schools = schoolService.listAll();
            types = typeService.listAll();
            model.addAttribute("articleList", articles);
            model.addAttribute("schoolList", schools);
            model.addAttribute("typeList", types);
            model.addAttribute("pageNo", pageNo);
            int sum = articleService.countQueryBySearchInfo(title, schoolId, typeId, isAudited);
            model.addAttribute("count", NumUtils.ceilNum(sum, pageSize));
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            model.addAttribute("title", title);
            model.addAttribute("schoolId", schoolId);
            model.addAttribute("typeId", typeId);
            model.addAttribute("isAudited", isAudited);
            return "management/article/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article/add", method = RequestMethod.GET)
    public String toAdd(HttpServletRequest request, HttpServletResponse response,
                        Model model) {
        List<Type> types = Collections.emptyList();
        try {
            types = typeService.listAll();
            model.addAttribute("typeList", types);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/article/add";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "article/add", method = RequestMethod.POST)
    public String newArticle(HttpServletRequest request, HttpServletResponse response,
                             Model model) {

        String UPLOAD_FILE_PATH = request.getSession().getServletContext().getRealPath("") + "/";

        String title = request.getParameter("title").trim();
        int typeId = Integer.parseInt(request.getParameter("typeId"));
        String content = request.getParameter("content");
        Article article = new Article();
        try {
            if (articleService.checkExistByName(title)) {
                model.addAttribute("msg", "文章名称已存在！");
                model.addAttribute("isRedirect", true);
                return "management/article/add";
            }
            User user = UserUtils.setUserSession(request, model);
            article.setTitle(title);
            article.setTypeId(typeId);
            article.setContent(content);
            article.setCreatorId(user.getId());
            article.setSchoolId(user.getSchoolId());
            articleService.newArticle(article);

            // @RequestParam("file") MultipartFile file
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            // 判断 request 是否有文件上传,即多部分请求
            if (multipartResolver.isMultipart(request)) {
                // 转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                // 取得上传文件
                List<MultipartFile> fileList = multiRequest.getFiles("uploadInput");
                if (fileList.size() > 0) {
                    for (MultipartFile file : fileList) {
                        UserFile userFile = new UserFile();
                        if (file != null) {
                            // 取得当前上传文件的文件名称
                            String fileName = file.getOriginalFilename();
                            // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                            if (fileName.trim() != "") {
                                // 定义上传路径
                                String filePath = UPLOAD_FILE_PATH + fileName;
                                File localFile = new File(filePath);
                                file.transferTo(localFile);
                                userFile.setName(fileName);
                                userFile.setPath(fileName);
                                userFile.setSize(file.getSize());
                                userFile.setType(file.getContentType());
                                userFile.setUserId(UserUtils.setUserSession(request, model).getId());
                                userFile.setArticleId(article.getId());
                                userFileService.newFile(userFile);
                            }
                        }
                    }
                }
            }
            model.addAttribute("user", user);
            return "redirect:/article/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "article/edit", method = RequestMethod.GET)
    public String toEdit(HttpServletRequest request, HttpServletResponse response,
                         Model model, Integer id) {
        Article article = new Article();
        List<Type> types = Collections.emptyList();
        try {
            types = typeService.listAll();
            article = (Article) articleService.queryById(id);
            model.addAttribute("article", article);
            model.addAttribute("typeList", types);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/article/edit";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/edit", method = RequestMethod.POST)
    public String updateArticle(HttpServletRequest request, HttpServletResponse response,
                                Model model) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title").trim();
            String content = request.getParameter("content");
            int typeId = Integer.parseInt(request.getParameter("typeId"));
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            articleService.updateArticleById(id, title, content, typeId, user.getId());
            return "redirect:/article/list";
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }

    @RequestMapping(value = "/article/delete", method = RequestMethod.POST)
    public String deleteById(HttpServletRequest request, HttpServletResponse response,
                             Model model, Integer id) {
        try {
            if (articleService.queryById(id) == null) {
                model.addAttribute("msg", "该文章不存在或已被删除！");
                model.addAttribute("isRedirect", true);
                return "management/article/list";
            }
            articleService.deleteById(id);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/article/list";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/detail", method = RequestMethod.GET)
    public String toDetail(HttpServletRequest request, HttpServletResponse response,
                           Model model, Integer id) {
        Article article = new Article();
        List<UserFile> files = Collections.emptyList();
        try {
            article = (Article) articleService.queryById(id);
            if (article == null) {
                model.addAttribute("msg", "该文章不存在或已被删除！");
            }
            model.addAttribute("article", article);
            files = userFileService.queryByArticleId(article.getId());
            model.addAttribute("files", files);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "management/article/detail";
        } catch (Exception e) {
            return "error";
        }
    }

    @RequestMapping(value = "/article/audited", method = RequestMethod.POST)
    public String audited(HttpServletRequest request, HttpServletResponse response,
                          Model model) {
        int isAudited = 1;
        Article article = new Article();
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            article = (Article) articleService.queryById(id);
//            if (article == null) {
//                model.addAttribute("msg", "该文章不存在或已被删除！");
//            }
            articleService.setIsAudited(id, isAudited);
            User user = UserUtils.setUserSession(request, model);
            model.addAttribute("user", user);
            return "redirect:/article/list";
        } catch (Exception e) {
            return "error";
        }
    }
}
