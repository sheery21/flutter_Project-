import 'package:flutter/material.dart';
import 'package:flutter_15_start/Pages/counter_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Build function called!');
    return Scaffold(
      appBar: AppBar(title: Text('Home'), centerTitle: true),
      body: Container(
        color: Colors.white38,
        child: Center(
          child: Consumer<CounterProvider>(
            builder: (cont, value, child) {
              print('Consumer function called!');
              return Text(
                // '${Provider.of<CounterProvider>(context,).getCount()}'
                '${cont.watch<CounterProvider>().getCount()}',
                style: TextStyle(fontSize: 50),
              );
            },
          ),
        ),
      ),
      floatingActionButton: Container(
        color: Colors.white38,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                // Provider.of<CounterProvider>(context , listen: false).incrementCount();
                context.read<CounterProvider>().dicrementCount();
              },
              child: Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () {
                // Provider.of<CounterProvider>(context , listen: false).incrementCount();
                context.read<CounterProvider>().incrementCount(7);
              },
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
