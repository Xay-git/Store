package com.sweet.system.entity;import com.baomidou.mybatisplus.annotation.FieldFill;import com.baomidou.mybatisplus.annotation.TableName;import com.baomidou.mybatisplus.extension.activerecord.Model;import com.baomidou.mybatisplus.annotation.TableId;import com.baomidou.mybatisplus.annotation.TableField;import java.io.Serializable;import java.util.Date;import io.swagger.annotations.ApiModel;import io.swagger.annotations.ApiModelProperty;import lombok.Data;import lombok.EqualsAndHashCode;import lombok.experimental.Accessors;/** * <p> * 字典类型表 * </p> * * @author admin * @since 2019-12-16 */@Data@EqualsAndHashCode(callSuper = false)@Accessors(chain = true)@TableName("t_dict_type")@ApiModel(value="DictType对象", description="字典类型表")public class DictType extends Model<DictType> {    private static final long serialVersionUID = 1L;    @ApiModelProperty(value = "字典类型id")    @TableId(value = "DICT_TYPE_ID")    private String dictTypeId;    @ApiModelProperty(value = "字典类型编码")    @TableField(value = "CODE")    private String code;    @ApiModelProperty(value = "字典类型名称")    @TableField(value = "NAME")    private String name;    @ApiModelProperty(value = "字典描述")    @TableField(value = "DESCRIPTION")    private String description;    @ApiModelProperty(value = "排序")    @TableField(value = "ORDER_NUM")    private Integer orderNum;    @ApiModelProperty(value = "添加时间")    @TableField(value = "CREATE_TIME",fill = FieldFill.INSERT)    private Date createTime;    @Override    protected Serializable pkVal() {        return null;    }}