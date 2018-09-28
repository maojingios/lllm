package com.lllm.hotinfo.admin.service.impl;

import com.lllm.hotinfo.admin.dao.crawler.CrawlerBodyNewDao;
import com.lllm.hotinfo.admin.dao.crawler.CrawlerCategoryDao;
import com.lllm.hotinfo.admin.dao.crawler.CrawlerDetailDao;
import com.lllm.hotinfo.admin.dao.crawler.CrawlerTopNewDao;
import com.lllm.hotinfo.admin.service.CrawlerService;
import com.lllm.hotinfo.admin.util.CrawlerFile.Crawler;
import com.lllm.hotinfo.domain.entity.crawler.CrawlerBodyNewItem;
import com.lllm.hotinfo.domain.entity.crawler.CrawlerCategory;
import com.lllm.hotinfo.domain.entity.crawler.CrawlerDetailContent;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CrawlerServiceImpl implements CrawlerService {

    @Autowired
    private CrawlerCategoryDao crawlerCategoryDao;
    @Autowired
    private CrawlerTopNewDao crawlerTopNewDao;
    @Autowired
    private CrawlerBodyNewDao crawlerBodyNewDao;
    @Autowired
    private CrawlerDetailDao crawlerDetailDao;

    @Override
    public void run(String conditions) {

       List list = new ArrayList();
        if (list != null) {
            //父级类目
            if (conditions.endsWith("pac")){
                list = Crawler.parseParentCategory(conditions);
                crawlerCategoryDao.insertBatch(list);
            }
            //子类目
            else if (conditions.endsWith("clc")) {
                Elements elements = Crawler.getParentEles(conditions);

                for (Element element : elements) {
                    String dataId = element.attr("id");
                    CrawlerCategory category = crawlerCategoryDao.getByDataId(dataId);
                    Long parentId = category.getId();
                    list = Crawler.getChildCategory(parentId, element, conditions);
                    if (list.size() > 0) {
                        crawlerCategoryDao.insertBatch(list);
                    }
                }
            }
            //头部news
            else if (conditions.endsWith("tpn")){
                list = Crawler.getTopNews(conditions);
                crawlerTopNewDao.insertBatch(list);
            }
            //body新闻
            else if (conditions.endsWith("mbn")){
                //获取需要展示的大类
                List bodyCategories = crawlerCategoryDao.getByShowId();
                //获取新闻板块
                Elements elements = Crawler.getBodyElements(conditions);

                for (int i = 0;i<elements.size();i++){
                    CrawlerCategory category = (CrawlerCategory)bodyCategories.get(i);
                    Element parentDiv = elements.get(i);
                    list = Crawler.getBodyNews(conditions,parentDiv,category.getId());
                    crawlerBodyNewDao.insertBatch(list);

                    //获取每条新闻的详情界面
                    saveDetail(list);
                }
            }
        }
    }

    /**
     * 存储每条新闻的二级界面
     */
    private void saveDetail(List listTemp) {
        //遍历
        List list = new ArrayList();
        for (Object o : listTemp) {
            CrawlerBodyNewItem item = (CrawlerBodyNewItem) o;
            CrawlerDetailContent content = Crawler.getCrawlerBodyNewItem(item);
            list.add(content);
        }
        if(list.size()>0){
            crawlerDetailDao.insertBatch(list);
        }
    }
}
