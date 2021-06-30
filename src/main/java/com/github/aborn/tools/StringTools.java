package com.github.aborn.tools;

import com.github.aborn.utils.FileUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author aborn
 * @date 2021/06/30 10:56 AM
 */
public class StringTools {

    /**
     * 从邮件列表获取用户列表，以 ; 作为分割
     *
     * @param mailListContent 邮件列表内容，如
     * @return
     */

    public static String getEmailNameInfo(String mailListContent) {

        String[] arr = mailListContent.split(";");
        List<String> resultList = new ArrayList<>();

        for (String item : arr) {
            if (item.contains("<")) {
                String[] arrItem = item.split("<");
                if (arrItem.length > 0 && !resultList.contains(arrItem[0].trim())) {
                    resultList.add(arrItem[0].trim());
                }
            }
        }
        return String.join(";", resultList);
    }


    /**
     * 对邮件里的内容获取
     * @param args
     */
    public static void main(String[] args) {
        String inputValue = "zhangsan <zhangsan@qq.com>; lisi <lisi@hotmail.com>; ";
        String fileName = "/Users/aborn/temp/t.txt";
        String fileContent = FileUtils.read(fileName);
        System.out.println(getEmailNameInfo(inputValue));
        System.out.println("\n");
        System.out.println(getEmailNameInfo(fileContent));
    }
}
