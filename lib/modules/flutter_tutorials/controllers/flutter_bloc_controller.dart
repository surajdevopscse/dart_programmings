import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterBlocController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'BLoC (Business Logic Component) is an architecture pattern that separates business logic from UI. Events go in, States come out. Flutter BLoC package provides Cubit (simpler) and Bloc (events-based) implementations.';
  String cubitsCode = '''# pubspec.yaml
# dependencies:
#   flutter_bloc: ^8.1.0

// Cubit — simpler form of BLoC (no events)
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);  // initial state = 0

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  void reset() => emit(0);
}

// Usage with BlocProvider
BlocProvider(
  create: (context) => CounterCubit(),
  child: const CounterPage(),
)

// Reading with BlocBuilder
BlocBuilder<CounterCubit, int>(
  builder: (context, count) {
    return Text('Count: \$count');
  },
)

// Triggering methods
context.read<CounterCubit>().increment();''';
  String blocCode = '''// BLoC — events-based, more explicit
// 1. Define Events
abstract class AuthEvent {}
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}
class LogoutEvent extends AuthEvent {}

// 2. Define States
abstract class AuthState {}
class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final String username;
  AuthSuccess(this.username);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

// 3. Implement BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await Future.delayed(const Duration(seconds: 2)); // simulate API
        if (event.email == 'user@example.com') {
          emit(AuthSuccess('John Doe'));
        } else {
          emit(AuthError('Invalid credentials'));
        }
      } catch (e) {
        emit(AuthError('Something went wrong'));
      }
    });

    on<LogoutEvent>((event, emit) {
      emit(AuthInitial());
    });
  }
}''';
  String builderCode = '''// BlocBuilder — rebuilds on state change
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthBloc(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // Side effects — navigation, dialogs
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome, \${state.username}!')),
            );
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message), backgroundColor: Colors.red),
            );
          }
        },
        builder: (context, state) {
          // UI
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const TextField(decoration: InputDecoration(labelText: 'Email')),
              const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    LoginEvent('user@example.com', 'password'),
                  );
                },
                child: const Text('Login'),
              ),
            ],
          );
        },
      ),
    );
  }
}''';
  List<String> tips = [
    'Cubit is simpler — use it when events are straightforward method calls',
    'Bloc is better when you need to transform events (debounce, switchMap)',
    'BlocBuilder rebuilds UI; BlocListener handles side effects; BlocConsumer does both',
    'MultiBlocProvider at the app root provides Blocs to the entire tree',
    'Use equatable package to easily compare states and events',
    'Blocs are highly testable — test event → state transitions in isolation',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterBloc,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterBloc;
    update();
    super.onInit();
  }

  void scrollToTop() => scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
