package com.yang.service;

import com.yang.pojo.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> getAll(Integer id);
    int inser(Comment comment);
}
