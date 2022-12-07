package Leitor;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Scanner;

public class Leitor {
	static String ende;

	public static void ini(String args[]) throws IOException {
		ManipuladorArquivo.escritor(ende);
		ManipuladorArquivo.leitor(ende);
	}

	public static void caminho (String caminho){
		ende = caminho;

	}

	public static void leitor(String path) throws IOException {
		BufferedReader buffRead = new BufferedReader(new FileReader(path));
		String linha = "";
		while (true) {
			if (linha != null) {
				System.out.println(linha);
			} else
				break;
			linha = buffRead.readLine();
		}
		buffRead.close();
	}

	public class ManipuladorArquivo {

		public static void leitor(String path) throws IOException {
			BufferedReader buffRead = new BufferedReader(new FileReader(path));
			String linha = "";
			while (true) {
				if (linha != null) {
					System.out.println(linha);
				} else
					break;
				linha = buffRead.readLine();
			}
			buffRead.close();
		}

		public static void escritor(String path) throws IOException {
			BufferedWriter buffWrite = new BufferedWriter(new FileWriter(path));
			String linha = "";
			Scanner in = new Scanner(System.in);
			System.out.println("Escreva algo: ");
			linha = in.nextLine();
			buffWrite.append(linha + "\n");
			buffWrite.close();
		}

	}
}