package repository;

import model.Account;

public interface IAccountRepository {
    Account checkLogin(String user, String pwd);
}
