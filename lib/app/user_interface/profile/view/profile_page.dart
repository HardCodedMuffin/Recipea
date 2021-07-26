import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipea/app/app.dart';
import 'package:recipea/app/user_interface/profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with AppNavigationStateMixin {
  @override
  void onPageVisible() {
    AppNavigation.of(context)!.params = AppBarParams(
        title: const Text('Profile'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Avatar(photo: user.photo),
          const SizedBox(height: 4.0),
          Text(user.email ?? '', style: textTheme.headline6),
          const SizedBox(height: 4.0),
          Text(user.name ?? '', style: textTheme.headline5),
        ],
      ),
    );
  }
}
