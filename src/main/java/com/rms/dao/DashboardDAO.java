package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.util.DBConnection;

public class DashboardDAO {

    public int getStudentCount() {

        int count = 0;

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(
                "SELECT COUNT(*) FROM STUDENT");

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return count;
    }


    public int getSubjectCount() {

        int count = 0;

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(
                "SELECT COUNT(*) FROM SUBJECT");

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return count;
    }


    public int getMarksCount() {

        int count = 0;

        try {

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(
                "SELECT COUNT(*) FROM MARKS");

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {
                count = rs.getInt(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return count;
    }


    public String getTopperName() {

        String topper = "N/A";

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "SELECT s.NAME " +
                "FROM STUDENT s, MARKS m " +
                "WHERE s.ROLLNO = m.ROLLNO " +
                "GROUP BY s.ROLLNO, s.NAME " +
                "ORDER BY AVG(m.MARKS) DESC";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {
                topper = rs.getString(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return topper;
    }


    public double getHighestPercentage() {

        double percentage = 0;

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "SELECT MAX(percentage) " +
                "FROM (" +
                "SELECT AVG(MARKS) percentage " +
                "FROM MARKS " +
                "GROUP BY ROLLNO" +
                ")";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {
                percentage = rs.getDouble(1);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return percentage;
    }
}