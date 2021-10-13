package com.yang.pojo;

import lombok.Data;

import java.io.Serializable;

@Data
public class Comment implements Serializable {
    private Integer id;
	private String  notEventend;
	private String commentDate;
	private Integer hotId;
}
