import 'package:todolist/app/models/task_model.dart';
import 'package:todolist/app/models/week_task_model.dart';
import 'package:todolist/app/repositories/tasks/taks_repository.dart';
import 'package:todolist/app/services/tasks/tasks_service.dart';

class TasksServiceimpl implements TasksService {
  final TasksRepository _taksRepository;
  TasksServiceimpl({
    required TasksRepository taksRepository,
  }) : _taksRepository = taksRepository;
  @override
  Future<void> save(DateTime date, String description) => _taksRepository.save(
        date,
        description,
      );

  @override
  Future<List<TaskModel>> getToday() {
    return _taksRepository.findByPeriod(DateTime.now(), DateTime.now());
  }

  @override
  Future<List<TaskModel>> getTomorrow() {
    var tomarrowDate = DateTime.now().add(const Duration(days: 1));
    return _taksRepository.findByPeriod(tomarrowDate, tomarrowDate);
  }

  @override
  Future<WeekTaskModel> getWeek() async {
    var tody = DateTime.now();
    var startFilter = DateTime(tody.year, tody.month, tody.day, 0, 0, 0);
    DateTime endFilter;
    if (startFilter.weekday != DateTime.monday) {
      startFilter = startFilter.subtract(
        Duration(
          days: (startFilter.weekday - 1),
        ),
      );
    }
    endFilter = startFilter.add(const Duration(days: 7));

    final tasks = await _taksRepository.findByPeriod(startFilter, endFilter);
    return WeekTaskModel(
      startDate: startFilter,
      endDate: endFilter,
      tasks: tasks,
    );
  }

  @override
  Future<void> checkOrUnCheckTask(TaskModel task) =>
      _taksRepository.checkOrUnCheckTask(task);
}
