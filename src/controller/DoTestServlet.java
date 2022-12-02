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
		Timestamp submitTime = new Timestamp(System.currentTimeMillis());
		int IDTest = Integer.parseInt(request.getParameter("IDTest"));
		double Grade = 0.0; int count = 0;
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("username");
		List<History> listH = new ArrayList<>();
				
		String[] listCB = request.getParameterValues("cb");
		String[] listRD = request.getParameterValues("group");
		if(listCB != null) {
			for(int i = 0; i < listCB.length; i++) {
				System.out.println(listCB[i]);
				int IDAnswer = Integer.parseInt(listCB[i]);
				//Nếu là câu đúng thì tăng biến đếm...
				listH.add(new History(-1, IDAnswer));
				
			}
		}
		if(listRD != null) {
			for(int i = 0; i < listRD.length; i++) {
				System.out.println(listRD[i]);
				int IDAnswer = Integer.parseInt(listRD[i]);
				//Nếu là câu đúng thì tăng biến đếm...
				listH.add(new History(-1, IDAnswer));
			}
		}

		TestBO tb = new TestBO();
		int numberQuestion = tb.getTest(IDTest).getNumberQuestion();
		//Tính điểm...
		Result rs = new Result(-1, IDTest, Grade, submitTime, userName);
		tb.AddResult(rs, listH);
	}

}
