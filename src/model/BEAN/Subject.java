package model.BEAN;

public class Subject {
	private int IDSubject;
	public Subject(int IDSubject, String SubjectName) {
		this.IDSubject = IDSubject;
		this.SubjectName = SubjectName;
	}
	public int getIDSubject() {
		return IDSubject;
	}
	public void setIDSubject(int iDSubject) {
		IDSubject = iDSubject;
	}
	public String getSubjectName() {
		return SubjectName;
	}
	public void setSubjectName(String subjectName) {
		SubjectName = subjectName;
	}
	private String SubjectName;
	
}
