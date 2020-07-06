package com.sweet.modular.starpos.util;

import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;

public class StarPosUtil {
    /**
     * 生产环境付款url
     */
    public static final String gatewayUrl = "http://gateway.starpos.com.cn/adpweb/ehpspos3/sdkBarcodePay.json";
    /**
     * 生产环境退款url
     */
    public static final String gatewayRefundUrl = "http://gateway.starpos.com.cn/adpweb/ehpspos3/sdkRefundBarcodePay.json";
    /**
     * 沙箱环境url
     */
    public static final String sandboxUrl = "http://sandbox.starpos.com.cn/adpweb/ehpspos3/sdkBarcodePay.json";

    /**
     * 机构号
     */
    public static final String orgNo = "80645";
    /**
     * 商户号
     */
    public static final String mercId = "800491000025974";
    /**
     * 设备号
     */
    public static final String trmNo = "XB938277";
    /**
     * 设备号
     */
    public static final String signkey = "6040D6A005ED41DCAFA67AABE6C72199";

    /**
     * 使用 Map按key进行排序
     * @param map
     * @return
     */
    public static Map<String, String> sortMapByKey(Map<String, String> map) {
        if (map == null || map.isEmpty()) {
            return null;
        }
        Map<String, String> sortMap = new TreeMap<String, String>(new Comparator<String>() {
            @Override
            public int compare(String obj1, String obj2) {
                return obj1.toLowerCase().compareTo(obj2.toLowerCase());//升序排序
            }
        });
        sortMap.putAll(map);
        return sortMap;
    }


    public static StringBuffer getValueStr(Map<String, String> map){
        StringBuffer sb=new StringBuffer();
        Iterator<Map.Entry<String, String>> entries = map.entrySet().iterator();
        while(entries.hasNext()){
            Map.Entry<String, String> entry = entries.next();
            String key = entry.getKey();
            String value = entry.getValue();
            if(value!=null){
                sb.append(value.trim());
            }
        }
        return sb;
    }


}
