package controle;

import dao.DAOException;
import dao.NotasDAO;
import dao.NotasDAOImpl;
import entidade.Notas;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class NotasControl {
	private ObservableList<Notas> lista   = 
			FXCollections.observableArrayList();
	private ObservableList<Notas> lista2   = 
			FXCollections.observableArrayList();
	private NotasDAO nDAO = new NotasDAOImpl();

	Notas n = new Notas();
	public void adicionar(ObservableList<Notas> teste) throws DAOException {
		
		int tam = teste.size();
		for (int i = 0; i < tam; i++) {
			n.setAluno(teste.get(i).getAluno());
			n.setDisciplina(teste.get(i).getDisciplina());
			n.setAvaliacao(teste.get(i).getAvaliacao());
			n.setNota(teste.get(i).getNota());
		
			nDAO.insereNotas(n);
		}
	}
	

	public ObservableList<Notas> getLista(int codigo_disciplina, String prova) throws DAOException {
		lista.clear();
		lista.addAll(nDAO.listar(codigo_disciplina, prova));
		return lista;
	}

	public ObservableList<Notas> getProvas(int codigo_disciplina) throws DAOException {
		lista2.clear();
		lista2.addAll(nDAO.listarProvas(codigo_disciplina));
		return lista2;
	}
	
	
}
