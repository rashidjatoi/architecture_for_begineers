import 'package:flutter/material.dart';
import 'package:learn_bloc/ui/counter/counter_view.dart';
import 'package:learn_bloc/ui/user/user_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter Example
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CounterView(),
                  ),
                );
              },
              child: Text('Counter Example'),
            ),

            // SizedBox
            SizedBox(height: 10),

            // Users Api Example
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserView(),
                  ),
                );
              },
              child: Text('User Api Example'),
            ),
          ],
        ),
      ),
    );
  }
}
