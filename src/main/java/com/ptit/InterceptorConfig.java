package com.ptit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ptit.interceptor.AdminInterceptor;
import com.ptit.interceptor.AuthInterceptor;
import com.ptit.interceptor.LogInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

	@Autowired
	AuthInterceptor auth;

	@Autowired
	AdminInterceptor admin;

	@Autowired
	LogInterceptor log;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(log).addPathPatterns("/**");
		registry.addInterceptor(auth).addPathPatterns("/admin/**", "/checkout/**", "/change-password", "/profile/**")
				.excludePathPatterns("/login");
		registry.addInterceptor(admin).addPathPatterns("/admin/**").excludePathPatterns("/index");
	}

}
