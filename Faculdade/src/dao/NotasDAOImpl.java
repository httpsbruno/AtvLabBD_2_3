package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entidade.Aluno;
import entidade.Avaliacao;
import entidade.Disciplina;
import entidade.Notas;

public class NotasDAOImpl implements NotasDAO {

	@Override
	public void insereNotas(Notas n) throws DAOException {
		try {
			Connection con = DBUtils.getInstance().getConnection();
			//String sql = "sp_inserirnota(ra,codigo_disciplina, codigo_avaliacao, nota)";
			String sql = "EXEC sp_inserirnota ?,?,?,? ";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setLong(1, n.getAluno().getRa());
			ps.setInt(2, n.getDisciplina().getCodigo());
			ps.setInt(3, n.getAvaliacao().getCodigo());
			ps.setDouble(4, n.getNota());
		
			ps.execute();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Notas> listar(int codigo_disciplina,String prova) throws DAOException{
		List<Notas> listaNotas = new ArrayList<Notas>();
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "SELECT disciplina.codigo AS cd, disciplina.nome AS nd, disciplina.turno AS td, " + 
					"aluno.ra AS ra, aluno.nome AS na, avaliacao.codigo AS ca, avaliacao.tipo AS ta, notas.nota AS n " + 
					"FROM  disciplina INNER JOIN notas " + 
					"ON disciplina.codigo = notas.codigo_disciplina " + 
					"INNER JOIN aluno " + 
					"ON aluno.ra = notas.ra_aluno " + 
					"INNER JOIN avaliacao " + 
					"ON avaliacao.codigo = notas.codigo_avaliacao " + 
					"WHERE disciplina.codigo = ? AND avaliacao.tipo = ? ";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, codigo_disciplina);
			ps.setString(2, prova);
			ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Disciplina d = new Disciplina();
					d.setCodigo(rs.getInt("cd"));
					d.setNome(rs.getString("nd"));
					d.setTurno(rs.getString("td"));
					
					Aluno a= new Aluno();
					a.setRa(rs.getInt("ra"));
					a.setNome(rs.getString("na"));
					
					Avaliacao av  = new Avaliacao();
					av.setCodigo(rs.getInt("ca"));
					av.setTipo(rs.getString("ta"));
					
					Notas n = new Notas();
					n.setAluno(a);
					n.setDisciplina(d);
					n.setAvaliacao(av);
					n.setNota(rs.getDouble("n"));
					
					listaNotas.add(n);
				}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return listaNotas;
	}



	@Override
	public List<Notas> listarProvas(int codigo_disciplina) throws DAOException{

		List<Notas> listaProvas = new ArrayList<Notas>();
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "SELECT avaliacao.codigo AS ca,avaliacao.tipo AS ta " + 
					"FROM  notas INNER JOIN disciplina " + 
					"ON disciplina.codigo = notas.codigo_disciplina " + 
					"INNER JOIN avaliacao " + 
					"ON avaliacao.codigo = notas.codigo_avaliacao " + 
					"WHERE disciplina.codigo = ? " + 
					"GROUP BY avaliacao.codigo, avaliacao.tipo";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, codigo_disciplina);
			ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Avaliacao a = new Avaliacao();
					
					a.setCodigo(rs.getInt("ca"));
					a.setTipo(rs.getString("ta"));
					
					Notas n = new Notas();
					n.setAvaliacao(a);
					
					listaProvas.add(n);
				}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return listaProvas;
	}

}
