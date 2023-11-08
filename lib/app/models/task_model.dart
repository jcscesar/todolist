class TaskModel {
  final int id;
  final String description;
  final DateTime dateTime;
  final bool finished;
  TaskModel({
    required this.id,
    required this.description,
    required this.dateTime,
    required this.finished,
  });

  factory TaskModel.loadFromDB(Map<String, dynamic> task) {
    return TaskModel(
      id: task['id'],
      description: task['description'],
      dateTime: DateTime.parse(task['dateTime']),
      finished: task['finalizado)'] == 1,
    );
  }
}
