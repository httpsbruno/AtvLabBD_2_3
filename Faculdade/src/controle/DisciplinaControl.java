package controle;

import dao.DisciplinaDAO;
import dao.DisciplinaDAOImpl;
import entidade.Disciplina;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

public class DisciplinaControl {
	private ObservableList<Disciplina> lista   = 
			FXCollections.observableArrayList();
	
	private DisciplinaDAO dDAO = new DisciplinaDAOImpl();
	
	public ObservableList<Disciplina> getLista() {
		lista.clear();
		lista.addAll(dDAO.listar());
		return lista;
	}

	
}
