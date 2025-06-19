package decoratorpattern;

public class Main {
    public static void main(String[] args) {
        Notifier basicNotifier = new EmailNotifier();

        Notifier smsNotifier = new SMSNotifierDecorator(basicNotifier);
        Notifier fullNotifier = new SlackNotifierDecorator(smsNotifier);

        fullNotifier.send("Server is down!");
    }
}
