<%@ page import="java.util.*, com.model.Reservation" %>

<html>
<head>
<title>Reservations</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: linear-gradient(to right, #4facfe, #00f2fe);
        margin: 0;
        padding: 0;
    }

    .container {
        width: 90%;
        margin: 40px auto;
        background: #fff;
        padding: 25px;
        border-radius: 12px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.2);
    }

    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    th {
        background: #4facfe;
        color: white;
        padding: 12px;
        font-size: 16px;
    }

    td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    tr:hover {
        background: #f2f2f2;
    }

    .no-data {
        text-align: center;
        padding: 15px;
        font-weight: bold;
        color: #777;
    }

    .back {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background: #4facfe;
        color: white;
        border-radius: 6px;
        text-decoration: none;
    }

    .back:hover {
        background: #00c6ff;
    }

    .center {
        text-align: center;
    }
</style>

</head>

<body>

<div class="container">

    <h2>Reservations List</h2>

    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Room</th>
            <th>Check-In</th>
            <th>Check-Out</th>
            <th>Amount</th>
        </tr>

        <%
        List<Reservation> list = (List<Reservation>)request.getAttribute("list");

        if(list != null && !list.isEmpty()){
            for(Reservation r : list){
        %>

        <tr>
            <td><%= r.getReservationID() %></td>
            <td><%= r.getCustomerName() %></td>
            <td><%= r.getRoomNumber() %></td>
            <td><%= r.getCheckIn() %></td>
            <td><%= r.getCheckOut() %></td>
            <td><%= r.getTotalAmount() %></td>
        </tr>

        <%
            }
        } else {
        %>

        <tr>
            <td colspan="6" class="no-data">No Data Available</td>
        </tr>

        <% } %>

    </table>

    <div class="center">
        <a href="index.jsp" class="back">Back</a>
    </div>

</div>

</body>
</html>