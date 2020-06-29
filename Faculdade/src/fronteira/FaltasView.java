package fronteira;

import javax.swing.JOptionPane;

import controle.DisciplinaControl;
import controle.FaltasControl;
import dao.DAOException;
import entidade.Disciplina;
import entidade.Faltas;
import javafx.beans.property.ReadOnlyStringWrapper;
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

public class FaltasView implements EventHandler<ActionEvent>, BoundaryContent {
	private ComboBox<Disciplina> cmbDisciplina = new ComboBox<Disciplina>();
	private ComboBox<Faltas> cmbDatas = new ComboBox<Faltas>();
	private Button btnBuscarAlunos = new Button("Buscar Alunos");
	private Button btnSalvar = new Button("Salvar");
	private BorderPane painelPrincipal;

	private FaltasControl control= new FaltasControl(); 
	private DisciplinaControl dc = new DisciplinaControl();
	private ObservableList<Disciplina> ld = dc.getLista();
	private ObservableList<Faltas> lf = null;
	private ObservableList<Faltas> obList;
	
	private TableView<Faltas> table = new TableView<Faltas>();
	private Callback<TableColumn<Faltas, String>, TableCell<Faltas, String>> cellFactory
    		= (TableColumn<Faltas, String> param) -> new EditingFaltas();
	
	
	public FaltasView() {
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
		cmbDisciplina.setOnAction(chamarDatas());
		
		cmbDatas.setMinWidth(100);
		cmbDatas.setDisable(true);
		cmbDatas.setOnAction(acionaBotao());
		
		btnBuscarAlunos.setDisable(true);
		btnSalvar.setDisable(true);
		
		painelCampos.add(new Label("Disciplina:  "), 0, 0);
		painelCampos.add(cmbDisciplina, 1, 0);
		painelCampos.add(new Label("    Data:  "), 2, 0);
		painelCampos.add(cmbDatas, 3, 0);
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

	private EventHandler<ActionEvent> chamarDatas() {
		EventHandler<ActionEvent> eventCombo = new EventHandler<ActionEvent>() { 
			public void handle(ActionEvent e){ 
				try {
					cmbDatas.setDisable(false);
					lf = control.getDatas(cmbDisciplina.getValue().getCodigo());
				} catch (DAOException e1) {
					JOptionPane.showMessageDialog(null, e1.getMessage());
				}
				cmbDatas.setItems(lf);
			} 
		}; 
		return eventCombo;
	}

	@SuppressWarnings("unchecked")
	public void addTableColumns() { 
		TableColumn<Faltas, String> colunaRa = new TableColumn<>("R.A.");
		colunaRa.setCellValueFactory(itemData -> new ReadOnlyStringWrapper(String.valueOf(itemData.getValue().getAluno().getRa())));
		colunaRa.setPrefWidth(200);
		
		TableColumn<Faltas, String> colunaAluno = new TableColumn<>("Aluno");
		colunaAluno.setCellValueFactory(itemData -> new ReadOnlyStringWrapper(itemData.getValue().getAluno().toString()));
		colunaAluno.setPrefWidth(300);
		
		 TableColumn<Faltas, String> colunaPresenca = new TableColumn<>("Presença");
		 colunaPresenca.setCellValueFactory(new PropertyValueFactory<Faltas, String>("presenca"));
		 colunaPresenca.setCellFactory(cellFactory);
		 colunaPresenca.setOnEditCommit( (TableColumn.CellEditEvent<Faltas, String> t) -> {
	                	((Faltas) t.getTableView().getItems()
	                    .get(t.getTablePosition().getRow()))
	                    .setPresenca(t.getNewValue());
	     });
		 colunaPresenca.setMinWidth(100);
		 
		table.getColumns().addAll(colunaRa,colunaAluno,colunaPresenca);
	}
	
	public void responsividadeLista() {
		try {
			table.setItems(control.getLista(cmbDisciplina.getValue().getCodigo(), cmbDatas.getValue().getData()));
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
				JOptionPane.showMessageDialog(null,e1.getMessage());
			}	
		}
	}
}
