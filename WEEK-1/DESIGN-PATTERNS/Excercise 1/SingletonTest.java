package singletonexample;

public class SingletonTest {
    public static void main(String[] args){
        Logger logger1 = Logger.getInstance();
        logger1.Log("Application Started");

        Logger logger2 = Logger.getInstance();
        logger2.Log("process completed");

        Logger logger3 = Logger.getInstance();
        logger3.Log("App shut down");

        System.out.println("\nVerifying instances:");
        System.out.println("Logger1 hashcode: " + logger1.hashCode());
        System.out.println("Logger2 hashcode: " + logger2.hashCode());
        System.out.println("Logger3 hashcode: " + logger3.hashCode());

        if (logger1 == logger2 && logger2 == logger3) {
            System.out.println("All logger instances are the same. Singleton pattern is working correctly!");
        } else {
            System.out.println("Singleton pattern failed. Multiple instances were created.");
        }
    }
}
