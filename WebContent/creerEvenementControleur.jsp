<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!--  j'importe la bibliothèque sql -->
<%@page import="java.sql.*"%>
<%@page import="modele.Evenement"%>


 
 <%
 try {
	 		//je récupère les données entrées par l'utilisateur dans ma vue
	 		//je stocke chaque donnée dans une variable
	 		String image_event = request.getParameter("image_event");
	 		String nom = request.getParameter("nom");
	 		String date = request.getParameter("date");
	 		String heure = request.getParameter("heure");
	        String lieu = request.getParameter("lieu");
	        int places_min = Integer.parseInt(request.getParameter("places_min"));
	        int places_max = Integer.parseInt(request.getParameter("places_max"));
	        int prix = Integer.parseInt(request.getParameter("prix"));
	        String cagnotte = request.getParameter("cagnotte");
	        String description_detaillee = request.getParameter("description_detaillee");

	        Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/buvette_tech";
			String user = "root";
			String pwd= "Password29";
			
			Connection con=DriverManager.getConnection(url, user, pwd);

			PreparedStatement ps = con.prepareStatement("insert into evenement(image_event, nom, date, heure, lieu, places_min, places_max, prix, cagnotte, description_detaillee) values(?,?,?,?,?,?,?,?,?,?)");
			
			ps.setString(1, image_event);
			ps.setString(2, nom);
			ps.setString(3, date);
			ps.setString(4, heure);
			ps.setString(5, lieu);
			ps.setInt(6, places_min);
			ps.setInt(7, places_max);
			ps.setInt(8, prix);
			ps.setString(9, cagnotte);
			ps.setString(10, description_detaillee);
			    
			int i = ps.executeUpdate();   
		            
		    if(i>0){
		    
				System.out.println("Création réussie. Bravo Vanessa :)");
				%>
				<jsp:forward page="evenementsVue.jsp"></jsp:forward>
				<%
		    	
		    }
		    else{
		    	System.out.println("ECHEC");
		    }
				
 }
 catch(Exception e)
 {e.printStackTrace();
 out.print("Nous ne pouvons satisfaire votre demande. Remplissez tous les champs et réessayez." );
 }

 %>