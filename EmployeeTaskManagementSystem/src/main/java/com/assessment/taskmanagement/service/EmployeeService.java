package com.assessment.taskmanagement.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.assessment.taskmanagement.model.Employee;

@Service
public interface EmployeeService {

	List<Employee> getEmployeeList();

	void saveEmployee(Employee employee);
	
	Employee findEmployeeById(int id);

	void updateEmployee(Employee employee);

	boolean deleteEmployeeById(int id);
	
}
