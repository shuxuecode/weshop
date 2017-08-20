package org.weixin.util;

import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by highness on 2017/8/20 0020.
 */
public class TuLingRobotUtil {

    public static final String url = "http://www.tuling123.com/openapi/api";
    public static final String apiKey = "a8fdcab49e44f87a789b599d19e11e4b";


    public static String getMsg(String text){
        JSONObject object = new JSONObject();
        object.put("key", apiKey);
        object.put("info", text);
//        object.put("userid", "123456");

        String post = SendPost(object.toString(), url);

        JSONObject jsonObject = JSONObject.parseObject(post);
        if (jsonObject.getInteger("code") == 100000){
            return jsonObject.getString("text");
        }
        return null;
    }


    /**
     * 向后台发送post请求
     *
     * @param param
     * @param url
     * @return
     */
    public static String SendPost(String param, String url) {
        OutputStreamWriter out = null;
        BufferedReader in = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            HttpURLConnection conn = (HttpURLConnection) realUrl
                    .openConnection();
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setUseCaches(false);
            conn.setRequestMethod("POST");
            conn.setConnectTimeout(50000);
            conn.setReadTimeout(50000);
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("Authorization", "token");
            conn.setRequestProperty("tag", "htc_new");

            conn.connect();

            out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(param);

            out.flush();
            out.close();
            //
            in = new BufferedReader(new InputStreamReader(
                    conn.getInputStream(), "UTF-8"));
            String line = "";
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (in != null) {
                    in.close();
                }
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        return result;
    }
}
