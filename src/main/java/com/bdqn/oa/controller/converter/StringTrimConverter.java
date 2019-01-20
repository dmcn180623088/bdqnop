package com.bdqn.oa.controller.converter;

import org.springframework.core.convert.converter.Converter;

public class StringTrimConverter implements Converter<String,String>{
    @Override
    public String convert(String source) {
        
        try {
            if(source != null) {
                source = source.trim();
                if("".equals(source)) {
                    return null;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return source;
    }
}