package com.sweet.modular.statistical.service;

import com.sweet.modular.product.entity.Product;
import com.sweet.modular.statistical.model.CategoryStatistical;
import com.sweet.modular.statistical.model.UserTechStatistical;
import com.sweet.modular.statistical.service.impl.StatisticalServiceImpl;

import java.util.List;
import java.util.Map;

public interface StatisticalService{
    List<CategoryStatistical> findCategoryStatistical(Integer type,String beginTime, String endTime);

    List<UserTechStatistical> findUserTechStatistical(String userId,String username,int type,String beginTime, String endTime);
}
