import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:worldpay_checkout/worldpay_checkout.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Card & CVV'),
              Tab(text: 'CVV'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Example(),
            Example2(),
          ],
        ),
      ),
    );
  }
}

class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final _worldpayCheckout = const WorldpayCheckout(
    baseUrl: 'https://access.worldpay.com/',
    merchantId: 'YOUR_MERCHANT_ID',
  );
  Sessions? _sessions;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isProcessing) ...[
              ElevatedButton(
                onPressed: () => _generateSessionForTestCard(),
                child: const Text('Generate Sessions'),
              ),
              const SizedBox(height: 32),
              if (_sessions != null) Text('''
                Generated Sessions:
                CARD => ${_sessions?.cardSession}
                CVV => ${_sessions?.cvvSession}
                '''),
            ] else
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> _generateSessionForTestCard() async {
    setState(() => _sessions = null);

    try {
      setState(() => _isProcessing = true);
      final sessions = await _worldpayCheckout.generateSessions(
        cardNumber: '4444333322221111',
        cardExpiry: '12/26',
        cardCVV: '555',
      );
      setState(() => _sessions = sessions);
    } on PlatformException catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(exception.message ?? exception.code),
        ),
      );
    } finally {
      setState(() => _isProcessing = false);
    }
  }
}

class Example2 extends StatefulWidget {
  const Example2({Key? key}) : super(key: key);

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  final _worldpayCheckout = const WorldpayCheckout(
    baseUrl: 'https://access.worldpay.com/',
    merchantId: 'YOUR_MERCHANT_ID',
  );
  String? _session;
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isProcessing) ...[
              ElevatedButton(
                onPressed: () => _generateSessionForCVV(),
                child: const Text('Generate CVV Session'),
              ),
              const SizedBox(height: 32),
              if (_session != null) Text('$_session'),
            ] else
              const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Future<void> _generateSessionForCVV() async {
    setState(() => _session = null);

    try {
      setState(() => _isProcessing = true);
      final session = await _worldpayCheckout.generateCVVSession(
        cardCVV: '555',
      );
      setState(() => _session = session);
    } on PlatformException catch (exception) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(exception.message ?? exception.code),
        ),
      );
    } finally {
      setState(() => _isProcessing = false);
    }
  }
}
