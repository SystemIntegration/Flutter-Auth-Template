import 'package:flutter/material.dart';
import 'package:login_register_demo/SignUpApp.dart';
import 'package:login_register_demo/WelcomeScreen.dart';
import 'package:login_register_demo/components/login_page.dart';

void main() {
  runApp(const MyAppNew()); // New Login Register
  //runApp(const SignUpApp()); // Old Login Register
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.orange,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// 
class MyAppNew extends StatelessWidget {
  const MyAppNew({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
    );
  }
}

// class SignUpApp extends StatelessWidget {
//   const SignUpApp();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/': (context) => const SignUpScreen(),
//         '/welcome': (context) => const WelcomeScreen(),
//       },
//     );
//   }
// }

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen();
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: const Center(
//         child: SizedBox(
//           width: 400,
//           child: Card(
//             child: SignUpForm(),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SignUpForm extends StatefulWidget {
//   const SignUpForm();

//   @override
//   _SignUpFormState createState() => _SignUpFormState();
// }

// class _SignUpFormState extends State<SignUpForm> {
//   final _firstNameTextContoller = TextEditingController();
//   final _lastNameTextContoller = TextEditingController();
//   final _userNameTextContoller = TextEditingController();
//   final _emailTextContoller = TextEditingController();
//   final _addressContoller = TextEditingController();



//   double _formProgress = 0;

//   void _updateFormProgress() {
//     var progress = 0.0;
//     final controllers = [
//       _firstNameTextContoller,
//       _lastNameTextContoller,
//       _userNameTextContoller,
//       _emailTextContoller,
//       _addressContoller
//     ];

//     for (final controller in controllers) {
//       if (controller.value.text.isNotEmpty) {
//         progress += 1 / controllers.length;
//       }
//     }

//     setState(() {
//       _formProgress = progress;
//     });
//   }

//   void _showWelcomeScreen() {
//     Navigator.of(context).pushNamed('/welcome');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return (Form(
//         onChanged: _updateFormProgress,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             AnimatedProgressIndicator(value: _formProgress),
//             //LinearProgressIndicator(value: formProgress),
//             Text('Sign Up', style: Theme.of(context).textTheme.headline4),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: _firstNameTextContoller,
//                 decoration: const InputDecoration(hintText: 'firstName'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: _lastNameTextContoller,
//                 decoration: const InputDecoration(hintText: 'Last name'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: _userNameTextContoller,
//                 decoration: const InputDecoration(hintText: 'Username'),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: _emailTextContoller,
//                 decoration: const InputDecoration(hintText: 'Email'),
//               ),
//               ),
            
//            Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: _addressContoller,
//                 decoration: const InputDecoration(hintText: 'Address'),
//               ),
//               ),
//             TextButton(
//                 style: ButtonStyle(
//                   foregroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Colors.white;
//                   }),
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                       (Set<MaterialState> states) {
//                     return states.contains(MaterialState.disabled)
//                         ? null
//                         : Colors.blue;
//                   }),
//                 ),
//                 onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
//                 child: const Text('Sign Up'))
//           ],
//         )));
//   }
// }

// class AnimatedProgressIndicator extends StatefulWidget {
//   final double value;

//   const AnimatedProgressIndicator({
//     required this.value,
//   });

//   @override
//   State<StatefulWidget> createState() {
//     return _AnimatedProgressIndicatorState();
//   }
// }

// class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<Color?> _colorAnimation;
//   late Animation<double> _curveAnimation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: const Duration(milliseconds: 1200),
//       vsync: this,
//     );

//     final colorTween = TweenSequence([
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.red, end: Colors.orange),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.yellow, end: Colors.green),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.green, end: Colors.blue),
//         weight: 1,
//       ),
//       TweenSequenceItem(
//         tween: ColorTween(begin: Colors.blue, end: Colors.green),
//         weight: 1,
//       ),
//     ]);

//     _colorAnimation = _controller.drive(colorTween);
//     _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
//   }

//   @override
//   void didUpdateWidget(oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     _controller.animateTo(widget.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) => LinearProgressIndicator(
//         value: _curveAnimation.value,
//         valueColor: _colorAnimation,
//         backgroundColor: _colorAnimation.value?.withOpacity(0.4),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//  final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//     _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//       appBar: AppBar(
//          title: Text(widget.title),
//       ),
//       body: Center(
     
//         child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
