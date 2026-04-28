<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Reports Dashboard</title>

<style>
body{
font-family:Arial;
background:linear-gradient(to right,#4facfe,#00f2fe);
margin:0;
padding:0;
}

.container{
width:80%;
margin:40px auto;
}

h1{
text-align:center;
color:white;
margin-bottom:30px;
}

.grid{
display:grid;
grid-template-columns:repeat(3,1fr);
gap:25px;
}

.card{
background:white;
padding:25px;
border-radius:15px;
box-shadow:0 0 15px rgba(0,0,0,0.2);
text-align:center;
}

.card h2{
font-size:22px;
margin-bottom:15px;
color:#333;
}

.card p{
color:#555;
margin-bottom:20px;
}

a{
text-decoration:none;
}

button{
padding:12px 20px;
background:#0072ff;
color:white;
border:none;
border-radius:8px;
cursor:pointer;
}

button:hover{
background:#0056cc;
}

.back{
display:block;
width:200px;
margin:30px auto;
text-align:center;
padding:12px;
background:#333;
color:white;
border-radius:8px;
text-decoration:none;
}
</style>

</head>
<body>

<div class="container">

<h1>Reports Dashboard</h1>

<div class="grid">

<div class="card">
<h2>Date Range Report</h2>
<p>Reservations between selected dates</p>
<a href="report_form.jsp?type=date">
<button>Open</button>
</a>
</div>

<div class="card">
<h2>Total Revenue</h2>
<p>Total revenue between dates</p>
<a href="report_form.jsp?type=revenue">
<button>Open</button>
</a>
</div>

<div class="card">
<h2>Most Booked Rooms</h2>
<p>Most frequently booked rooms</p>
<a href="ReportServlet">
<button>Open</button>
</a>
</div>

</div>

<a href="index.jsp" class="back">Back to Dashboard</a>

</div>

</body>
</html>