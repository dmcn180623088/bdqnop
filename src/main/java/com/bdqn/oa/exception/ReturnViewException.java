package com.bdqn.oa.exception;

/**
* @ClassName: ReturnViewException 
* @Description: 此异常类型用来向前台返回页面
* @author 石家庄北大青鸟Y2教员 韩志彬
* @date 2018年12月3日 下午4:00:27
 */
public class ReturnViewException extends Exception{

	private static final long serialVersionUID = -1668707977736987938L;

	//异常信息
    public String message;

    public ReturnViewException (String message) {
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
