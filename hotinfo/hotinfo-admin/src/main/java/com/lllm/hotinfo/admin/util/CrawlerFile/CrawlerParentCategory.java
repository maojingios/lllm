package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerCategory;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CrawlerParentCategory {

    /**
     * 解析父类
     * @param conditionArray
     * @param document
     * @return
     */
    public static List parse(String[] conditionArray, Document document) {
        List list = new ArrayList();
        Elements targetEles = null;
        //得到目标标签集合
        Element parentDiv = document.getElementById("MainNav");
        if (parentDiv!=null){
            targetEles = parentDiv.getElementsByTag("a");
        }
        if (targetEles!=null){
            //进一步处理
            list = genCategory(targetEles,conditionArray);
        }
        return list;
    }

    /**
     * 生成category
     * @param targetEles
     * @param conditionArray
     * @return
     */
    private static List genCategory(Elements targetEles, String[] conditionArray) {
        List<CrawlerCategory> list = new ArrayList<>();
        //遍历
        for (Element e : targetEles) {
            CrawlerCategory crawlerCategory = new CrawlerCategory();
            crawlerCategory.setTitle(e.text());
            crawlerCategory.setUrl("http:" + e.attr("href"));
            crawlerCategory.setCreated(new Date());
            crawlerCategory.setUpdated(new Date());
            crawlerCategory.setDelFlag(1);
            crawlerCategory.setIsParent(1);
            crawlerCategory.setParentId(0L);
            crawlerCategory.setShowInBody(0);
            crawlerCategory.setDataSubId(e.attr("data-subid"));

            list.add(crawlerCategory);
        }
        //单独处理其他
        CrawlerCategory other = new CrawlerCategory();
        other.setTitle("其它");
        other.setUrl("");
        other.setCreated(new Date());
        other.setUpdated(new Date());
        other.setDelFlag(1);
        other.setIsParent(1);
        other.setParentId(0L);
        other.setDataSubId("nav_sub");
        other.setShowInBody(0);
        list.add(other);
        return list;
    }

    /**
     * 得到目标标签集合对象
     * @param document
     * @param conditionArray
     * @return
     */
    public static Elements getElements(Document document, String[] conditionArray) {
        Elements targetEles = null;
        System.out.println(document);
        Element parentDiv = document.getElementById("MainNav");
        if (parentDiv!=null){
            targetEles = parentDiv.getElementsByTag("a");
        }
        return targetEles;
    }
}
