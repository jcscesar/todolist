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
}
