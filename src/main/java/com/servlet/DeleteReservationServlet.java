// DeleteReservationServlet.java
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.ReservationDAO;

public class DeleteReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        try {

            int id = Integer.parseInt(req.getParameter("id"));

            ReservationDAO dao = new ReservationDAO();
            dao.deleteReservation(id);

            // SUCCESS MESSAGE ONLY
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Deleted</title>");
            out.println("<style>");
            out.println("body{font-family:Arial;background:#fff0f0;text-align:center;padding-top:100px;}");
            out.println(".box{background:white;width:430px;margin:auto;padding:30px;border-radius:15px;box-shadow:0 0 15px gray;}");
            out.println("h2{color:red;}");
            out.println("a{display:inline-block;margin-top:20px;padding:10px 20px;background:#e74c3c;color:white;text-decoration:none;border-radius:8px;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");
            out.println("<h2>Reservation Deleted Successfully!</h2>");
            out.println("<a href='reservationdelete.jsp'>Delete Another</a>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            out.println("<h2 style='color:red;text-align:center;'>Delete Failed!</h2>");
            e.printStackTrace();
        }
    }
}