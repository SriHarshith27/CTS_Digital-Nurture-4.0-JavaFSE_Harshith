package observerpattern;

public class Main {
    public static void main(String[] args) {
        StockMarket market = new StockMarket();

        Observer client1 = new ClientObserver("Client A");
        Observer client2 = new ClientObserver("Client B");

        market.register(client1);
        market.register(client2);

        market.setStock("COGNIZANT", 3625.50);
        market.setStock("GOOGLE", 1480.00);

        market.deregister(client1);

        market.setStock("NVIDIA", 422.75);
    }
}
