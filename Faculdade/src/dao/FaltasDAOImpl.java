package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entidade.Aluno;
import entidade.Disciplina;
import entidade.Faltas;


public class FaltasDAOImpl implements FaltasDAO{
	
	@Override
	public void insereFaltas(Faltas f) throws DAOException {
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "EXEC sp_inserirfaltas ?,?,?,?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, f.getAluno().getRa());
			ps.setInt(2, f.getDisciplina().getCodigo());
			ps.setDate(3, new Date(f.getData().getTime()));
			ps.setString(4, f.getPresenca());
		
			ps.execute();
			ps.close();
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
			//System.out.println(e.getMessage());
		}
		
	}

	@Override
	public List<Faltas> listar(int codigo_disciplina, Date data) throws DAOException{
		
		List<Faltas> listaFaltas = new ArrayList<Faltas>();
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "SELECT disciplina.codigo AS cd, disciplina.nome AS nd, disciplina.turno AS td, " + 
					"aluno.ra AS ra, aluno.nome AS na, faltas.data AS df, faltas.presenca AS pf " + 
					"FROM  disciplina INNER JOIN faltas " + 
					"ON disciplina.codigo = faltas.codigo_disciplina " + 
					"INNER JOIN aluno " + 
					"ON aluno.ra = faltas.ra_aluno " + 
					"WHERE disciplina.codigo = ? AND faltas.data = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, codigo_disciplina);
			ps.setDate(2, data);
			
			ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Disciplina d = new Disciplina();
					d.setCodigo(rs.getInt("cd"));
					d.setNome(rs.getString("nd"));
					d.setTurno(rs.getString("td"));
					
					Aluno a= new Aluno();
					a.setRa(rs.getInt("ra"));
					a.setNome(rs.getString("na"));
					
					Faltas f = new Faltas();
					f.setAluno(a);
					f.setDisciplina(d);
					f.setData(rs.getDate("df"));
					f.setPresenca(rs.getString("pf"));
			
					listaFaltas.add(f);
				}
		} catch (SQLException e) {
		
			e.printStackTrace();
		
		}
		return listaFaltas;
	}

	@Override
	public List<Faltas> listardatas(int codigo_disciplina) throws DAOException{

		List<Faltas> listaDatas = new ArrayList<Faltas>();
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "SELECT faltas.data AS df " + 
					"FROM  faltas INNER JOIN disciplina " + 
					"ON disciplina.codigo = faltas.codigo_disciplina " + 
					"WHERE disciplina.codigo = ? " +
					"GROUP BY faltas.data";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, codigo_disciplina);
			ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Faltas f = new Faltas();
					f.setData(rs.getDate("df"));
					listaDatas.add(f);
				}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return listaDatas;
	}

}
