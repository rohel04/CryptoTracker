import 'package:cryptocurrency_tracker/model/users.dart';
import 'package:cryptocurrency_tracker/screens/authentication/login.dart';
import 'package:cryptocurrency_tracker/screens/home.dart';
import 'package:cryptocurrency_tracker/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
  final authProvider=Provider.of<AUthService>(context);
    return StreamBuilder<UserModal?>(
        stream: authProvider.user,
        builder: (context,AsyncSnapshot<UserModal?> snapshot){
          if(snapshot.connectionState==ConnectionState.active)
            {
              UserModal? userModal=snapshot.data;
              return userModal==null ? LoginScreen():HomePage();
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        });
  }
}
