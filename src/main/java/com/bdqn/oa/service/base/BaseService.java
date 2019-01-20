package com.bdqn.oa.service.base;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

import javax.management.RuntimeErrorException;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.jboss.logging.Logger;

public class BaseService {
	public static final String SUCCESS="success";
	public static final String ERROR="error";
	public static final String EX = "ex";
	
	public static final String SAVE = "save";
	public static final String EDIT = "edit";
	public static final String QUERY = "query";
	public static final String DEL = "del";
	public static final String ARR = "arr";
	public static final String CODE = "code";
	public static final String MESSAGE = "message";
	public static final String OBJECT = "object";
	public static final String PARAM = "param";
	
	public static final String UP = "up";
	public static  final String DOWN = "down";
	
	
	public static final String SYSTEM_MANAGER = "admin";//admin身份
	public static final String IDENTITY_STUDENT= "9"; //学生身份
	public static final String IDENTITY_TEACHER= "2"; //教员身份
	public static final String IDENTITY_ASSISTANT = "3";//助教身份
	public static final String IDENTITY_HEADMASTER = "4";//班主任身份
	
	public static final String STRING_NUMBER_ZERO = "0";
	public static final String STRING_NUMBER_ONE = "1";
	public static final String STRING_NUMBER_TWO = "2";
	public static final String STRING_NUMBER_THREE = "3";
	public static final String STRING_NUMBER_FOUR = "4";
	public static final String STRING_NUMENR_FIVE = "5";
	public static final String STRING_NUMBER_SIX = "6";
	
	public static final Integer INTEGER_NUMBER_ZERO = 0;
	public static final Integer INTEGER_NUMBER_ONE = 1;
	public static final Integer INTEGER_NUMBER_TWO = 2;
	public static final Integer INTEGER_NUMBER_THREE = 3;
	public static final Integer INTEGER_NUMBER_FOUR = 4;
	public static final Integer INTEGER_NUMBER_FIVE = 5;
	public static final Integer INTEGER_NUMBER_SIX = 6;
	
	
	public static final Integer NUMBER_2000 = 2000; //成功状态码
	public static final Integer NUMBER_5000 = 5000; //失败状态码
	public static final Integer NUMBER_5001 = 5001; //异常状态码
	
	
	public static final String  NUMBER_9999 = "9999";
	
    public static final String ALIYUN_IDCARD_HOST = "https://fediscern.market.alicloudapi.com";
    public static final String ALIYUN_IDCARD_PATH = "/baseinfo";
    public static final String ALIYUN_IDCARD_METHOD = "GET";
    public static final String ALIYUN_IDCARD_APPCODE = "1b3fb8645992408989f85a5ab43027ec";
	
	
	public Logger logger = Logger.getLogger(this.getClass());
	
	public static Logger createLogger() {
		BaseService bs = new BaseService();
		return bs.logger;
	}
	
	public static void createInfoLogger() {
		createLogger().info("");
	}
	
