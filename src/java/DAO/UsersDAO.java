/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Users;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleTypes;

public class UsersDAO {

    public UsersDAO() {
    }

    ;
    
    public Connection newConnection() {
        Connection conn = DBDataSource.getJDBCConnection();
        return conn;
    }

    public void closeConnection(Connection conn) {
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Users select(String username) {
        Connection conn = DBDataSource.getJDBCConnection();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users u = new Users();
        try {
            String query = "SELECT NUMERO, USERNAME FROM Users WHERE Username = ?";

            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                u.setId(rs.getLong("Numero"));
                u.setUsername(rs.getString("Username"));
            }

            return u;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
                return u;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public Users select(Connection conn, String username) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users u = new Users();
        try {
            String query = "SELECT NUMERO, USERNAME FROM Users WHERE Username = ?";

            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                u.setId(rs.getLong("Numero"));
                u.setUsername(rs.getString("Username"));
            }

            return u;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
        return null;
    }

    public Vector<Users> selectAll() {
        Connection conn = DBDataSource.getJDBCConnection();
        Statement stmt = null;
        ResultSet rs = null;
        Vector<Users> resultList = new Vector();
        try {

            String query = "select NUMERO, USERNAME from USERS";

            System.out.println(query);
            stmt = conn.createStatement(); //create a statement
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getLong("NUMERO"));
                u.setUsername(rs.getString("USERNAME"));
            }

            return resultList;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }

        return null;
    }

    public Vector<Users> selectAll(Connection conn) {
        Statement stmt = null;
        ResultSet rs = null;
        Vector<Users> resultList = new Vector();
        try {

            String query = "select NUMERO, USERNAME from USERS";

            System.out.println(query);
            stmt = conn.createStatement(); //create a statement
            rs = stmt.executeQuery(query);

            while (rs.next()) {
                Users u = new Users();
                u.setId(rs.getLong("NUMERO"));
                u.setUsername(rs.getString("USERNAME"));
            }

            return resultList;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }

        return null;
    }

    public Users selectById(Connection conn, Long id) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users u = new Users();
        try {
            String query = "SELECT NUMERO, USERNAME FROM Users WHERE Numero = ?";

            stmt = conn.prepareStatement(query);
            stmt.setLong(1, id);
            rs = stmt.executeQuery();

            while (rs.next()) {
                u.setId(rs.getLong("Numero"));
                u.setUsername(rs.getString("Username"));
            }

            return u;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();

            }
        }
        return null;
    }

    public Long create(Long id, String username, String pwd, Blob photo) {
        Connection conn = DBDataSource.getJDBCConnection();
        OraclePreparedStatement pstmt = null;
        ResultSet rs = null;
        Long returnNumero = null;
        try {

            String query = "insert into Users(username,pwd,photo) values (?,?,?) returning numero into ?";
            System.out.println("insertquery ->" + query);

            pstmt = (OraclePreparedStatement) conn.prepareStatement(query); //create a statement
            pstmt.setString(1, username);
            pstmt.setString(2, pwd);
            pstmt.setBlob(3, photo);
            pstmt.setLong(4, OracleTypes.NUMBER);

            int count = pstmt.executeUpdate();
            conn.commit();

            if (count > 0) {
                rs = pstmt.getReturnResultSet(); //rest is not null and not empty
                while (rs.next()) {
                    returnNumero = rs.getLong(1);
                    System.out.println(returnNumero);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                pstmt.close();
                conn.close();
                return returnNumero;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public Long updateProfil(Long id, String username, String pwd, Blob photo) {
        int executeUpdate = 0;
        String query = null, endquery = null, susername = null, spwd = null, sphoto = null;
        Connection conn = DBDataSource.getJDBCConnection();
        Statement stmt = null;
        try {

            boolean onedone = false;
            query = "update USERS SET";
            endquery = " WHERE numero=" + id;

            if (username != null) {
                susername = " USERNAME='" + username + "'";
            }
            if (pwd != null) {
                spwd = " PWD='" + pwd + "'";
            }
            if (photo != null) {
                sphoto = " PHOTO='" + photo + "'";
            }

            query = query.concat(endquery);

            System.out.println("updatequery ->" + query);

            //create a statement
            stmt = conn.createStatement();
            executeUpdate = stmt.executeUpdate(query);
            conn.commit();
            System.out.println(executeUpdate + " Rows modified");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                conn.close();
                return new Long(executeUpdate);
            } catch (SQLException e) {
                e.printStackTrace();
                return new Long(executeUpdate);
            }
        }
    }

    public Long delete(Long id) {
        int executeUpdate = 0;

        Connection conn = DBDataSource.getJDBCConnection();
        PreparedStatement pstmt = null;

        try {
            String q = "delete from Users where numero=?";

            System.out.println("deletequery ->" + q);

            pstmt = conn.prepareStatement(q); //create a statement
            //create a statement
            pstmt.setLong(1, id);
            executeUpdate = pstmt.executeUpdate();
            conn.commit();
            System.out.println(executeUpdate + " Rows modified");

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                pstmt.close();
                conn.close();
                return new Long(executeUpdate);
            } catch (SQLException e) {
                e.printStackTrace();
                return new Long(executeUpdate);
            }
        }
    }
}
