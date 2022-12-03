
package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.History;
import model.BEAN.LichSuLamBai;
import model.BEAN.Question;
import model.BEAN.Result;
import model.BEAN.ViewTest;
import model.BO.LichSuLamBaiBO;
import model.BO.TestBO;
import model.BO.ViewTestBO;

@WebServlet("/ViewTestServlet")
public class ViewTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewTestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int IDTest = Integer.parseInt(request.getParameter("IDTest"));
		ViewTestBO tb = new ViewTestBO();
		
		ArrayList<ViewTest> listKQ = tb.getAllSVByID(IDTest);
		request.setAttribute("listKQ", listKQ);
		getServletContext().getRequestDispatcher("/ViewTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ViewTestBO tb = new ViewTestBO();
		int IDTest = Integer.parseInt(request.getParameter("IDTest"));
		ArrayList<ViewTest> listKQ = tb.getAllSVByID(IDTest);
		request.setAttribute("listKQ", listKQ);
		
	}

}
