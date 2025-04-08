import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:home_chef/core/core.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.pushNamed(AppRoutes.intermediateScreenRoute);
          },
          child: Text('Go to intermediate screen'),
        ),
      ),
    );
  }
}



