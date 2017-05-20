package com.nenu.innovation.utils;

/**
 * NumUtils
 *
 * @author: wychen
 * @time: 2017/4/27 16:15
 */
public class NumUtils {

    public static int ceilNum(int num1, int num2) throws Exception {
        int result;
        try {
            result = (num1 % num2 == 0) ? num1 / num2 : num1 / num2 + 1;
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }
}
