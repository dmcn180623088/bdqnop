package com.bdqn.oa.quartz.scheduler;

import java.util.Date;

import org.quartz.CronExpression;

/**
 * @ClassName SchedulerService
 * @Description 自定义动态调度容器 
 */
@SuppressWarnings("all")
public interface SchedulerService {
	
	
	/**
	 * @Description:
	 * 			定时发短信提醒用户的备忘事项
	 * @param startTime
	 * 			开始执行的时间
	 * @param repeatCount
	 * 			重复执行次数
	 * @param intPar
	 * 			操作的数据实体ID（可以为其他类似唯一识别的参数）
	 * 			想要取出存入的ID 必须使用键名："id"
	 * @param clazz
	 * 			执行的Job
	 * @param jobName
	 * 			当前任务名称
	 */
	void autoMemoSend(Date startTime, int repeatCount,Integer intPar,Class clazz,String jobName);
	
	void memoSend(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,Integer examId,Class clazz,String jobName);
	
	

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param cronExpression
	 *            Quartz Cron 表达式，如 "0/10 * * ? * * *"等
	 */
	void schedule(String cronExpression);

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param name
	 *            Quartz CronTrigger名称
	 * @param cronExpression
	 *            Quartz Cron 表达式，如 "0/10 * * ? * * *"等
	 */
	void schedule(String name, String cronExpression);

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param name
	 *            Quartz CronTrigger名称
	 * @param group
	 *            Quartz CronTrigger组
	 * @param cronExpression
	 *            Quartz Cron 表达式，如 "0/10 * * ? * * *"等
	 */
	void schedule(String name, String group, String cronExpression);

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param cronExpression
	 *            Quartz CronExpression
	 */
	void schedule(CronExpression cronExpression);

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param name
	 *            Quartz CronTrigger名称
	 * @param cronExpression
	 *            Quartz CronExpression
	 */
	void schedule(String name, CronExpression cronExpression);

	/**
	 * 根据 Quartz Cron Expression 调试任务
	 * 
	 * @param name
	 *            Quartz CronTrigger名称
	 * @param group
	 *            Quartz CronTrigger组
	 * @param cronExpression
	 *            Quartz CronExpression
	 */
	void schedule(String name, String group, CronExpression cronExpression);

	/**
	 * 在startTime时执行调试一次
	 * 
	 * @param startTime
	 *            调度开始时间
	 */
	void schedule(Date startTime);

	void schedule(Date startTime, String group);

	/**
	 * 在startTime时执行调试一次
	 * 
	 * @param name
	 *            Quartz SimpleTrigger 名称
	 * @param startTime
	 *            调度开始时间
	 */
	void schedule(String name, Date startTime);

	void schedule(String name, Date startTime, String group);

	/**
	 * 在startTime时执行调试，endTime结束执行调度
	 * 
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 */
	void schedule(Date startTime, Date endTime);

	void schedule(Date startTime, Date endTime, String group);

	/**
	 * 在startTime时执行调试，endTime结束执行调度
	 * 
	 * @param name
	 *            Quartz SimpleTrigger 名称
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 */
	void schedule(String name, Date startTime, Date endTime);

	void schedule(String name, Date startTime, Date endTime, String group);

	
	
	/**
	 * 自动开始考试调度器
	 *
	 * @param startTime
	 *            调度开始时间
	 * @param repeatCount
	 *            重复执行次数
	 */
	void autoStartExam(Date startTime, int repeatCount,Integer examId);

	void startExam(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,
			Integer examId);
	
	
	
	/**
	 * 自动结束考试调度器
	 *
	 * @param startTime
	 *            调度开始时间
	 * @param repeatCount
	 *            重复执行次数
	 */
	void autoStopExam(Date startTime, int repeatCount,Integer intPar);

	void stopExam(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,
			Integer examId);
	
	
	

	
	/**
	 * 在startTime时执行调试，endTime结束执行调度，重复执行repeatCount次
	 * 
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 * @param repeatCount
	 *            重复执行次数
	 */
	void schedule(Date startTime, Date endTime, int repeatCount);

	void schedule(Date startTime, Date endTime, int repeatCount, String group);

	/**
	 * 在startTime时执行调试，endTime结束执行调度，重复执行repeatCount次
	 * 
	 * @param name
	 *            Quartz SimpleTrigger 名称
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 * @param repeatCount
	 *            重复执行次数
	 */
	void schedule(String name, Date startTime, Date endTime, int repeatCount);

	void schedule(String name, Date startTime, Date endTime, int repeatCount, String group);

	/**
	 * 在startTime时执行调试，endTime结束执行调度，重复执行repeatCount次，每隔repeatInterval秒执行一次
	 * 
	 * @param startTime
	 *            调度开始时间
	 * 
	 * @param repeatCount
	 *            重复执行次数
	 * @param repeatInterval
	 *            执行时间隔间
	 */
	void schedule(Date startTime, int repeatCount, long repeatInterval);

	/**
	 * 在startTime时执行调试，endTime结束执行调度，重复执行repeatCount次，每隔repeatInterval秒执行一次
	 * 
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 * @param repeatCount
	 *            重复执行次数
	 * @param repeatInterval
	 *            执行时间隔间
	 */
	void schedule(Date startTime, Date endTime, int repeatCount, long repeatInterval);

	void schedule(Date startTime, Date endTime, int repeatCount, long repeatInterval, String group);

	/**
	 * 在startTime时执行调试，endTime结束执行调度，重复执行repeatCount次，每隔repeatInterval秒执行一次
	 * 
	 * @param name
	 *            Quartz SimpleTrigger 名称
	 * @param startTime
	 *            调度开始时间
	 * @param endTime
	 *            调度结束时间
	 * @param repeatCount
	 *            重复执行次数
	 * @param repeatInterval
	 *            执行时间隔间
	 */
	void schedule(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval);

	void schedule(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group);

	/**
	 * 暂停触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 */
	void pauseTrigger(String triggerName);

	/**
	 * 暂停触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 * @param group
	 *            触发器组
	 */
	void pauseTrigger(String triggerName, String group);

	/**
	 * 恢复触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 */
	void resumeTrigger(String triggerName);

	/**
	 * 恢复触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 * @param group
	 *            触发器组
	 */
	void resumeTrigger(String triggerName, String group);

	/**
	 * 删除触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 * @return
	 */
	boolean removeTrigdger(String triggerName);

	/**
	 * 删除触发器
	 * 
	 * @param triggerName
	 *            触发器名称
	 * @param group
	 *            触发器组
	 * @return
	 */
	boolean removeTrigdger(String triggerName, String group);

	

}
	
