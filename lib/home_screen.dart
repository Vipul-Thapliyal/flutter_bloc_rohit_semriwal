import 'package:bloc_app/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: BlocConsumer<InternetCubit, InternetState>(
            listener: (context, state) {
              // TODO: implement listener
              if(state == InternetState.Gained) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Internet Connected!"),
                    backgroundColor: Colors.green,
                  )
                );
              }
              else if(state == InternetState.Lost) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Internet not Connected!"),
                      backgroundColor: Colors.red,
                    )
                );
              }
            },
            builder: (context, state) {
              if(state == InternetState.Gained) {
                return const Text("Connected!");
              }
              else if(state == InternetState.Lost) {
                return const Text("Not Connected!");
              }
              else {
                return const Text("Loading....");
              }
            },
          ),
        ),
      ),
    );
  }
}
