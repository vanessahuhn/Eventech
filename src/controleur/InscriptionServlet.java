package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modele.Utilisateur;
import dao.InscriptionDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/InscriptionServlet")
public class InscriptionServlet extends HttpServlet {
		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String prenom = request.getParameter("prenom");
		String nom = request.getParameter("nom");
		String mail = request.getParameter("mail");
		String mot_de_passe = request.getParameter("mot_de_passe");
		 
		 Utilisateur utilisateur = new Utilisateur();
		 //Using Java Beans - An easiest way to play with group of related data
		 utilisateur.setPrenom(prenom);
		 utilisateur.setNom(nom);
		 utilisateur.setMail(mail);
		 utilisateur.setMot_de_passe(mot_de_passe); 
		 
		 InscriptionDao dao = new InscriptionDao();
		 
		 //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
		 String userRegistered = dao.inscrireUtilisateur(utilisateur);
		 
		 if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
		 {
		 request.getRequestDispatcher("/connexionVue.jsp").forward(request, response);
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
		 request.setAttribute("errMessage", userRegistered);
		 request.getRequestDispatcher("/inscriptionVue.jsp").forward(request, response);
		 }
	}

}
