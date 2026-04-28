// ReservationDAO.java
package com.dao;

import java.sql.*;
import java.util.*;
import com.model.Reservation;

public class ReservationDAO {

    private Connection getConnection() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");

        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/hotel",
            "root",
            "pandu@142"
        );
    }

    // ADD RESERVATION
    public void addReservation(Reservation r) throws Exception {

        Connection con = getConnection();

        String sql =
        "INSERT INTO Reservations(CustomerName,RoomNumber,CheckIn,CheckOut,TotalAmount) VALUES(?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, r.getCustomerName());
        ps.setInt(2, r.getRoomNumber());
        ps.setString(3, r.getCheckIn());
        ps.setString(4, r.getCheckOut());
        ps.setDouble(5, r.getTotalAmount());

        ps.executeUpdate();
        con.close();
    }

    // VIEW ALL
    public List<Reservation> getAllReservations() throws Exception {

        List<Reservation> list = new ArrayList<>();

        Connection con = getConnection();

        PreparedStatement ps =
        con.prepareStatement("SELECT * FROM Reservations");

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Reservation r = new Reservation();

            r.setReservationID(rs.getInt("ReservationID"));
            r.setCustomerName(rs.getString("CustomerName"));
            r.setRoomNumber(rs.getInt("RoomNumber"));
            r.setCheckIn(rs.getString("CheckIn"));
            r.setCheckOut(rs.getString("CheckOut"));
            r.setTotalAmount(rs.getDouble("TotalAmount"));

            list.add(r);
        }

        con.close();
        return list;
    }

    // GET BY ID
    public Reservation getReservationById(int id) throws Exception {

        Reservation r = null;

        Connection con = getConnection();

        PreparedStatement ps =
        con.prepareStatement(
        "SELECT * FROM Reservations WHERE ReservationID=?");

        ps.setInt(1,id);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){

            r = new Reservation();

            r.setReservationID(rs.getInt("ReservationID"));
            r.setCustomerName(rs.getString("CustomerName"));
            r.setRoomNumber(rs.getInt("RoomNumber"));
            r.setCheckIn(rs.getString("CheckIn"));
            r.setCheckOut(rs.getString("CheckOut"));
            r.setTotalAmount(rs.getDouble("TotalAmount"));
        }

        con.close();
        return r;
    }

    // UPDATE FULL
    public void updateFullReservation(Reservation r) throws Exception {

        Connection con = getConnection();

        String sql =
        "UPDATE Reservations SET CustomerName=?,RoomNumber=?,CheckIn=?,CheckOut=?,TotalAmount=? WHERE ReservationID=?";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setString(1,r.getCustomerName());
        ps.setInt(2,r.getRoomNumber());
        ps.setString(3,r.getCheckIn());
        ps.setString(4,r.getCheckOut());
        ps.setDouble(5,r.getTotalAmount());
        ps.setInt(6,r.getReservationID());

        ps.executeUpdate();

        con.close();
    }

    // DELETE
    public void deleteReservation(int id) throws Exception {

        Connection con = getConnection();

        PreparedStatement ps =
        con.prepareStatement(
        "DELETE FROM Reservations WHERE ReservationID=?");

        ps.setInt(1,id);

        ps.executeUpdate();

        con.close();
    }

    // DATE RANGE REPORT
    public List<Reservation> getReservationsByDate(
        String from,String to) throws Exception {

        List<Reservation> list =
        new ArrayList<>();

        Connection con = getConnection();

        String sql =
        "SELECT * FROM Reservations WHERE CheckIn BETWEEN ? AND ?";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setString(1,from);
        ps.setString(2,to);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Reservation r = new Reservation();

            r.setReservationID(rs.getInt("ReservationID"));
            r.setCustomerName(rs.getString("CustomerName"));
            r.setRoomNumber(rs.getInt("RoomNumber"));
            r.setCheckIn(rs.getString("CheckIn"));
            r.setCheckOut(rs.getString("CheckOut"));
            r.setTotalAmount(rs.getDouble("TotalAmount"));

            list.add(r);
        }

        con.close();
        return list;
    }

    // TOTAL REVENUE
    public double getTotalRevenue(
        String from,String to) throws Exception {

        double total = 0;

        Connection con = getConnection();

        String sql =
        "SELECT IFNULL(SUM(TotalAmount),0) FROM Reservations WHERE CheckIn BETWEEN ? AND ?";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ps.setString(1,from);
        ps.setString(2,to);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            total = rs.getDouble(1);
        }

        con.close();
        return total;
    }

    // MOST BOOKED ROOMS
    public List<Object[]> getMostBookedRooms()
    throws Exception {

        List<Object[]> list =
        new ArrayList<>();

        Connection con = getConnection();

        String sql =
        "SELECT RoomNumber, COUNT(*) total FROM Reservations GROUP BY RoomNumber ORDER BY total DESC";

        PreparedStatement ps =
        con.prepareStatement(sql);

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Object[] obj = new Object[2];

            obj[0] = rs.getInt("RoomNumber");
            obj[1] = rs.getInt("total");

            list.add(obj);
        }

        con.close();
        return list;
    }
}