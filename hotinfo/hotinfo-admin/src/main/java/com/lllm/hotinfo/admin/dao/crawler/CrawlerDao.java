package com.lllm.hotinfo.admin.dao.crawler;

import java.util.List;

public interface CrawlerDao <T> {

    int insert(T t);

    int insertBatch(List<T> cs);

}
