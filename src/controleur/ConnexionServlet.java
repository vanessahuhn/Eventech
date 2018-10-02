package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modele.Utilisateur;
import dao.ConnexionDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/ConnexionServlet")
public class ConnexionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String mail = request.getParameter("mail");
		String mot_de_passe = request.getParameter("mot_de_passe");
		Utilisateur utilisateur = new Utilisateur();
		utilisateur.setMail(mail);
		utilisateur.setMot_de_passe(mot_de_passe);
		ConnexionDao dao = new ConnexionDao();
		
		try
		{
		boolean isConnecte = dao.connecterUtilisateur(utilisateur);
		if(isConnecte)
		{
		System.out.println("utilisateur connecté");
		HttpSession session = request.getSession(); //Creating a session
		session.setAttribute("utilisateur", utilisateur); //setting session attribute
		session.setAttribute("mail", utilisateur.getMail());
		session.setAttribute("prenom", utilisateur.getPrenom());
		session.setAttribute("nom", utilisateur.getNom());
		session.setAttribute("id_utilisateur", utilisateur.getId_utilisateur());
		session.setAttribute("mot_de_passe", utilisateur.getMot_de_passe());
		session.setAttribute("isConnecte", utilisateur.isConnecte());
		request.getRequestDispatcher("/evenementsVue.jsp").forward(request, response);
		}
		
		else
		{
		System.out.println("utilisateur pas connecté");
		request.getRequestDispatcher("/connexionVue.jsp").forward(request, response);
		}
		}
		catch (IOException e1)
		{
		e1.printStackTrace();
		}
		catch (Exception e2)
		{
		e2.printStackTrace();
		}
		

		
	}

}
