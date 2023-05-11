package com.ptit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

public class ServletInitializer extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(N1FinalApplication.class);
	}

	@SpringBootApplication
	public static class N1FinalApplication {

		public static void main(String[] args) {
			SpringApplication.run(N1FinalApplication.class, args);
		}

	}
}
