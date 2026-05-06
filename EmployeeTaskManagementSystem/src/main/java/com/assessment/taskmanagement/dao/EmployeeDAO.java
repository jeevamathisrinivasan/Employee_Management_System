package com.assessment.taskmanagement.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.assessment.taskmanagement.model.Employee;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;

@Repository
public class EmployeeDAO {
	
	@Autowired
	private EntityManager manager;
	
	@SuppressWarnings("unchecked")
	public List<Employee> getEmployeeList(){
		Query  query = manager.createQuery("select e from Employee e");
		return query.getResultList();
	}
	
	public void saveEmployee(Employee employee) {
		EntityTransaction et = manager.getTransaction();
		et.begin();
		manager.persist(employee);
		et.commit();
	}
	
	public Employee getEmployeeById(int id) {
		return manager.find(Employee.class,id);	
	}
	
	public void updateEmployeeById(Employee employee){
		EntityTransaction et = manager.getTransaction();
		et.begin();
		manager.merge(employee);
		et.commit();
	}
	
	public boolean deleteEmployeeById(int id) {

	    EntityTransaction et = manager.getTransaction();
	    et.begin();

	    manager.createQuery(
	        "update Task t set t.assignedEmployee = null where t.assignedEmployee.employeeId = :id"
	    )
	    .setParameter("id", id)
	    .executeUpdate();

	    Employee emp = manager.find(Employee.class, id);

	    if (emp == null) {
	        et.rollback();
	        return false;
	    }

	    manager.remove(emp);

	    manager.flush();   
	    manager.clear();   

	    et.commit();
	    return true;
	}
}
