import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gamatics/generated/locale_keys.g.dart';
import 'package:gamatics/presentation/bloc/page_view/page_view_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gamatics/presentation/pages/permission_page.dart';
import 'package:gamatics/presentation/widgets/language_switch_button.dart';
import 'package:gamatics/presentation/widgets/page_view.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController _pageController;
  PageViewBloc _pageViewBloc;

  @override
  void initState() {
    super.initState();
    _pageViewBloc = BlocProvider.of<PageViewBloc>(context);
    _pageController = PageController(initialPage: _pageViewBloc.state.page);
  }

  _pageChanged(int page) {
    print(page);
    _pageViewBloc.state.copyWith(page: page);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PageViewBloc, PageState>(
      listener: (context, state) {
        _pageController.animateToPage(state.page,
            duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              OnBoardingPageView(
                controller: _pageController,
                pageChanged: (int page) {
                  _pageViewBloc.add(ChangePageEvent(page));
                },
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: LanguageSwitch(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 70),
                  child: DotsIndicator(
                    dotsCount: state.pageLength,
                    decorator: DotsDecorator(
                        spacing: EdgeInsets.all(2),
                        size: Size.square(6),
                        activeSize: Size.square(6),
                        color: Colors.transparent,
                        activeColor: Color(0xff39393F),
                        shape: CircleBorder(
                            side: BorderSide(
                                color: Color(0xff39393F), width: 0.4))),
                    position: state.page.toDouble(),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: RaisedButton(
                    color: Color(0xff39393F),
                    shape: StadiumBorder(),
                    onPressed: () {
                      state.isRegister
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => PermissionPage()))
                          : _pageViewBloc.add(NextPageEvent());
                    },
                    child: Text(
                      state.isRegister ? LocaleKeys.register : LocaleKeys.next,
                      style: TextStyle(color: Colors.white),
                    ).tr(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
