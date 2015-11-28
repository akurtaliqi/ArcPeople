package services;

import DAO.AjoutDAO;
import DAO.CommentaireDAO;
import DAO.DBDataSource;
import DAO.UsersDAO;
import Model.Commentaire;
import Model.Users;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

public class Services {

    public Vector<Commentaire> selectComments(Connection con) {
        
        CommentaireDAO cdao = new CommentaireDAO();
        
        Users u = new Users();
        Vector<Commentaire> vcomm = new Vector();
        vcomm = cdao.selectAll();
        
        return vcomm;
    }
    
    public ArrayList<Users> getTop5UsersAdditions() throws SQLException {
        
        AjoutDAO adao = new AjoutDAO();
        
        ArrayList<Users> usersTop = adao.top5Additions();
        
        return usersTop;
        
        
    }

}
