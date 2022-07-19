import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    home: ChangeNotifierProvider(
      create: (context) => CounterProvider(0),
      child: CounterScreen(),
    ),
  ));
}

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Counter Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              counterProvider._counter.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
          floatingActionButton: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed: () {
                  counterProvider.decrementCounter();
                },
                tooltip: 'Decrement',
                child: Icon(Icons.remove),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  counterProvider.resetCounter();
                },
                tooltip: 'Reset',
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  counterProvider.incrementCounter();
                },
                tooltip: 'increment',
                child: Icon(Icons.add),
              ),
              
            ],
          ),
        ));
  }
      
    
    

  }


class CounterProvider extends ChangeNotifier {
  int _counter;
  CounterProvider(this._counter);

  int getCounter() => _counter;
  serCounter(int counter) => this._counter = counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
  void resetCounter() {
    _counter = 0;
    notifyListeners();
  }
  void decrementCounter() {
    _counter--;
    notifyListeners();
  }
}
