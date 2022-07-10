package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.StringFilter;
import model.Utente;
import model.UtenteDAO;
/*
 * 		name = "Registrazione",
		urlPatterns = {
 * */
@WebServlet("/registrationServlet")

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email1");
		String password1 = request.getParameter("Password1");
		String password2 = request.getParameter("Password2");
		int admin;
		
		if(request.getParameter("admin")==null) {		//creare profiloDAO
			admin = 0;
		}
		else
			admin = 1;
		Utente u = new Utente(username,email,admin);	//creare agenziaDAO
		if(password1.equals(password2))
			u.setHashPassword(password1);
		
		UtenteDAO newUser = new UtenteDAO();
		if(!newUser.doSave(u))
			response.sendRedirect("Home.jsp");
		else{
			request.getSession().setAttribute("utente", u);
			HttpSession session= request.getSession();
		    session.setAttribute("utente",u);
		    response.sendRedirect("Home.jsp"); // redirect al profilo da modificare
		}
	}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);// redirect al profilo da modificare
}
}