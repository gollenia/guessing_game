import java.util.Random;
import java.util.Scanner;

class Game {
    private int guess;
    private int tries;
    private int secret;
    
    public void run() {
        Random rand = new Random();
        int secret = rand.nextInt(99);
        int i = 0;
        
        Scanner sc = new Scanner(System.in);
        
        while ( i != secret ) {
            i = sc.nextInt();
            if(i > secret) {
                System.out.println("Too high!");
            }
            
            if(i < secret) {
                System.out.println("Too low!");
            } 
        }
        
        System.out.println("You Win!!");  
    }
}

class Main {

    public static void main(String[] args) {
        
        Game game = new Game();
        game.run();
          
    }

}

