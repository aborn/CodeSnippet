package com.github.aborn.utils;

import java.io.*;

import org.apache.commons.lang3.StringUtils;

/**
 * @author aborn
 * @date 2021/06/30 11:43 AM
 */
public class FileUtils {

    public static void main(String[] args) {
        String file = "/Users/aborn/temp/t.txt";
        System.out.println(read(file));
    }

    /**
     * Read file content as string，
     * null if file doesn't exist or read exception
     *
     * @param fileName 文件名全路径
     * @return file content
     */
    public static String read(String fileName) {
        if (StringUtils.isBlank(fileName)) {
            return null;
        }

        File file = new File(fileName);
        if (!file.exists()) {
            return null;
        }

        // 再从文件里读
        InputStream inputStream = null;
        try {
            inputStream = new FileInputStream(file);
            // 临时存储 bitSet的 array信息
            ByteArrayOutputStream out = new ByteArrayOutputStream();

            // 缓冲区大小
            int bufferSize = 1024;
            byte[] buffer = new byte[bufferSize];
            int n;
            // 读取到buffer缓冲区，缓冲区大小为bufferSize
            while ((n = inputStream.read(buffer)) != -1) {
                out.write(buffer, 0, n);
            }

            return out.toString();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        } finally {
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
