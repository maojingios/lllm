package com.lllm.hotinfo.admin.web.controller;


import com.lllm.hotinfo.admin.service.BaseService;
import com.lllm.hotinfo.domain.entity.BaseEntity;
import com.lllm.hotinfo.domain.entity.DataTableResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.ParameterizedType;

public abstract class BaseController<T extends BaseEntity,S extends BaseService<T>> {

    @Autowired
    protected S service;

    /**
     * 初始化回显功能
     * @param id
     * @return
     */
    @ModelAttribute
    public T getEntity(String id){
        T t = null;
        if (id == null || "0".equals(id)){
            try {
                ParameterizedType pType = (ParameterizedType) this.getClass().getGenericSuperclass();
                Class clazz = (Class<T>) pType.getActualTypeArguments()[0];
                t = (T) clazz.newInstance();
            } catch (InstantiationException e) {
                e.printStackTrace();
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        else{
            t = service.getTById(id==null? 0L:Long.parseLong(id));
        }
        return t;
    }

    /**
     * 分页
     * @param req
     * @param t
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "data",method = RequestMethod.GET)
    public DataTableResult<T> result(HttpServletRequest req, T t){
        /*从前端拿到dataTable的基本数据*/
        String strDraw = req.getParameter("draw");
        String strStart = req.getParameter("start");
        String strLength = req.getParameter("length");

        int draw = Integer.parseInt(strDraw == null ? "0" : strDraw);
        int start = Integer.parseInt(strStart == null ? "0" : strStart);
        int length = Integer.parseInt(strLength == null ? "10" : strLength);

        /*查处最大条数和被拦截后最大条数,传给前台*/
        int count = service.count(t);
        DataTableResult<T> dataTableResult = new DataTableResult<>();
        dataTableResult.setRecordsTotal(count);
        dataTableResult.setRecordsFiltered(count);
        /*拿到的draw传回去*/
        dataTableResult.setDraw(draw);
        /*拿到需要展示的信息*/
        dataTableResult.setData(service.page(t,start,length));

        return dataTableResult;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @RequestMapping(value = "delete" ,method = RequestMethod.GET)
    public abstract String delete(long id, RedirectAttributes redirectAttributes);

    /**
     * 展示
     * @return
     */
    @RequestMapping(value = "show" ,method = RequestMethod.GET)
    public abstract String show();

    /**
     * 添加
     * @param req
     * @return
     */
    @RequestMapping(value = {"form","view"},method = RequestMethod.GET)
    public abstract String toForm(HttpServletRequest req);

    /**
     * 批量删除
     * @return
     */
    @RequestMapping(value = "batchDelete",method = RequestMethod.POST)
    public abstract String batchDelete(HttpServletRequest req, RedirectAttributes redirectAttributes);

    /**
     *修改
     */
    @RequestMapping(value = "update" ,method = RequestMethod.POST)
    public abstract String update(T t,HttpServletRequest req, Model model, RedirectAttributes attributes);

    /**
     * 添加
     */
    @RequestMapping(value = "insert",method = RequestMethod.POST)
    public abstract String insert(T t,HttpServletRequest req, Model model, RedirectAttributes attributes);
}
