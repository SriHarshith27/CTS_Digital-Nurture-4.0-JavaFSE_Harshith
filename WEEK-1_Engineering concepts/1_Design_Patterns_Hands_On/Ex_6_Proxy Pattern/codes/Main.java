package proxypattern;

public class Main {
    public static void main(String[] args) {
        Image image1 = new ProxyImage("nature.jpg");

        image1.display();
        image1.display();

        Image image2 = new ProxyImage("city.png");

        image2.display();
    }
}
