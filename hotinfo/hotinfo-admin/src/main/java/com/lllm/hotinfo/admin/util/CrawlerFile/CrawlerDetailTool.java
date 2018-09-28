package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerDetailContent;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.Date;


public class CrawlerDetailTool {

    public static CrawlerDetailContent getContent(Document document, long parentId) {
        CrawlerDetailContent content = new CrawlerDetailContent();
        //parentDiv
        Elements parentDivs = document.getElementsByClass("PageCore");

        if (parentDivs.size() > 0) {
            Element parentDiv = parentDivs.get(0);
            //topnav
            Elements topNavEle = parentDiv.getElementsByClass("Mbx");
            if (topNavEle.size() > 0) {
                content.setTopNav(topNavEle.html());
            } else {
                content.setTopNav("null");
            }

            //正文div
            Elements centerContentEles = parentDiv.getElementsByClass("ArticleBox");
            if (centerContentEles.size() > 0) {
                Element centerContentEle = centerContentEles.get(0);
                //title
                Element aTitleElement = centerContentEle.getElementsByClass("a_title").get(0);
                content.setATitle(aTitleElement.text());

                //info
                Element infoElement = centerContentEle.getElementsByClass("info").get(0);
                content.setInfo(infoElement.html());

                //content
                Element contentElement = centerContentEle.getElementsByClass("a_content").get(0);
                content.setAContent(contentElement.html());

                //todayHots
                Element hotElement = centerContentEle.getElementsByClass("today_hots").get(0);
                content.setTodayHots(hotElement.html());

                //24h
                Element hot24Element = centerContentEle.getElementById("today-hots-a");
                content.setNews24H(hot24Element.html());
            }
        }
        content.setCreated(new Date());
        content.setUpdated(new Date());
        content.setDelFlag(1);
        content.setParentId(parentId);
        return content;
    }
}
