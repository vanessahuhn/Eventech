package controleur;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LogoutServlet")
public class DeconnexionServlet extends HttpServlet
{
private static final long serialVersionUID = 1L;
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
{
HttpSession session = request.getSession(false); //Fetch session object
if(session!=null) //If session is not null
{
session.invalidate(); //removes all session attributes bound to the session
request.setAttribute("errMessage", "Vous êtes déconnecté.e.");
RequestDispatcher requestDispatcher = request.getRequestDispatcher("/connexionVue.jsp");
requestDispatcher.forward(request, response);
System.out.println("Logged out");
}
}
}