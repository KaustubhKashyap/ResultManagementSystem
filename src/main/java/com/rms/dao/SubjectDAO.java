package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rms.model.Subject;
import com.rms.util.DBConnection;

public class SubjectDAO {


// Add Subject
public boolean addSubject(Subject s) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "INSERT INTO RMS.SUBJECT(SUBJECT_ID, SUBJECT_NAME) VALUES(?, ?)";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, s.getSubjectId());
        ps.setString(2, s.getSubjectName());

        int rows = ps.executeUpdate();

        if(rows > 0) {
            status = true;
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return status;
}


// View Subjects
public List<Subject> getAllSubjects() {

    List<Subject> list =
        new ArrayList<Subject>();

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "SELECT * FROM RMS.SUBJECT ORDER BY SUBJECT_ID";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ResultSet rs =
            ps.executeQuery();

        System.out.println("SUBJECT QUERY EXECUTED");

        while(rs.next()) {

            System.out.println(
                rs.getInt("SUBJECT_ID") + " - " +
                rs.getString("SUBJECT_NAME")
            );

            Subject s =
                new Subject();

            s.setSubjectId(
                rs.getInt("SUBJECT_ID"));

            s.setSubjectName(
                rs.getString("SUBJECT_NAME"));

            list.add(s);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return list;
}


// Delete Subject
public boolean deleteSubject(int subjectId) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "DELETE FROM RMS.SUBJECT WHERE SUBJECT_ID=?";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, subjectId);

        int rows = ps.executeUpdate();

        if(rows > 0) {
            status = true;
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return status;
}


// Get Subject By ID
public Subject getSubjectById(int subjectId) {

    Subject s = null;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "SELECT * FROM RMS.SUBJECT WHERE SUBJECT_ID=?";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, subjectId);

        ResultSet rs =
            ps.executeQuery();

        if(rs.next()) {

            s =
                new Subject();

            s.setSubjectId(
                rs.getInt("SUBJECT_ID"));

            s.setSubjectName(
                rs.getString("SUBJECT_NAME"));
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return s;
}


// Update Subject
public boolean updateSubject(Subject s) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
            "UPDATE RMS.SUBJECT SET SUBJECT_NAME=? WHERE SUBJECT_ID=?";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setString(
            1,
            s.getSubjectName());

        ps.setInt(
            2,
            s.getSubjectId());

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

}
