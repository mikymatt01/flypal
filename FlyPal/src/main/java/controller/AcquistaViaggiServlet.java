package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import model.ViaggioDAO;

/**
 * Servlet implementation class AcquistaViaggiServlet
 */
@WebServlet("/AcquistaViaggiServlet")
public class AcquistaViaggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcquistaViaggiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViaggioDAO dao = new ViaggioDAO();
		ArrayList<String> values= new ArrayList<String>();
		String[] params;
		String username= ((Utente)request.getSession().getAttribute("utente")).getUsername();
		String line = request.getReader().readLine();
		if(line!=null) {
			params=line.split("&");
			for(int i=0; i<params.length;i++) {
				values.add(params[i].split("=")[1]);
			}
			dao.addCart(Integer.parseInt(values.get(0)), username, 1, (values.get(1).equals("true"))?1:0);
		}else {
			values.add(request.getParameter("id"));
			values.add(request.getParameter("value"));
			dao.buyCart(Integer.parseInt(values.get(0)), username);
			response.sendRedirect("CarrelloServlet"); 
		} 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
