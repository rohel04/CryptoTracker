import 'package:cryptocurrency_tracker/screens/authentication/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../service/auth_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                Text('Hello.',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                Text('Welcome Back',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                SizedBox(height: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('EMAIL',style: TextStyle(color: Colors.grey,fontSize: 14)),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),
                Text('PASSWORD',style: TextStyle(color: Colors.grey,fontSize: 14)),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password??',style: TextStyle(color: Colors.grey))
                  ],
                ),
                SizedBox(height: 50),
                ElevatedButton(onPressed: () async{
                  await authProvider.signInwithEmailandPass(_emailController.text, _passwordController.text);
                },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      shadowColor: Colors.blueAccent,
                      elevation: 15,
                      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20)
                    ),
                    child: Text('Login')),
                SizedBox(height: 40),
                InkWell(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create Account?',style: TextStyle(color:Colors.grey))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
