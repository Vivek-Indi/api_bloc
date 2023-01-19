import 'package:api_bloc/blocs/app_blocs.dart';
import 'package:api_bloc/blocs/app_events.dart';
import 'package:api_bloc/blocs/app_states.dart';
import 'package:api_bloc/repos/repository.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(
        RepositoryProvider.of<UserRepo>(context),
      )..add(EventUserLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Bloc Demo"),
        ),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
          if (state is StateUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StateUserLoaded) {
            var data = state.users;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].avatar)),
                    title: Text("${data[index].fname} ${data[index].lname}"),
                  );
                });
          }
          return Container();
        }),
      ),
    );
  }
}
