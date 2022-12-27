import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_register_demo/SignIn.dart';
import 'package:login_register_demo/WelcomeScreen.dart';

class SignUpApp extends StatelessWidget {
  const SignUpApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/loginScreen': (context) => const SignIn(),

      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm();

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextContoller = TextEditingController();
  final _lastNameTextContoller = TextEditingController();
  final _userNameTextContoller = TextEditingController();
  final _emailTextContoller = TextEditingController();
  final _addressContoller = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextContoller,
      _lastNameTextContoller,
      _userNameTextContoller,
      _emailTextContoller,
      _addressContoller
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return (Form(
        onChanged: _updateFormProgress,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedProgressIndicator(value: _formProgress),
            //LinearProgressIndicator(value: formProgress),
            Text('Sign Up', style: Theme.of(context).textTheme.headline4),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _firstNameTextContoller,
                decoration: const InputDecoration(hintText: 'firstName'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _lastNameTextContoller,
                decoration: const InputDecoration(hintText: 'Last name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _userNameTextContoller,
                decoration: const InputDecoration(hintText: 'Username'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _emailTextContoller,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _addressContoller,
                decoration: const InputDecoration(hintText: 'Address'),
              ),
            ),
            TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.white;
                  }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (Set<MaterialState> states) {
                    return states.contains(MaterialState.disabled)
                        ? null
                        : Colors.blue;
                  }),
                ),
                onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
                child: const Text('Sign Up')),

            TextButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
                 Navigator.of(context).pushNamed('/loginScreen');
              },
              child: Text(
                'Already have an account? Sign in',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        )));
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  const AnimatedProgressIndicator({
    required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.green, end: Colors.blue),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
