package com.asd.project.controller;


import com.asd.project.model.Order;
import com.asd.project.utils.DB;
import com.asd.project.model.dao.OrderDao;
import com.asd.project.model.dao.UserDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet{

    DB db;
    OrderDao orderDao;
    UserDao userDao;

    public OrderServlet() throws SQLException {
        super();
        db = new DB();
        userDao = new UserDao(db);
        orderDao = new OrderDao(db);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getQueryString().split("=")[1]; //Action
        String[] actionpro = action.split("&");
        String actionfinal = actionpro[0];

        String dishid = request.getQueryString().split("=")[2];//Dishname if cart this field will be none;
        String[] dishtemp = dishid.split("&");
        int dishidfinal = Integer.parseInt(dishtemp[0]);

        String numtemp = request.getQueryString().split("=")[3]; //UserID
        int id = Integer.parseInt(numtemp);

        System.out.println(actionfinal);
        System.out.println(dishidfinal);
        System.out.println(id);

        switch (actionfinal){
            case "View":
                try {
                    handleView(request,response,id);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "Add":
                try {
                    handleAdd(request,response,id,dishidfinal);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "Minus":
                try {
                    handleMinus(request,response,id,dishidfinal);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "Delete":
                try {
                    handleDelte(request,response,id,dishidfinal);
                }
                catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "Confirm":
                break;
            case "Edit":
                break;
            default:
                System.out.println(actionfinal);
                System.out.println("Nothing");
        }
    }

    private void handleView(HttpServletRequest req, HttpServletResponse res,int id) throws IOException, SQLException, ServletException {
        ArrayList<Order> DisplayAL = orderDao.viewcart(id);
        req.setAttribute("OrderArraylist", DisplayAL);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("makeorder.jsp");
        requestDispatcher.forward(req, res);
    }

    private void handleAdd(HttpServletRequest req, HttpServletResponse res,int id,int dishid) throws IOException, SQLException {
        //Num in this case is dish;
        orderDao.addquantity(id,dishid);
    }
    private void handleMinus(HttpServletRequest req, HttpServletResponse res,int id,int dishid) throws IOException, SQLException {
        //Num in this case is dish;
        orderDao.minusquantity(id,dishid);
    }

    private void handleDelte(HttpServletRequest req, HttpServletResponse res,int id,int dishid) throws IOException, SQLException {
        //Num in this case is dish;
        orderDao.deletedish(id,dishid);
    }


}
