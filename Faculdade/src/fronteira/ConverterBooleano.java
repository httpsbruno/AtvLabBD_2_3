package fronteira;

public class ConverterBooleano {
	public String booleanToString(boolean[] vetor) {
		int tamanho =  vetor.length;
		String presenca = "";
		for (int i = 0; i < tamanho; i++) {
			if(vetor[i] == true) {
				presenca += "P";
			}else {
				presenca += "F";
			}
			
		}
		return presenca;
	}
	
	public boolean[] stringToBoolean(String presenca) {
		boolean vetor[] = {false,false,false,false};
		if(!presenca.isEmpty()) {
			for (int i = 0; i < 4; i++) {
				if("P".equals(presenca.charAt(i))) {
					vetor[i] = true;
				} else {
					vetor[i] = false;
				}
			}
		}
		return vetor;
	}
}
