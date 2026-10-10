package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rms.model.Result;
import com.rms.util.DBConnection;

public class ResultDAO {

public List<Result> getResult(int rollNo) {

    List<Result> list = new ArrayList<Result>();

    try {

        Connection con =
            DBConnection.getConnection();

        String sql =
            "SELECT s.ROLLNO, s.NAME, " +
            "sub.SUBJECT_NAME, m.MARKS " +
            "FROM STUDENT s " +
            "JOIN MARKS m ON s.ROLLNO=m.ROLLNO " +
            "JOIN SUBJECT sub ON sub.SUBJECT_ID=m.SUBJECT_ID " +
            "WHERE s.ROLLNO=?";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, rollNo);

        ResultSet rs =
            ps.executeQuery();

        while(rs.next()) {

            Result r = new Result();

            r.setRollNo(
                rs.getInt("ROLLNO"));

            r.setStudentName(
                rs.getString("NAME"));

            r.setSubjectName(
                rs.getString("SUBJECT_NAME"));

            r.setMarks(
                rs.getInt("MARKS"));

            list.add(r);
        }

        if(!list.isEmpty()) {

            int total = 0;

            for(Result r : list) {
                total += r.getMarks();
            }

            double percentage =
                (double) total / list.size();

            String status =
                percentage >= 40 ? "PASS" : "FAIL";

            String grade;

            if(percentage >= 90)
                grade = "A+";
            else if(percentage >= 80)
                grade = "A";
            else if(percentage >= 70)
                grade = "B";
            else if(percentage >= 60)
                grade = "C";
            else if(percentage >= 40)
                grade = "D";
            else
                grade = "F";

            list.get(0).setTotalMarks(total);
            list.get(0).setPercentage(percentage);
            list.get(0).setStatus(status);
            list.get(0).setGrade(grade);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return list;
}

public List<Result> getAllResults() {

    List<Result> list =
        new ArrayList<Result>();

    try {

        Connection con =
            DBConnection.getConnection();

        String sql =
            "SELECT s.ROLLNO, s.NAME, " +
            "AVG(m.MARKS) AS PERCENTAGE " +
            "FROM STUDENT s " +
            "JOIN MARKS m ON s.ROLLNO = m.ROLLNO " +
            "GROUP BY s.ROLLNO, s.NAME " +
            "ORDER BY s.ROLLNO";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ResultSet rs =
            ps.executeQuery();

        while(rs.next()) {

            Result r =
                new Result();

            r.setRollNo(
                rs.getInt("ROLLNO"));

            r.setStudentName(
                rs.getString("NAME"));

            double percentage =
                rs.getDouble("PERCENTAGE");

            r.setPercentage(
                percentage);

            r.setStatus(
                percentage >= 40 ?
                "PASS" : "FAIL");

            list.add(r);
        }

    } catch(Exception e) {
        e.printStackTrace();
    }

    return list;
}


}
