package controller;

import java.util.Map;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import model.Motel;
import service.IMotelService;
import service.IRentTypeService;
import service.impl.MotelServiceImpl;
import service.impl.RentTypeServiceImpl;

@WebServlet(name = "MotelServlet", value = {"/motel", ""})
public class MotelServlet extends HttpServlet {
    private final String ROOT_PATH = "/view/motel/";
    private final String URL_PATH = "motel";
    private final IMotelService iMotelService = new MotelServiceImpl();
    private final IRentTypeService iRentTypeService = new RentTypeServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("rentTypes", iRentTypeService.selectAllRentType()); // Get list from DAO
        request.setAttribute("urlPath", URL_PATH); // Get list from DAO
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
//                showEditForm(request, response);
                break;
            case "search":
                searchMotel(request, response);
                break;
            default:
                showListMotel(request, response);
        }    }

    private void searchMotel(HttpServletRequest request, HttpServletResponse response) {
        String motelId = request.getParameter("motel_id");
        String customerName = request.getParameter("customer_name");
        String phone = request.getParameter("phone");
        motelId = motelId == null ? "" : motelId;
        customerName = customerName == null ? "" : customerName;
        phone = phone == null ? "" : phone;
        System.out.println(iMotelService.search(motelId, customerName, phone).size());
        request.setAttribute("motels", iMotelService.search(motelId, customerName, phone));
        try {
            request.getRequestDispatcher(ROOT_PATH + "list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListMotel(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("motels", iMotelService.selectAllMotel()); // Get list from DAO
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        System.out.println(action);
        switch (action) {
            case "create":
                createMotel(request, response);
                break;
            case "delete":
                deleteMotel(request, response);
                break;
            default:
                showListMotel(request, response);
        }
    }

    private void deleteMotel(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        Integer motelId = Integer.parseInt(id);
        boolean isFound = iMotelService.findById(motelId);
        try {
            if (!isFound) {
                response.sendRedirect("view/error-404.jsp");
            } else {
                iMotelService.deleteCustomer(motelId);
                response.sendRedirect(URL_PATH);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createMotel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String customerName = request.getParameter("customer_name");
        String phoneNumber = request.getParameter("phone");
        String rentDate = request.getParameter("rent_date");
        Integer rentType = 0;
        try {
            rentType = Integer.parseInt(request.getParameter("rent_type"));
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        String note = request.getParameter("note");
        Motel motel = new Motel(null, customerName, phoneNumber, rentDate, rentType, note);
        System.out.println(motel);
        Map<String, String> errors = iMotelService.validate(motel);
        if (errors.isEmpty()) {
            iMotelService.insertOne(motel);
            response.sendRedirect("/motel?sc=1");
        } else {
            request.setAttribute("rentTypes", iRentTypeService.selectAllRentType()); // Get list from DAO
            request.setAttribute("error", errors);
            request.setAttribute("motel", motel);
            try {
                request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    }
}
