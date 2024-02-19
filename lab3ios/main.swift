//task 1
import Foundation

struct Student {
    var firstName: String
    var lastName: String
    var averageGrade: Double
}

class StudentJournal {
    var students: [Student] = []
    
    func addStudent(firstName: String, lastName: String, averageGrade: Double) {
        let newStudent = Student(firstName: firstName, lastName: lastName, averageGrade: averageGrade)
        students.append(newStudent)
    }
    
    func removeStudent(firstName: String, lastName: String) {
        students.removeAll { student in
            student.firstName == firstName && student.lastName == lastName
        }
    }
    
    func displayStudents() {
        let sortedStudents = students.sorted { student1, student2 in
            student1.averageGrade > student2.averageGrade
        }
        
        for student in sortedStudents {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }
    
    func findAverageScore() -> Double {
        let totalGrade = students.reduce(0) { result, student in
            result + student.averageGrade
        }
        return totalGrade / Double(students.count)
    }
    
    func findStudentWithHighestGPA() -> Student? {
        return students.max { student1, student2 in
            student1.averageGrade < student2.averageGrade
        }
    }
}

let journal = StudentJournal()

journal.addStudent(firstName: "John", lastName: "Doe", averageGrade: 90.5)
journal.addStudent(firstName: "Jane", lastName: "Smith", averageGrade: 85.0)
journal.addStudent(firstName: "Bob", lastName: "Johnson", averageGrade: 92.3)

print("Students in descending order of GPA:")
journal.displayStudents()

let averageScore = journal.findAverageScore()
print("\nAverage Score: \(averageScore)")

if let highestGPAStudent = journal.findStudentWithHighestGPA() {
    print("\nStudent with Highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName), GPA: \(highestGPAStudent.averageGrade)")
} else {
    print("No students in the journal.")
}

//task 2
import Foundation

struct Task {
    var title: String
    var description: String
    var isCompleted: Bool
}

class ToDoList {
    var tasks: [Task] = []
    
    func addTask(title: String, description: String) {
        let newTask = Task(title: title, description: description, isCompleted: false)
        tasks.append(newTask)
    }
    
    func removeTask(title: String) {
        tasks.removeAll { task in
            task.title == title
        }
    }
    
    func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { task in task.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayTasks() {
        for task in tasks {
            let status = task.isCompleted ? "Completed" : "Not Completed"
            print("Title: \(task.title), Description: \(task.description), Status: \(status)")
        }
    }
    
    func displayCompletedTasks() {
        let completedTasks = tasks.filter { task in task.isCompleted }
        print("\nCompleted Tasks:")
        for task in completedTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func displayOutstandingTasks() {
        let outstandingTasks = tasks.filter { task in !task.isCompleted }
        print("\nOutstanding Tasks:")
        for task in outstandingTasks {
            print("Title: \(task.title), Description: \(task.description)")
        }
    }
    
    func clearCompletedTasks() {
        tasks.removeAll { task in task.isCompleted }
    }
}

let toDoList = ToDoList()

func getInput() -> String {
    print("Enter your choice:")
    guard let input = readLine() else {
        return ""
    }
    return input
}

var isRunning = true

while isRunning {
    print("\nChoose an option:")
    print("1. Add Task")
    print("2. Remove Task")
    print("3. Change Task Status")
    print("4. Display All Tasks")
    print("5. Display Completed Tasks")
    print("6. Display Outstanding Tasks")
    print("7. Clear Completed Tasks")
    print("8. Quit")

    guard let choice = Int(getInput()) else {
        print("Invalid input. Please enter a number.")
        continue
    }

    switch choice {
    case 1:
        print("Enter task title:")
        let title = getInput()
        print("Enter task description:")
        let description = getInput()
        toDoList.addTask(title: title, description: description)
    case 2:
        print("Enter task title to remove:")
        let title = getInput()
        toDoList.removeTask(title: title)
    case 3:
        print("Enter task title to change status:")
        let title = getInput()
        print("Enter new status (true for completed, false for not completed):")
        if let isCompleted = Bool(getInput()) {
            toDoList.changeTaskStatus(title: title, isCompleted: isCompleted)
        } else {
            print("Invalid input for status.")
        }
    case 4:
        toDoList.displayTasks()
    case 5:
        toDoList.displayCompletedTasks()
    case 6:
        toDoList.displayOutstandingTasks()
    case 7:
        toDoList.clearCompletedTasks()
    case 8:
        isRunning = false
    default:
        print("Invalid choice. Please enter a number between 1 and 8.")
    }
}
