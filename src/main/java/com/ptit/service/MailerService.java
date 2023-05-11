package com.ptit.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;

import com.ptit.dto.MailerDTO;

public interface MailerService {

	void send(MailerDTO mail) throws MessagingException;

	void send(String to, String subject, String body) throws MessagingException;

	void sendEmail(String recipientEmail, String link) throws MessagingException, UnsupportedEncodingException;

}
