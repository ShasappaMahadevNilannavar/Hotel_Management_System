package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.model.Reservation;

public class DisplayReservationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        try {
            ReservationDAO dao = new ReservationDAO();
            List<Reservation> list = dao.getAllReservations();

            req.setAttribute("list", list);

            // ✅ ONLY forward
            RequestDispatcher rd = req.getRequestDispatcher("reservationdisplay.jsp");
            rd.forward(req, res);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doGet(req, res);
    }
}