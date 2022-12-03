package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.LichSuLamBai;
import model.BEAN.User;
import model.BO.LichSuLamBaiBO;
/**
 * Servlet implementation class LichSuLamBaiServlet
 */
@WebServlet("/LichSuLamBaiServlet")
public class LichSuLamBaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LichSuLamBaiServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher rd = null;
		LichSuLamBaiBO lichSuLamBaiBO = new LichSuLamBaiBO();
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("username");
		ArrayList<LichSuLamBai> listKQ = lichSuLamBaiBO.getAllKq(user);
		request.setAttribute("listKQ", listKQ);
		rd = request.getRequestDispatcher("/lichsulambai.jsp");
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



