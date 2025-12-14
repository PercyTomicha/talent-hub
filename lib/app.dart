import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di.dart';
import 'core/router/app_router.dart';
import 'features/users/presentation/cubit/user_cubit.dart' show UserCubit;

class TalentHub extends StatelessWidget {
  const TalentHub({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<UserCubit>()..fetchUsers()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
