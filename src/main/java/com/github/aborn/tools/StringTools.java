package com.github.aborn.tools;

import java.util.ArrayList;
import java.util.List;

/**
 * @author aborn
 * @date 2021/06/30 10:56 AM
 */
public class StringTools {

    public static void main(String[] args) {
        String inputValue = "zhangsan <zhangsan@qq.com>; lisi <lisi@hotmail.com>; ";

        String[] arr = inputValue.split(";");
        List<String> resultList = new ArrayList<>();

        for (String item : arr) {
            if (item.contains("<")) {
                String[] arrItem = item.split("<");
                if (arrItem.length > 0 && !resultList.contains(arrItem[0].trim())) {
                    resultList.add(arrItem[0].trim());
                }
            }
        }

        System.out.println(String.join(";", resultList));
    }
}
