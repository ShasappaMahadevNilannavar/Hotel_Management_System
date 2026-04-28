<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Reservation</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    background:linear-gradient(rgba(0,0,0,0.45),rgba(0,0,0,0.55)),
    url('https://images.unsplash.com/photo-1566073771259-6a8506099945')
    no-repeat center center/cover;
    height:100vh;
}

.container{
    width:430px;
    background:rgba(255,255,255,0.95);
    padding:30px;
    border-radius:18px;
    box-shadow:0 0 20px rgba(0,0,0,0.4);
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
}

h2{
    text-align:center;
    color:#0072ff;
    margin-bottom:25px;
}

.input-box{
    margin-bottom:15px;
}

label{
    font-weight:bold;
    display:block;
    margin-bottom:6px;
    color:#333;
}

input{
    width:100%;
    padding:12px;
    border:1px solid #ccc;
    border-radius:8px;
    outline:none;
}

input:focus{
    border:1px solid #0072ff;
}

button{
    width:100%;
    padding:13px;
    border:none;
    border-radius:8px;
    background:#0072ff;
    color:white;
    font-size:16px;
    cursor:pointer;
    margin-top:10px;
}

button:hover{
    background:#0056cc;
}

.back{
    display:block;
    text-align:center;
    margin-top:15px;
    text-decoration:none;
    color:#0072ff;
    font-weight:bold;
}
</style>
</head>

<body>

<div class="container">

<h2><i class="fa-solid fa-hotel"></i> Add Reservation</h2>

<form action="AddReservationServlet" method="post">

<!-- Reservation ID removed -->

<div class="input-box">
<label>Customer Name</label>
<input type="text" name="name" required>
</div>

<div class="input-box">
<label>Room Number</label>
<input type="number" name="room" required>
</div>

<div class="input-box">
<label>Check In Date</label>
<input type="date" name="checkin" required>
</div>

<div class="input-box">
<label>Check Out Date</label>
<input type="date" name="checkout" required>
</div>

<div class="input-box">
<label>Total Amount</label>
<input type="number" step="0.01" name="amount" required>
</div>

<button type="submit">
<i class="fa-solid fa-circle-plus"></i> Add Reservation
</button>

</form>

<a href="index.jsp" class="back">
<i class="fa-solid fa-arrow-left"></i> Back
</a>

</div>

</body>
</html>