package com.lllm.hotinfo.admin.web.controller;

import com.lllm.hotinfo.admin.service.UserService;
import com.lllm.hotinfo.admin.util.RegexpUtils;
import com.lllm.hotinfo.admin.util.SystemConstants;
import com.lllm.hotinfo.domain.entity.HiUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "user")
public class UserController extends BaseController<HiUser, UserService> {

    @Autowired
    private UserService userService;

    /*跳转到用户展示页面*/
    @Override
    public String show(){
        return "modules/user/show";

    }

    /*跳转到添加页面*/
    @Override
    public String toForm(HttpServletRequest req){
        String uri = req.getRequestURI();
        if ("/user/form".equals(uri)){
            return "modules/user/form";
        }
        else {
            return "modules/user/profile";
        }
    }

    /**
     * 删除
     * @param id
     * @return
     */
    @Override
    public String delete(long id, RedirectAttributes redirectAttributes){
        if (id > -1){
            userService.delete(id);
            redirectAttributes.addFlashAttribute("successInfo", "删除信息成功");
        }
        return SystemConstants.REDIRECT_SHOW;
    }

    /**
     * 批量删除
     * @param req
     * @return
     */
    @Override
    public String batchDelete (HttpServletRequest req, RedirectAttributes redirectAttributes){
        String id = req.getParameter("ids");
        /*把String类型的数组转化为long类型的数组*/
        long[] array = strArrayToLongArray(id);
        userService.batchDelete(array);
        redirectAttributes.addFlashAttribute("message", "删除信息成功");
        return SystemConstants.REDIRECT_SHOW;
    }

    private long[] strArrayToLongArray(String id) {
        String[] strArray = id.split(",");
        long[] array = new long[strArray.length];
        for(int i = 0;i <strArray.length;i++){
            array[i] = Long.parseLong(strArray[i]);
        }
        return array;
    }

    /**
     * 修改
     * @param hiUser
     * @param req
     * @param model
     * @param attributes
     * @return
     */

    @Override
    public String update(HiUser hiUser, HttpServletRequest req, Model model, RedirectAttributes attributes) {
        String results = userService.validationInfo(hiUser,SystemConstants.ACTION_UPDATE);
        return setMsg(hiUser, req, model, attributes, results);
    }

    /**
     * 添加
     * @param hiUser
     * @param req
     * @param model
     * @param attributes
     * @return
     */
    @Override
    public String insert(HiUser hiUser, HttpServletRequest req, Model model, RedirectAttributes attributes) {
        String results = userService.validationInfo(hiUser,SystemConstants.ACTION_INSERT);
        return setMsg(hiUser, req, model, attributes, results);
    }

    private String setMsg(HiUser hiUser, HttpServletRequest req, Model model, RedirectAttributes attributes, String results) {
        if ("0".equals(results)) {
            req.getSession().setAttribute("hiUser", hiUser);
            attributes.addFlashAttribute("successInfo", "保存信息成功");
            return SystemConstants.REDIRECT_SHOW;
        } else {
            RegexpUtils.checkInfo(results,model);
            return "modules/user/form";
        }
    }
}
