package a;

import com.alibaba.fastjson.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

/**
 * Created by highness on 2017/8/20 0020.
 */
public class TuLingTest {

    static String url = "http://www.tuling123.com/openapi/api";
    static String apiKey = "a8fdcab49e44f87a789b599d19e11e4b";

    public static void main(String[] args) {

        JSONObject object = new JSONObject();
        object.put("key", apiKey);
        object.put("info", "你好");
//        object.put("userid", "123456");

//        String post = post(url, object.toString());
        String post = SendPost(object.toString(), url);
        System.out.println();
        System.out.println(post);
        System.out.println();

        JSONObject jsonObject = JSONObject.parseObject(post);
        if (jsonObject.getInteger("code") == 100000){
            String text = jsonObject.getString("text");
            System.out.println(text);
        }


    }


    /**
     * 向后台发送post请求
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


    private static String post(String reqURL, String sendData){
        HttpURLConnection httpURLConnection = null;
        OutputStream out = null; // 写
        InputStream in = null; // 读
        int httpStatusCode = 0; // 远程主机响应的HTTP状态码
        try {
            URL sendUrl = new URL(reqURL);
            httpURLConnection = (HttpURLConnection) sendUrl.openConnection();
            httpURLConnection.setRequestMethod("POST");
            // 指示应用程序要将数据写入URL连接,其值默认为false
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
            httpURLConnection.setConnectTimeout(30000); // 30秒连接超时
            httpURLConnection.setReadTimeout(30000); // 30秒读取超时

            out = httpURLConnection.getOutputStream();
            out.write(sendData.toString().getBytes("UTF-8"));

            // 清空缓冲区,发送数据
            out.flush();

            // 获取HTTP状态码
            httpStatusCode = httpURLConnection.getResponseCode();

            in = httpURLConnection.getInputStream();

            byte[] byteDatas = new byte[in.available()];
            in.read(byteDatas);

            return new String(byteDatas);

        } catch (Exception e) {
            e.printStackTrace();
            return "null";
        }finally {
            if (out != null) {
                try {
                    out.close();
                } catch (Exception e) {

                }
            }
            if (in != null) {
                try {
                    in.close();
                } catch (Exception e) {

                }
            }
            if (httpURLConnection != null) {
                httpURLConnection.disconnect();
                httpURLConnection = null;
            }
        }
    }

}
