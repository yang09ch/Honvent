package com.yang.mapper;

import com.yang.pojo.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    List<Comment> getAll(Integer id);
    int inser(Comment comment);
}
