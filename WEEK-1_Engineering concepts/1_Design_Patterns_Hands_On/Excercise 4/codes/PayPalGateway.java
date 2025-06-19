package adapterpattern;

public class PayPalGateway {
    public void sendMoney(double money) {
        System.out.println("Processing PayPal payment of ₹" + money);
    }
}
