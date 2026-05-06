package com.assessment.taskmanagement.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.taskmanagement.model.Employee;
import com.assessment.taskmanagement.service.EmployeeService;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	
	@Autowired
	private EmployeeService service;
	
	@GetMapping("/list")
	public ModelAndView getEmployeeList(ModelAndView modelAndView) {
		modelAndView.addObject("employees",service.getEmployeeList());
		modelAndView.setViewName("employee-dashboard");
		return modelAndView;
	}
	
	@GetMapping("/add")
	public ModelAndView addEmployee(ModelAndView modelAndView) {
		modelAndView.addObject("employee",new Employee());
		modelAndView.setViewName("addEmployee");
		return modelAndView;
	}
	
	@PostMapping("/save")
	public String saveEmployee(@ModelAttribute Employee employee) {
		service.saveEmployee(employee);
		return "redirect:/employee/list";	
	}
	
	@GetMapping("/edit/{id}")
	public ModelAndView editEmployeeForm(ModelAndView modelAndView,
			                             @PathVariable("id") int id) {
		Employee employee = service.findEmployeeById(id);
		modelAndView.addObject("employee",employee);
		modelAndView.setViewName("editEmployee");
		return modelAndView;
	}
	
	@PostMapping("/update")
	public String updateEmployee(@ModelAttribute Employee employee) {
		service.updateEmployee(employee);
		return "redirect:/employee/list";
		
	}
	
	@GetMapping("/delete/{id}")
	public String deleteEmployeeById(@PathVariable("id") int id) {
		service.deleteEmployeeById(id);
		return "redirect:/employee/list";
	}
}
