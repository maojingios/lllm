package com.lllm.hotinfo.admin.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping(value = "upload" )
public class UploadController {
    private static final String UPLOAD_PATH = "/static/upload/img";
    @ResponseBody
    @RequestMapping(value = "img", method = RequestMethod.POST)
    public Map<String, Object> img(MultipartHttpServletRequest req, MultipartFile dropFile){
        /*getRealPath获得返回给定虚拟路径的真实路径，如果转换错误，则返回null*/
        String uploadPath = req.getSession().getServletContext().getRealPath(UPLOAD_PATH );

        Map<String, Object> map = new HashMap<>();
        File uploadFilePath = new File(uploadPath);
        if (!uploadFilePath.exists()){
            uploadFilePath.mkdirs();
        }

        try {
        String oldFileName = dropFile.getOriginalFilename();
        //从后往前的第一个.开始截到最后
        String suffixName = oldFileName.substring(oldFileName.lastIndexOf("."));
        String newFileName = UUID.randomUUID().toString() + suffixName;

        // 上传文件
        File uploadFile = new File(uploadPath + "/" + newFileName);
        dropFile.transferTo(uploadFile);

        String scheme = req.getScheme();
        String serverName = req.getServerName();
        int serverPort = req.getServerPort();

        String imgUrl = String.format("%s://%s:%s/%s/%s", scheme, serverName, serverPort, UPLOAD_PATH, newFileName);
        map.put("imgUrl",imgUrl);
            System.out.println(map);
        return map;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
