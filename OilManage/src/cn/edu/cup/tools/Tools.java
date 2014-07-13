package cn.edu.cup.tools;

import java.util.UUID;

public class Tools {
	 /**
	    *获得一个UUID
	    *@return StringUUID
	    */
	    public static String getUUID(){
	        String s=UUID.randomUUID().toString();
	        //去掉“-”符号
	        return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24);
	    }

}
