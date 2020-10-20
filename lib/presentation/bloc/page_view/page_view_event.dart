part of 'page_view_bloc.dart';

abstract class PageEvent {}

class NextPageEvent extends PageEvent {}

class PrevPageEvent extends PageEvent {}

class ChangePageEvent extends PageEvent {
 final int page;

  ChangePageEvent(this.page);

}

class LanguageChangeEvent extends PageEvent {
  final Language language;

  LanguageChangeEvent({this.language});
}
