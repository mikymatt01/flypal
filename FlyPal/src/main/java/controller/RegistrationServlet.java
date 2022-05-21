package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Utente;

@WebServlet(name="Registrazione", urlPatterns="/Registrazione")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegistrationServlet() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("Password");
		int admin;
		if(request.getParameter("admin").equals(""))
			admin = 0;
		else
			admin = Integer.parseInt(request.getParameter("admin"));
		Utente u = new Utente(username,email,admin);
		u.setHashPassword(password);
		
		request.getSession().setAttribute("utente", u);
		HttpSession session= request.getSession();
	    session.setAttribute("utente",u);
	    response.sendRedirect("/FlyPal/jsp/Home.jsp");
	}
}
