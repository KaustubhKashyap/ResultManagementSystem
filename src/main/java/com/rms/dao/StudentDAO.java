package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.rms.model.Student;
import com.rms.util.DBConnection;

public class StudentDAO {

    // Add Student
    public boolean addStudent(Student s) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();
            String sql =
            		"INSERT INTO STUDENT(ROLLNO,NAME,CLASS,EMAIL,PASSWORD) VALUES(?,?,?,?,?)";
            
            System.out.println("NEW STUDENT DAO RUNNING");
            System.out.println(sql);

            
            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, s.getRollNo());
            ps.setString(2, s.getName());
            ps.setString(3, s.getStudentClass());
            ps.setString(4, s.getEmail());
            ps.setString(5, s.getPassword());

            System.out.println("Add Student Method Called");
            
            int rows = ps.executeUpdate();
            
            System.out.println("Rows = " + rows);

            if(rows > 0) {
                status = true;
            }

        } 
        catch(Exception e) {

            System.out.println("========== ERROR ==========");
            e.printStackTrace();

        }
        

        return status;
    }

    // View All Students
    public List<Student> getAllStudents() {

        List<Student> list = new ArrayList<Student>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM STUDENT ORDER BY ROLLNO";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Student s = new Student();

                s.setRollNo(rs.getInt("ROLLNO"));
                s.setName(rs.getString("NAME"));
                s.setStudentClass(rs.getString("CLASS"));
                s.setEmail(rs.getString("EMAIL"));
                s.setPassword(rs.getString("PASSWORD"));

                list.add(s);
            }

            System.out.println("TOTAL STUDENTS = " + list.size());

        } catch(Exception e) {

            e.printStackTrace();

        }

        return list;
    }

    // Delete Student
    public boolean deleteStudent(int rollNo) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "DELETE FROM STUDENT WHERE ROLLNO=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, rollNo);

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    // Get Student By Roll No
    public Student getStudentByRollNo(int rollNo) {

        Student s = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT * FROM STUDENT WHERE ROLLNO=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, rollNo);

            ResultSet rs =
                ps.executeQuery();

            if(rs.next()) {

                s = new Student();

                s.setRollNo(rs.getInt("ROLLNO"));
                s.setName(rs.getString("NAME"));
                s.setStudentClass(rs.getString("CLASS"));
                s.setEmail(rs.getString("EMAIL"));
                s.setPassword(rs.getString("PASSWORD"));

            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    // Update Student
    public boolean updateStudent(Student s) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "UPDATE STUDENT SET NAME=?, CLASS=?, EMAIL=? WHERE ROLLNO=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, s.getName());
            ps.setString(2, s.getStudentClass());
            ps.setString(3, s.getEmail());
            ps.setInt(4, s.getRollNo());

            int rows = ps.executeUpdate();

            if(rows > 0) {
                status = true;
            }
            

        } catch(Exception e) {
            e.printStackTrace();
        }

        return status;
    }
 // Search Student
    public Student searchStudent(int rollNo) {

   
    Student s = null;

    try {

        Connection con =
            DBConnection.getConnection();

        String sql =
            "SELECT * FROM STUDENT WHERE ROLLNO=?";

        PreparedStatement ps =
            con.prepareStatement(sql);

        ps.setInt(1, rollNo);

        ResultSet rs =
            ps.executeQuery();

        if(rs.next()) {

            s = new Student();

            s.setRollNo(
                rs.getInt("ROLLNO"));

            s.setName(
                rs.getString("NAME"));

            s.setStudentClass(
                rs.getString("CLASS"));

            s.setEmail(
                rs.getString("EMAIL"));
            
            s.setPassword(
            		rs.getString("PASSWORD"));

        }

    } catch(Exception e) {

        e.printStackTrace();
    }

    return s;
    

    }
    public Student validateStudent(int rollNo, String password) {

    	Student s = null;

    	try {

    	    Connection con =
    	        DBConnection.getConnection();

    	    String sql =
    	        "SELECT * FROM STUDENT WHERE ROLLNO=? AND PASSWORD=?";

    	    PreparedStatement ps =
    	        con.prepareStatement(sql);

    	    ps.setInt(1, rollNo);
    	    ps.setString(2, password);

    	    ResultSet rs =
    	        ps.executeQuery();

    	    if(rs.next()) {

    	        s = new Student();

    	        s.setRollNo(rs.getInt("ROLLNO"));
    	        s.setName(rs.getString("NAME"));
    	        s.setStudentClass(rs.getString("CLASS"));
    	        s.setEmail(rs.getString("EMAIL"));
    	        s.setPassword(rs.getString("PASSWORD"));
    	    }

    	} catch(Exception e) {
    	    e.printStackTrace();
    	}

    	return s;

    	}
    public boolean changePassword(
            int rollNo,
            String newPassword) {

        boolean status = false;

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "UPDATE STUDENT SET PASSWORD=? WHERE ROLLNO=?";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, newPassword);
            ps.setInt(2, rollNo);

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