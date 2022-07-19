package controller;

import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ServiceData;
import service.IRentTypeService;
import service.IServiceDataService;
import service.IServiceTypeService;
import service.impl.RentTypeServiceImpl;
import service.impl.ServiceDataServiceImpl;
import service.impl.ServiceTypeServiceImpl;

@WebServlet(name = "ServiceServlet", value = "/services")
public class ServiceServlet extends HttpServlet {

    public static final String TITLE = "Service";
    public static final String URL_PATH = "services";
    private final String ROOT_PATH = "/view/services/";
    private final IServiceDataService iServiceDataService = new ServiceDataServiceImpl();
    private final IServiceTypeService iServiceTypeService = new ServiceTypeServiceImpl();
    private final IRentTypeService iRentTypeService = new RentTypeServiceImpl();

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
                createService(request, response);
                break;
            default:
                showList(request, response);
        }

    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        Integer serviceId = null;
        String serviceCode = request.getParameter("service_code");
        String serviceName = request.getParameter("service_name");
        Integer area = null;
        try {
            area = Integer.parseInt(request.getParameter("area"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Double price = null;
        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer maxPeopleAllowed = null;
        try {
            maxPeopleAllowed = Integer.parseInt(request.getParameter("people_allowed"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        String standardRoom = request.getParameter("standard_room");
        String convenientDescribe = request.getParameter("describe");
        Double poolArea = null;
        try {
            poolArea = Double.parseDouble(request.getParameter("pool_area"));
        } catch (NumberFormatException | NullPointerException e) {
            System.err.println(e.getMessage());
        }
        Integer numFloors = null;
        try {
            numFloors = Integer.parseInt(request.getParameter("floors"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer rentTypeId = null;
        try {
            rentTypeId = Integer.parseInt(request.getParameter("rent_type_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        Integer serviceTypeId = null;
        try {
            serviceTypeId = Integer.parseInt(request.getParameter("service_type_id"));
        } catch (NumberFormatException e) {
            System.err.println(e.getMessage());
        }
        ServiceData serviceData = new ServiceData(serviceId,serviceCode, serviceName, area, price, maxPeopleAllowed, standardRoom,
            convenientDescribe, poolArea, numFloors, rentTypeId, serviceTypeId);
        System.out.println(serviceData);
        Map<String, String> error =  iServiceDataService.insertOne(serviceData);
        if (error.isEmpty()) {
            request.setAttribute("message", "Success");
        } else {
            request.setAttribute("message", "Error");
            request.setAttribute("serviceData", serviceData);
            request.setAttribute("errors", error);
        }
        try {
            request.setAttribute("serviceTypes", iServiceTypeService.selectAllServiceType());
            request.setAttribute("rentTypes", iRentTypeService.selectAllRentType());
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            System.err.println(e.getMessage());
        }
    }

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
            default:
                showList(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("serviceTypes", iServiceTypeService.selectAllServiceType());
        request.setAttribute("rentTypes", iRentTypeService.selectAllRentType());
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            System.err.println(e.getMessage());
        }
        
    }
    

    private void showList(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("serviceDatas", iServiceDataService.selectAllServiceData());
        request.setAttribute("serviceTypes", iServiceTypeService.selectAllServiceType());
        request.setAttribute("rentTypes", iRentTypeService.selectAllRentType());
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            System.err.println(e.getMessage());
            
        }

    }


}
