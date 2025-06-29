import 'package:flutter/material.dart';
import 'package:go_router_builder_sample/core/router/route/route.dart';
import 'package:go_router_builder_sample/domain/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () => const HelpRoute().push<void>(context),
          ),
        ],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: User.list.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final user = User.list[index];
            return ListTile(
              leading: Icon(user.image, color: user.color),
              title: Text(user.name),
              onTap: () => DetailRoute(userId: user.id).go(context),
            );
          },
        ),
      ),
    );
  }
}
