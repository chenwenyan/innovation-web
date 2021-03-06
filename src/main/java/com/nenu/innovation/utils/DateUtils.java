package com.nenu.innovation.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * DateUtils
 *
 * @author: wychen
 * @time: 2017/4/16 9:42
 */
public class DateUtils {

    public static Date formatDate(String format, String dateStr) throws Exception {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        try {
            return sdf.parse(dateStr);
        } catch (Exception e) {
            System.out.println("时间格式转换出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

    public static int getCurrentYear() throws Exception {
        try {
            return Calendar.getInstance().get(Calendar.YEAR);
        } catch (Exception e) {
            System.out.println("获取当前时间出错！");
            e.printStackTrace();
            throw new Exception(e.getMessage());
        }
    }

}
