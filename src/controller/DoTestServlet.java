package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BEAN.History;
import model.BEAN.Question;
import model.BEAN.Result;
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
		Test testInfo  =tb.getTest(IDTest);
		Date date = new Date();
		Timestamp now = new Timestamp(date.getTime());
		
		request.setAttribute("Test", testInfo);
		request.setAttribute("Subject", tb.getSubject(testInfo.getIDSubject()));
		List<Question> listQ = tb.getQuestions(IDTest);
		request.setAttribute("listQ", listQ);
		request.setAttribute("listA", tb.getAnswers(listQ));
		if(testInfo.getDateTest().compareTo(now) > 0) {
			response.sendRedirect("lietkedethi?err=1");
		} else
			getServletContext().getRequestDispatcher("/DoTest.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rq = null;
		Timestamp submitTime = new Timestamp(System.currentTimeMillis());
		
		TestBO tb = new TestBO();
		int IDTest = Integer.parseInt(request.getParameter("IDTest"));
		request.setAttribute("Test", tb.getTest(IDTest));
		List<Question> listQ = tb.getQuestions(IDTest);
		
		double Grade = 0.0; int count = 0;double scd = 0;
		HttpSession session = request.getSession();
		String userName = (String)session.getAttribute("username");
		List<History> listH = new ArrayList<>();
	
		System.out.println(listQ.size());
		for(int i = 0;i < listQ.size() ;i++) {
			if(!listQ.get(i).isMultiChoice()) {
				listQ.get(i).getIdQuestion();
				int ctl = Integer.parseInt((String)request.getParameter("ra"+String.valueOf(listQ.get(i).getIdQuestion())));
				listH.add(new History(-1, ctl));
				if(1==tb.checkradio(ctl)) {
					scd +=1;
				}

			}
			else {
				
				int idqs= listQ.get(i).getIdQuestion();
				String[] myCheckBoxValue = request.getParameterValues("cb"+String.valueOf(listQ.get(i).getIdQuestion()));
				int soluong= tb.getSoLuong(idqs);
				double dung = 0;
				for(int x = 0;x<myCheckBoxValue.length;x++) {
					int ctl = Integer.parseInt(myCheckBoxValue[x]);
					listH.add(new History(-1, ctl));
					if (tb.checkcheckbox(ctl)==1) {
						dung +=(double)1/soluong;
					}
					else {
						dung -=(double)1/soluong;
					}
					
				}
				if (dung >0) {
				scd +=dung;
				}
			}
			
			
		}
		System.out.println(scd);
		Grade = scd/listQ.size()*10; 
		System.out.println(Grade);
		System.out.println("vao day");
		
		Result rs = new Result(-1, IDTest, Grade, submitTime, userName);
		Test test = tb.getTest(rs.getIdTest());
		String nametest = test.getTestName();
		tb.AddResult(rs, listH);
		request.setAttribute("nametest",nametest );
		request.setAttribute("rs", rs);
		//response.sendRedirect("LichSuLamBaiServlet");
		rq = request.getRequestDispatcher("/ketqua.jsp");
		rq.forward(request, response);

	}
}
