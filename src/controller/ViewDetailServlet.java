package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.History;
import model.BEAN.Question;
import model.BEAN.Result;
import model.BO.TestBO;

@WebServlet("/ViewDetailServlet")
public class ViewDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int IDResult = Integer.parseInt(request.getParameter("IDResult"));
		TestBO tb = new TestBO();
		Result rs = tb.getResult(IDResult);
		request.setAttribute("rs", rs);
		request.setAttribute("listH", tb.getHistories(IDResult));
		request.setAttribute("Test", tb.getTest(rs.getIdTest()));
		List<Question> listQ = tb.getQuestions(rs.getIdTest());
		request.setAttribute("listQ", listQ);
		request.setAttribute("listA", tb.getAnswers(listQ));
		getServletContext().getRequestDispatcher("/ViewDetail.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getServletContext().getRequestDispatcher("ViewTestServlet").forward(request, response);
	}

}
