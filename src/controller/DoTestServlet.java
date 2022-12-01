package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BEAN.Question;
import model.BEAN.Test;
import model.BO.TestBO;

@WebServlet("/DoTestServlet")
public class DoTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DoTestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int IDTest = Integer.parseInt(request.getParameter("IDTest"));
		TestBO tb = new TestBO();
		request.setAttribute("Test", tb.getTest(IDTest));
		List<Question> listQ = tb.getQuestions(IDTest);
		request.setAttribute("listQ", listQ);
		request.setAttribute("listA", tb.getAnswers(listQ));
		getServletContext().getRequestDispatcher("/DoTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("IDTest"));
	}

}
