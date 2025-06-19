package adapterpattern;

public class StripeGateway {
    public void makeStripePayment(double value) {
        System.out.println("Processing Stripe payment of ₹" + value);
    }
}
