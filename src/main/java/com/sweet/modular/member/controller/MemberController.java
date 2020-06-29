package com.sweet.modular.member.controller;import com.sweet.core.exception.ServiceException;import com.sweet.core.shiro.ShiroKit;import com.sweet.core.translationDict.DictParam;import com.sweet.core.translationDict.TranslationDict;import com.sweet.modular.membercard.entity.Membercard;import com.sweet.modular.membercard.service.MembercardService;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.model.ResultBean;import com.sweet.core.model.system.LayuiPageInfo;import com.sweet.modular.member.entity.Member;import com.sweet.modular.member.service.MemberService;import org.springframework.beans.factory.annotation.Autowired;import org.springframework.web.bind.annotation.RequestMapping;import com.sweet.core.util.StringUtil;import org.springframework.stereotype.Controller;import org.springframework.web.bind.annotation.ResponseBody;import org.springframework.stereotype.Controller;import java.math.BigDecimal;import java.util.List;/** * <p> * 会员表 前端控制器 * </p> * * @author admin * @since 2020-04-25 */@Controller@RequestMapping("/admin/member")public class MemberController {    @Autowired    MemberService memberService;    @Autowired    MembercardService membercardService;    /**     * 列表页     */    @RequestMapping("/member_list")    public String list(){        return "/modular/member/member_list";    }    /**     * 编辑页     */    @RequestMapping("/member_edit")    public String edit(){        return "/modular/member/member_edit";    }    /**     * 添加/编辑     */    @RequestMapping("/editMember")    @ResponseBody    public ResultBean editMember(Member member){        if(StringUtil.isEmpty(member.getId())){            memberService.addMember(member);        }else{            memberService.editMember(member);        }        return ResultBean.success(member);    }    /**     * 删除     */    @RequestMapping("/delMember")    @ResponseBody    public ResultBean delMember(Member member){        member.setMemberStatus(memberService.MEMBER_DEL);        memberService.updateById(member);        return ResultBean.success(member);    }    /**     * 添加修改菜单     * @param menu     * @return     */    @RequestMapping("/getMemberDetail")    @ResponseBody    public ResultBean getMemberDetail(String id){        Member member = memberService.getById(id);        return ResultBean.success(member);    }    /**     * 列表数据     */    @RequestMapping("/getMemberList")    @ResponseBody    public LayuiPageInfo getMemberList(Member Member,String deptId){        Member.setDeptId(deptId);        LayuiPageInfo pageInfo = memberService.findPageBySpec(Member);        return pageInfo;    }    /**     * 列表数据     */    @RequestMapping("/getMemberCardList")    @ResponseBody    public ResultBean getMemberCardList(String memberId){        List<Membercard> membercards = membercardService.getMemberCardByMemberId(memberId);        return ResultBean.success(membercards);    }    @RequestMapping("/getMemberCountByTime")    @ResponseBody    public ResultBean getMemberCountByTime(String beginTime,String endTime){        String deptId = ShiroKit.getUser().getDeptId();        Integer count = memberService.getMemberCountByTime(beginTime, endTime,deptId);        return ResultBean.success(count);    };}