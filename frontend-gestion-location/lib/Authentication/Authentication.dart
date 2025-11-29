import 'package:flutter/material.dart';
import 'package:gestion_locateur/login/LoginView.dart';
import 'package:gestion_locateur/register/RegisterView.dart';
import 'package:get/get.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text(
            "20".tr,
            style: TextStyle(
                color: Color(0xffC49FFF), fontWeight: FontWeight.bold),
          ),
          // backgroundColor: Colors.grey[800],
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffC49FFF),
                    borderRadius: BorderRadius.circular(10)),
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                child: TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    indicatorPadding: EdgeInsets.all(5),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    dividerColor: Colors.transparent,
                    // s
                    tabs: [
                      Tab(
                        text: "21".tr,
                      ),
                      Tab(
                        text: "22".tr,
                      )
                    ]),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(child: Loginview()),
                    SingleChildScrollView(child: Registerview()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
