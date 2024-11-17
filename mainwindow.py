from PySide6.QtWidgets import QApplication, QMainWindow, QLabel, QComboBox, QPlainTextEdit, QPushButton, QVBoxLayout, QWidget
from PySide6.QtGui import QFont

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()

        # Set up window properties
        self.setGeometry(0, 0, 474, 306)
        self.setWindowTitle("MainWindow")

        # Central widget container
        central_widget = QWidget(self)
        self.setCentralWidget(central_widget)

        # Set up layout for central widget
        layout = QVBoxLayout(central_widget)

        # Create and position all widgets in the main window
        self.label_opcode = QLabel("Opcode:", self)
        self.label_opcode.setGeometry(9, 9, 49, 16)
        
        self.opcode_combo = QComboBox(self)
        self.opcode_combo.setGeometry(70, 10, 101, 21)
        self.opcode_combo.addItem("Opcode")  # Only one option

        self.label_funct = QLabel("Funct:", self)
        self.label_funct.setGeometry(10, 40, 49, 16)
        
        self.funct_text = QPlainTextEdit(self)
        self.funct_text.setGeometry(70, 40, 111, 16)
        
        # Set smaller font for funct text
        font = QFont()
        font.setPointSize(8)  # Set font size smaller by 6px (default is 14px)
        self.funct_text.setFont(font)

        self.label_rs = QLabel("RS", self)
        self.label_rs.setGeometry(20, 70, 49, 16)
        
        self.rs_text = QPlainTextEdit(self)
        self.rs_text.setGeometry(70, 70, 111, 16)
        
        # Set smaller font for RS text
        self.rs_text.setFont(font)

        self.label_rt = QLabel("RT:", self)
        self.label_rt.setGeometry(20, 130, 49, 16)
        
        self.rt_text = QPlainTextEdit(self)
        self.rt_text.setGeometry(70, 130, 101, 16)
        
        # Set smaller font for RT text
        self.rt_text.setFont(font)

        self.label_operation = QLabel("Operacion:", self)
        self.label_operation.setGeometry(10, 100, 61, 16)
        
        # Operation ComboBox with additional options
        self.operation_combo = QComboBox(self)
        self.operation_combo.setGeometry(80, 100, 68, 21)
        self.operation_combo.addItems(["+", "-", "x", "AND", "OR"])  # Adding new options

        self.result_label = QLabel("Resultado:", self)
        self.result_label.setGeometry(210, 10, 71, 16)

        self.consola_log = QPlainTextEdit(self)
        self.consola_log.setGeometry(210, 30, 251, 211)

        self.convertir_button = QPushButton("Convertir 😊", self)
        self.convertir_button.setGeometry(60, 170, 91, 24)
        self.convertir_button.clicked.connect(self.convertir)

        self.limpiar_consola_button = QPushButton("Limpiar Consola 😍", self)
        self.limpiar_consola_button.setGeometry(280, 250, 131, 24)

        self.borrar_button = QPushButton("Borrar 🙌", self)
        self.borrar_button.setGeometry(60, 200, 91, 24)

        # List to store conversions
        self.conversions = []

        # Set layout manager
        central_widget.setLayout(layout)

        # Show the main window
        self.show()

    def convertir(self):
        # Get current values from input fields
        opcode = self.opcode_combo.currentText()
        funct = self.funct_text.toPlainText()
        rs = self.rs_text.toPlainText()
        rt = self.rt_text.toPlainText()
        operation = self.operation_combo.currentText()

        # Convert inputs into a dictionary and add to the list
        conversion = {
            "opcode": opcode,
            "funct": funct,
            "rs": int(rs) if rs.isdigit() else 0,  # Default to 0 if invalid input
            "rt": int(rt) if rt.isdigit() else 0,  # Default to 0 if invalid input
            "operation": operation
        }
        self.conversions.append(conversion)

        # Update the consola_log with the current list of conversions
        log_text = "\n".join([f'"{key}": "{value}"' for conv in self.conversions for key, value in conv.items()])
        self.consola_log.setPlainText(log_text)

# Run the application
app = QApplication([])
window = MainWindow()
app.exec_()
