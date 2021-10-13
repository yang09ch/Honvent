package com.yang.controller;

import com.yang.pojo.Comment;
import com.yang.pojo.Hotevents;
import com.yang.service.CommentService;
import com.yang.service.HoteventsService;
import com.yang.util.PageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
public class HoteventController {
    @Resource
    CommentService commentService;
    @Resource
    HoteventsService hoteventsService;
    @RequestMapping("/")
    public String index(){
        return "redirect:/getLimit";
    }
    @RequestMapping("/getLimit")
    public String getLimit(String keyWord,
                           @RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex, Model model){
        model.addAttribute("page",hoteventsService.getLimit(keyWord, pageIndex, 3));
        return "index";
    }
    @RequestMapping("/getList")
    @ResponseBody
    public PageUtil<Hotevents> getList(String keyWord,@RequestParam(value = "pageIndex",defaultValue = "1") Integer pageIndex){
        return hoteventsService.getLimit(keyWord,pageIndex,3);
    }

    @RequestMapping("/toPing/{id}")
    public String toPing(@PathVariable("id") Integer id,Model model){
        model.addAttribute("ho",hoteventsService.getByid(id));
        model.addAttribute("co",commentService.getAll(id));
        return "ping";
    }
    @RequestMapping("/Ping")
    public String Ping(Integer id,Model model){
        model.addAttribute("id",id);
        return "ping1";
    }
    @RequestMapping("/showPin")
    @ResponseBody
    public Hotevents showPin(Integer id){
        return hoteventsService.getHotenentsByid(id);
    }
    @RequestMapping("/doadd")
    @ResponseBody
    public String doadd(Comment comment){
        if (commentService.inser(comment)>0){
            hoteventsService.update(comment.getHotId());
            return "1";
        }
        return "0";
    }
 }
