package service;

import model.Account;

public interface IAccountService {

    Account checkAccount(String username, String password);
}
