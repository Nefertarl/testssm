package com.lanyuan.util;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * @program: olp
 * @description:
 * @author: 吴福生-32
 * @create: 2022-06-22 11:18
 * @version:1.0
 **/
public class UploadAndLoadUtil {
    //文件上传
    public static String upload(HttpServletRequest req, MultipartFile my){
        String newName=null;
        if (!"".equals(my.getOriginalFilename())){
            String path = req.getServletContext().getRealPath("/upload");
            File f = new File(path);
            if (!f.exists()){
                f.mkdirs();
            }
            String oldName = my.getOriginalFilename();
            String suffix = oldName.substring(oldName.lastIndexOf("."));
            newName = UUID.randomUUID().toString().replaceAll("-","")+suffix;
            path=path+File.separator+newName;
            try {
                my.transferTo(new File(path));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return newName;
    }

    /*//文件下载
    public static ResponseEntity<byte[]> download(HttpServletRequest req, String fileName){
        //获取头部信息类
        HttpHeaders headers = new HttpHeaders();
        //设置文档类型
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        //设置附件形式下载 (附件,文件名)
        headers.setContentDispositionFormData("attachment",fileName);
        String path = req.getServletContext().getRealPath("/upload")+ File.separator+fileName;
        byte[] bs = new byte[0];
        try {
            bs = FileUtils.readFileToByteArray(new File(path));
        } catch (IOException e) {
            e.printStackTrace();
        }
        ResponseEntity<byte[]> re = new ResponseEntity<byte[]>(bs,headers, HttpStatus.CREATED);
        return re;
    }*/
}