package com.sweet.modular.starpos.util;
import java.math.BigDecimal;

/**
 * 金额工具类
 * Created by cxq on 2018/1/4.
 */
public class AmountUtil {

    /**
     * 分转元（除以100）四舍五入，保留2位小数
     * @param amount 金额 元
     * @return
     */
    public static String changeF2Y(String amount){
        return new BigDecimal(amount).divide(new BigDecimal(100)).setScale(2, BigDecimal.ROUND_HALF_UP).toString();
    }

    /**
     * 元转分（乘以100）
     * @param amount 金额 分（支持大数字，16位以上）
     * @return
     */
    public static String changeY2F(String amount){
        return new BigDecimal(amount).multiply(new BigDecimal(100)).toString();
    }

    public static void main(String[] arg){

        //普通数值
        System.out.println(changeF2Y("101"));
        //1.01
        System.out.println(changeY2F("101"));
        //10100

        //超16位以上数值
        System.out.println(changeF2Y("34353452345768679845234534343445"));
        //343534523457686798452345343434.45
        System.out.println(changeY2F("32123134757697845454423534232323"));
        //3212313475769784545442353423232300
    }

}