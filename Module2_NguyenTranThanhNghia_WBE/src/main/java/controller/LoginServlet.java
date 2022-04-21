package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Account;
import service.IAccountService;
import service.impl.AccountServiceImpl;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        checkLogin(request, response);
    }

    private void checkLogin(HttpServletRequest request, HttpServletResponse response) {
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String remember = request.getParameter("remember");
            boolean isValidUsn = username != null & username.trim().length() > 0;
            boolean isValidPwd = password != null & password.trim().length() > 0;
            System.out.println(remember);
            if (isValidPwd && isValidUsn) {
                IAccountService iAccountService = new AccountServiceImpl();
                Account account = iAccountService.checkAccount(username, password);
                if (account != null) { // account xac nhan thanh cong
                    // Tao 1 session attribute name_session

                    request.getSession().setAttribute("name_session",account.getName());
                    System.out.println("session");
                    if (remember != null) {
                        Cookie usn_ck = new Cookie("usn_ck",username);
                        Cookie pwd_ck = new Cookie("pwd_ck",password);
                        Cookie rmb_ck = new Cookie("rmb_ck",remember);
                        response.addCookie(usn_ck);
                        response.addCookie(pwd_ck);
                        response.addCookie(rmb_ck);
                        System.out.println("cookie");
                    }
                    System.out.println("session");
                    response.sendRedirect("home");
                } else {
                    request.setAttribute("message", "DATA INCORRECT");
                    request.getRequestDispatcher("/view/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "CAN NOT EMPTY");
                request.getRequestDispatcher("/view/login.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = null;
//        String password = null;
//        Cookie[] cookies = request.getCookies();
//        for (Cookie cookie : cookies) {
//            if (cookie.getName().equals("usn_ck")) {
//                username = cookie.getValue();
//            }
//            if (cookie.getName().equals("pwd_ck")) {
//                username = cookie.getValue();
//            }
//        }
//        if (username != null && password != null) {
//            do
//        }
        request.getRequestDispatcher("/view/login.jsp").forward(request,response);
    }
}
