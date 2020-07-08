package com.sweet.modular.statistical.service.impl;

import com.sun.javafx.collections.MappingChange;
import com.sweet.core.util.BigDecimalUtil;
import com.sweet.modular.category.entity.Category;
import com.sweet.modular.category.service.CategoryService;
import com.sweet.modular.member.entity.Member;
import com.sweet.modular.member.service.MemberService;
import com.sweet.modular.product.entity.Product;
import com.sweet.modular.product.service.ProductService;
import com.sweet.modular.sell.mapper.SellMapper;
import com.sweet.modular.sell.service.SellService;
import com.sweet.modular.selldetail.entity.Selldetail;
import com.sweet.modular.selldetail.service.SelldetailService;
import com.sweet.modular.selldetailTech.entity.DetailTech;
import com.sweet.modular.selldetailTech.mapper.DetailTechMapper;
import com.sweet.modular.selldetailTech.service.DetailTechService;
import com.sweet.modular.statistical.model.CategoryStatistical;
import com.sweet.modular.statistical.model.CategoryStatisticalList;
import com.sweet.modular.statistical.model.UserTechStatistical;
import com.sweet.modular.statistical.service.StatisticalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class StatisticalServiceImpl implements StatisticalService {
    @Autowired
    CategoryService categoryService;
    @Autowired
    ProductService productService;
    @Autowired
    SellMapper sellMapper;
    @Autowired
    MemberService memberService;
    @Autowired
    SelldetailService selldetailService;
    @Autowired
    DetailTechService detailTechService;
    @Autowired
    DetailTechMapper detailTechMapper;

    @Override
    public List<CategoryStatistical> findCategoryStatistical(Integer type, String beginTime, String endTime) {
        List<Category> categoryList = categoryService.query().eq("CATEGORY_TYPE", type).list();
        List<CategoryStatistical> list = new ArrayList<>();

        for (Category c : categoryList) {
            CategoryStatistical category = new CategoryStatistical();
            category.setName(c.getName());
            List<Product> productList = productService.query().eq("CATEGORY_ID", c.getId()).list();
            //项目总数
            int count = 0;
            //项目总金额
            BigDecimal amount = new BigDecimal(0);
            List<CategoryStatisticalList> statisticalList = new ArrayList<>();
            for (Product d : productList) {
                CategoryStatisticalList categoryStatisticalList = new CategoryStatisticalList();

                List<Map> mapList = sellMapper.findSelltypeByid(3, null, d.getId(), beginTime, endTime);
                //商品总金额
                BigDecimal productAmount = new BigDecimal(0);
                //男客
                int man = 0;
                //女客
                int woman = 0;
                //散客
                int userFit = 0;
                for (Map map : mapList) {
                    productAmount = BigDecimalUtil.add(productAmount, (BigDecimal) map.get("amount"));
                    //会员信息
                    if (map.get("memberId") == null) {
                        userFit += 1;
                    } else {
                        Member m = memberService.query().eq("ID", map.get("memberId")).one();
                        switch (m.getSex()) {
                            case "1": {
                                man += 1;
                                break;
                            }
                            case "2": {
                                woman += 1;
                                break;
                            }
                            default: {
                                break;
                            }
                        }
                    }
                }
                count = count + mapList.size();
                //不同商品的总金额 相加
                amount = BigDecimalUtil.add(amount, productAmount);
                categoryStatisticalList.setName(d.getName());
                categoryStatisticalList.setCount(mapList.size());
                categoryStatisticalList.setCountAmount(productAmount);
                categoryStatisticalList.setAmount(d.getAmount());
                categoryStatisticalList.setMemberAmount(d.getMemberAmount());
                categoryStatisticalList.setMan(man);
                categoryStatisticalList.setWoman(woman);
                categoryStatisticalList.setUserFalse(userFit);
                statisticalList.add(categoryStatisticalList);
            }
            category.setCount(count);
            category.setCategoryAmount(amount);
            category.setList(statisticalList);
            list.add(category);
        }
        return list;
    }

    @Override
    public List<UserTechStatistical> findUserTechStatistical(String userId, String username, int type,String beginTime, String endTime) {
        //销售关系list
        List<Map> list = detailTechMapper.findAllTech(userId,beginTime,endTime);
        List<UserTechStatistical> list1 = new ArrayList<>();

        UserTechStatistical userTech = new UserTechStatistical();
        int count1 = 0;
        int count2 = 0;
        int count3 = 0;
        //男客
        int man1 = 0;
        int man2 = 0;
        int man3 = 0;
        //女客
        int woman1 = 0;
        int woman2 = 0;
        int woman3 = 0;
        //散客
        int userFit1 = 0;
        int userFit2 = 0;
        int userFit3 = 0;
        //总金额
        BigDecimal productAmount1 = new BigDecimal(0);
        BigDecimal productAmount2 = new BigDecimal(0);
        BigDecimal productAmount3 = new BigDecimal(0);

        List<CategoryStatisticalList> statisticalList = new ArrayList<>();
        for (Map map : list) {
            switch ((int) map.get("sellType")) {
                case 1: {
                    count1 += 1;
                    productAmount1 = BigDecimalUtil.add(productAmount1, (BigDecimal) map.get("amount"));
                    if (map.get("memberId") == null) {
                        userFit1 += 1;
                    } else {
                        Member m = memberService.query().eq("ID", map.get("memberId")).one();
                        switch (m.getSex()) {
                            case "1": {
                                man1 += 1;
                                break;
                            }
                            case "2": {
                                woman1 += 1;
                                break;
                            }
                            default: {
                                break;
                            }
                        }
                    }
                    break;
                }
                case 2: {
                    count2 += 1;
                    productAmount2 = BigDecimalUtil.add(productAmount2, (BigDecimal) map.get("amount"));
                    if (map.get("memberId") == null) {
                        userFit2 += 1;
                    } else {
                        Member m = memberService.query().eq("ID", map.get("memberId")).one();
                        switch (m.getSex()) {
                            case "1": {
                                man2 += 1;
                                break;
                            }
                            case "2": {
                                woman2 += 1;
                                break;
                            }
                            default: {
                                break;
                            }
                        }
                    }
                    break;
                }
                case 3: {

                    CategoryStatisticalList categoryStatisticalList = new CategoryStatisticalList();

                    List<Map> mapList = sellMapper.findSelltypeByid(3, null, (Long) map.get("productId"), null, null);
                    //商品总金额
                    BigDecimal productAmount = new BigDecimal(0);
                    //男客
                    int man = 0;
                    //女客
                    int woman = 0;
                    //散客
                    int userFit = 0;
                    for (Map maps : mapList) {
                        productAmount = BigDecimalUtil.add(productAmount, (BigDecimal) maps.get("amount"));
                        //会员信息
                        if (maps.get("memberId") == null) {
                            userFit += 1;
                        } else {
                            Member m = memberService.query().eq("ID", maps.get("memberId")).one();
                            switch (m.getSex()) {
                                case "1": {
                                    man += 1;
                                    break;
                                }
                                case "2": {
                                    woman += 1;
                                    break;
                                }
                                default: {
                                    break;
                                }
                            }
                        }
                    }
                    count3 = mapList.size();
                    //不同商品的总金额 相加
                    productAmount3 = BigDecimalUtil.add(productAmount3, productAmount);
                    categoryStatisticalList.setName((String) map.get("name"));
                    categoryStatisticalList.setCount(mapList.size());
                    categoryStatisticalList.setCountAmount(productAmount);
                    categoryStatisticalList.setAmount((BigDecimal) map.get("amount"));
                    categoryStatisticalList.setMemberAmount((BigDecimal) map.get("memberAmount"));
                    categoryStatisticalList.setMan(man);
                    categoryStatisticalList.setWoman(woman);
                    categoryStatisticalList.setUserFalse(userFit);
                    statisticalList.add(categoryStatisticalList);
                    break;
                }
                default: {
                    break;
                }
            }
        }
        int count = count1+count2+count3;
        switch (type) {
            case 1: {
                userTech.setUserName(username);
                userTech.setName("开卡");
                userTech.setTechCount(count);
                userTech.setNumber(count1);
                userTech.setSelltype(1);
                userTech.setAmount(productAmount1);
                userTech.setMan(man1);
                userTech.setWoman(woman1);
                userTech.setUserFalse(userFit1);
                list1.add(userTech);
                break;
            }
            case 2: {
                userTech.setUserName(username);
                userTech.setName("续卡");
                userTech.setTechCount(count);
                userTech.setNumber(count2);
                userTech.setSelltype(2);
                userTech.setAmount(productAmount2);
                userTech.setMan(man2);
                userTech.setWoman(woman2);
                userTech.setUserFalse(userFit2);
                list1.add(userTech);
                break;
            }
            case 3: {
                for (CategoryStatisticalList c: statisticalList){
                    userTech.setUserName(username);
                    userTech.setName(c.getName());
                    userTech.setTechCount(count);
                    userTech.setNumber(c.getCount());
                    userTech.setSelltype(3);
                    userTech.setAmount(c.getCountAmount());
                    userTech.setMan(c.getMan());
                    userTech.setWoman(c.getWoman());
                    userTech.setUserFalse(c.getUserFalse());
                    list1.add(userTech);
                }
                break;
            }
            default: {
                break;
            }
        }
        return list1;
    }

}
