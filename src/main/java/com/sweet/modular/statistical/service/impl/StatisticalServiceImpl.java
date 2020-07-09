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
        //技师的所有type 销售详情
        List<Map> list = detailTechMapper.findAllTech(userId,type,beginTime,endTime);
        //商品表集合
        List<Product> productList = productService.list();

        List<UserTechStatistical> list1 = new ArrayList<>();
        //总量
        int count1 = 0;

        for (Product p : productList) {
            UserTechStatistical userTech = new UserTechStatistical();
            //个数
            int count = 0;
            //商品总金额
            BigDecimal productAmount = new BigDecimal(0);
            //男客
            int man = 0;
            //女客
            int woman = 0;
            //散客
            int userFit = 0;
            userTech.setUserName(username);
            userTech.setName(p.getName());

            for (Map map : list) {
                if(p.getId().equals(map.get("productId"))){
                    count+=1;
                    productAmount = BigDecimalUtil.add(productAmount, (BigDecimal) map.get("amount"));
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
            }

//            count1 =count;
            count1 += count;
            userTech.setNumber(count);
            userTech.setAmount(productAmount);
            userTech.setMan(man);
            userTech.setWoman(woman);
            userTech.setUserFalse(userFit);
            userTech.setSelltype(p.getProductType());

            //只显示卖出的商品项
            if(count>0){
                list1.add(userTech);
            }
            //给每一个商品都添加一个  所有商品的售出总量 前台自己会把总量列合并
            for(UserTechStatistical u:list1){
                u.setTechCount(count1);
            }

        }
        return list1;
    }

}
