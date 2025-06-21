import java.util.Scanner;

public class MVCPatternExample {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter student details:");

        System.out.print("Name: ");
        String name = scanner.nextLine();

        System.out.print("ID: ");
        String id = scanner.nextLine();

        System.out.print("Grade: ");
        String grade = scanner.nextLine();

        // Step 2: Create model, view, controller
        Student student = new Student(name, id, grade);
        StudentView view = new StudentView();
        StudentController controller = new StudentController(student, view);

        // Step 3: Display initial details
        controller.updateView();

        // Step 4: Ask if user wants to update
        System.out.print("\nDo you want to update the details? (yes/no): ");
        String response = scanner.nextLine().toLowerCase();

        if (response.equals("yes")) {
            System.out.print("New Name (or press Enter to skip): ");
            String newName = scanner.nextLine();
            if (!newName.isEmpty()) {
                controller.setStudentName(newName);
            }

            System.out.print("New ID (or press Enter to skip): ");
            String newId = scanner.nextLine();
            if (!newId.isEmpty()) {
                controller.setStudentId(newId);
            }

            System.out.print("New Grade (or press Enter to skip): ");
            String newGrade = scanner.nextLine();
            if (!newGrade.isEmpty()) {
                controller.setStudentGrade(newGrade);
            }

            // Step 5: Display updated details
            controller.updateView();
        }

        scanner.close();
    }
}
