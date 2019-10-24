package com.rj.util;

public class StringUtil {
    public static boolean isEmpty(String str) {
        if (str == null || str.trim().length()==0) {
            return true;
        } else {
            return false;
        }
    }
}
