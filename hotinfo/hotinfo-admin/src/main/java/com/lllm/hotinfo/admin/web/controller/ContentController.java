package com.lllm.hotinfo.admin.web.controller;

import com.lllm.hotinfo.admin.service.ContentService;
import com.lllm.hotinfo.common.util.BeanValidator;
import com.lllm.hotinfo.domain.entity.Content;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "content")
public class ContentController extends BaseController<Content, ContentService> {

    @Override
    public String delete(long id , RedirectAttributes redirectAttributes) {
        if (id > -1){
            service.delete(id);
            redirectAttributes.addFlashAttribute("message", "删除信息成功");
        }
        return "redirect:/content/show";
    }

    @Override
    public String show(){
        return "modules/content/show";
    }

    @Override
    public String toForm(HttpServletRequest req){
        String uri = req.getRequestURI();
        if ("/content/form".equals(uri)){
            return "modules/content/form";
        }
        else {
            return "modules/content/profile";
        }
    }
    @Override
    public String batchDelete (HttpServletRequest req, RedirectAttributes redirectAttributes){
        String id = req.getParameter("ids");
        /*把String类型的数组转化为long类型的数组*/
        long[] array = strArrayToLongArray(id);
        service.batchDelete(array);
        redirectAttributes.addFlashAttribute("message", "删除信息成功");
        return "redirect:/content/show";
    }

    @Override
    public String update(Content content, HttpServletRequest req, Model model, RedirectAttributes attributes) {
        String result = BeanValidator.validator(content);
        if (result != null) {
            model.addAttribute("message", result);
            return "modules/content/form";
        }
        service.update(content);
        return "redirect:/content/show";
    }

    @Override
    public String insert(Content content, HttpServletRequest req, Model model, RedirectAttributes attributes) {
        String result = BeanValidator.validator(content);
        if (result != null) {
            model.addAttribute("message", result);
            return "modules/content/form";
        }
        service.insert(content);
        return "redirect:/content/show";
    }

    private long[] strArrayToLongArray(String id) {
        String[] strArray = id.split(",");
        long[] array = new long[strArray.length];
        for(int i = 0;i <strArray.length;i++){
            array[i] = Long.parseLong(strArray[i]);
        }
        return array;
    }

}
