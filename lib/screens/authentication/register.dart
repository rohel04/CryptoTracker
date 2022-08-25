import 'package:cryptocurrency_tracker/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final authProvider=Provider.of<AUthService>(context);
    final _emailController=TextEditingController();
    final _passwordController=TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 60, 15, 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Hi.',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                Text('Fill the Form',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                SizedBox(height: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMAIL',style: TextStyle(color: Colors.grey)),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                Text('PASSWORD',style: TextStyle(color: Colors.grey)),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 40),
                Text('RE-TYPE PASSWORD',style: TextStyle(color: Colors.grey)),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 50),
                ElevatedButton(onPressed: () async{
                  await authProvider.createWithEmailandPass(_emailController.text, _passwordController.text);
                  Navigator.pop(context);
                },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shadowColor: Colors.blueAccent,
                        elevation: 15,
                        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20)
                    ),
                    child: Text('Sign Up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
