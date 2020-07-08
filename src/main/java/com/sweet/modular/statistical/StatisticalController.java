package com.sweet.modular.statistical;

import com.sweet.core.model.ResultBean;
import com.sweet.core.util.Pinyin4j;
import com.sweet.modular.card.entity.Card;
import com.sweet.modular.card.service.CardService;
import com.sweet.modular.membercard.service.MembercardService;
import com.sweet.modular.sell.service.SellService;
import com.sweet.modular.selldetail.service.SelldetailService;
import com.sweet.modular.statistical.model.CardDateDetails;
import com.sweet.modular.statistical.model.CardStatistical;
import com.sweet.modular.statistical.model.CategoryStatistical;
import com.sweet.modular.statistical.model.UserTechStatistical;
import com.sweet.modular.statistical.service.StatisticalService;
import com.sweet.system.entity.User;
import com.sweet.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 统计宝报表
 *
 * @author
 */
@RequestMapping("/admin/statistical")
@Controller
public class StatisticalController {

    @Autowired
    MembercardService membercardService;
    @Autowired
    StatisticalService statisticalService;
    @Autowired
    CardService cardService;
    @Autowired
    SelldetailService selldetailService;
    @Autowired
    SellService sellService;
    @Autowired
    UserService userService;

    @RequestMapping("")
    public String statistical() {
        return "/modular/statistical/statistical";
    }
    @RequestMapping("datetable")
    public String datetable() {
        return "/modular/statistical/datetable";
    }

    @RequestMapping("/statistical_list")
    public String statisticalList() {
        return "/modular/statistical/statistical_list";
    }

    @RequestMapping("/getstatisticalCardList")
    @ResponseBody
    public ResultBean select(String beginTime, String endTime) {
        List<Card> list = cardService.list();
        List<CardStatistical> cardStatisticalList  = new ArrayList<>();
        for (Card c : list) {
            CardStatistical caed = new CardStatistical();
            CardStatistical s = sellService.findSelltypeByid(1,c.getId(),null,beginTime,endTime);
            CardStatistical g = sellService.findSelltypeByid(2,c.getId(),null,beginTime,endTime);
            List<CardDateDetails> Detailslist = new ArrayList<>();
            Detailslist.addAll(s.getCardDateDetailsList());
            Detailslist.addAll(g.getCardDateDetailsList());

            for (int i = 0; i < Detailslist.size(); i++)    {
                for (int j = Detailslist.size()-1; j > i; j--)  {
                    Date dates = Detailslist.get(j).getDatedesc();
                    Date date = Detailslist.get(j-1).getDatedesc();
                    if (dates.compareTo(date)>0)    {
                        //互换位置
                        CardDateDetails stu = Detailslist.get(j);
                        Detailslist.set(j, Detailslist.get(j-1));
                        Detailslist.set(j-1, stu);
                    }
                }
            }
            caed.setName(c.getName());
            caed.setCardCount(s.getCardCount());
            caed.setCardUserCount(s.getCardUserCount());
            caed.setCardAmount(s.getCardAmount());
            caed.setCardGiveAmount(s.getCardGiveAmount());
            caed.setChargedCount(g.getChargedCount());
            caed.setChargedAmount(g.getChargedAmount());
            caed.setChargedGiveAmount(g.getChargedGiveAmount());
            caed.setCardDateDetailsList(Detailslist);

            cardStatisticalList.add(caed);
        }
        return ResultBean.success(0, "success", cardStatisticalList);
    }
    @RequestMapping("/CategoryStatistical")
    @ResponseBody
    public ResultBean CategoryStatistical(Integer type,String beginTime, String endTime) {
        List<CategoryStatistical> list = statisticalService.findCategoryStatistical(type,beginTime,endTime);
        return ResultBean.success(0, "success", list);
    }

    @RequestMapping("/UserTechStatistical")
    @ResponseBody
    public ResultBean findUserTechStatistical(String beginTime, String endTime) {
        List<User> users = userService.query().eq("ACCOUNT_STATUS",1).ne("USER_GRADE","").list();
        List<UserTechStatistical> ulist = new ArrayList<>();
        for(User u:users){
            List<UserTechStatistical> list = statisticalService.findUserTechStatistical(u.getUserId(),u.getRealName(),1,beginTime,endTime);
            List<UserTechStatistical> list1 = statisticalService.findUserTechStatistical(u.getUserId(),u.getRealName(),2,beginTime,endTime);
            List<UserTechStatistical> list3 = statisticalService.findUserTechStatistical(u.getUserId(),u.getRealName(),3,beginTime,endTime);
            if(list.size()>0){
                ulist.addAll(list);
                ulist.addAll(list1);
                ulist.addAll(list3);
            }
        }

        return ResultBean.success(ulist);
    }
}
