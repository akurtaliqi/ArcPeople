
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.Users;
import java.awt.Image;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleTypes;

/**
 *
 * @author Maxime Stierli <maxime.stierli@he-arc.ch>
 */
public class UsersDAO {

    public UsersDAO() {
    }

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

    public Image getphotoById(Connection conn, long user_id) {
        System.out.println("connexion base donnée sucsse");
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String query = "SELECT BLOBTOIMAGE(?) as image FROM DUAL";

            stmt = conn.prepareStatement(query);
            stmt.setLong(1, user_id);
            rs = stmt.executeQuery();
            System.out.println("image avant finally");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                System.out.println("image finally");
                System.out.println(((Image) rs.getObject("image")).toString());
                return (Image) rs.getObject("image");

            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
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

    public Users select(String username) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Users u = new Users();
        Connection conn = DBDataSource.getJDBCConnection();
        try {
            String query = "SELECT * FROM Users WHERE Username = ?";

            stmt = conn.prepareStatement(query);
            stmt.setString(1, username);
            rs = stmt.executeQuery();

            while (rs.next()) {
                u.setId(rs.getLong("Numero"));
                u.setUsername(rs.getString("Username"));
                u.setEmail(rs.getString("email"));
                u.setPwd(rs.getString("pwd"));
                u.setPhoto(rs.getBlob("Photo"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                return u;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public Long create(Connection conn, Long id, String username, String pwd, String email, Blob photo) {
        OraclePreparedStatement pstmt = null;
        ResultSet rs = null;
        Long returnNumero = null;
        try {

            String query = "insert into Users(username,pwd,email,photo) values (?,?,?,?) returning numero into ?";
            System.out.println("insertquery ->" + query);

            pstmt = (OraclePreparedStatement) conn.prepareStatement(query); //create a statement
            pstmt.setString(1, username);
            pstmt.setString(2, pwd);
            pstmt.setString(3, email);
            pstmt.setBlob(4, photo);
            pstmt.setLong(5, OracleTypes.NUMBER);

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
                return returnNumero;
            } catch (SQLException e) {
                e.printStackTrace();
                return null;
            }
        }
    }

    public Long updateProfil(Long id, String username, String pwd, String email, Blob photo) {
        int executeUpdate = 0;
        String query = null, endquery = null, susername = null, spwd = null, semail = null, sphoto = null;
        Statement stmt = null;
        Connection conn = DBDataSource.getJDBCConnection();
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
            if (pwd != null) {
                semail = " EMAIL='" + email + "'";
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
                return new Long(executeUpdate);
            } catch (SQLException e) {
                e.printStackTrace();
                return new Long(executeUpdate);
            }
        }
    }

    public Long delete(Connection conn, Long id) {
        int executeUpdate = 0;
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
                return new Long(executeUpdate);
            } catch (SQLException e) {
                e.printStackTrace();
                return new Long(executeUpdate);
            }
        }
    }
}
