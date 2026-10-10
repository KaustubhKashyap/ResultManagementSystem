package com.rms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.rms.util.DBConnection;

public class LoginDAO {

    public boolean validate(String username,
                            String password) {

        boolean status = false;

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                    "SELECT * FROM ADMIN WHERE USERNAME=? AND PASSWORD=?";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs =
                    ps.executeQuery();

            if(rs.next()) {

                status = true;
            }

        } catch(Exception e) {

            e.printStackTrace();
        }

        return status;
    }
}