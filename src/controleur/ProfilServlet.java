package controleur;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProfilDao;
import modele.Utilisateur;

/**
 * Servlet implementation class ProfilServlet
 */
@WebServlet("/ProfilServlet")
public class ProfilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		int id_utilisateur = (int) session.getAttribute("id_utilisateur");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String pseudo = request.getParameter("pseudo");
		String mail = request.getParameter("mail");
		String entreprise = request.getParameter("entreprise");
		String fonction = request.getParameter("fonction");
		
		
		System.out.println(session.getAttribute("id_utilisateur") + " avant new user");
		
		Utilisateur utilisateur = new Utilisateur();
		
		utilisateur.setId_utilisateur(id_utilisateur);
		utilisateur.setNom(nom);
		utilisateur.setPrenom(prenom);
		utilisateur.setPseudo(pseudo);
		utilisateur.setMail(mail);
		utilisateur.setEntreprise(entreprise);
		utilisateur.setFonction(fonction);
		
		ProfilDao dao = new ProfilDao();
		dao.modifierProfil(utilisateur);
		
		try
		{
		
		 boolean profilModifie = dao.modifierProfil(utilisateur);
		 
		 if(profilModifie)   //On success, you can display a message to user on Home page
		 {
			 //je récupère la session créée dans ConnexionServlet
			 session.setAttribute("nom", utilisateur.getNom());
			 session.setAttribute("prenom", utilisateur.getPrenom());
			 session.setAttribute("pseudo", utilisateur.getPseudo());
			 session.setAttribute("mail", utilisateur.getMail());
			 session.setAttribute("entreprise", utilisateur.getEntreprise());
			 session.setAttribute("fonction", utilisateur.getFonction());			
			 request.getRequestDispatcher("/profilVue.jsp").forward(request, response);
		 }
		 else   //On Failure, display a meaningful message to the User.
		 {
		 request.getRequestDispatcher("/accueil.jsp").forward(request, response);
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
