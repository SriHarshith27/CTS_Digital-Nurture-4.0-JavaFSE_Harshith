package observerpattern;

public class ClientObserver implements Observer {
    private String clientName;

    public ClientObserver(String clientName) {
        this.clientName = clientName;
    }

    public void update(String stockName, double stockPrice) {
        System.out.println(clientName + " received update → " + stockName + ": ₹" + stockPrice);
    }
}
