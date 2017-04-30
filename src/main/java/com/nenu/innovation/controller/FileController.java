package com.nenu.innovation.controller;

import com.nenu.innovation.entity.UserFile;
import com.nenu.innovation.service.UserFileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;


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



    @RequestMapping(value = "file/download",method = RequestMethod.GET)
    public void fileDownload(HttpServletRequest request, HttpServletResponse response,
                               Model model) throws Exception{
        int fileId = Integer.parseInt(request.getParameter("fileId"));
        UserFile userFile = new UserFile();
        try {
            userFile = userFileService.queryById(fileId);
            if (userFile == null) {
                System.out.println("文件不存在！");
            } else {
                File proposeFile = new File(userFile.getPath());

                InputStream inputStream = null;
                OutputStream bufferOut = null;
                try {
                    // 设置响应报头
                    long fSize = proposeFile.length();
                    response.setContentType("application/x-download");
                    response.setCharacterEncoding("utf-8");
//                    response.addHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(proposeFile.getName(), "utf-8"));
                    response.addHeader("Content-Disposition", "attachment; filename=" + new String(proposeFile.getName().getBytes("gbk"),"iso-8859-1"));
                    // Accept-Ranges: bytes
                    response.setHeader("Accept-Ranges", "bytes");
                    long pos = 0, last = fSize - 1, sum = 0;// pos开始读取位置; last最后读取位置; sum记录总共已经读取了多少字节
                    if (null != request.getHeader("Range")) {
                        // 断点续传
                        response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
                        try {
                            // 情景一：RANGE: bytes=2000070- 情景二：RANGE: bytes=2000070-2000970
                            String numRang = request.getHeader("Range").replaceAll("bytes=", "");
                            String[] strRange = numRang.split("-");
                            if (strRange.length == 2) {
                                pos = Long.parseLong(strRange[0].trim());
                                last = Long.parseLong(strRange[1].trim());
                            } else {
                                pos = Long.parseLong(numRang.replaceAll("-", "").trim());
                            }
                        } catch (NumberFormatException e) {
                            pos = 0;
                        }
                    }
                    long rangLength = last - pos + 1;// 总共需要读取的字节
                    // Content-Range: bytes 10-1033/304974592
                    String contentRange = new StringBuffer("bytes ").append(pos).append("-").append(last).append("/").append(fSize).toString();
                    response.setHeader("Content-Range", contentRange);
                    // Content-Length: 1024
                    response.addHeader("Content-Length", String.valueOf(rangLength));

                    // 跳过已经下载的部分，进行后续下载
                    bufferOut = new BufferedOutputStream(response.getOutputStream());
                    inputStream = new BufferedInputStream(new FileInputStream(proposeFile));
                    inputStream.skip(pos);
                    byte[] buffer = new byte[1024];
                    int length = 0;
                    while (sum < rangLength) {
                        length = inputStream.read(buffer, 0, ((rangLength - sum) <= buffer.length ? ((int) (rangLength - sum)) : buffer.length));
                        sum = sum + length;
                        bufferOut.write(buffer, 0, length);
                    }
                } catch (Throwable e) {
//                    if (e instanceof ClientAbortException) {
//                        // 浏览器点击取消
//                        LOGGER.info("用户取消下载!");
//                    } else {
//                        LOGGER.info("下载文件失败....");
//                        e.printStackTrace();
//                    }
                } finally {
                    try {
                        if (bufferOut != null) {
                            bufferOut.close();
                        }
                        if (inputStream != null) {
                            inputStream.close();
                        }
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }

            }
        }catch (Exception e){
            e.printStackTrace();
        }
//        return null;
    }
}
