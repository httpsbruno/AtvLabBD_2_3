package entidade;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Faltas {
	private Aluno aluno;        
	private Disciplina disciplina; 
	private Date data; 
	private String presenca;
	
	public Aluno getAluno() {
		return aluno;
	}
	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	public Disciplina getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(Disciplina disciplina) {
		this.disciplina = disciplina;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public String getPresenca() {
		return presenca;
	}
	public void setPresenca(String presenca) {
		this.presenca = presenca;
	}
	
	@Override
	public String toString() {
		SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
		String dataformatada = formatador.format(data);
		return dataformatada;
	}
}
