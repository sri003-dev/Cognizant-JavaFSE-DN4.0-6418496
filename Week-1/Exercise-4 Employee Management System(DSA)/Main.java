public class Main {
    public static void main(String[] args) {
        EmployeeManager manager = new EmployeeManager(5);
        manager.addEmployee(new Employee(1, "Arun", "Manager", 50000));
        manager.addEmployee(new Employee(2, "Bala", "Analyst", 30000));
        manager.traverse();
        manager.deleteEmployee(1);
        System.out.println("After deletion:");
        manager.traverse();
    }
}
