package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.model.ResultSummary;
import com.rms.util.DBConnection;

public class ResultSummaryDAO {

    public ResultSummary getSummary() {

        ResultSummary rsObj =
            new ResultSummary();

        try {

            Connection con =
                DBConnection.getConnection();


            // ==============================
            // Total Students
            // ==============================

            PreparedStatement ps1 =
                con.prepareStatement(
                "SELECT COUNT(*) " +
                "FROM RMS.STUDENT");

            ResultSet rs1 =
                ps1.executeQuery();

            if(rs1.next()) {

                rsObj.setTotalStudents(
                    rs1.getInt(1));
            }


            // ==============================
            // Topper & Highest Percentage
            // ==============================

            String sql =
                "SELECT NAME, PERCENTAGE " +
                "FROM (" +
                "SELECT s.NAME, " +
                "AVG(m.MARKS) AS PERCENTAGE " +
                "FROM RMS.STUDENT s " +
                "JOIN RMS.MARKS m " +
                "ON s.ROLLNO = m.ROLLNO " +
                "GROUP BY s.ROLLNO, s.NAME " +
                "ORDER BY AVG(m.MARKS) DESC" +
                ") " +
                "WHERE ROWNUM = 1";


            PreparedStatement ps2 =
                con.prepareStatement(sql);

            ResultSet rs2 =
                ps2.executeQuery();

            if(rs2.next()) {

                rsObj.setTopperName(
                    rs2.getString("NAME"));

                rsObj.setHighestPercentage(
                    rs2.getDouble("PERCENTAGE"));
            }


            rs1.close();
            ps1.close();

            rs2.close();
            ps2.close();

            con.close();


        } catch(Exception e) {

            e.printStackTrace();
        }

        return rsObj;
    }
}