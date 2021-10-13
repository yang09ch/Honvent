package com.yang.mapper;

import com.yang.pojo.Hotevents;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface HoteventsMapper {
    int getCount(@Param("keyWord") String keyWord);
    List<Hotevents> getLimit(@Param("keyWord") String keyWord
            ,@Param("form")Integer form,@Param("pageSize") Integer pageSize);
    Hotevents getByid(Integer id);
    Hotevents getHotenentsByid(Integer id);
    int update(Integer id);
}
