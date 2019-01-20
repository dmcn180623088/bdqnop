package com.bdqn.oa.exception;

public class CustomException extends Exception{

	private static final long serialVersionUID = -1668707977736987938L;

	//异常信息
    public String message;

    public CustomException (String message) {
        super(message);
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
