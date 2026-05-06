package com.assessment.taskmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.assessment.taskmanagement.model.Task;

@Service
public interface TaskService {

	List<Task> getAllTaskList();

	void saveTask(Task task);
	
	Task findTaskById(int id);

	void updateTask(Task task);
	
	boolean deleteTaskById(int id);
	
	void updateStatus(int id , String updatedStatus);
	
}
