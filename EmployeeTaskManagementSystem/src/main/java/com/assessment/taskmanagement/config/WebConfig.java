package com.assessment.taskmanagement.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

@Configuration
@ComponentScan
public class WebConfig {
	
	@Bean
	public EntityManager getEntityManager() {
		return Persistence
				.createEntityManagerFactory("dev")
				.createEntityManager();
	}
	
	
}
