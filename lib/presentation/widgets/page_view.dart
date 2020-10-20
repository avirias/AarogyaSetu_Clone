import 'package:flutter/material.dart';
import 'package:gamatics/generated/locale_keys.g.dart';
import 'package:gamatics/presentation/widgets/clippers.dart';
import 'package:easy_localization/easy_localization.dart';
class OnBoardingPageView extends StatelessWidget {

  final PageController controller;
  final Function(int) pageChanged;

  const OnBoardingPageView({Key key, this.controller, this.pageChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: pageChanged,
      children: [
        Container(
          color: Color(0xffF9E9E8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: DownwardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 40),
                    child: Text(
                      LocaleKeys.boarding_page_one_title,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/onboarding_one.webp',
                height: 120,
                width: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: UpWardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
                    child: Text(
                      LocaleKeys.boarding_page_one_subtitle,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Color(0xfff9e9f4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: DownwardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 40),
                    child: Text(
                      LocaleKeys.boarding_page_two_title,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/group_8.webp',
                width: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: UpWardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
                    child: Text(
                      LocaleKeys.boarding_page_two_subtitle,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Color(0xffebe9f9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: DownwardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 20, 50, 40),
                    child: Text(
                      LocaleKeys.boarding_page_three_title,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              ),
              Image.asset(
                'assets/images/onboarding_three.webp',
                height: 120,
                width: 120,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: UpWardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
                    child: Text(
                      LocaleKeys.boarding_page_three_subtitle,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          color: Color(0xffe9f7f9),
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset('assets/images/onboarding_four.webp'),
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                          padding: EdgeInsets.only(top: 70),
                          child: Image.asset(
                            'assets/images/map_pins.webp',
                          )))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipPath(
                  clipper: UpWardClipper(),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 20),
                    child: Text(
                      LocaleKeys.boarding_page_four,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
      controller: controller,
    );

  }
}
