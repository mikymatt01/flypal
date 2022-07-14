package controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import model.ViaggioDAO;

/**
 * Servlet implementation class EliminaViaggiServlet
 */
@WebServlet("/EliminaViaggiServlet")
public class EliminaViaggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EliminaViaggiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	   ServletContext scontext=getServletContext();
	
	   //fetching values of initialization parameters and printing it
		String appPath =scontext.getInitParameter("appPath");
		Utente u = (Utente) request.getSession().getAttribute("utente");
		String id =request.getParameter("id");
		String url =request.getParameter("url");
		String name = appPath + "\\" + url.substring(url.indexOf("image"));
		if(u!= null && id!=null) {
			File deleteFile = new File(name);
			if(deleteFile.exists())
				deleteFile.delete();
			new ViaggioDAO().delete(u.getUsername(),Integer.parseInt(id));
		}
		response.sendRedirect("DashboardServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
