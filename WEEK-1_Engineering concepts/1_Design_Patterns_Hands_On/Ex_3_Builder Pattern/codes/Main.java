package builderpattern;

public class Main {
    public static void main(String[] args) {
        Computer basicComputer = new Computer.Builder("Intel i3", "8GB")
                .setStorage("256GB SSD")
                .build();

        System.out.println("=== Basic Computer ===");
        basicComputer.showSpecs();

        Computer gamingComputer = new Computer.Builder("Intel i9", "32GB")
                .setStorage("1TB SSD")
                .setGraphicsCard(true)
                .setBluetooth(true)
                .build();

        System.out.println("\n=== Gaming Computer ===");
        gamingComputer.showSpecs();

        Computer officeComputer = new Computer.Builder("AMD Ryzen 5", "16GB")
                .setStorage("512GB SSD")
                .setBluetooth(true)
                .build();

        System.out.println("\n=== Office Computer ===");
        officeComputer.showSpecs();
    }
}
