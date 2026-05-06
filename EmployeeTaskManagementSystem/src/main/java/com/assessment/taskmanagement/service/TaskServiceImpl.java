package com.assessment.taskmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.assessment.taskmanagement.dao.TaskDAO;
import com.assessment.taskmanagement.model.Task;

@Component
public class TaskServiceImpl implements TaskService {
	
	@Autowired
	private TaskDAO  taskDAO;

	@Override
	public List<Task> getAllTaskList() {
		return taskDAO.getTaskList();
	}

	@Override
	public void saveTask(Task task) {
		taskDAO.addTask(task);
	}
	
	@Override
	public Task findTaskById(int id) {
		return taskDAO.findTaskById(id);
	}

	@Override
	public void updateTask(Task task) {
		taskDAO.updateByTaskID(task);
	}

	@Override
	public boolean deleteTaskById(int id) {
		return taskDAO.deleteTaskById(id);
	}
	
	@Override
	public void updateStatus(int id , String updatedStatus) {
		taskDAO.updateStatus(id, updatedStatus);
	}
}
