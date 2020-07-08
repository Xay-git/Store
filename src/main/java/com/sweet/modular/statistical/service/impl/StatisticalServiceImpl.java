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
import com.sweet.modular.statistical.model.CategoryStatistical;
import com.sweet.modular.statistical.model.CategoryStatisticalList;
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

    @Override
    public List<CategoryStatistical> findCategoryStatistical(Integer type,String beginTime, String endTime) {
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
                    if (map.get("memberId")==null) {
                        userFit+=1;
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
}
