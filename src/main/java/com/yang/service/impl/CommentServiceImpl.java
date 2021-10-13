package com.yang.service.impl;

import com.yang.mapper.CommentMapper;
import com.yang.pojo.Comment;
import com.yang.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    CommentMapper cm;
    @Override
    public List<Comment> getAll(Integer id) {
        return cm.getAll(id);
    }

    @Override
    public int inser(Comment comment) {
        return cm.inser(comment);
    }
}
