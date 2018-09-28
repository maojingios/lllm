package com.lllm.hotinfo.ui.controller;

import com.lllm.hotinfo.ui.dto.Comment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CommentController {

    @RequestMapping(value = "submit/comment", method = RequestMethod.POST)
    public void submitComment(HttpServletRequest request){
        String txt = request.getParameter("txt");
        System.out.println(txt);
    }

    /**
     *  根据前端传过来的 title，查找对应的文章 id，文章 id 作为评论的 parentId
     *  调用 API 对应的 selectCommentByParentName, 得到评论集合
     *  将数据返回给前端页面
     */
    @RequestMapping(value = "get/comment", method = RequestMethod.GET)
    @ResponseBody
    public List<Comment> getComment(String parentName, Model model){
        List<Comment> comments = new ArrayList<>();

        for (int i = 0; i < 5; i++){
            Comment comment = new Comment();
            comment.setContent(i+"xxx"+i+"评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容");
            comment.setUserName("用户"+i+"xxx");
            comments.add(comment);
        }
        System.out.println(comments);

        return comments;
    }
}
