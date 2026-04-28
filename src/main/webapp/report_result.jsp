<%@ page import="java.util.*,com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
<title>Report Result</title>

<style>
body{
font-family:Arial;
background:#eef2f7;
margin:0;
padding:0;
}

.box{
width:90%;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px rgba(0,0,0,0.2);
}

table{
width:100%;
border-collapse:collapse;
margin-top:20px;
}

th,td{
padding:12px;
border:1px solid #ccc;
text-align:center;
}

th{
background:#0072ff;
color:white;
}

h2{
text-align:center;
margin-bottom:20px;
color:#222;
}

.revenue{
text-align:center;
font-size:42px;
font-weight:bold;
color:green;
margin:40px 0;
}

.back{
display:block;
width:180px;
margin:30px auto 0;
padding:12px;
text-align:center;
background:#333;
color:white;
text-decoration:none;
border-radius:8px;
font-size:18px;
}

.back:hover{
background:#111;
}
</style>

</head>
<body>

<div class="box">

<%
String type=(String)request.getAttribute("type");

if("date".equals(type)){
%>

<h2>Reservations Report</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Room</th>
<th>Check In</th>
<th>Check Out</th>
<th>Amount</th>
</tr>

<%
List<Reservation> list=
(List<Reservation>)request.getAttribute("list");

for(Reservation r:list){
%>

<tr>
<td><%=r.getReservationID()%></td>
<td><%=r.getCustomerName()%></td>
<td><%=r.getRoomNumber()%></td>
<td><%=r.getCheckIn()%></td>
<td><%=r.getCheckOut()%></td>
<td>&#8377; <%=r.getTotalAmount()%></td>
</tr>

<% } %>

</table>

<%
}else if("revenue".equals(type)){
%>

<h2>Total Revenue</h2>

<div class="revenue">

&#8377; <%=request.getAttribute("revenue")%>

</div>

<%
}else if("rooms".equals(type)){
%>

<h2>Most Booked Rooms</h2>

<table>

<tr>
<th>Room Number</th>
<th>Total Bookings</th>
</tr>

<%
List<Object[]> rooms=
(List<Object[]>)request.getAttribute("rooms");

for(Object[] r:rooms){
%>

<tr>
<td><%=r[0]%></td>
<td><%=r[1]%></td>
</tr>

<% } %>

</table>

<%
}
%>

<a href="reports.jsp" class="back">Back</a>

</div>

</body>
</html>