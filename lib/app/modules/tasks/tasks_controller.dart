// ignore_for_file: unused_field, prefer_final_fields

import 'package:todolist/app/core/notifier/default_change_notifier.dart';
import 'package:todolist/app/services/tasks/tasks_service.dart';

class TasksController extends DefaultChangeNotifier {
  TasksService _tasksService;
  DateTime? _selectedDate;

  TasksController({
    required TasksService tasksService,
  }) : _tasksService = tasksService;

  set selectedDate(DateTime? selectedDate) {
    resetState();
    _selectedDate = selectedDate;
    notifyListeners();
  }

  DateTime? get selectedDate => _selectedDate;

  Future<void> save(String description) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      if (_selectedDate != null) {
        await _tasksService.save(_selectedDate!, description);
        success();
      } else {
        setError('Selecione uma data');
      }
    } catch (e, _) {
      setError('Erro a cadastrar task');
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
