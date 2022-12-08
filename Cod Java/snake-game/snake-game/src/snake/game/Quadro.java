package snake.game;

import javax.swing.JFrame; //base para criação gráfica

public class Quadro extends JFrame{
	Quadro(){
		this.add(new Painel());
		this.setTitle("Snake");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.pack();
		this.setVisible(true);
		this.setLocationRelativeTo(null);
	}
}
