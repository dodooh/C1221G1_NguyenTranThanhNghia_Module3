package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import models.Customer;
import models.CustomerType;

@WebServlet(name = "controller.CustomerServlet", value = "/customer-servlet")
public class CustomerServlet extends HttpServlet {
    private List<Customer> customerList;
    private List<CustomerType> customerTypeList;
    @Override
    public void init() throws ServletException {
        customerTypeList = new ArrayList<>();
        customerTypeList.add(new CustomerType(1, "Diamond"));
        customerTypeList.add(new CustomerType(2, "Platinum"));
        customerTypeList.add(new CustomerType(3, "Gold"));
        customerTypeList.add(new CustomerType(4, "Silver"));
        customerTypeList.add(new CustomerType(5, "Member"));
        customerList = new ArrayList<>();
        customerList.add(new Customer("Nghia", 1, "26/01/1997", "Đà Nẵng", 8.6, "https://picsum.photos/536/354", 1));
        customerList.add(new Customer("An", 0,"26/01/1997", "Đà Nẵng",5.6,  "https://picsum.photos/536/354", 2));
        customerList.add(new Customer("Hoang",1, "26/01/1997", "Đà Nẵng",9.6,  "https://picsum.photos/536/354",3));
        customerList.add(new Customer("Khoa",0, "26/01/1997", "Đà Nẵng",6.6,  "https://picsum.photos/536/354",4));
        customerList.add(new Customer("Luat",1, "26/01/1997", "Quyển Vở",2.6,  "https://picsum.photos/536/354",5));

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(customerList.get(2).getAddress());
        request.setAttribute("cusList", customerList);
        request.setAttribute("cusTypeList", customerTypeList);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
