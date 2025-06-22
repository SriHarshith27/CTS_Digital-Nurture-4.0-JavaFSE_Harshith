public class Main {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        // Pay with Credit Card
        context.setPaymentStrategy(new CreditCardPayment("1234-5678-9876", "Harshith"));
        context.payAmount(500);

        // pay with PayPal
        context.setPaymentStrategy(new PayPalPayment("harshith@example.com"));
        context.payAmount(1200);
    }
}
