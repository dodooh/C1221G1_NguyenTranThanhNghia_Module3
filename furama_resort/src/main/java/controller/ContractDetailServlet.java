package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ContractDetail;
import service.IAccompaniedServiceService;
import service.IContractDetailService;
import service.IContractService;
import service.impl.AccompaniedServiceServiceImpl;
import service.impl.ContractDetailServiceImpl;
import service.impl.ContractServiceImpl;

@WebServlet(name = "ContractDetailServlet", value = "/contract-details")
public class ContractDetailServlet extends HttpServlet {
    private final IContractDetailService iContractDetailService = new ContractDetailServiceImpl();
    private final IAccompaniedServiceService iAccompaniedServiceService = new AccompaniedServiceServiceImpl();
    private final IContractService iContractService = new ContractServiceImpl();
    private final String ROOT_PATH = "view/contract-details/";
    public static final String TITLE = "Contract Detail";
    public static final String URL_PATH = "contract-details";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("urlPath", URL_PATH);
        request.setAttribute("title", TITLE);
        request.setAttribute("ass", iAccompaniedServiceService.selectAllAccompaniedService()); // Get list from DAO
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            default:
                showListContractDetail(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("ass", iAccompaniedServiceService.selectAllAccompaniedService()); // Get list from DAO
        request.setAttribute("contractList", iContractService.selectAllContract()); // Get list from DAO
        try {
            request.getRequestDispatcher(ROOT_PATH + "create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            System.err.println(e.getMessage());
        }
    }

    private void showListContractDetail(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("contractDetailsDTO", iContractDetailService.selectAllContractDetailDTO()); // Get list from DAO
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
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createContractDetail(request, response);
                break;
            default:
                showListContractDetail(request, response);
        }
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {
        Integer quantity = null;
        try {
            quantity = Integer.valueOf(request.getParameter("quantity"));
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        Integer contractId = null;
        try {
            contractId = Integer.valueOf(request.getParameter("contract_id"));
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        Integer asId = null;
        try {
            asId = Integer.valueOf(request.getParameter("as_id"));
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
        ContractDetail contractDetail = new ContractDetail(null, quantity, contractId, asId);
        System.out.println(contractDetail);
        iContractDetailService.insertOne(contractDetail);
        try {
            response.sendRedirect(URL_PATH);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
