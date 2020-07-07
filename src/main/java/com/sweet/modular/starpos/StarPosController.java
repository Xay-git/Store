package com.sweet.modular.starpos;

import com.sweet.core.model.ResultBean;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@RestController
@RequestMapping("/starPos")
public class StarPosController {

    /**
     * 异步回调
     */
    @PostMapping(value = "/notify")
    public ResultBean notify(@RequestBody Map map, HttpServletResponse httpServletResponse) throws Exception {
        System.out.println("收到支付回调");
        System.out.println(map);
        return ResultBean.success();
    }
}
