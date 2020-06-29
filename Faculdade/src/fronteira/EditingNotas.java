package fronteira;

import entidade.Notas;
import javafx.beans.value.ObservableValue;
import javafx.scene.control.TableCell;
import javafx.scene.control.TextField;

public class EditingNotas extends TableCell<Notas, Double>{

    private TextField textField;

    @Override
    public void startEdit() {
        if (!isEmpty()) {
            super.startEdit();
            createTextField();
            setText(null);
            setGraphic(textField);
            textField.selectAll();
        }
    }

    @Override
    public void cancelEdit() {
        super.cancelEdit();
        setText(String.valueOf(getItem()));
        setGraphic(null);
    }

    @Override
    public void updateItem(Double item, boolean empty) {
        super.updateItem(item, empty);

        if (empty) {
            setText("");
            setGraphic(null);
        } else {
            if (isEditing()) {
                if (textField != null) {
                    textField.setText("");
                }
                setText("");
                setGraphic(textField);
            } else {
                setText(getString());
                setGraphic(null);
            }
        }
    }
    private void createTextField() {
        textField = new TextField(getString());
        textField.setMinWidth(this.getWidth() - this.getGraphicTextGap() * 2);
        textField.setOnAction((e) -> commitEdit(Double.parseDouble(textField.getText())));
        textField.focusedProperty().addListener((ObservableValue<? extends Boolean> observable, Boolean oldValue, Boolean newValue) -> {
            if (!newValue) {
                if(textField.getText() != null) {
            	commitEdit(Double.parseDouble(textField.getText()));
                }
               }
        });
    }

    private String getString() {
        return getItem().toString() == null ? "" : getItem().toString();
    }
}