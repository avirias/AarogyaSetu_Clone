import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gamatics/generated/locale_keys.g.dart';

part 'page_view_state.dart';

part 'page_view_event.dart';

class PageViewBloc extends Bloc<PageEvent, PageState> {
  final int pageLength;

  PageViewBloc({@required this.pageLength})
      : super(PageState(pageLength: pageLength));

  @override
  Stream<PageState> mapEventToState(PageEvent event) async* {
    if (event is ChangePageEvent) yield _mapChangePage(event.page);
    if (event is NextPageEvent)
      yield _mapEventToNextPage();
    else if (event is PrevPageEvent)
      yield _mapEventToPrevPage();
    else if (event is LanguageChangeEvent)
      yield _mapEventToLangChange(event.language);
  }

  _mapEventToNextPage() {
    if (state.page == state.pageLength - 1)
      return state.copyWith(page: state.page + 1, isRegister: true);
    return state.page < state.pageLength - 1
        ? state.copyWith(page: state.page + 1)
        : state;
  }

  _mapEventToPrevPage() {
    return state.page > 0 ? state.copyWith(page: state.page - 1) : state;
  }

  _mapEventToLangChange(Language language) {
    return state.copyWith(language: language);
  }

  _mapChangePage(int page) {
    return state.copyWith(page: page, isRegister: page == pageLength - 1);
  }
}
