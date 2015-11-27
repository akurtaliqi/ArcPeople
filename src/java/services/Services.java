package services;

import DAO.CommentaireDAO;
import DAO.UsersDAO;
import Model.Commentaire;
import Model.Users;
import java.sql.Connection;
import java.util.Vector;

public class Services {

    public Vector<Commentaire> selectComments(Connection con) {
        
        CommentaireDAO cdao = new CommentaireDAO();
        
        Users u = new Users();
        Vector<Commentaire> vcomm = new Vector();
        vcomm = cdao.selectAll();
        
        return vcomm;
    }

}
