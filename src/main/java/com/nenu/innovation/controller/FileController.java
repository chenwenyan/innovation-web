package com.nenu.innovation.controller;

import com.nenu.innovation.entity.UserFile;
import com.nenu.innovation.service.UserFileService;
import com.nenu.innovation.utils.UserUtils;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * FileController
 *
 * @author: wychen
 * @time: 2017/4/28 14:04
 */
@Controller
public class FileController {

    @Autowired
    private UserFileService userFileService;


    private static final String UPLOAD_FILE_PATH = "D:";

    @RequestMapping(value = "/ajax/upload",method = RequestMethod.POST)
    @ResponseBody
    public JSON ajaxFileUpload(HttpServletRequest request, HttpServletResponse response,
                               Model model) throws SecurityException, IOException{

        JSONObject result = new JSONObject();
        int code = 0;

        List<Integer> fileIds = new ArrayList<Integer>();

        try {
            // @RequestParam("file") MultipartFile file
            CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                    request.getSession().getServletContext());
            // 判断 request 是否有文件上传,即多部分请求
            if (multipartResolver.isMultipart(request)) {
                // 转换成多部分request
                MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
                // 取得request中的所有文件名
                Iterator<String> iter = multiRequest.getFileNames();
                while (iter.hasNext()) {

                    UserFile userFile = new UserFile();

                    // 取得上传文件
                    MultipartFile file = multiRequest.getFile(iter.next());
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
                            userFile.setPath(filePath);
                            userFile.setSize(file.getSize());
                            userFile.setType(file.getContentType());
                            userFile.setUserId(UserUtils.setUserSession(request, model).getId());
                            userFile.setDownloadNum(0);
                            userFileService.newFile(userFile);
                            int fileId = userFile.getId();
                            fileIds.add(fileId);
                        }
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        if(fileIds.size() > 0) {
            code = 1;
        }
        result.put("code",code);
        result.put("fileIds",fileIds);
        return result;
    }

}
