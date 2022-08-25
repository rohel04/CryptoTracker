import 'package:cryptocurrency_tracker/provider/ThemeProvider.dart';
import 'package:cryptocurrency_tracker/service/auth_service.dart';
import 'package:cryptocurrency_tracker/widget/markets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    ThemeProvider themeProvider=Provider.of<ThemeProvider>(context);
    final authProvider=Provider.of<AUthService>(context);

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            Expanded(child: Text('Welcome Back',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500))),
                    IconButton(onPressed: () async{
                      await authProvider.signOut();
                    }, icon: Icon(Icons.logout))
          ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Expanded(child: Text('Crypto Today',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),)),
                IconButton(onPressed: (){
                  themeProvider.toggleTheme();
                }, icon: (themeProvider.themeMode==ThemeMode.light)? Icon(Icons.dark_mode):Icon(Icons.light_mode))
              ]
              ),
              SizedBox(height: 20),
              Markets()
            ],
          ),
        ),
      ),
    );
  }
}
