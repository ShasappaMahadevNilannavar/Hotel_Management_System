<%@ page import="com.dao.ReservationDAO,com.model.Reservation" %>
<!DOCTYPE html>
<html>
<head>
<title>Update Reservation</title>

<style>
body{
font-family:Arial;
background:#36d1dc;
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
background:#0072ff;
color:white;
border:none;
border-radius:6px;
cursor:pointer;
margin-top:10px;
}

button:hover{
background:#0056cc;
}

h2{
text-align:center;
margin-bottom:20px;
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

label{
font-weight:bold;
}
</style>

</head>
<body>

<div class="box">

<%
String sid = request.getParameter("id");

if(sid == null){
%>

<h2>Search Reservation</h2>

<form method="get" action="reservationupdate.jsp">

<input type="number" name="id" placeholder="Enter Reservation ID" required>

<button type="submit">Search</button>

</form>

<a href="index.jsp" class="back">Back to Dashboard</a>

<%
}else{

ReservationDAO dao = new ReservationDAO();
Reservation r = dao.getReservationById(Integer.parseInt(sid));

if(r != null){
%>

<h2>Update Reservation</h2>

<form action="UpdateReservationServlet" method="post">

<label>ID</label>
<input type="number" name="id"
value="<%=r.getReservationID()%>" readonly>

<label>Name</label>
<input type="text" name="name"
value="<%=r.getCustomerName()%>">

<label>Room Number</label>
<input type="number" name="room"
value="<%=r.getRoomNumber()%>">

<label>Check In</label>
<input type="date" name="checkin"
value="<%=r.getCheckIn()%>">

<label>Check Out</label>
<input type="date" name="checkout"
value="<%=r.getCheckOut()%>">

<label>Amount</label>
<input type="number" step="0.01" name="amount"
value="<%=r.getTotalAmount()%>">

<button type="submit">Update</button>

</form>

<a href="reservationupdate.jsp" class="back">Back</a>

<%
}else{
%>

<h2>Reservation Not Found</h2>

<a href="reservationupdate.jsp" class="back">Back</a>

<%
}
}
%>

</div>

</body>
</html>