package com.lllm.hotinfo.admin.dao.crawler;

import com.lllm.hotinfo.domain.entity.crawler.CrawlerCategory;

import java.util.List;

public interface CrawlerCategoryDao extends CrawlerDao<CrawlerCategory>{

    CrawlerCategory getByDataId(String dataId);

    List getByShowId();
}
