package com.sweet.modular.statistical;

import com.sweet.core.model.ResultBean;
import com.sweet.modular.card.entity.Card;
import com.sweet.modular.card.service.CardService;
import com.sweet.modular.membercard.service.MembercardService;
import com.sweet.modular.sell.service.SellService;
import com.sweet.modular.selldetail.service.SelldetailService;
import com.sweet.modular.statistical.model.CardStatistical;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

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
            caed.setName(c.getName());
            caed.setCardCount(s.getCardCount());
            caed.setCardUserCount(s.getCardUserCount());
            caed.setCardAmount(s.getCardAmount());
            caed.setCardGiveAmount(s.getCardGiveAmount());
            caed.setChargedCount(g.getChargedCount());
            caed.setChargedAmount(g.getChargedAmount());
            caed.setChargedGiveAmount(g.getChargedGiveAmount());

            cardStatisticalList.add(caed);
        }
        return ResultBean.success(0, "success", cardStatisticalList);
    }
}
