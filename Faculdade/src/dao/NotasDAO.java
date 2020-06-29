package dao;

import java.util.List;
import entidade.Notas;

public interface NotasDAO {
	void insereNotas(Notas n) throws DAOException;
	
	List<Notas> listar(int codigo_disciplina, String prova) throws DAOException;
	List<Notas> listarProvas(int codigo_disciplina) throws DAOException;
}
