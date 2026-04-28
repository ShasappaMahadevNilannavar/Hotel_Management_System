<%@ page import="com.dao.ReservationDAO,com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
<title>Delete Reservation</title>

<style>
body{
font-family:Arial;
background:#ff9a9e;
}

.box{
width:500px;
background:white;
padding:30px;
margin:50px auto;
border-radius:15px;
box-shadow:0 0 15px gray;
}

input{
width:100%;
padding:10px;
margin:8px 0;
border:1px solid #ccc;
border-radius:6px;
}

button{
width:100%;
padding:10px;
background:red;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
margin-top:10px;
}

button:hover{
background:#cc0000;
}

h2{
text-align:center;
margin-bottom:20px;
}

p{
font-size:18px;
margin:8px 0;
}

.back{
display:block;
text-align:center;
margin-top:15px;
padding:10px;
background:#555;
color:white;
text-decoration:none;
border-radius:6px;
}

.back:hover{
background:#333;
}
</style>

</head>
<body>

<div class="box">

<%
String id=request.getParameter("id");

if(id==null){
%>

<h2>Search Reservation</h2>

<form method="get">

<input type="number" name="id" placeholder="Enter Reservation ID" required>

<button type="submit">Search</button>

</form>

<a href="index.jsp" class="back">Back to Dashboard</a>

<%
}else{

ReservationDAO dao=new ReservationDAO();
Reservation r=dao.getReservationById(Integer.parseInt(id));

if(r!=null){
%>

<h2>Delete Reservation</h2>

<p><b>ID:</b> <%=r.getReservationID()%></p>
<p><b>Name:</b> <%=r.getCustomerName()%></p>
<p><b>Room:</b> <%=r.getRoomNumber()%></p>
<p><b>CheckIn:</b> <%=r.getCheckIn()%></p>
<p><b>CheckOut:</b> <%=r.getCheckOut()%></p>
<p><b>Amount:</b> ₹ <%=r.getTotalAmount()%></p>

<form action="DeleteReservationServlet" method="post">

<input type="hidden" name="id" value="<%=r.getReservationID()%>">

<button type="submit">Delete</button>

</form>

<a href="reservationdelete.jsp" class="back">Back</a>

<%
}else{
%>

<h2>Reservation Not Found</h2>

<a href="reservationdelete.jsp" class="back">Back</a>

<%
}
}
%>

</div>

</body>
</html>