
public class PaymentContext {
    private PaymentStrategy paymentStrategy;

    public void setPaymentStrategy(PaymentStrategy strategy) {
        this.paymentStrategy = strategy;
    }

    public void payAmount(int amount) {
        if (paymentStrategy == null) {
            System.out.println("No payment strategy selected!");
        } else {
            paymentStrategy.pay(amount);
        }
    }
}
