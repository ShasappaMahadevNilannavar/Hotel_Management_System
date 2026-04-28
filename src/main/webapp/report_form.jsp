<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Select Date</title>

<style>
body{
font-family:Arial;
background:#4facfe;
}

.box{
width:400px;
background:white;
padding:30px;
margin:80px auto;
border-radius:15px;
}

input{
width:100%;
padding:10px;
margin:10px 0;
}

button{
width:100%;
padding:12px;
background:#0072ff;
color:white;
border:none;
}

h2{text-align:center;}
</style>

</head>
<body>

<div class="box">

<%
String type=request.getParameter("type");
%>

<h2>Select Date Range</h2>

<form action="ReportCriteriaServlet" method="post">

<input type="hidden" name="type" value="<%=type%>">

<label>From Date</label>
<input type="date" name="fromDate" required>

<label>To Date</label>
<input type="date" name="toDate" required>

<button type="submit">Generate Report</button>

</form>

</div>

</body>
</html>