	public static void createDebugLogger() {
		createLogger().error("");
	}
	
	
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}
	
	
	public static boolean isBlank(String str) {
		int strLen;
		if (str == null || (strLen = str.length()) == 0)
			return true;
		for (int i = 0; i < strLen; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				return false;
		
		return true;
	}
	
	public static boolean isBlank(Integer integer) {
		if(integer == null) {
			return true;
		}
		return false;
	}
	
	
	public static boolean isNotBlank(String str) {
		return !isBlank(str);
	}
	
	
	public static boolean isNotBlank(Integer integer) {
		return !isBlank(integer);
	}
	
	
   /**对象是否存在,如果存在则true*/
   public static boolean isNotExist(Object obj) {
	   if(obj == null) {
		   return false;
	   }
	   return true;
   }

   public static boolean isEmpty(String value) {
		if (value != null && !"".equalsIgnoreCase(value.trim()) && !"null".equalsIgnoreCase(value.trim())) {
			return false;
		} else {
			return true;
		}
	}

	/** 判断多个字符串是否相等，如果其中有一个为空字符串或者null，则返回false，只有全相等才返回true */
	public static boolean isEquals(String... agrs) {
		String last = null;
		for (int i = 0; i < agrs.length; i++) {
			String str = agrs[i];
			if (isEmpty(str)) {
				return false;
			}
			if (last != null && !str.equalsIgnoreCase(last)) {
				return false;
			}
			last = str;
		}
		return true;
	}

   
   public static boolean isExist(Object obj) {
	  return !isNotExist(obj);
   }
   /**
    * 判断对象属性中是否有null
    * @param obj 对象
    * @return 布尔   有null值则为false,都不为Null则true
    * @throws Exception 
    */
   public static boolean checkObject(Object obj){
	   boolean len = true;
        try {
			Field[] field = obj.getClass().getDeclaredFields();
			for (int j = 0; j < field.length; j++) {
			    String name = field[j].getName();
			    name = name.substring(0, 1).toUpperCase() + name.substring(1);
			    Method m = obj.getClass().getMethod("get" + name);
			    String value = (String) m.invoke(obj);
			    if (value != null) {
			    } else {
			        len = false;
			        return len;
			    }
			}
			return len;
		} catch (Exception e) {
			e.printStackTrace();
		}
        return len;
    }
   
   
   /**
	 * 消息返回 Map类型
	 * @param type 操作类型
	 * @param key  行为结果
	 * @return
	 */
	public static Map<String,Object> createMessageMap(String type,String key){
		switch (type) {
			case SAVE:
				switch (key) {
					case SUCCESS:
						return createMessageMap(2000,"保存成功");
					case ERROR:
						return createMessageMap(5000,"保存失败");
					default:
						return createMessageMap(8000,"执行异常");
				}
			case EDIT:
				switch (key) {
					case SUCCESS:
						return createMessageMap(2000,"修改成功");
					case ERROR:
						return createMessageMap(5000,"修改失败");
					default:
						return createMessageMap(8000,"执行异常");
				}
			case QUERY:
				switch (key) {
					case SUCCESS:
						return createMessageMap(2000,"查询成功");
					case ERROR:
						return createMessageMap(5000,"查询失败");
					default:
						return createMessageMap(8000,"执行异常");
				}
			case DEL:
				switch (key) {
					case SUCCESS:
						return createMessageMap(2000,"删除成功");
					case ERROR:
						return createMessageMap(5000,"删除失败");
					default:
						return createMessageMap(8000,"执行异常");
				}
			case DOWN:
				switch (key) {
				case SUCCESS:
					return createMessageMap(2000,"下载成功");
				case ERROR:
					return createMessageMap(5000,"下载失败");
				default:
					return createMessageMap(8000,"执行异常");
			}
			case PARAM:
				switch (key) {
				case ERROR:
					return createMessageMap(5000,"参数异常");
				default:
					return createMessageMap(8000,"执行异常");
			}		
				
		default:
			return null;
		}
	}
	
	public Map<String,Object> createCodeMap(Integer code){
		return createMessageMap(code, null, null);
	}
	
	public Map<String,Object> createBooleanAndMsgMap(boolean	bool,String message){
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(bool == true) {
			map.put("type", true);
			map.put("message", message);
		}else {
			map.put("type", false);
			map.put("message", message);
		}
		
		return map;
	}
	
	
	public Map<String,Object> createExceptionMap(){
		return createMessageMap(5000,"执行异常");
	}
	
	public Map<String,Object> createParamExceptionMap(){
		return createMessageMap(8000, "参数传递异常");
	}
	
	
	public static Map<String,Object> createMessageMap(Integer code,String message,Object obj){
		Map<String,Object>	map = new HashMap<>();
		try {
			map.put("code", code);
			map.put("message", message);
			map.put("obj", obj);
		} catch (Error e) {
			throw new RuntimeErrorException(e, "{success:false,info:\""+ e.getCause().getMessage()+"\"}");
		}
		
		return map;
	}
	
	public static Map<String,Object> createMessageMap(Integer code,String message){
		Map<String,Object>	map = new HashMap<>();
		try {
			map.put("code", code);
			map.put("message", message);
		} catch (Error e) {
			throw new RuntimeErrorException(e, "{success:false,info:\""+ e.getCause().getMessage()+"\"}");
		}
		
		return map;
	}
	
	public static String addFontAndImgToTitle(String oldTitle) {
		if (!oldTitle.contains("<span")) oldTitle ="<span style=\"font-size:20px;font-weight:700\">".concat(oldTitle).concat("</span>");
		if(oldTitle.contains("<img")) oldTitle = oldTitle.replaceAll("<img", " <img style='display:none;' ");
		return oldTitle;
	}
	
	public static void main(String[] args) {
		String s = "<span style=\"font-size:20px;font-weight:700\">大阿斯顿打算打算</span>";
		String string = hideFontAndImgToTitle(s);
		System.err.println(string);
	}
	
	public static String hideFontAndImgToTitle(String oldTitle) {
		if (oldTitle.contains("<span")) oldTitle = oldTitle.replaceAll("<span style=\"font-size:20px;font-weight:700;\">", "");
		if (oldTitle.contains("<span")) oldTitle = oldTitle.replaceAll("<span style=\"font-size:20px;font-weight:700\">", "");
		if (oldTitle.contains("<span")) oldTitle = oldTitle.replaceAll("<span style='font-size:20px;font-weight:700'>", "");
		if (oldTitle.contains("</span>")) oldTitle = oldTitle.replaceAll("</span>", "");
		return oldTitle;
	}
	
	public static String showFontAndImgToTitle(String oldTitle) {
		if(oldTitle.contains("<img style='display:none;'")) oldTitle = oldTitle.replaceAll("<img style='display:none;'", " <img style='display:block;' ");
		return oldTitle;
	}
	
	public static String buildTitleToHide(String oldTitle) {

		if(oldTitle.contains("<img")) {
			oldTitle = oldTitle.replaceAll("<img", " <img style='display:none;' ");
			//oldTitle = "<span style='font-size:20px;font-weight:700'>"  + replaceTitle +"</span>";
		}
		
		if(oldTitle.contains("<span style='font-size:20px;font-weight:700'>")) {
			String replaceAll = oldTitle.replaceAll("<span style='font-size:20px;font-weight:700'>", "");
			if(replaceAll.contains("</span>")) {
				String newTitle = replaceAll.replaceAll("</span>", "");
				return newTitle;
			}
		}else {
			return oldTitle;
		}
		
		return oldTitle;
	}
	
}
