package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BEAN.Test;
import model.BEAN.Question;
import model.BEAN.Answer;

import model.BO.TestBO;

@WebServlet("/CreateTestServlet")
public class CreateTestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateTestServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("err") != null) {
			String msg = "Xảy ra lỗi khi tạo đề!";
			request.setAttribute("err", msg);
		}
		else if (request.getParameter("success") != null) {
			String msg = "Tạo đề thành công!";
			request.setAttribute("success", msg);
		}

		request.setAttribute("listS", new TestBO().getSubjects());
		getServletContext().getRequestDispatcher("/CreateTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("UTF-8");
			int numberQuestion = Integer.parseInt(request.getParameter("numberQues")); 
			int timeInMinutes = Integer.parseInt(request.getParameter("timeInMininutes"));		
	
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			Timestamp dateTest = new Timestamp(formatter.parse(request.getParameter("dateTest")).getTime());
			
			String TestName = request.getParameter("testName");
			int IDSubject = Integer.parseInt(request.getParameter("subjectTest"));
			
			Test test = new Test(-1, numberQuestion, timeInMinutes, dateTest, TestName, IDSubject);
			List<Question> listQ = new ArrayList<Question>(numberQuestion);
			List<Answer> listA = new ArrayList<>();
			
			String[] multiChoice = request.getParameterValues("cb");				//get list Checkbox multiple choice
			int h = 0;

			for(int i = 1; i <= numberQuestion; i++) {
				String[] statement = request.getParameterValues("txt" + i); 
				
				if(multiChoice != null && h < multiChoice.length && Integer.parseInt(multiChoice[h]) == i) {							//check whether this question have multiple choices
					h++;					
					listQ.add(new Question(i, -1, statement[0], true));
					
					String[] correctAns = request.getParameterValues("cb"+i);	//get list correct answer of this question
					int k = 0;
					
					for(int j = 1; j < statement.length; j++) {
						boolean correct = false;
						if(k < correctAns.length && Integer.parseInt(correctAns[k]) == j) {
							correct = true; k++;
						}
						
						listA.add(new Answer(-1, i, statement[j], correct));
					}
				}
				else {
//					System.out.println(test.toString());
					listQ.add(new Question(i, -1, statement[0], false));
//					System.out.println(listQ.get(i-1).toString());
					
					String correctAns = request.getParameter("group"+i);		//get the correct answer of this question
					for(int j = 1; j < statement.length; j++) {
						boolean correct = false;
						if(Integer.parseInt(correctAns) == j) {
							correct = true;
						}
						
						listA.add(new Answer(-1, i, statement[j], correct));
//						System.out.println(listA.get(t++).toString());
					}
				}
			}
			
			TestBO tb = new TestBO();
			boolean rs = tb.AddTest(test, listQ, listA);
//			if(rs) response.sendRedirect("CreateTestServlet?success=1");
//			else response.sendRedirect("CreateTestServlet?err=1");
			response.sendRedirect("lietkedethi");
		}catch(ParseException e) {
			
		}
	}
	
//	DateFormat formatter = new SimpleDateFormat("HH 'giờ' mm 'phút'");

}
