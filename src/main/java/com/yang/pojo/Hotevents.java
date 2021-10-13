package com.yang.pojo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class Hotevents implements Serializable {
    private Integer id;
           private String  keyWord;
    private String  hotContent;
            private Integer searSum;
            private String createDate;
            private List<Comment> commentslist;
}
