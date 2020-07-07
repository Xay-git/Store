package com.sweet.modular.statistical;

import com.sweet.core.model.ResultBean;
import com.sweet.modular.card.entity.Card;
import com.sweet.modular.card.service.CardService;
import com.sweet.modular.membercard.service.MembercardService;
import com.sweet.modular.sell.service.SellService;
import com.sweet.modular.selldetail.service.SelldetailService;
import com.sweet.modular.statistical.model.CardDateDetails;
import com.sweet.modular.statistical.model.CardStatistical;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    CardService cardService;
    @Autowired
    SelldetailService selldetailService;
    @Autowired
    SellService sellService;

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
            CardStatistical s = sellService.findSelltypeByid(1,c.getId(),beginTime,endTime);
            CardStatistical g = sellService.findSelltypeByid(2,c.getId(),beginTime,endTime);
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
}
