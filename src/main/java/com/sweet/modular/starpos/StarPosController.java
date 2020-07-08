package com.sweet.modular.starpos;

import com.sweet.core.exception.ServiceException;
import com.sweet.core.model.ResultBean;
import com.sweet.modular.receipt.entity.Receipt;
import com.sweet.modular.receipt.service.ReceiptService;
import com.sweet.modular.starpos.service.StarPosService;
import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    StarPosService starPosService;
    @Autowired
    ReceiptService receiptService;
    /**
     * 异步回调
     */
    @PostMapping(value = "/notify")
    public ResultBean notify(@RequestBody Map<String,String> map, HttpServletResponse httpServletResponse) throws Exception {
        String TxnCode =  map.get("TxnCode");
        String TxnStatus = map.get("TxnStatus");
        String orderNo =map.get("OfficeId");


        Receipt receipt = receiptService.getReceiptByOrderNo(orderNo);


        if(TxnCode.equals(StarPosService.TxnCode_scanPhone)){
            if(TxnStatus.equals("1")){
                receipt.setReceiptStatus(ReceiptService.RECEIPT_SUCCESS);
            }
        }else if(TxnCode.equals(StarPosService.TxnCode_refund)){
            if(TxnStatus.equals("1")){
                receipt.setReceiptStatus(ReceiptService.RECEIPT_REFUND);
            }else{
                throw new ServiceException("退款失败");
            }
        }

        receiptService.updateById(receipt);
        return ResultBean.success();
    }
}
