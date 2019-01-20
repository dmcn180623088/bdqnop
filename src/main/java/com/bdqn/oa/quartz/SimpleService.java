package com.bdqn.oa.quartz;

import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.bdqn.oa.exception.CustomException;


@Service("simpleService")
@PropertySource("classpath:send_mail.properties") 
public class SimpleService {
	
	
	@Value("${title}")
	private String title; //发送短信的身份认证
	
	@Value("${content}")
	private String content; //发送短信的内容
	
	/**
	 * @Description: 
	 * 			到时见根据考试ID开始考试
	 * @param context 
	 * 			调度器的综合对象
	 * @throws CustomException 
	 */
	
	public void startExam(JobExecutionContext context) throws CustomException {
	}
	
	
	
	/**
	 * @Description: 
	 * 			到时见根据考试ID结束考试，
	 * 			为确保学生试卷数据提交完毕，执行结束会比定义的考试结束时间晚2分钟
	 * @param context 
	 * 			调度器的综合对象
	 */
	
	public void stopExam(JobExecutionContext context) throws CustomException {
		//monthPaperService.stopExam(context.getTrigger().getJobDataMap().getInt("examId"));
	}
	
	/**
	 * @Description:
	 * 			执行备忘定时提醒
	 * 			到时间进行邮箱提醒
	 * @author 盼盼
	 * @date 2018年12月9日 下午5:16:50
	 */
	public void sendMemoPhone(JobExecutionContext context) {
		//获得待办事项保存的id
		//Integer id = context.getTrigger().getJobDataMap().getInt("id");
		//获得当前的memo对象
		//根据memo中的消息进行查询，获得用户的手机号
		//定时发送邮件
		//SendMailUtil.sendMail("待办事项提醒", content, user.getEmail());
		//发送成功短信之后初始化 提醒时间 字段
	}
}
