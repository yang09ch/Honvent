package com.yang.service;

import com.yang.pojo.Hotevents;
import com.yang.util.PageUtil;

public interface HoteventsService {
    PageUtil<Hotevents> getLimit(String keyWord,Integer pageIndex,Integer pageSize);
    Hotevents getByid(Integer id);
    Hotevents getHotenentsByid(Integer id);
    int update(Integer id);
}
