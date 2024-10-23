package com.future.my.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.UUID;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileController {

    @Value("#{util['file.upload.path']}")
    private String CURR_IMAGE_PATH;

    @Value("#{util['file.download.path']}")
    private String WEB_PATH;

    @RequestMapping("/download")
    public void download(String imageFileName, HttpServletResponse response) throws IOException {
        String downloadFile = CURR_IMAGE_PATH + File.separator + imageFileName;
        File file = new File(downloadFile);
        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + imageFileName + "\"");

        try (FileInputStream in = new FileInputStream(file);
             OutputStream out = response.getOutputStream()) {
            byte[] buffer = new byte[1024 * 8];
            int count;
            while ((count = in.read(buffer)) != -1) {
                out.write(buffer, 0, count);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @ResponseBody
    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public Map<String, Object> singleImgUpload(@RequestParam("uploadImage") MultipartFile file) {
        Map<String, Object> responseMap = new HashMap<>();
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        System.out.println(file);
        System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
        
        try {
            if (file.isEmpty()) {
                responseMap.put("message", "File is empty");
                responseMap.put("status", "error");
                return responseMap;
            }

            String fileName = file.getOriginalFilename();
            String extension = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
            String realName = UUID.randomUUID().toString() + extension;

            File targetFile = new File(CURR_IMAGE_PATH, realName);
            file.transferTo(targetFile); // MultipartFile을 사용하여 파일 저장

            responseMap.put("message", "success");
            responseMap.put("imagePath", WEB_PATH + realName);
            return responseMap; // JSON 응답
        } catch (IOException e) {
            e.printStackTrace();
            responseMap.put("message", "File upload error");
            responseMap.put("status", "error");
            return responseMap;
        }
    }
}
