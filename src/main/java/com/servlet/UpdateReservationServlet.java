
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.model.Reservation;

public class UpdateReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        try {

            Reservation r = new Reservation();

            r.setReservationID(
                Integer.parseInt(req.getParameter("id"))
            );

            r.setCustomerName(
                req.getParameter("name")
            );

            r.setRoomNumber(
                Integer.parseInt(req.getParameter("room"))
            );

            r.setCheckIn(
                req.getParameter("checkin")
            );

            r.setCheckOut(
                req.getParameter("checkout")
            );

            r.setTotalAmount(
                Double.parseDouble(req.getParameter("amount"))
            );

            ReservationDAO dao = new ReservationDAO();
            dao.updateFullReservation(r);

            // SUCCESS MESSAGE ONLY
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Updated</title>");
            out.println("<style>");
            out.println("body{font-family:Arial;background:#f0f8ff;text-align:center;padding-top:100px;}");
            out.println(".box{background:white;width:430px;margin:auto;padding:30px;border-radius:15px;box-shadow:0 0 15px gray;}");
            out.println("h2{color:green;}");
            out.println("a{display:inline-block;margin-top:20px;padding:10px 20px;background:#3498db;color:white;text-decoration:none;border-radius:8px;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");
            out.println("<h2>Reservation Updated Successfully!</h2>");
            out.println("<a href='reservationupdate.jsp'>Update Another</a>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            out.println("<h2 style='color:red;text-align:center;'>Update Failed!</h2>");
            e.printStackTrace();
        }
    }
}