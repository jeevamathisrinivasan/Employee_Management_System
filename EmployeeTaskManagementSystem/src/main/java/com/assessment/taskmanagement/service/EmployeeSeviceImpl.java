package com.assessment.taskmanagement.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.assessment.taskmanagement.dao.EmployeeDAO;
import com.assessment.taskmanagement.model.Employee;


@Component
public class EmployeeSeviceImpl implements EmployeeService{
	
	@Autowired
	private EmployeeDAO employeeDAO;

	@Override
	public List<Employee> getEmployeeList() {
		return employeeDAO.getEmployeeList();
	}

	@Override
	public void saveEmployee(Employee employee) {
		employeeDAO.saveEmployee(employee);
	}
	
	@Override
	public Employee findEmployeeById(int id) {
		return employeeDAO.getEmployeeById(id);
	}

	@Override
	public void updateEmployee(Employee employee) {
		employeeDAO.updateEmployeeById(employee);
	}

	@Override
	public boolean deleteEmployeeById(int id) {
		return employeeDAO.deleteEmployeeById(id);
	}

}
