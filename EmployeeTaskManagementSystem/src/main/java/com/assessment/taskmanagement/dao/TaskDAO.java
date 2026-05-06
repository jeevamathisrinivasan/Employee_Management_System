package com.assessment.taskmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assessment.taskmanagement.model.Employee;
import com.assessment.taskmanagement.model.Task;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;

@Repository
public class TaskDAO {
	@Autowired
	private EntityManager em;
	
	@SuppressWarnings("unchecked")
	public List<Task> getTaskList(){
		Query query = em.createQuery("select t from Task t");
		return query.getResultList();
	}
	
	public void addTask(Task task) {

	    EntityTransaction et = em.getTransaction();
	    et.begin();

	    if (task.getAssignedEmployee() != null &&
	        task.getAssignedEmployee().getEmployeeId() != 0) {

	        Employee emp = em.find(Employee.class,
	                task.getAssignedEmployee().getEmployeeId());

	        task.setAssignedEmployee(emp);
	    }

	    em.persist(task);
	    et.commit();
	}
	
	public Task findTaskById(int id) {
		return em.find(Task.class,id);
	}
	
	public void updateByTaskID(Task task) {
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(task);
		et.commit();
	}
	
	public boolean deleteTaskById(int id) {
		Task taskById = findTaskById(id);
		if(taskById==null) {
			return false;
		}
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.remove(taskById);
		et.commit();
		return true;
	}
	
	public void updateStatus(int id , String updatedStatus) {
		Task task = findTaskById(id);
		task.setStatus(updatedStatus);
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.merge(task);
		et.commit();
	}
	
}
