package com.rms.dao;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.model.Marks;
import com.rms.util.DBConnection;

public class MarksDAO {

    // Add Marks
    public boolean addMarks(Marks m) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "INSERT INTO MARKS(ROLLNO,SUBJECT_ID,MARKS) VALUES(?,?,?)";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, m.getRollNo());
            ps.setInt(2, m.getSubjectId());
            ps.setInt(3, m.getMarks());

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }


    // Get Existing Marks
    public Marks getMarks(int rollNo, int subjectId) {

        Marks m = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT * FROM MARKS " +
                "WHERE ROLLNO=? AND SUBJECT_ID=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, rollNo);
            ps.setInt(2, subjectId);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {

                m = new Marks();

                m.setRollNo(
                    rs.getInt("ROLLNO"));

                m.setSubjectId(
                    rs.getInt("SUBJECT_ID"));

                m.setMarks(
                    rs.getInt("MARKS"));
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return m;
    }


    // Update Marks
    public boolean updateMarks(Marks m) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "UPDATE MARKS SET MARKS=? " +
                "WHERE ROLLNO=? AND SUBJECT_ID=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, m.getMarks());
            ps.setInt(2, m.getRollNo());
            ps.setInt(3, m.getSubjectId());

            int rows =
                ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
 // Get All Marks
    public List<Marks> getAllMarks() {

        List<Marks> list = new ArrayList<Marks>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =
            	    "SELECT ROLLNO, SUBJECT_ID, MARKS " +
            	    "FROM RMS.MARKS " +
            	    "ORDER BY ROLLNO, SUBJECT_ID";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ResultSet rs =
                ps.executeQuery();

            while(rs.next()) {

                Marks m = new Marks();

                m.setRollNo(
                    rs.getInt("ROLLNO"));

                m.setSubjectId(
                    rs.getInt("SUBJECT_ID"));

                m.setMarks(
                    rs.getInt("MARKS"));

                list.add(m);
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return list;
    }
}