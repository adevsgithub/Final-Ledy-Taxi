import 'package:final_ledy_taxi_app/data/bloc/get%20user%20bloc/get_user_bloc.dart';
import 'package:final_ledy_taxi_app/ui/pages/home/addres_page.dart';
import 'package:final_ledy_taxi_app/ui/pages/registry/register_page_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GetUserBloc, UserState>(
        listener: (context, state) {
          if (state is GetUserSuccess) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AddresPage(state.userInfo)));
          } else if (state is UserInitial) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterPage1()));
          }
        },
        builder: (context, state) {
          if (state is GetUserErrorState) {
            return Center(child: Text('Oops, an error has occured!'));
          }
          return Center(child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }
}
