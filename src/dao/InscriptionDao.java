package dao;

import java.sql.*;

import modele.Utilisateur;
import jdbc.DBConnection;

public class InscriptionDao {
	public String inscrireUtilisateur(Utilisateur utilisateur)
	 {
	 String prenom = utilisateur.getPrenom();
	 String nom = utilisateur.getNom();
	 String mail = utilisateur.getMail();
	 String mot_de_passe = utilisateur.getMot_de_passe();
	 
	 Connection con = null;
	 PreparedStatement preparedStatement = null;
	 
	 try
	 {
	 con = DBConnection.createConnection();
	 String query = "insert into utilisateur(prenom,nom,mail,mot_de_passe) values (?,?,?,?)"; //Insert user details into the table 'USERS'
	 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
	 preparedStatement.setString(1, prenom);
	 preparedStatement.setString(2, nom);
	 preparedStatement.setString(3, mail);
	 preparedStatement.setString(4, mot_de_passe);
	 
	 int i= preparedStatement.executeUpdate();
	 
	 if (i!=0)  //Just to ensure data has been inserted into the database
	 return "SUCCESS"; 
	 }
	 catch(SQLException e)
	 {
	 e.printStackTrace();
	 }
	 
	 return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
	 }
	 }