part of 'page_view_bloc.dart';
enum Language { ENG, HIN }

class PageState {
  final int page;
  final Language language;
  final int pageLength;
  final bool isRegister;

  PageState({this.page = 0, this.language = Language.ENG,@required this.pageLength,this.isRegister = false});

  PageState copyWith({int page, Language language,bool isRegister}) {
    return PageState(
        page: page ?? this.page,
        language: language ?? this.language,
        isRegister: isRegister ?? this.isRegister,
        pageLength: this.pageLength);
  }
}
