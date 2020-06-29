package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entidade.Disciplina;


public class DisciplinaDAOImpl implements DisciplinaDAO {

	@Override
	public List<Disciplina> listar() {
		List<Disciplina> listaDisciplina = new ArrayList<Disciplina>();
		try {
			Connection con = DBUtils.getInstance().getConnection();
			String sql = "SELECT * FROM disciplina";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					Disciplina d = new Disciplina();
					d.setCodigo(rs.getInt("codigo"));
					d.setNome(rs.getString("nome"));
					d.setSigla(rs.getString("sigla"));
					d.setTurno(rs.getString("turno"));
					d.setNum_aulas(rs.getInt("num_aulas"));
					
					
					listaDisciplina.add(d);
				}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return listaDisciplina;
	}
	
}
