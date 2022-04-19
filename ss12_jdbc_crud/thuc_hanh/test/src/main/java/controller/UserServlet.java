package controller;

import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.User;
import service.IUserService;
import service.UserServiceImpl;

@WebServlet(name = "UserServlet", value = {"", "/UserServlet"})
public class UserServlet extends HttpServlet {

    private IUserService iUserService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action  = request.getParameter("action");
        if(action == null) {
            action = "";
        }

        switch (action ){
            case "search":
                searchUser(request, response);
                break;
            default:
                showListUser(request, response);
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String keyword = request.getParameter("keyword");
        List<User> searchList =iUserService.search(keyword);
        request.setAttribute("users", searchList);
        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = iUserService.findAll();
        System.out.println("ID user 3" + userList.get(3).getId());
        request.setAttribute("users", userList);

        try {
            request.getRequestDispatcher("list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
