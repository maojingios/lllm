package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerTopNew;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CrawlerTopNews {

    public static List parse(String[] conditionArray, Document document) {
        List list = new ArrayList<>();
        //left
        CrawlerTopNew topLeftNew = getLeftNew(document);
        list.add(topLeftNew);
        //right
        List listTopRight = getRightNews(document);
        //top-hot
        List listTopHot = getTopHotNews(document);
        //combine
        list.addAll(listTopHot);
        list.addAll(listTopRight);
        list.add(topLeftNew);
        return list;
    }

    /**
     * 热点新闻
     *
     * @param document
     * @return
     */
    private static List getTopHotNews(Document document) {
        List list = new ArrayList();
        Element parentDiv = document.getElementsByClass("HotBox").get(0);
        //a s
        Elements as = parentDiv.getElementsByTag("a");

        for (Element a : as) {
            CrawlerTopNew crawlerTopNew = new CrawlerTopNew();
            crawlerTopNew.setUrl(a.attr("href"));
            crawlerTopNew.setPic("null");
            crawlerTopNew.setTitle(a.text());
            crawlerTopNew.setDescr(a.text());
            crawlerTopNew.setClassify("top-hot");
            crawlerTopNew.setCreated(new Date());
            crawlerTopNew.setUpdated(new Date());
            crawlerTopNew.setTag("null");
            crawlerTopNew.setDelFlag(1);

            if ("更多".equals(a.text())) {
                crawlerTopNew.setClassify("more-hot");
            }
            list.add(crawlerTopNew);
        }
        return list;
    }

    /**
     * 顶部右边新闻
     *
     * @param document
     * @return
     */
    private static List getRightNews(Document document) {
        List list = new ArrayList();
        Element parentDiv = document.getElementsByClass("mod_c2").get(0);
        //items
        Elements divs = parentDiv.getElementsByClass("item");
        //list
        for (Element element : divs) {
            //a tag
            Element a = element.getElementsByTag("a").get(0);
            //p tag
            Element p = element.getElementsByTag("p").get(0);
            //span
            Element span = element.getElementsByTag("span").get(0);

            CrawlerTopNew crawlerTopNew = new CrawlerTopNew();
            crawlerTopNew.setUrl(a.attr("href"));
            crawlerTopNew.setPic("null");
            crawlerTopNew.setTitle(a.text());
            crawlerTopNew.setDescr(p.text());
            crawlerTopNew.setClassify("top-right");
            crawlerTopNew.setCreated(new Date());
            crawlerTopNew.setUpdated(new Date());
            crawlerTopNew.setTag("null");
            crawlerTopNew.setDelFlag(1);

            list.add(crawlerTopNew);
        }
        return list;
    }

    /**
     * 顶部左边新闻
     *
     * @param document
     * @return
     */
    private static CrawlerTopNew getLeftNew(Document document) {
        CrawlerTopNew crawlerNew = new CrawlerTopNew();
        Element parentDiv = document.getElementById("SiderBarBcroll2_slidexinminpic");
        if (parentDiv != null) {
            //a tag
            Element a = parentDiv.getElementsByClass("aimg").get(0);
            //img tag
            Element img = parentDiv.getElementsByClass("zoom-img").get(0);
            //desc tag
            Element pDesc = parentDiv.getElementsByClass("descri").get(0);

            //set value
            crawlerNew.setUrl(a.attr("href"));
            crawlerNew.setPic(img.attr("src"));
            crawlerNew.setTitle(img.attr("title"));
            crawlerNew.setDescr(pDesc.text());
            crawlerNew.setClassify("top-left");
            crawlerNew.setCreated(new Date());
            crawlerNew.setUpdated(new Date());
            crawlerNew.setTag("null");
            crawlerNew.setDelFlag(1);
        }
        return crawlerNew;
    }
}
