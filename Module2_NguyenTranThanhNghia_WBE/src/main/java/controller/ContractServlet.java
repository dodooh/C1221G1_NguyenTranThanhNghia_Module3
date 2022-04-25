package controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Contract;
import service.IContractService;
import service.ICustomerService;
import service.IEmployeeService;
import service.IServiceDataService;
import service.impl.ContractServiceImpl;
import service.impl.CustomerServiceImpl;
import service.impl.EmployeeServiceImpl;
import service.impl.ServiceDataServiceImpl;

@WebServlet(name = "ContractServlet", value = "/contracts")
public class ContractServlet extends HttpServlet {

    private final IContractService iContractService = new ContractServiceImpl();
    private final IEmployeeService iEmployeeService = new EmployeeServiceImpl();
    private final ICustomerService iCustomerService = new CustomerServiceImpl();
    private final IServiceDataService iServiceDataService = new ServiceDataServiceImpl();
    private final String ROOT_PATH = "view/contracts/";
    public static final String TITLE = "Contract";
    public static final String URL_PATH = "contracts";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("urlPath", URL_PATH);
        request.setAttribute("title", TITLE);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showListContracts(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employeeList", iEmployeeService.selectAllEmployee()); // Get list from DAO
        request.setAttribute("customerList", iCustomerService.selectAllCustomer()); // Get list from DAO
        request.setAttribute("serviceList", iServiceDataService.selectAllServiceData()); // Get list from DAO
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListContracts(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractsDTO", iContractService.selectAllContractDTO()); // Get list from DAO
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        request.setAttribute("urlPath", URL_PATH);
        request.setAttribute("title", TITLE);
        request.setAttribute("employeeList", iEmployeeService.selectAllEmployee()); // Get list from DAO
        request.setAttribute("customerList", iCustomerService.selectAllCustomer()); // Get list from DAO
        request.setAttribute("serviceList", iServiceDataService.selectAllServiceData()); // Get list from DAO
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "create":
                createContract(request, response);
                break;
//            case "edit":
//                updateCustomer(request, response);
//                break;
//            case "delete":
//                deleteCustomer(request, response);
//                break;
            default:
                showListContracts(request, response);
        }
    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) {
        String createDate = request.getParameter("create_date");
        String endDate = request.getParameter("end_date");
        Double deposit = null;
        try {
            deposit = Double.parseDouble(request.getParameter("deposit"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Integer employeeId = null;
        try {
            employeeId = Integer.parseInt(request.getParameter("employee_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Integer customerId = null;
        try {
            customerId = Integer.parseInt(request.getParameter("customer_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Integer serviceId = null;
        try {
            serviceId = Integer.parseInt(request.getParameter("service_id"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        Contract contract = new Contract(null , createDate, endDate, deposit, employeeId, customerId, serviceId);
        System.out.println(contract);
        iContractService.insertOne(contract);
        try {
            response.sendRedirect("/contracts");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
