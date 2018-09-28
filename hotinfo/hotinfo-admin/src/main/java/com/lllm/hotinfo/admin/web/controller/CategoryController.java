package com.lllm.hotinfo.admin.web.controller;


import com.lllm.hotinfo.admin.service.CategoryService;
import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.common.util.BeanValidator;
import com.lllm.hotinfo.domain.entity.Category;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;

@Controller
@Transactional
@RequestMapping(value = "content/category")
public class CategoryController extends BaseTreeController<Category, CategoryService> {

    @Override
    @Transactional(readOnly = true)
    public String show(Category category, Model model) {
        ArrayList<Category> targetList = new ArrayList<>();
        sortTree(0L,targetList);
        model.addAttribute("list",targetList);
        return "modules/content/category/show";
    }

    @Override
    @Transactional(readOnly = true)
    public String form(Category category) {
        if (StringUtils.isBlank(category.getParentTitle())) {
            category.setParentTitle("/");
        }
        return "modules/content/category/form";
    }

    @Override
    public String delete(HttpServletRequest req , RedirectAttributes redirectAttributes) {
        /*拿到删除对象的id*/
        long id = Long.parseLong(req.getParameter("id"));
        service.delete(id);
        redirectAttributes.addFlashAttribute("message", "删除信息成功");
        return "redirect:/content/category/show";
    }

    @RequestMapping(value = {SystemConstants.ACTION_INSERT,SystemConstants.ACTION_UPDATE},method = RequestMethod.POST)
    public String save(Category category, HttpServletRequest req, Model model){
        // 验证不通过
        String result = BeanValidator.validator(category);
        if (result != null) {
            model.addAttribute("message", result);
            return "modules/content/category/form";
        }
        String uri = req.getRequestURI();
        if ("/content/category/insert".equals(uri)){
            service.insert(category);
        }else {
            service.update(category);
        }
        return "redirect:/content/category/show";
    }
}
