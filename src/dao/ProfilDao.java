package dao;

import java.sql.*;
import jdbc.DBConnection;
import modele.Utilisateur;

public class ProfilDao {
	
	public boolean modifierProfil(Utilisateur utilisateur)
	 {
		Connection con = null;
		 PreparedStatement preparedStatement = null;
try{
    		String nom = utilisateur.getNom();
    		String prenom = utilisateur.getPrenom();
    		String pseudo = utilisateur.getPseudo();
    		String mail = utilisateur.getMail();
    		String entreprise = utilisateur.getEntreprise();
    		String fonction = utilisateur.getFonction();
    		int id_utilisateur = utilisateur.getId_utilisateur();
    		System.out.println(utilisateur.getId_utilisateur() + " avant db connection");
    		
    		con = DBConnection.createConnection();
    		String query = "UPDATE utilisateur SET nom = ?, prenom = ?, pseudo = ?, mail = ?, entreprise = ?, fonction = ? WHERE id_utilisateur = ?"; //Insert user details into the table 'USERS'
    		preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
    		preparedStatement.setString(1,nom);
    		preparedStatement.setString(2,prenom);
    		preparedStatement.setString(3,pseudo);
    		preparedStatement.setString(4,mail);
    		preparedStatement.setString(5,entreprise);
    		preparedStatement.setString(6,fonction);
    		preparedStatement.setInt(7, id_utilisateur);
    		 
    		 int i= preparedStatement.executeUpdate();
    		 
    		 if (i!=0)  //Just to ensure data has been inserted into the database
    		 return true; 
    		 }
catch (SQLException e) {
	e.printStackTrace();
}
return false;  // On failure, send a message from here.

    		
}

		
	

}
