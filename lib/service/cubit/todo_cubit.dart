import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app/constants/app_text.dart';
import 'package:todo_app/service/db/database_service.dart';

import '../../model/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  Future<void> getData() async {
    try {
      emit(TodoGetData(await DatabaseService().getUncompletedTodos()));
    } catch (e) {
      emit(
        TodoGetDataError(BlocErrorText.dataCantFetch),
      );
    }
  }

  Future<void> getDoneData() async {
    try {
      emit(TodoDoneData(await DatabaseService().getCompletedTodos()));
    } catch (e) {
      emit(
        TodoGetDataError(BlocErrorText.dataCantFetch),
      );
    }
  }

  Future<void> getCalendarPageData() async {
    try {
      emit(TodoCalendarPageData(await DatabaseService().getUncompletedTodos()));
    } catch (e) {
      emit(
        TodoGetDataError(BlocErrorText.dataCantFetch),
      );
    }
  }

  Future<void> getTodoById(int id) async {
    try {
      emit(GetTodoById(await DatabaseService().getTodoById(id)));
    } catch (e) {
      emit(TodoGetDataError(BlocErrorText.dataCantFetch));
    }
  }
}
