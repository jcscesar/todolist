import 'package:todolist/app/core/database/sqlite_connection_factory.dart';
import 'package:todolist/app/models/task_model.dart';
import 'package:todolist/app/repositories/tasks/taks_repository.dart';

class TaksRepositoryImpl implements TasksRepository {
  final SqliteConnectionFactory _sqliteConnectionFactory;

  TaksRepositoryImpl({
    required SqliteConnectionFactory sqliteConnectionFactory,
  }) : _sqliteConnectionFactory = sqliteConnectionFactory;

  @override
  Future<void> save(DateTime date, String description) async {
    final conn = await _sqliteConnectionFactory.openConnection();
    await conn.insert('todo', {
      'id': null,
      'descricao': description,
      'data_hora': date.toIso8601String(),
      'finalizado': 0,
    });
    print('conn $conn');
  }

  @override
  Future<List<TaskModel>> findByPeriod(DateTime start, DateTime end) async {
    final startFilter = DateTime(start.year, start.month, start.day, 0, 0, 0);
    final endFilter = DateTime(end.year, end.month, end.day, 23, 59, 59);

    final conn = await _sqliteConnectionFactory.openConnection();
    final result = await conn.rawQuery(
      '''
        select * from todo where data_hora
        between ? and ? order by data_hora
       ''',
      [
        startFilter.toIso8601String(),
        endFilter.toIso8601String(),
      ],
    );
    return result.map((e) => TaskModel.loadFromDB(e)).toList();
  }
}
