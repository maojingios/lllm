package com.lllm.hotinfo.admin.util.CrawlerFile;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerBodyNewItem;
import com.lllm.hotinfo.domain.entity.crawler.CrawlerDetailContent;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;

public class Crawler {

    private static String[] conditionArray;
    private static String htmlText;
    private static Document document;

    /**
     * prepare for parse
     * @param conditions
     * @return
     */
    public static List parseParentCategory(String conditions){
        List list = new ArrayList<>();
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //父类
        list = CrawlerParentCategory.parse(conditionArray,document);
        return list;
    }

    /**
     * 子类
     * @param conditions
     * @return
     */
    public static Elements getParentEles (String conditions){
        Elements parentEles = null;
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //父类
        parentEles = CrawlerChildCategory.getParentEles(conditionArray,document);
        return parentEles;
    }

    /**
     * 获取所有新闻
     * @param conditions
     * @return
     */
    public static List getTopNews(String conditions){
        List list = new ArrayList<>();
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //top news
        list = CrawlerTopNews.parse(conditionArray,document);
        return list;
    }
    /**
     * 获取body新闻
     * @param conditions
     * @return
     */
    public static List getBodyNews(String conditions, Element parentDiv,long parentId) {
        List list = new ArrayList<>();
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //top news
        list = CrawlerBodyNews.parse(conditionArray,parentDiv,parentId);
        return list;
    }
    /**
     * 获取新闻大板块
     * @param conditions
     * @return
     */
    public static Elements getBodyElements(String conditions) {
        Elements elements = null;
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //top news
        elements = CrawlerBodyNews.getBosyElements(document);

        return elements;
    }

    /**
     * prepare for parse
     * @param conditions
     */
    public static void prepare(String conditions){
        //条件集合
        conditionArray = CrawlerUtils.getConditionArray(conditions);
        //数据源
        htmlText = CrawlerUtils.getHtml(CrawlerUtils.getUrl(conditionArray));
        if (htmlText.length()<300){
            System.out.println("爬取数据有问题："+htmlText);
        }
        //遍历解析
        document = CrawlerUtils.getDocument(htmlText);
    }

    /**
     * 处理子节点
     * @param parentId
     * @param element
     * @param conditions
     * @return
     */
    public static List getChildCategory(Long parentId, Element element, String conditions) {
        List list = new ArrayList<>();
        //筛选
        if (conditions == null || conditions.trim() == "") return null;
        //准备
        prepare(conditions);
        //子类
        list = CrawlerChildCategory.getChildCategorys(parentId,conditionArray,element);
        return list;
    }

    /**
     * 获取详情界面数据
     * @return
     */
    public static CrawlerDetailContent getCrawlerBodyNewItem(CrawlerBodyNewItem item) {
        CrawlerDetailContent content = null;
        String url = item.getUrl();
        String conditions = "url:"+url;
        prepare(conditions);
        content = CrawlerDetailTool.getContent(document,item.getId());
        return content;
    }
}
