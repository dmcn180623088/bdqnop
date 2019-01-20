package com.bdqn.oa.exception;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.support.spring.FastJsonJsonView;

public class IntegrateException implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception ex) {
		
		//判断是否为ajax请求，默认不是  
        boolean isAjaxRequest = false;  
        if(!StringUtils.isBlank(request.getHeader("x-requested-with")) && request.getHeader("x-requested-with").equals("XMLHttpRequest")){  
            isAjaxRequest = true; 
        }

        //如果是ajax请求
        if(isAjaxRequest) {
        	
        	CustomException  customException = null;
        	
        	if(ex instanceof CustomException) {
        		customException = (CustomException) ex;
            }else {
                //如果抛出的不是系统自定义的异常则重新构造一个未知错误异常
                //这里我就也有CustomException省事了，实际中应该要再定义一个新的异常
            	customException = new CustomException ("系统未知错误,请联系管理员");
            }
        	
        	 String message = customException.getMessage();
             
             //向前台返回错误信息
             ModelAndView model = new ModelAndView();
         
             FastJsonJsonView view = new FastJsonJsonView();
             
             Map<String,Object> map = new HashMap<String,Object>();
             
             map.put("code", 5000);
             map.put("message", message);
             
             view.setAttributesMap(map);
             
             model.setView(view);

             return model;
        }else {
        	//如果不是ajax请求 那么异常后需要返回页面
        	ReturnViewException returnViewException = null;
        	
        	if(ex instanceof ReturnViewException) {
            	returnViewException = (ReturnViewException) ex;
            }else {
            	returnViewException = new ReturnViewException("500");
            }
        	
        	 ModelAndView model = new ModelAndView();
        	 model.setViewName(returnViewException.getMessage());
        	 return model;
        }
       
	}

}

