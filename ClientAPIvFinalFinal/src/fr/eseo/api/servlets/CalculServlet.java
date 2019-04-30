package fr.eseo.api.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CalculServlet
 */
@WebServlet("/CalculServlet")
public class CalculServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalculServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		double lat1Double = Double.parseDouble(request.getParameter("lat1"));
		double lng1Double = Double.parseDouble(request.getParameter("lng1"));
		double lat2Double = Double.parseDouble(request.getParameter("lat2"));
		double lng2Double = Double.parseDouble(request.getParameter("lng2"));

		// Formule ok ?
		double distance = Math.acos(Math.sin(lat1Double) * Math.sin(lat2Double)
				+ Math.cos(lat1Double) * Math.cos(lat2Double) * Math.cos(lng2Double - lng1Double)) * 6371;

		RequestDispatcher dispat = request.getRequestDispatcher("affichageDistance.jsp");
		HttpSession session = request.getSession();
		session.setAttribute("distance", distance);
		dispat.forward(request, response);
	}
}


