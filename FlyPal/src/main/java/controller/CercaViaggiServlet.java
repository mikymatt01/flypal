package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Viaggio;
import model.ViaggioDAO;

/**
 * Servlet implementation class LeggiViaggiServlet
 */
@WebServlet("/CercaViaggiServlet")
public class CercaViaggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CercaViaggiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String partenza = request.getParameter("partenza");
		String arrivo = request.getParameter("arrivo");
		ArrayList<Viaggio> list = new ViaggioDAO().search(partenza, arrivo);
		request.setAttribute("viaggi", list);
		RequestDispatcher rd;
		rd=request.getRequestDispatcher("/cerca");
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
