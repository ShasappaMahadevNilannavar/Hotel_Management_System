<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<title>Hotel Dashboard</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<!-- Font Awesome Icons -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    background:linear-gradient(rgba(0,0,0,0.55),rgba(0,0,0,0.65)),
    url('https://images.unsplash.com/photo-1582719478250-c89cae4dc85b') no-repeat center center/cover;
    min-height:100vh;
}

.header{
    padding:22px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:rgba(255,255,255,0.08);
    backdrop-filter:blur(8px);
    color:white;
}

.logo{
    font-size:32px;
    font-weight:700;
}

.welcome{
    font-size:17px;
}

.container{
    width:90%;
    margin:35px auto;
}

.title{
    text-align:center;
    color:white;
    font-size:38px;
    font-weight:700;
    margin-bottom:35px;
}

.grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:25px;
}

.card{
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(12px);
    border-radius:20px;
    padding:28px 20px;
    text-align:center;
    color:white;
    box-shadow:0 8px 20px rgba(0,0,0,0.35);
    transition:0.4s;
}

.card:hover{
    transform:translateY(-10px);
}

.icon{
    font-size:48px;
    color:#00c6ff;
    margin-bottom:18px;
}

.card h3{
    margin-bottom:10px;
    font-size:24px;
}

.card p{
    font-size:14px;
    margin-bottom:18px;
}

button{
    width:100%;
    border:none;
    padding:12px;
    border-radius:30px;
    color:white;
    font-size:16px;
    cursor:pointer;
    background:linear-gradient(45deg,#00c6ff,#0072ff);
}

button:hover{
    background:linear-gradient(45deg,#ff512f,#dd2476);
}

.footer{
    text-align:center;
    color:white;
    padding:20px;
}
</style>

</head>
<body>

<div class="header">
<div class="logo"><i class="fa-solid fa-hotel"></i> Hotel HMS</div>
<div class="welcome">Welcome Admin</div>
</div>

<div class="container">

<div class="title">Hotel Management Dashboard</div>

<div class="grid">

<div class="card">
<div class="icon"><i class="fa-solid fa-user-plus"></i></div>
<h3>Add Reservation</h3>
<p>Create new bookings.</p>
<a href="reservationadd.jsp"><button>Open</button></a>
</div>

<div class="card">
<div class="icon"><i class="fa-solid fa-pen-to-square"></i></div>
<h3>Update Reservation</h3>
<p>Edit guest details.</p>
<a href="reservationupdate.jsp"><button>Open</button></a>
</div>

<div class="card">
<div class="icon"><i class="fa-solid fa-trash"></i></div>
<h3>Delete Reservation</h3>
<p>Remove bookings.</p>
<a href="reservationdelete.jsp"><button>Open</button></a>
</div>

<div class="card">
<div class="icon"><i class="fa-solid fa-list-check"></i></div>
<h3>View Reservations</h3>
<p>Check all records.</p>
<a href="DisplayReservationServlet"><button>Open</button></a>
</div>

<div class="card">
<div class="icon"><i class="fa-solid fa-chart-line"></i></div>
<h3>Reports</h3>
<p>Booking analytics.</p>
<a href="reports.jsp"><button>Open</button></a>
</div>



</div>
</div>

<div class="footer">
© Smart Hotel Management System
</div>

</body>
</html>