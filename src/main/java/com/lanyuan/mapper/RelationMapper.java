package com.lanyuan.mapper;

import com.lanyuan.pojo.Relation;

public interface RelationMapper {
    int insert(Relation record);

    int insertSelective(Relation record);
}