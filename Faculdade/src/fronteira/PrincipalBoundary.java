package fronteira;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.BorderPane;
import javafx.stage.Stage;

public class PrincipalBoundary extends Application implements EventHandler<ActionEvent>{
	private MenuBar barraMenu = new MenuBar();
	private Menu mnuFaltas = new Menu("Faltas");
	private Menu mnuNotas= new Menu("Notas");
	private Menu mnuRelatorio = new Menu("Relatório");
	
	private MenuItem mnuIFaltas = new MenuItem("Inserir Faltas");
	private MenuItem mnuINotas = new MenuItem("Inserir Notas");
	private MenuItem mnuRFaltas = new MenuItem("Relatório de Faltas");
	private MenuItem mnuRNotas = new MenuItem("Relatório de Notas");
	
	private BorderPane panPrincipal = new BorderPane();
	private Map<MenuItem, BoundaryContent> telas = new HashMap<>();

	@Override
	public void start(Stage stage) throws Exception {
		panPrincipal.setTop(generateMenus());
		Scene scn = new Scene(panPrincipal, 800, 600);
		panPrincipal.setStyle("-fx-padding: 10px");
		panPrincipal.setTop(barraMenu);
		stage.setScene(scn);
		stage.setTitle("Faculdade");
		stage.show();
	}
	
	public MenuBar  generateMenus() { 
		barraMenu.getMenus().addAll(mnuFaltas, mnuNotas,mnuRelatorio);
		
		mnuFaltas.getItems().add(mnuIFaltas);
		mnuNotas.getItems().add(mnuINotas);
		mnuRelatorio.getItems().addAll(mnuRFaltas,mnuRNotas);
		
		//colocando cor - css
		Group root = new Group();
		barraMenu.setStyle("-fx-background-color:linear-gradiente(lightblue,aliceblue);"
				+ "-fx-font-size:15px;;"
				+ "-fx-border-color:lightblue;");
		root.getChildren().add(barraMenu);
		
		telas.put(mnuIFaltas, new FaltasView());
		telas.put(mnuINotas, new NotasView());
		telas.put(mnuRFaltas, new RFaltasView());
		telas.put(mnuRNotas, new RNotasView());
	
		
		Set<MenuItem> opcoes = telas.keySet();
		for(MenuItem menu : opcoes) { 
			menu.addEventHandler(ActionEvent.ANY, this);
		}
		return barraMenu;
	}

	public static void main(String[] args) {
		launch(PrincipalBoundary.class, args);
	}

	@Override
	public void handle(ActionEvent event) {
		BoundaryContent tela = telas.get(event.getTarget());
		if (telas != null) { 
			panPrincipal.setCenter(tela.gerarTela());
		}				
	}

}