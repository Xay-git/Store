package com.sweet.system.service.impl;import com.sweet.core.util.StringUtil;import com.sweet.system.model.FileInfoResult;import com.sweet.system.entity.FileInfo;import com.sweet.system.mapper.FileInfoMapper;import com.sweet.system.service.FileInfoService;import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;import org.apache.ibatis.annotations.Param;import org.springframework.stereotype.Service;import java.util.Arrays;import java.util.List;/** * <p> * 文件信息表 服务实现类 * </p> * * @author wxl * @since 2019-12-06 */@Servicepublic class FileInfoServiceImpl extends ServiceImpl<FileInfoMapper, FileInfo> implements FileInfoService {    @Override    public List<FileInfoResult> getFileList(String parentId) {        return baseMapper.getFileList(parentId);    }    @Override    public List<FileInfo> getFileInfoByIds(String ids) {        final String[] coverIds = {""};        Arrays.stream(ids.split(",")).forEach(s -> {            coverIds[0] += "'"+s+"',";        });        return baseMapper.getFileInfoByIds(coverIds[0].substring(0,coverIds[0].length()-1));    }    public String getFileSysPathByIds(String ids,String separator){        final String[] coverIds = {""};        Arrays.stream(ids.split(",")).forEach(s -> {            coverIds[0] += "'"+s+"',";        });        return baseMapper.getFileSysPathByIds(coverIds[0].substring(0,coverIds[0].length()-1),separator);    };}