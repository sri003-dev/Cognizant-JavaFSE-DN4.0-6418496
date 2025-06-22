public class Main {
    public static void main(String[] args) {
        TaskList list = new TaskList();
        list.addTask(new Task(1, "Login Feature", "Pending"));
        list.addTask(new Task(2, "Database Setup", "Completed"));
        list.traverse();
        System.out.println("After deletion:");
        list.deleteTask(1);
        list.traverse();
    }
}
