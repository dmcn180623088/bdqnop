package com.bdqn.oa.quartz.scheduler.impl;

import java.util.Date;

import org.quartz.CronExpression;
import org.quartz.DisallowConcurrentExecution;
import org.springframework.stereotype.Service;

import com.bdqn.oa.quartz.scheduler.SchedulerService;

@Service("schedulerService")
@DisallowConcurrentExecution
@SuppressWarnings("all")
public class SchedulerServiceImpl implements SchedulerService{

	@Override
	public void autoMemoSend(Date startTime, int repeatCount, Integer intPar, Class clazz, String jobName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void memoSend(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,
			Integer examId, Class clazz, String jobName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, String cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, String group, String cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(CronExpression cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, CronExpression cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, String group, CronExpression cronExpression) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void autoStartExam(Date startTime, int repeatCount, Integer examId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void startExam(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,
			Integer examId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void autoStopExam(Date startTime, int repeatCount, Integer intPar) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stopExam(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval, String group,
			Integer examId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime, int repeatCount) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime, int repeatCount, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime, int repeatCount) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime, int repeatCount, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, int repeatCount, long repeatInterval) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime, int repeatCount, long repeatInterval) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(Date startTime, Date endTime, int repeatCount, long repeatInterval, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void schedule(String name, Date startTime, Date endTime, int repeatCount, long repeatInterval,
			String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pauseTrigger(String triggerName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void pauseTrigger(String triggerName, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resumeTrigger(String triggerName) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void resumeTrigger(String triggerName, String group) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean removeTrigdger(String triggerName) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeTrigdger(String triggerName, String group) {
		// TODO Auto-generated method stub
		return false;
	}

}
