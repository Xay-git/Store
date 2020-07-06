package com.sweet.demo;


import com.sweet.core.shiro.session.SessionService;
import com.sweet.core.util.RedisUtil;

import com.sweet.modular.starpos.service.StarPosService;
import com.sweet.system.service.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SweetApplicationTests {
    @Autowired
    StarPosService starPosService;

    @Test
    public void test() throws UnsupportedEncodingException {
      Map map =  starPosService.refundBarcodePay("20200706193006069153");
        System.out.println(map);
        String message = (String) map.get("message");
        System.out.println(message);
        System.out.println(URLDecoder.decode(message,"utf-8"));
    }


}
