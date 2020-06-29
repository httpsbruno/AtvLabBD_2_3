package fronteira;

import javax.swing.JOptionPane;

import controle.DisciplinaControl;
import controle.RelatorioFaltasController;
import entidade.Disciplina;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;

public class RFaltasView implements EventHandler<ActionEvent>, BoundaryContent {
	private ComboBox<Disciplina> cmbDisciplina = new ComboBox<Disciplina>();
	private Button btnRelatorio = new Button("Gerar Relatório");
	private BorderPane painelPrincipal;	
	private RelatorioFaltasController rc = new RelatorioFaltasController(); 
	private DisciplinaControl dc = new DisciplinaControl();
	private ObservableList<Disciplina> ld = dc.getLista();

	public RFaltasView() {
		GridPane painelCampos = new GridPane();
		painelPrincipal = new BorderPane();
		painelPrincipal.setStyle("-fx-padding: 10px");
		painelPrincipal.setCenter(painelCampos);
		
		cmbDisciplina.setItems(ld);
		cmbDisciplina.setMinWidth(400);
		cmbDisciplina.setOnAction(acionaBotao());
		
		btnRelatorio.setDisable(true);
		
		painelCampos.add(new Label("   Disciplina:   "), 0, 0);
		painelCampos.add(cmbDisciplina, 1, 0);
		painelCampos.add(new Label("     "), 2, 0);
		painelCampos.add(btnRelatorio, 3, 0);
		
		btnRelatorio.addEventHandler(ActionEvent.ANY, this);
	}
	
	private EventHandler<ActionEvent> acionaBotao() {
		EventHandler<ActionEvent> eventCombo = new EventHandler<ActionEvent>() { 
			public void handle(ActionEvent e) { 
        	  btnRelatorio.setDisable(false);
        	}
        }; 
		return eventCombo;
	}

	@Override
	public Pane gerarTela() {
		return painelPrincipal;
	}
	
	@Override
	public void handle(ActionEvent event) {
		if (event.getTarget() == btnRelatorio) {
			 rc.gerarRelatorio(cmbDisciplina.getValue().getCodigo(),
			cmbDisciplina.getValue().getSigla(),
			cmbDisciplina.getValue().getTurno());
			 JOptionPane.showMessageDialog(null,"Gereando relatório...");
		}
	}
}
