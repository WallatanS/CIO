package snake.game;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.Random; //gera valorez pseudo-aleatórios

public class Painel extends JPanel implements ActionListener{
	static final int Largura_Tela = 1000;
	static final int Tamanho_Tela = 500;
	static final int Tamanho_Bloco = 30;
	static final int Unidade_Jogo = (Largura_Tela*Tamanho_Tela)/(Tamanho_Bloco*Tamanho_Bloco);
	static final int Delay = 175;
	final int x[] = new int[Unidade_Jogo];
	final int y[] = new int[Unidade_Jogo];
	int Corpo = 6;
	int FrutaComida;
	int FrutaX;
	int FrutaY;
	char Direcao = 'R';
	boolean Running = false;
	Timer timer;
	Random random;
        
	Painel(){
		random = new Random();
		this.setPreferredSize(new Dimension(Largura_Tela,Tamanho_Tela));
		this.setBackground(Color.black);
		this.setFocusable(true);
		this.addKeyListener(new MyKeyAdapter());
		startGame();
	}
	public void startGame() {
		RespawnFruta();
		Running = true;
		timer = new Timer(Delay,this);
		timer.start();
	}
	public void paintComponent(Graphics g) {
		super.paintComponent(g);
		draw(g);
	}
	public void draw(Graphics g) {
		if(Running) {
			g.setColor(Color.red);
			g.fillOval(FrutaX, FrutaY, Tamanho_Bloco, Tamanho_Bloco);
			for(int i = 0; i< Corpo;i++) {
				if(i == 0) {
					g.setColor(Color.green);
					g.fillRect(x[i], y[i], Tamanho_Bloco, Tamanho_Bloco);
				}
				else {
					g.setColor(new Color(45,180,0));
					g.fillRect(x[i], y[i], Tamanho_Bloco, Tamanho_Bloco);
				}			
			}
			g.setColor(Color.red);
			g.setFont( new Font("Ink Free",Font.BOLD, 40));
			FontMetrics metrics = getFontMetrics(g.getFont());
			g.drawString("Pontuacao: "+ FrutaComida, (Largura_Tela - metrics.stringWidth("Pontuacao: "+ FrutaComida))/2, g.getFont().getSize());
		}
		else {
			gameOver(g);
		}	
	}
	public void RespawnFruta(){
		FrutaX = random.nextInt((int)(Largura_Tela/Tamanho_Bloco))*Tamanho_Bloco;
		FrutaY = random.nextInt((int)(Tamanho_Tela/Tamanho_Bloco))*Tamanho_Bloco;
	}
	public void move(){
		for(int i = Corpo;i>0;i--) {
			x[i] = x[i-1];
			y[i] = y[i-1];
		}
		switch(Direcao) {
		case 'U':
			y[0] = y[0] - Tamanho_Bloco;
			break;
		case 'D':
			y[0] = y[0] + Tamanho_Bloco;
			break;
		case 'L':
			x[0] = x[0] - Tamanho_Bloco;
			break;
		case 'R':
			x[0] = x[0] + Tamanho_Bloco;
			break;
		}
	}
	public void checkFruta() {
		if((x[0] == FrutaX) && (y[0] == FrutaY)) {
			Corpo++;
			FrutaComida++;
			RespawnFruta();
		}
	}
	public void checkCollisao() {
		//checa se a cabeça toca alguma parte do seu corpo
		for(int i = Corpo;i>0;i--) {
			if((x[0] == x[i])&& (y[0] == y[i])) {
				Running = false;
			}
		}
		//checa se a cabeça toca na borda da esquerda
		if(x[0] < 0) {
			Running = false;
		}
		//checa se a cabeça toca na borda da direita
		if(x[0] > Largura_Tela) {
			Running = false;
		}
		//checa se a cabeça toca na borda de baixo
		if(y[0] < 0) {
			Running = false;
		}
		//checa se a cabeça toca a borda de cima
		if(y[0] > Tamanho_Tela) {
			Running = false;
		}
		if(!Running) {
			timer.stop();
		}
	}
	public void gameOver(Graphics g) {
		//Pontuação
		g.setColor(Color.red);
		g.setFont( new Font("Ink Free",Font.BOLD, 40));
		FontMetrics metrics1 = getFontMetrics(g.getFont());
		g.drawString("Score: "+ FrutaComida, (Largura_Tela - metrics1.stringWidth("Score: "+ FrutaComida))/2, g.getFont().getSize());
		//Texto de Game Over
		g.setColor(Color.red);
		g.setFont( new Font("Ink Free",Font.BOLD, 75));
		FontMetrics metrics2 = getFontMetrics(g.getFont());
		g.drawString("Game Over", (Largura_Tela - metrics2.stringWidth("Game Over"))/2, Tamanho_Tela/2);
	}
	@Override
	public void actionPerformed(ActionEvent e) {	
		if(Running) {
			move();
			checkFruta();
			checkCollisao();
		}
		repaint();
	}
	public class MyKeyAdapter extends KeyAdapter{
		public void keyPressed(KeyEvent e) {
			switch(e.getKeyCode()) {
			case KeyEvent.VK_LEFT:
				if(Direcao != 'R') {
					Direcao = 'L';
				}
				break;
			case KeyEvent.VK_RIGHT:
				if(Direcao != 'L') {
					Direcao = 'R';
				}
				break;
			case KeyEvent.VK_UP:
				if(Direcao != 'D') {
					Direcao = 'U';
				}
				break;
			case KeyEvent.VK_DOWN:
				if(Direcao != 'U') {
					Direcao = 'D';
				}
				break;
			}
		}
	}
}