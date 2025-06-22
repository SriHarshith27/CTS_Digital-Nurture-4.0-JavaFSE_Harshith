public class TaskManagementSystem {
    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        // Adding tasks
        taskList.addTask(new Task(1, "Design Module", "Pending"));
        taskList.addTask(new Task(2, "Implement Backend", "In Progress"));
        taskList.addTask(new Task(3, "Test Application", "Pending"));

        System.out.println("All Tasks:");
        taskList.displayTasks();

        // Search task
        System.out.println("\nSearching for Task with ID 2:");
        Task foundTask = taskList.searchTask(2);
        System.out.println(foundTask != null ? foundTask : "Task not found");

        // Delete task
        System.out.println("\nDeleting Task with ID 1:");
        boolean isDeleted = taskList.deleteTask(1);
        System.out.println(isDeleted ? "Task Deleted" : "Task Not Found");

        System.out.println("\nTasks after deletion:");
        taskList.displayTasks();
    }
}
