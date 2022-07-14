package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Utente;
import model.Viaggio;
import model.ViaggioDAO;

/**
 * Servlet implementation class CarrelloServlet
 */
@WebServlet("/CarrelloServlet")
public class CarrelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CarrelloServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ViaggioDAO v= new ViaggioDAO();
		
		Utente u = (Utente)request.getSession().getAttribute("utente");

		String pagato=(String)request.getParameter("pagato");
		ArrayList<Viaggio> lv;
		System.out.print(pagato);
		if(pagato!=null && Integer.parseInt(pagato)==1) {
			lv = v.selectCart(u.getUsername(), 1);
			request.setAttribute("pagato", pagato);
		}
		else {
			lv = v.selectCart(u.getUsername(), 0);
			request.setAttribute("pagato", pagato);
		}
		for(Viaggio viaggio: lv) {
			System.out.println(viaggio.getId());
		}
		request.setAttribute("viaggi", lv);
		RequestDispatcher rd=request.getRequestDispatcher("/carrello");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
