package controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Employee;
import service.IDepartmentService;
import service.IEducationDegreeService;
import service.IEmployeeService;
import service.IPositionService;
import service.impl.DepartmentServiceImpl;
import service.impl.EducationDegreeServiceImpl;
import service.impl.EmployeeServiceImpl;
import service.impl.PositionServiceImpl;

@WebServlet(name = "EmployeeServlet", value = "/employees")
public class EmployeeServlet extends HttpServlet {

    private final String TITLE = "Employee";
    private final String ROOT_PATH = "/view/employees/";
    private final String URL_PATH = "employees";
    private IEmployeeService iEmployeeService = new EmployeeServiceImpl();
    private IPositionService iPositionService = new PositionServiceImpl();
    private IEducationDegreeService iEducationDegreeService = new EducationDegreeServiceImpl();
    private IDepartmentService iDepartmentService = new DepartmentServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        request.setAttribute("urlPath", URL_PATH);
        request.setAttribute("title", TITLE);
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "edit":
                updateEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                showListEmployees(request, response);


        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer idToDelete = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.findById(idToDelete);
        try {
            if (employee == null) {
                response.sendRedirect("view/error-404.jsp");
            } else {
                iEmployeeService.deleteEmployee(idToDelete);
                response.sendRedirect(URL_PATH);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.valueOf(request.getParameter("id"));
        String employeeName = request.getParameter("employee_name");
        String employeeDob = request.getParameter("date_of_birth");
        String employeeIdCard = request.getParameter("identify_number");
        Double employeeSalary = null;
        try {
            employeeSalary = Double.valueOf(request.getParameter("salary"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        String employeePhone = request.getParameter("phone_number");
        String employeeMail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        Integer employeePositionId = null;
        try {
            employeePositionId = Integer.valueOf(request.getParameter("position_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer employeeEducationDegreeId = null;
        try {
            employeeEducationDegreeId = Integer.valueOf(request.getParameter("education_degree_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer employeeDivisionId = null;
        try {
            employeeDivisionId = Integer.valueOf(request.getParameter("division_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Employee employee = new Employee(id, employeeName, employeeDob, employeeIdCard, employeeSalary,
            employeePhone, employeeMail, employeeAddress, employeePositionId, employeeEducationDegreeId, employeeDivisionId);
        iEmployeeService.updateOne(employee);
        request.setAttribute("message", "Success");
        try {
            request.setAttribute("employee", employee);
            request.setAttribute("positions", iPositionService.selectAllPosition());
            request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
            request.setAttribute("departments", iDepartmentService.selectAllDepartment());
            request.getRequestDispatcher(ROOT_PATH + "edit.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String employeeName = request.getParameter("employee_name");
        String employeeDob = request.getParameter("date_of_birth");
        String employeeIdCard = request.getParameter("identify_number");
        Double employeeSalary = null;
        try {
            employeeSalary = Double.valueOf(request.getParameter("salary"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        String employeePhone = request.getParameter("phone_number");
        String employeeMail = request.getParameter("email");
        String employeeAddress = request.getParameter("address");
        Integer employeePositionId = null;
        try {
            employeePositionId = Integer.valueOf(request.getParameter("position_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer employeeEducationDegreeId = null;
        try {
            employeeEducationDegreeId = Integer.valueOf(request.getParameter("education_degree_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer employeeDivisionId = null;
        try {
            employeeDivisionId = Integer.valueOf(request.getParameter("division_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());

        }
        Employee employee = new Employee(null, employeeName, employeeDob, employeeIdCard, employeeSalary,
            employeePhone, employeeMail, employeeAddress, employeePositionId, employeeEducationDegreeId, employeeDivisionId);

        Map<String, String> error =  iEmployeeService.insertOne(employee);
        try {
            request.setAttribute("message", "Success");
            request.setAttribute("positions", iPositionService.selectAllPosition());
            request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
            request.setAttribute("departments", iDepartmentService.selectAllDepartment());
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
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
            case "edit":
                showEditForm(request, response);
                break;
            case "search":
                searchEmployee(request, response);
                break;
            default:
                showListEmployees(request, response);
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        name = name == null ? "" : name;
        startDate = startDate == null ? "" : startDate;
        endDate = endDate == null ? "" : endDate;
        request.setAttribute("employees", iEmployeeService.search(name, startDate, endDate));
        request.setAttribute("positions", iPositionService.selectAllPosition());
        request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
        request.setAttribute("departments", iDepartmentService.selectAllDepartment());
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = iEmployeeService.findById(id);
        try {
            if (employee == null) {
                response.sendRedirect("/view/error-404.jsp");
            } else {
                request.setAttribute("positions", iPositionService.selectAllPosition());
                request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
                request.setAttribute("departments", iDepartmentService.selectAllDepartment());
                request.setAttribute("employee", employee);
                request.getRequestDispatcher(ROOT_PATH + "edit.jsp").forward(request, response);
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("positions", iPositionService.selectAllPosition());
        request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
        request.setAttribute("departments", iDepartmentService.selectAllDepartment());
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showListEmployees(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("employees", iEmployeeService.selectAllEmployee());
        request.setAttribute("positions", iPositionService.selectAllPosition());
        request.setAttribute("educationDegrees", iEducationDegreeService.selectAllEducationDegree());
        request.setAttribute("departments", iDepartmentService.selectAllDepartment());
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
