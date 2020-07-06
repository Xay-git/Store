package com.sweet.demo;

import cn.hutool.core.swing.clipboard.ClipboardUtil;
import cn.hutool.crypto.SecureUtil;
import cn.hutool.crypto.digest.MD5;
import com.alibaba.fastjson.JSONObject;
import com.sweet.core.util.StringUtil;
import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.apache.tomcat.util.security.MD5Encoder;

import java.awt.datatransfer.Clipboard;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;

/**
 * @author 郑焕奇
 * @description
 * @data 2020/7/1
 **/
public class Test {
    public static void main(String[] args) throws UnsupportedEncodingException {
/*        Clipboard a= ClipboardUtil.getClipboard();
        String ab=ClipboardUtil.getStr();
        System.out.println(ab);*/
startPOSApi();
    }
    public static void startPOSApi() throws UnsupportedEncodingException {
        String abc=URLDecoder.decode("%E6%95%B0%E6%8D%AE%E5%BA%93%E6%93%8D%E4%BD%9C%E9%94%99%E8%AF%AF","utf-8");
        System.out.println(abc);
        HashMap<String,String> map=new HashMap<String,String>();
        map.put("amount","1");
        map.put("authCode","136240440392878818");
        map.put("mercId","800491000025974");//商户号
        map.put("opSys","3");
        map.put("orgNo","80645");
        map.put("trmNo","XB938277");//设备号
        map.put("payChannel","WXPAY");
        map.put("signType","MD5");
        map.put("total_amount","1");
        map.put("tradeNo", StringUtil.getUUID());
        map.put("txnTime","20190702153245");
        map.put("version","V1.0.0");
        map.put("characterSet","00");
        Map sortMap=sortMapByKey(map);
        System.out.println(sortMap);
        System.out.println(getValueStr(sortMap));
        String waitSinger=getValueStr(sortMap);
        String signer=SecureUtil.md5(waitSinger);
        System.out.println(signer);
        JSONObject json = new JSONObject(sortMap);
        System.out.println(json.toString());
    }
    /**
     * 使用 Map按key进行排序
     * @param map
     * @return
     */
    public static Map<String, String> sortMapByKey(Map<String, String> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
//        Map<String, String> sortMap = new TreeMap<String, String>(new MapKeyComparator());
        Map<String, String> sortMap = new TreeMap<String, String>(new Comparator<String>() {
            public int compare(String obj1, String obj2) {
                return obj1.toLowerCase().compareTo(obj2.toLowerCase());//升序排序
            }
        });
        sortMap.putAll(map);
        return sortMap;
    }

    public static String getValueStr(Map<String, String> map){
        StringBuffer sb=new StringBuffer();
        Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<String, String> entry = entries.next();
            String key = entry.getKey();
            String value = entry.getValue();
            sb.append(value.trim());
        }
        sb.append("6040D6A005ED41DCAFA67AABE6C72199");
        return sb.toString();
    }
}
