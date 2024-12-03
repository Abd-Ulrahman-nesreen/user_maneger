import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/Material.dart';
import 'package:provider/provider.dart';
import 'package:user_maneger/logic/sign_up_provider.dart';
import 'package:user_maneger/logic/signing_in_state_listener_provider.dart';
import 'package:user_maneger/screens/sign_in_page.dart';
import 'package:user_maneger/screens/user_maneger.dart';
import 'firebase_options.dart';
import 'logic/sign_in_provider.dart';

void main () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SigningInStateProvider()..listen()),
    ChangeNotifierProvider(create: (_) => SignInProvide()),
    ChangeNotifierProvider(create: (_) => SignUpProvider()),
  ] , child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer<SigningInStateProvider>(builder: (context , state , child){
        if (state.signedIn){
          return const UserManeger();
        }else {
          return const SignInPage();
        }
      }
    ));
  }
}