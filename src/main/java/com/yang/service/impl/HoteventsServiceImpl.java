package com.yang.service.impl;

import com.yang.mapper.HoteventsMapper;
import com.yang.pojo.Hotevents;
import com.yang.service.HoteventsService;
import com.yang.util.PageUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@Service
public class HoteventsServiceImpl implements HoteventsService {
    @Resource
    HoteventsMapper hm;
    @Override
    public PageUtil<Hotevents> getLimit(String keyWord, Integer pageIndex, Integer pageSize) {
        PageUtil<Hotevents> util=new PageUtil<>();
        util.setPageIndex(pageIndex);
        util.setPageSize(pageSize);
        util.setTotalCount(hm.getCount(keyWord));
        util.setList(hm.getLimit(keyWord, (pageIndex-1)*pageSize, pageSize));
        return util;
    }

    @Transactional
    @Override
    public Hotevents getByid(Integer id) {
        return hm.getByid(id);
    }

    @Override
    public Hotevents getHotenentsByid(Integer id) {
        return hm.getHotenentsByid(id);
    }

    @Override
    public int update(Integer id) {
        return hm.update(id);
    }
}
