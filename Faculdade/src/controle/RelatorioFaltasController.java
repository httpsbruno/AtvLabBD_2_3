package controle;

import java.awt.Desktop;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.swing.JOptionPane;
import dao.DBUtils;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

public class RelatorioFaltasController {
	public void gerarRelatorio(int codigo, String sigla, String turno) {
		String erro="";
		String codigo_disciplina = String.valueOf(codigo);
		String jasper = "C:\\Users\\Bruno Barbosa\\Desktop\\Relatorios\\RelatorioFaltas.jasper";
	
		HashMap<String,Object> param = new HashMap<String,Object>();
		param.put("CODIGO_DISCIPLINA", codigo_disciplina);
		
		byte[] bytes = null;
		
		try {
			JasperReport relatorio = (JasperReport) JRLoader.loadObjectFromFile(jasper);
			Connection con = DBUtils.getInstance().getConnection();
			
			bytes = JasperRunManager.runReportToPdf(relatorio, param,con);
			
			//onde vou salvar
			File file = new File("C:\\Users\\Bruno Barbosa\\Desktop\\Relatorios", sigla +"-"+ turno + "-Faltas.pdf");
			if(file.exists()) {
				file.delete();
			}
			
			FileOutputStream fos = new FileOutputStream(file);
			fos.write(bytes);
			fos.flush();
			fos.close();
			
			Desktop desk = Desktop.getDesktop();
			desk.open(file);
		
		} catch (JRException | IOException | SQLException e) {
			erro = e.getMessage();
			JOptionPane.showMessageDialog(null, erro);
		}
	}
		
	
}