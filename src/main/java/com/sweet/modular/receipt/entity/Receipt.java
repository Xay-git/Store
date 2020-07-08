package com.sweet.modular.receipt.entity;import com.baomidou.mybatisplus.annotation.*;import com.baomidou.mybatisplus.annotation.TableField;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.annotation.IdType;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.Version;import com.baomidou.mybatisplus.annotation.TableId;import java.time.LocalDateTime;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 条码支付 * </p> * * @author admin * @since 2020-07-07 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("business_receipt")@ApiModel(value="Receipt对象", description="条码支付")public class Receipt extends Model<Receipt> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "ID")    @TableId(value = "ID", type = IdType.AUTO)    private Long id;    @ApiModelProperty(value = "交易单号")    @TableField(value = "TRADE_NO")    private String tradeNo;    @ApiModelProperty(value = "设备号")    @TableField(value = "TRM_NO")    private String trmNo;    @ApiModelProperty(value = "金额")    @TableField(value = "AMOUNT")    private String amount;    @ApiModelProperty(value = "销售单号")    @TableField(value = "SELL_ID")    private Long sellId;    @ApiModelProperty(value = "创建时间")    @TableField(value = "CREATE_TIME", fill = FieldFill.INSERT)    private Date createTime;    @TableField(value = "CREATE_ID", fill = FieldFill.INSERT)    private String createId;    @TableField(value = "CREATE_NAME", fill = FieldFill.INSERT)    private String createName;    @TableField(value = "DEPT_ID", fill = FieldFill.INSERT)    private String deptId;    @TableField(value = "RECEIPT_STATUS")    private Integer receiptStatus;    @TableField(value = "ORDER_NO")    private String orderNo;    @TableField(value = "RECEIPT_TYPE")    private Integer receiptType;   /** -----------字典装换数据----------- **/   /** -----------END 字典装换数据----------- **/    @Override    protected Serializable pkVal() {        return null;    }}