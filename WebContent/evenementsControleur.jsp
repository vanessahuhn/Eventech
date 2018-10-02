<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%-- j'importe mon modèle --%>
	<%@ page import="modele.Evenement"%>
	
	<%-- j'importe les classes/interfaces de la librairie sql --%>
    <%@ page import="java.sql.*"%>
    
    <%
    	try {
    		    	
    		Class.forName("com.mysql.jdbc.Driver");
    		
    		String url = "jdbc:mysql://localhost:3306/buvette_tech";
    		String user = "root";
    		String pwd= "Password29";
    		
    		Connection con=DriverManager.getConnection(url, user, pwd);
    		
    		//create statement
    		Statement st=con.createStatement();
    		//execute query
    		ResultSet result = st.executeQuery("SELECT * FROM evenement");
    		
    		while (result.next()) {
    			
    			   			
    			Evenement evenement = new Evenement();
    			
    			evenement.setNom(result.getString("nom"));
    			evenement.setDescription_detaillee(result.getString("description_detaillee"));
    			
    			
    			out.println("<div class='card shadow-sm p-2 mb-4 bg-white rounded' style='width: 19rem;'>");
    			out.println("<img class='card-img-top img-fluid h-50' src='img/hackathon.png' alt='Card image cap'>");
    			out.println("<div class='card-body'>");
    			out.println("<h5 class='card-title'>"+evenement.getNom()+"</h5>");
    			out.println("<p class='card-text'>" + evenement.getDescription_detaillee() + "</p>");
    			out.println("<a href='#' class='btn btn-primary btn-lg'>Plus de détails</a>");
    			out.println("</div>");
    			out.println("</div>");
    	
		}
	
}
catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();

}

%>