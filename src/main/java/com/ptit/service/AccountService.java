package com.ptit.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.ptit.dto.AccountDTO;
import com.ptit.entity.Account;

public interface AccountService {

	AccountDTO findByUsername(String username);

	AccountDTO save(AccountDTO username);

	void deleteById(String id);

	Optional<Account> findById(String id);

	List<Account> findAll();

	<S extends Account> S save(S entity);

	boolean existsById(String id);

	Page<Account> findAll(Integer page, Integer limit, String field);

	String setHashMD5(String password) throws NoSuchAlgorithmException;

	String getHashMD5(String password) throws NoSuchAlgorithmException;

	void updateToken(String token, String email) throws Exception;

	Account getByToken(String token);

	void updatePassword(Account entity, String newPassword);

}
