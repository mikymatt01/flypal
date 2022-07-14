package controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Utente;
import model.Viaggio;
import model.ViaggioDAO;
/**
 * Servlet implementation class AggiungiViaggiServlet
 */
@WebServlet("/AggiungiViaggiServlet")
@MultipartConfig(
        fileSizeThreshold   = 1024 * 1024 *2,
        maxFileSize         = 1024 * 1024 *10,
        maxRequestSize      = 1024 * 1024 *50
)
public class AggiungiViaggiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "image";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiViaggiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public String saveImage(HttpServletRequest request) throws IOException, ServletException {
       // gets absolute path of the web application
       ServletContext scontext=getServletContext();

	   //fetching values of initialization parameters and printing it
		String appPath = scontext.getInitParameter("appPath");
		String savePath = scontext.getInitParameter("savePath");


	   File fileSaveDir = new File(savePath);
	   if (!fileSaveDir.exists()) {
	       fileSaveDir.mkdir();
	   }
	   String url = "http:" + File.separator + File.separator + request.getServerName() + ":" + request.getServerPort() + File.separator + request.getContextPath().substring(1) + savePath;
	   for (Part part : request.getParts()) {
		   if( part.getContentType() != null && part.getContentType().equals("image/jpeg")) {
			   String random = UUID.randomUUID().toString();
			   String fileName = random + ".jpeg";
		       part.write(appPath + savePath + File.separator + fileName);
		       url = url + fileName;
	   }else if( part.getContentType() != null && part.getContentType().equals("image/png")) {
			   String random = UUID.randomUUID().toString();
			   String fileName = random + ".png";
	           part.write(appPath + savePath + File.separator + fileName);
	           url = url + fileName;
		   }
	   }
	   return url;
	}
	
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
		
		

		if(u==null) {
			response.getWriter().append("You are not logged");
		}
		if(!u.isAdmin()) {
			response.getWriter().append("You can't access this page");
		}else{
			String url=saveImage(request);

			System.out.print(u.getUsername());
			Viaggio v = new Viaggio(
				u.getUsername(),
				request.getParameter("cittaPartenza"),
				request.getParameter("cittaArrivo"),
				request.getParameter("dataPartenza"),
				request.getParameter("dataArrivo"),
				request.getParameter("scadenza"),
				0,
				Integer.parseInt(request.getParameter("posti")),
				Float.parseFloat(request.getParameter("prezzo")),
				request.getParameter("descrizione"),
				url
			);
			
			boolean result = new ViaggioDAO().doSave(v);

			request.getSession().setAttribute("utente", u);
		    response.sendRedirect("DashboardServlet"); 
		}
	}

}
