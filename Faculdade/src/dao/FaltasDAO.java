package dao;

import java.sql.Date;
import java.util.List;
import entidade.Faltas;

public interface FaltasDAO {
	void insereFaltas(Faltas f) throws DAOException; 
	
	List<Faltas> listar(int codigo_disciplina, Date data) throws DAOException;
	List<Faltas> listardatas(int codigo_disciplina) throws DAOException;
}
