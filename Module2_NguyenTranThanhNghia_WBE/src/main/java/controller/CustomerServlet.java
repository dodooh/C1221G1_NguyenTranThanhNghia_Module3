package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.Customer;
import service.ICustomerService;
import service.impl.CustomerServiceImpl;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {

    ICustomerService iCustomerService = new CustomerServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createCustomer(request, response);
                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
//          customer_id, customer_name, date_of_birth, gender, identify_number, phone_number, email, address, customer_type_id --%>
        String customerName = request.getParameter("customer_name");
        String customerDob = request.getParameter("date_of_birth");
        Integer customerGender = Integer.parseInt(request.getParameter("gender")) == 1 ? 1 : 0;
        String customerIdCard = request.getParameter("identify_number");
        String customerPhone = request.getParameter("phone_number");
        String customerMail = request.getParameter("email");
        String customerAddress = request.getParameter("address");
        Integer customerTypeId = Integer.valueOf(request.getParameter("customer_type_id"));
        Customer customer = new Customer(null, customerName, customerDob, customerGender, customerIdCard, customerPhone, customerMail,
            customerAddress, customerTypeId);
        System.out.println(customer);
        iCustomerService.insertOne(customer);
        request.setAttribute("message", "Success");
        try {
            request.getRequestDispatcher("customers/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = String.valueOf(request.getRequestURL());
        System.out.println("GET" + url.substring(url.lastIndexOf("/") + 1));
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showListCustomers(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customerTypes", iCustomerService.selectAllCustomerType());
        request.setAttribute("urlPath", "customers");
        try {
            request.getRequestDispatcher("customers/create.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomers(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("customers", iCustomerService.selectAllCustomer());
        request.setAttribute("customerTypes", iCustomerService.selectAllCustomerType());
        request.setAttribute("urlPath", "customers");
        request.setAttribute("title", "Customer");
        try {
            request.getRequestDispatcher("customers/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }


}
