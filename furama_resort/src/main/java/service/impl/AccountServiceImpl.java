package service.impl;

import model.Account;
import repository.IAccountRepository;
import repository.impl.AccountRepositoryImpl;
import service.IAccountService;

public class AccountServiceImpl implements IAccountService {

    private final IAccountRepository iAccountRepository = new AccountRepositoryImpl();

    @Override
    public Account checkAccount(String username, String password) {
        return iAccountRepository.checkLogin(username, password);
    }
}
