package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import modele.Utilisateur;
import jdbc.DBConnection;

public class ConnexionDao {
	public boolean connecterUtilisateur (Utilisateur utilisateur)
	{
	String mail = utilisateur.getMail();
	String mot_de_passe = utilisateur.getMot_de_passe();
	Connection con = null;
	Statement statement = null;
	ResultSet resultSet = null;
	String mailDB = "";
	String mot_de_passeDB = "";
	try
	{
	con = DBConnection.createConnection();
	statement = con.createStatement();
	resultSet = statement.executeQuery("select * from utilisateur where mot_de_passe = SHA2('" + mot_de_passe + "',0) AND mail = SHA2('" + mail + "',0)");
	while(resultSet.next())
	{
	mailDB = resultSet.getString("mail");
	mot_de_passeDB = resultSet.getString("mot_de_passe");
	utilisateur.setNom(resultSet.getString("nom"));
	utilisateur.setPrenom(resultSet.getString("prenom"));
	utilisateur.setId_utilisateur(resultSet.getInt("id_utilisateur"));
	
	System.out.println(utilisateur.getNom());
	System.out.println(utilisateur.getId_utilisateur());
	
	if(mail.equals(mailDB) && mot_de_passe.equals(mot_de_passeDB))
		System.out.println("mail et mot de passe OK");
		return true;
	}	
	
	}
	
	catch(SQLException e)
	{
	e.printStackTrace();
	}
	return false;
	}
}
