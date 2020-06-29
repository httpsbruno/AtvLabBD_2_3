package controle;

import java.sql.Date;
import dao.DAOException;
import dao.FaltasDAO;
import dao.FaltasDAOImpl;
import entidade.Faltas;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class FaltasControl {
	private ObservableList<Faltas> lista   = 
			FXCollections.observableArrayList();
	private ObservableList<Faltas> lista2   = 
			FXCollections.observableArrayList();
	private FaltasDAO fDAO = new FaltasDAOImpl();
	
	Faltas f = new Faltas();

	public void adicionar(ObservableList<Faltas> teste) throws DAOException {
		int tam = teste.size();
		for (int i = 0; i < tam; i++) {
			f.setAluno(teste.get(i).getAluno());
			f.setDisciplina(teste.get(i).getDisciplina());
			f.setData(teste.get(i).getData());
			f.setPresenca(teste.get(i).getPresenca());
		
			fDAO.insereFaltas(f);
		}
	}
	

	public ObservableList<Faltas> getLista(int codigo_disciplina, Date data) throws DAOException {
		lista.clear();
		lista.addAll(fDAO.listar(codigo_disciplina, data));
		return lista;
	}

	public ObservableList<Faltas> getDatas(int codigo_disciplina) throws DAOException {
		lista2.clear();
		lista2.addAll(fDAO.listardatas(codigo_disciplina));
		return lista2;
	}
}