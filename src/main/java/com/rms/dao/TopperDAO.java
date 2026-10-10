package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rms.model.Topper;
import com.rms.util.DBConnection;

public class TopperDAO {

public List<Topper> getTopperList() {

    List<Topper> list =
        new ArrayList<Topper>();

    try {

        Connection con =
            DBConnection.getConnection();

        String sql =
            "SELECT s.ROLLNO, s.NAME, " +
            "ROUND(AVG(m.MARKS),2) PERCENTAGE " +
            "FROM STUDENT s " +
            "JOIN MARKS m ON s.ROLLNO=m.ROLLNO " +
            "GROUP BY s.ROLLNO,s.NAME " +
            "ORDER BY PERCENTAGE DESC";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ResultSet rs =
            ps.executeQuery();

        while(rs.next()) {

            Topper t =
                new Topper();

            t.setRollNo(
                rs.getInt("ROLLNO"));

            t.setStudentName(
                rs.getString("NAME"));

            t.setPercentage(
                rs.getDouble("PERCENTAGE"));

            list.add(t);
        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return list;
}


}
