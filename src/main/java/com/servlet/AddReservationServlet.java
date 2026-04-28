// AddReservationServlet.java
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import com.dao.ReservationDAO;
import com.model.Reservation;

public class AddReservationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();

        try {

            // No Reservation ID input required
            String name = req.getParameter("name");
            int room = Integer.parseInt(req.getParameter("room"));
            String checkin = req.getParameter("checkin");
            String checkout = req.getParameter("checkout");
            double amount = Double.parseDouble(req.getParameter("amount"));

            Reservation r = new Reservation();

            // ID auto generated in database
            r.setCustomerName(name);
            r.setRoomNumber(room);
            r.setCheckIn(checkin);
            r.setCheckOut(checkout);
            r.setTotalAmount(amount);

            ReservationDAO dao = new ReservationDAO();
            dao.addReservation(r);

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Success</title>");
            out.println("<style>");
            out.println("body{font-family:Arial;background:#f0f8ff;text-align:center;padding-top:100px;}");
            out.println(".box{background:white;width:420px;margin:auto;padding:30px;border-radius:15px;box-shadow:0 0 15px gray;}");
            out.println("h2{color:green;}");
            out.println("a{display:inline-block;margin-top:20px;padding:10px 20px;background:#3498db;color:white;text-decoration:none;border-radius:8px;}");
            out.println("</style>");
            out.println("</head>");
            out.println("<body>");

            out.println("<div class='box'>");
            out.println("<h2>Reservation Added Successfully!</h2>");
            out.println("<p>Reservation ID Auto Generated</p>");
            out.println("<a href='reservationadd.jsp'>Add Another</a>");
            out.println("</div>");

            out.println("</body>");
            out.println("</html>");

        } catch (Exception e) {

            out.println("<h2 style='color:red;text-align:center;'>Error Adding Reservation!</h2>");
            e.printStackTrace();
        }
    }
}