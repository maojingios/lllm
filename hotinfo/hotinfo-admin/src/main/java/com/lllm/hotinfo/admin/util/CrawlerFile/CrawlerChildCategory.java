package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerCategory;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CrawlerChildCategory {

    /**
     * 获取子节点的块级元素
     *
     * @param conditionArray
     * @param document
     * @return
     */
    public static Elements getParentEles(String[] conditionArray, Document document) {
        Elements classEles = getElementClasses(document, conditionArray);
        return classEles;
    }

    /**
     * 生成子节点，并关联父节点id
     *
     * @param parentId
     * @param conditionArray
     * @return
     */
    public static List getChildCategorys(Long parentId, String[] conditionArray, Element element) {
        List list = new ArrayList();
        Elements targetEles = getElementCategorys(element, conditionArray);
        list = genCategory(parentId, targetEles, conditionArray);
        return list;
    }

    /**
     * 生成category
     *
     * @param targetEles
     * @param conditionArray
     * @return
     */
    private static List genCategory(Long parentId, Elements targetEles, String[] conditionArray) {
        List<CrawlerCategory> list = new ArrayList<>();
        //遍历
        for (Element e : targetEles) {
            CrawlerCategory crawlerCategory = new CrawlerCategory();
            crawlerCategory.setTitle(e.text());
            crawlerCategory.setUrl("http:"+e.attr("href"));
            crawlerCategory.setCreated(new Date());
            crawlerCategory.setUpdated(new Date());
            crawlerCategory.setDelFlag(1);
            crawlerCategory.setIsParent(0);
            crawlerCategory.setParentId(parentId);
            crawlerCategory.setDataSubId(e.attr(""));
            crawlerCategory.setShowInBody(0);
            list.add(crawlerCategory);
        }
        return list;
    }

    /**
     * 根据父级div获取子类
     *
     * @param conditionArray
     * @return
     */
    private static Elements getElementCategorys(Element element, String[] conditionArray) {
        Elements targetEles = null;
        targetEles = element.getElementsByTag("a");
//        for (String s : conditionArray) {
//            String[] sarr = s.split(":");
//            String key = sarr[0];
//            String value = sarr[1];
//            switch (key) {
//                case "tn": {
//                    targetEles = element.getElementsByTag(value);
//                }
//                break;
//                default:
//                    break;
//            }
//        }
        return targetEles;
    }

    /**
     * 根据类标签批量获取
     *
     * @param document
     * @param conditionArray
     * @return
     */
    private static Elements getElementClasses(Document document, String[] conditionArray) {
        Elements targetEles = null;
        Element parentDiv = document.getElementById("SubNav");
        if (parentDiv!=null){
            targetEles = parentDiv.getElementsByClass("pull_box");
        }
        return targetEles;
    }
}
