package fronteira;

import javax.swing.JOptionPane;

import controle.DisciplinaControl;
import controle.NotasControl;
import dao.DAOException;
import entidade.Disciplina;
import entidade.Notas;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.control.Label;
import javafx.scene.control.TableCell;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.GridPane;
import javafx.scene.layout.Pane;
import javafx.util.Callback;

public class NotasView implements EventHandler<ActionEvent>, BoundaryContent {
	private ComboBox<Disciplina> cmbDisciplina = new ComboBox<Disciplina>();
	private ComboBox<Notas> cmbProvas = new ComboBox<Notas>();
	private Button btnBuscarAlunos = new Button("Buscar Alunos");
	private Button btnSalvar = new Button("Salvar");
	private BorderPane painelPrincipal;
	
	private NotasControl control= new NotasControl(); 	
	private DisciplinaControl dc = new DisciplinaControl();
	private ObservableList<Disciplina> ld = dc.getLista();
	private ObservableList<Notas> obList;

	private TableView<Notas> table = new TableView<Notas>();
	private Callback<TableColumn<Notas, Double>, TableCell<Notas, Double>> cellFactory
            = (TableColumn<Notas, Double> param) -> new EditingNotas();
    
	public NotasView() {
		GridPane painelCampos = new GridPane();
		painelPrincipal = new BorderPane();
		painelPrincipal.setStyle("-fx-padding: 10px");
		painelPrincipal.setTop(painelCampos);
		painelPrincipal.setCenter(table);
		painelPrincipal.setBottom(btnSalvar);
		
		table.setPrefSize(400, 200);
		table.setEditable(true);
		
		cmbDisciplina.setItems(ld);
		cmbDisciplina.setMinWidth(400);
		cmbDisciplina.setOnAction(chamarNotas());
		
		cmbProvas.setMinWidth(100);
		cmbProvas.setDisable(true);
		cmbProvas.setOnAction(acionaBotao());
		
		btnBuscarAlunos.setDisable(true);
		btnSalvar.setDisable(true);
		
		painelCampos.add(new Label("Disciplina:  "), 0, 0);
		painelCampos.add(cmbDisciplina, 1, 0);
		painelCampos.add(new Label("    Prova:  "), 2, 0);
		painelCampos.add(cmbProvas, 3, 0);
		painelCampos.add(new Label("            "), 4, 0);
		painelCampos.add(btnBuscarAlunos, 5, 0);
		addTableColumns();
		
		btnBuscarAlunos.addEventHandler(ActionEvent.ANY, this);
		btnSalvar.addEventHandler(ActionEvent.ANY, this);
	}
	
	private EventHandler<ActionEvent> acionaBotao() {
		EventHandler<ActionEvent> eventCombo = new EventHandler<ActionEvent>() { 
			public void handle(ActionEvent e) { 
				btnBuscarAlunos.setDisable(false);
				btnSalvar.setDisable(false);
			}
		}; 
		return eventCombo;
	}
	
	private EventHandler<ActionEvent> chamarNotas() {
		EventHandler<ActionEvent> eventCombo = new EventHandler<ActionEvent>() { 
			public void handle(ActionEvent e) { 
				try {
					cmbProvas.setDisable(false);
					ObservableList<Notas> ln = control.getProvas(cmbDisciplina.getValue().getCodigo());
					cmbProvas.setItems(ln);
				} catch (DAOException e1) {
					JOptionPane.showMessageDialog(null, e1.getMessage());
				}
          	
			} 
		}; 
		return eventCombo;
	}

	@SuppressWarnings("unchecked")
	public void addTableColumns() { 
		TableColumn<Notas, String> colunaAluno = new TableColumn<>("Aluno");
		colunaAluno.setCellValueFactory(new PropertyValueFactory<Notas, String>("aluno"));
		colunaAluno.setPrefWidth(300);
		
		TableColumn<Notas, Double> colunaNota = new TableColumn<>("Nota");
		colunaNota.setMinWidth(100);
		colunaNota.setCellValueFactory(new PropertyValueFactory<Notas, Double>("nota"));
		colunaNota.setCellFactory(cellFactory);
		colunaNota.setOnEditCommit((TableColumn.CellEditEvent<Notas, Double> t) -> {
	        	t.getTableView().getItems().get(t.getTablePosition().getRow()).setNota(t.getNewValue());
	     });
	
		table.getColumns().addAll(colunaAluno,colunaNota);
	}
	

	public void responsividadeLista() {
		try {
			
			table.setItems(control.getLista(cmbDisciplina.getValue().getCodigo(), cmbProvas.getValue().getAvaliacao().getTipo()));
		} catch (DAOException e) {
			JOptionPane.showMessageDialog(null, e.getMessage());
		}
	}
	
	@Override
	public Pane gerarTela() {
		return painelPrincipal;
	}

	@Override
	public void handle(ActionEvent event) {
		if (event.getTarget() == btnBuscarAlunos) {
			responsividadeLista();
		}
		
		if (event.getTarget() == btnSalvar) {
			obList = table.getItems();
			try {
				control.adicionar(obList);
				JOptionPane.showMessageDialog(null,"Salvo com sucesso!");
			} catch (DAOException e1) {
				JOptionPane.showMessageDialog(null, e1.getMessage());
			}
			
		}
	}
}
