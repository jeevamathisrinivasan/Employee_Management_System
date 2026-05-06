package com.assessment.taskmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.assessment.taskmanagement.model.Employee;
import com.assessment.taskmanagement.model.Task;
import com.assessment.taskmanagement.service.EmployeeService;
import com.assessment.taskmanagement.service.TaskService;

@Controller
@RequestMapping("task")
public class TaskController {
	
	@Autowired
	private TaskService service;
	
	@Autowired
	private EmployeeService eService;
	
	@GetMapping("/list")
	public ModelAndView listTask(ModelAndView modelAndView) {
		modelAndView.addObject("tasks",service.getAllTaskList());
		modelAndView.setViewName("taskDashboard");
		return modelAndView;
	}
	
	@GetMapping("/add")
	public ModelAndView addTask(ModelAndView modelAndView) {
		modelAndView.addObject("task",new Task());
		modelAndView.addObject("employeeList",eService.getEmployeeList());
		modelAndView.setViewName("addTask");
		return modelAndView ;
	}
	
	@PostMapping("saveTask")
	public String saveTask(@ModelAttribute Task task) {
		service.saveTask(task);
		return "redirect:/task/list";
	}
	
	@GetMapping("/edit/{id}")
	public ModelAndView editTaskForm(ModelAndView modelAndView,
	                                 @PathVariable("id") int id) {

	    Task task = service.findTaskById(id);
	    List<Employee> employeeList = eService.getEmployeeList();

	    modelAndView.addObject("task", task);
	    modelAndView.addObject("employeeList", employeeList); 
	    modelAndView.setViewName("editTask");

	    return modelAndView;
	}
	
	@PostMapping("/update")
	public String updateTask(@ModelAttribute("task") Task task) {
	    service.updateTask(task); 
	    return "redirect:/task/list";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteTaskById(@PathVariable("id") int id) {
		service.deleteTaskById(id);
		return "redirect:/task/list";
	}
	
	@GetMapping("/update-status/{id}")
	public ModelAndView showUpdateStatusPage(@PathVariable("id") int id,
	                                         ModelAndView mv) {

	    Task task = service.findTaskById(id);

	    mv.addObject("task", task);
	    mv.setViewName("updateStatus");

	    return mv;
	}
	
	@PostMapping("/update-status/{id}")
	public String updateStatus(@PathVariable("id") int id,
	                           @RequestParam("status") String status) {

	    service.updateStatus(id, status);
	    return "redirect:/task/list";
	}
}
