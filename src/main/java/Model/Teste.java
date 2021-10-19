package Model;

import java.sql.SQLException;

public class Teste {
	
	   public static void main(String[] args) throws SQLException, ClassNotFoundException {
		  Disciplina d = new Disciplina();
		  d.incluirDisciplina(1, "Métodos qualitativos", 120, true);
		   
	   }

}
