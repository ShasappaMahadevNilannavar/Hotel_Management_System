package com.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

import com.dao.ReservationDAO;
import com.model.Reservation;

public class ReportCriteriaServlet extends HttpServlet {

protected void doPost(HttpServletRequest req,HttpServletResponse res)
throws ServletException,IOException{

try{

String type=req.getParameter("type");
String from=req.getParameter("fromDate");
String to=req.getParameter("toDate");

ReservationDAO dao=new ReservationDAO();

if(type.equals("date")){

List<Reservation> list=
dao.getReservationsByDate(from,to);

req.setAttribute("type","date");
req.setAttribute("list",list);

}

else if(type.equals("revenue")){

double total=
dao.getTotalRevenue(from,to);

req.setAttribute("type","revenue");
req.setAttribute("revenue",total);
}

RequestDispatcher rd=
req.getRequestDispatcher("report_result.jsp");

rd.forward(req,res);

}catch(Exception e){
e.printStackTrace();
}
}
}