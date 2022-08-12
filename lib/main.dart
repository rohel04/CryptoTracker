import 'package:cryptocurrency_tracker/model/localStorage.dart';
import 'package:cryptocurrency_tracker/provider/MarketProvider.dart';
import 'package:cryptocurrency_tracker/provider/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:cryptocurrency_tracker/constants/theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String currentTheme=await LocalStorage.getTheme() ?? 'light';
  runApp(MyApp(theme: currentTheme));

}

class MyApp extends StatelessWidget {


  String theme;
  MyApp({required this.theme});

  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider<MarketProvider>
            (create: (context)=>MarketProvider()),
          ChangeNotifierProvider<ThemeProvider>
            (create: (context)=>ThemeProvider(theme))
        ],
        child: Consumer<ThemeProvider>(
          builder: (context,themeProvider,child)
          {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              themeMode: themeProvider.themeMode,
              theme: lightTheme,
              darkTheme: darkTheme,
                home: HomePage(),
            );
          }
        ),
      );
  }
}
