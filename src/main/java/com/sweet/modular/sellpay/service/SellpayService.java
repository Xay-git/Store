package com.sweet.modular.sellpay.service;import com.sweet.modular.sellpay.entity.Sellpay;import com.baomidou.mybatisplus.extension.service.IService;import com.sweet.core.model.system.LayuiPageInfo;import com.baomidou.mybatisplus.extension.service.IService;import java.util.List;/** * <p> * 销售单付款方式 服务类 * </p> * * @author admin * @since 2020-04-30 */public interface SellpayService extends IService<Sellpay> {    public LayuiPageInfo findPageBySpec(Sellpay sellpay);    public List<Sellpay> findBySellId(Long sellId);}