public class TaskList {
    private Task head;

    public void addTask(Task task) {
        task.next = head;
        head = task;
    }

    public void deleteTask(int taskId) {
        Task current = head, prev = null;
        while (current != null && current.taskId != taskId) {
            prev = current;
            current = current.next;
        }
        if (current != null) {
            if (prev == null) {
                head = head.next;
            } else {
                prev.next = current.next;
            }
        }
    }

    public Task searchTask(int taskId) {
        Task current = head;
        while (current != null) {
            if (current.taskId == taskId) {
                return current;
            }
            current = current.next;
        }
        return null;
    }

    public void traverse() {
        Task current = head;
        while (current != null) {
            System.out.println(current);
            current = current.next;
        }
    }
}
