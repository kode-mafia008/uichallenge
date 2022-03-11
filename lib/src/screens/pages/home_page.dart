import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../../controllers/timer_hook_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  int _number = 0;

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _number = _timer.tick;
      });
    });
    super.initState();
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
            Text(
              _number.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

class HomePageHook extends HookWidget {
  const HomePageHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _numberNotifier = useState(0);
    useEffect(() {
      final timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          _numberNotifier.value = timer.tick;
        },
      );
      return timer.cancel;
    }, const []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage Hook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _numberNotifier.value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageCustomHook extends HookWidget {
  const HomePageCustomHook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final number = useInfiniteTimer(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage CustomHook'),
      ),
      body: Center(child: Text(number.toString())),
    );
  }
}
