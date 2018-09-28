package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.common.util.IDUtils;
import com.lllm.hotinfo.domain.entity.crawler.CrawlerBodyNewItem;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CrawlerBodyNews {

    public static List parse(String[] conditionArray, Element parentDiv, long parentId) {
        List list = new ArrayList<>();
        //头条
        list = getTouTiaoNews(parentDiv,parentId);
        return list;
    }

    /**
     * 头条新闻
     * @return
     */
    private static List getTouTiaoNews(Element parentDiv,long parentId) {
        List list = new ArrayList();
        //list div
        Elements elements = parentDiv.getElementsByClass("list_card");
        //list
        for (Element element : elements) {
            //img
            Element img = element.getElementsByClass("img smart-load zoom-img").get(0);
            //a
            Element a = element.getElementsByClass("tit share-url share-title").get(0);
            //p
            Element p = element.getElementsByClass("des share-brief").get(0);
            //tag
            Elements tags = element.getElementsByClass("tag color1");
            //自定义id
            long customId = IDUtils.getId();

            CrawlerBodyNewItem item = new CrawlerBodyNewItem();
            item.setId(customId);
            item.setUrl(a.attr("href"));
            item.setPic(img.attr("data-src"));
            item.setTitle(a.text());
            item.setDescr(p.text());
            item.setClassify("body-new");
            item.setCreated(new Date());
            item.setUpdated(new Date());
            if (tags.size()>0){
                Element tag = tags.get(0);
                item.setTag(tag.text());
            }else {
                item.setTag("null");
            }
            item.setDelFlag(1);
            item.setParentId(parentId);
            list.add(item);
        }
        return list;
    }

    /**
     * 获取大板块
     * @param document
     * @return
     */
    public static Elements getBosyElements(Document document) {
        Elements elements = null;
         Elements elementTemps = document.getElementsByClass("type_content-group");
         if (elementTemps.size()>0){
             Element elementTemp = elementTemps.get(0);
             elements = elementTemp.getElementsByClass("type-item");
         }
        return elements;
    }
}
