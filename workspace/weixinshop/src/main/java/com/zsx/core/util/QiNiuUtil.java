package com.zsx.core.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import com.alibaba.fastjson.JSONObject;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

public class QiNiuUtil {

	private final static String accessKey = "Z5DLmsX7sYiySxDgtk-QEtyqCFjv1tLYVgEIMoBQ";
	private final static String secretKey = "LeLKIY2qHsZgklLTxlGzk0kaoazTYkAn1K7hxKe4";

	// 要上传的空间
	private final static String bucketname = "highness";

	// 密钥配置
	Auth auth = Auth.create(accessKey, secretKey);

	// 第二种方式: 自动识别要上传的空间(bucket)的存储区域是华东、华北、华南。
	Zone zone = Zone.autoZone();

	Configuration configuration = new Configuration(zone);

	// 创建上传对象
	UploadManager uploadManager = new UploadManager(configuration);

	public static void main(String args[]) throws IOException {
		
		File file = new File("D:/wechat/weshop/HTML/demo/images/2.jpg");
		
		//name 原文件名
		String name = "1.jpg"; // file.getOriginalFilename();
		//文件格式 ———— 后缀名 
		String fileType = name.substring(name.lastIndexOf("."));
		//secondName 生成的uuID文件名
		String secondName = UUID.randomUUID().toString().replace("-", "") + fileType;
//        new QiNiuUtil().upload(file, secondName);
        InputStream is = new FileInputStream(file);
        new QiNiuUtil().upload(is, secondName);
		
//		System.out.println(JSONObject.parseObject("{\"hash\":\"FpOk4knwEbPdkU2ZPqo-Ou7qeAm9\",\"key\":\"fde9032f48444f2db476b6356a98ce82.jpg\"}").get("key"));
		
    }

    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    private String getUpToken() {
        return auth.uploadToken(bucketname);
    }

    public boolean upload(File file, String key) throws IOException {
        try {
            //调用put方法上传
            Response res = uploadManager.put(file, key, getUpToken());
            //打印返回的信息
            System.out.println(res.bodyString());
            
            return res.isOK();
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
            return r.isOK();
        }
    }
    
    
    public boolean upload(InputStream is, String key) throws IOException {
        try {
            //调用put方法上传
            Response res = uploadManager.put(is, key, getUpToken(), new StringMap(), "");
            //打印返回的信息
            System.out.println(res.bodyString());
            
            return res.isOK();
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                //响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException e1) {
                //ignore
            }
            return r.isOK();
        }
    }

}
