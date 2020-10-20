import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamatics/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gamatics/presentation/pages/demo_page.dart';
import 'package:gamatics/presentation/widgets/language_switch_button.dart';
import 'package:gamatics/presentation/widgets/permission_detail.dart';

class PermissionPage extends StatefulWidget {
  @override
  _PermissionPageState createState() => _PermissionPageState();
}

class _PermissionPageState extends State<PermissionPage> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Permissions',
          style: TextStyle(color: Colors.black),
        ),
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
          LanguageSwitch()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Color(0xff3E80E5)),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/lock_embelem.webp",
                        width: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          LocaleKeys.terms.tr(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Text(
                        LocaleKeys.terms_body.tr(),
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                PermissionDetail(
                  title: LocaleKeys.location.tr(),
                  body: LocaleKeys.location_body.tr(),
                ),
                PermissionDetail(
                  title: LocaleKeys.bluetooth.tr(),
                  body: LocaleKeys.bluetooth_body.tr(),
                ),
                PermissionDetail(
                  title: LocaleKeys.data.tr(),
                  body: LocaleKeys.data_body.tr(),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    LocaleKeys.terms_use.tr(),
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Divider(),
              RaisedButton(
                color: Color(0xff39393F),
                shape: StadiumBorder(),
                onPressed: () {
                  _phoneSheet();
                },
                child: Text(LocaleKeys.agree.tr(),
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        ],
      ),
    );
  }

  _phoneSheet() {
    showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                        Text(
                          LocaleKeys.mobile_enter,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ).tr(),
                        Container(
                          width: 30,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: LocaleKeys.mobile.tr(),
                            prefixText: "+91",
                            counter: Container(
                              height: 0,
                              width: 0,
                            )),
                        autofocus: true,
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        controller: _phoneController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: InkWell(
                        onTap: _whyMobileSheet,
                        child: Text(
                          LocaleKeys.why_needed,
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ).tr(),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 15),
                        child: RaisedButton(
                          color: Color(0xff39393F),
                          shape: StadiumBorder(),
                          onPressed: () {
                            login(_phoneController.text.trim());
                          },
                          child: Text(LocaleKeys.submit.tr(),
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }

  _whyMobileSheet() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        builder: (context) => Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    Expanded(
                      child: ListView(
                        shrinkWrap: false,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Text(
                            LocaleKeys.mobile_require.tr(),
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            LocaleKeys.mobile_require_why.tr(),
                            style: TextStyle(color: Colors.grey.shade600),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: RaisedButton(
                        color: Color(0xff39393F),
                        shape: StadiumBorder(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          LocaleKeys.understand.tr(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }

  Future login(String mobile) {
    mobile = '+91$mobile';
    _firebaseAuth.verifyPhoneNumber(
        timeout: Duration(seconds: 60),
        phoneNumber: mobile,
        verificationCompleted: (PhoneAuthCredential credential) async {
          Navigator.of(context).pop();

          UserCredential result =
              await _firebaseAuth.signInWithCredential(credential);

          User user = result.user;

          if (user != null) {
            print(user.phoneNumber);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DemoPage(
                          user: user,
                        )));
          } else {
            print("Error");
          }
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception);
        },
        codeSent: (String verificationId, int forceResendingToken) {

        },
        codeAutoRetrievalTimeout: (String verificationId){

        });
  }
}
