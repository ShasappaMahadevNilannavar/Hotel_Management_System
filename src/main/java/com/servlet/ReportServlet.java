package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import com.dao.ReservationDAO;

public class ReportServlet extends HttpServlet {

protected void doGet(HttpServletRequest req,HttpServletResponse res)
throws ServletException,IOException{

try{

ReservationDAO dao=new ReservationDAO();

List<Object[]> rooms=dao.getMostBookedRooms();

req.setAttribute("type","rooms");
req.setAttribute("rooms",rooms);

RequestDispatcher rd=req.getRequestDispatcher("report_result.jsp");
rd.forward(req,res);

}catch(Exception e){
e.printStackTrace();
}
}
}