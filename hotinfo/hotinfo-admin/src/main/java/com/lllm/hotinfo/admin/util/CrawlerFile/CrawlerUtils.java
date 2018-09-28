package com.lllm.hotinfo.admin.util.CrawlerFile;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.io.InputStream;

public class CrawlerUtils {
    /**
     * 得到目标标签集合对象
     * @param document
     * @param conditionArray
     * @return
     */
    public static Elements getElements(Document document, String[] conditionArray) {
        Elements targetEles = null;
        Element parentEle = null;
        for (String s : conditionArray) {
            String[] sarr = s.split(":");
            String key = sarr[0];
            String value = sarr[1];

            switch (key) {
                case "pn_id": {
                    parentEle = document.getElementById(value);
                }
                break;
                case "tn": {
                    targetEles = parentEle.getElementsByTag(value);
                }
                break;
                default:
                    break;
            }
        }
        return targetEles;
    }

    /**
     * @param htmlText
     * @return
     */
    public static Document getDocument(String htmlText) {
        return Jsoup.parse(htmlText);
    }

    /**
     * 获取条件数据组
     * @param conditions
     * @return
     */
    public static String[] getConditionArray(String conditions){
        return conditions.split(";");
    }

    /**
     * 根据URL 获取html文件
     * @param url
     * @return
     */
    public static String getHtml(String url) {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        httpGet.setHeader("Connection", "keep-alive");
        httpGet.setHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36");
        httpGet.setHeader("Cookie", "UM_distinctid=16442706a09352-0376059833914f-3c604504-1fa400-16442706a0b345; CNZZDATA1262458286=1603637673-1530123020-%7C1530123020; JSESSIONID=805587506F1594AE02DC45845A7216A4");
        CloseableHttpResponse httpResponse = null;
        String ret = "";
        InputStream is = null;
        try {
            // 请求并获得响应结果
            httpResponse = httpClient.execute(httpGet);
            HttpEntity httpEntity = httpResponse.getEntity();
            is = httpEntity.getContent();
            ret = convertStreamToString(is);
            return ret;
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        return null;
    }

    /**
     * 中文转换
     * @param is
     * @return
     */
    public static String convertStreamToString(InputStream is) {
        StringBuilder sb1 = new StringBuilder();
        byte[] bytes = new byte[4096];
        int size = 0;
        try {
            while ((size = is.read(bytes)) > 0) {
                String str = new String(bytes, 0, size, "utf-8");
                sb1.append(str);
            }
            return new String(sb1);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return "";
    }

    /**
     * 获取Url
     *
     * @return
     */
    public static String getUrl(String[] conditions) {
        String url = "";
        for (String condition : conditions) {
            if (condition.startsWith("url")) {
                String arr[] = condition.split(":");
                url = arr[1]+":"+arr[2];
                return url;
            }
        }
        return url;
    }

    /**
     * 获取需要生成的对象
     * @param conditions
     * @return
     */
    public static String getTargetClass(String[] conditions){
        String className = "";
        for (String condition : conditions) {
            if (condition.startsWith("pojo")) {
                String arr[] = condition.split(":");
                className = arr[1];
                return className;
            }
        }
        return className;
    }

    /**
     * 判断当前是否为父节点
     * @param conditions
     * @return
     */
    public static  boolean isParent(String[] conditions){
        boolean isParent= false;
        for (String condition : conditions) {
            if (condition.startsWith("parent")) {
                String arr[] = condition.split(":");
                isParent = "true".equals(arr[1]) ? true : false;
                return isParent;
            }
        }
        return isParent;
    }
}
