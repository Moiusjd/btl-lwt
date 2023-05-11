package com.ptit.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MailerDTO {
	String from;
	String to;
	String[] cc;
	String[] bcc;
	String subject;
	String body;
	String[] attachments;

	public MailerDTO(String to, String subject, String body) {
		this.from = "stu@ptit.edu.vn";
		this.to = to;
		this.subject = subject;
		this.body = body;
	}
}
