/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Date;

/**
 *
 * @author Maxime Stierli <maxime.stierli@he-arc.ch>
 */
public class Commentaire {
    private Long id=null;
    private Long users_numero=null;
    private String commentaire;
    private Date dateAjout=null;
    
    public Commentaire(String commentaire,Long comm_users) {
        this.commentaire = commentaire;
    }
    
    public Commentaire(){
        
    }

    public Long getUsers_numero() {
        return users_numero;
    }

    public void setUsers_numero(Long comm_users) {
        this.users_numero = comm_users;
    }

    public String getCommentaire() {
        return commentaire;
    }

    public void setCommentaire(String commentaire) {
        this.commentaire = commentaire;
    }

    public Long getId() {
        return id;
    }
   
    public void setId(Long id){
        this.id = id;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }
}
