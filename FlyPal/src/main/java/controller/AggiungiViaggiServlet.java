package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;

/**
 * Servlet implementation class AggiungiViaggiServlet
 */
@WebServlet("/AggiungiViaggiServlet")
public class AggiungiViaggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiViaggiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Method not allowed");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Utente u = (Utente) request.getSession().getAttribute("utente");
		System.out.println(request.getParameter("immagine"));
		System.out.println(request.getParameter("cittaPartenza"));
		System.out.println(request.getParameter("cittaArrivo"));
		System.out.println(request.getParameter("dataPartenza"));
		System.out.println(request.getParameter("dataArrivo"));
		System.out.println(request.getParameter("posti"));
		System.out.println(request.getParameter("prezzo"));
		
		if(u==null) {
			response.getWriter().append("You are not logged");
		}
		if(!u.isAdmin()) {
			response.getWriter().append("You can't access this page");
		}else{
			request.getSession().setAttribute("utente", u);
		    response.sendRedirect("dashboard"); 
		}
	}

}
