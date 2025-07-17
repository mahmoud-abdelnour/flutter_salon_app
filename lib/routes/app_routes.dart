import 'package:certain_salon/common/screens/not_found_page.dart';
import 'package:certain_salon/common/screens/not_login_screen.dart';
import 'package:certain_salon/common/widgets/drawer.dart';
import 'package:certain_salon/components/appointment/screens/appointment_screen.dart';
import 'package:certain_salon/components/appointment/screens/appointment_success.dart';
import 'package:certain_salon/components/appointment/screens/guest_appointment_screen.dart';
import 'package:certain_salon/components/appointment/screens/user_appointments_screen.dart';
import 'package:certain_salon/components/auth/providers/auth_provider.dart';
import 'package:certain_salon/components/auth/screens/change_password.dart';
import 'package:certain_salon/components/auth/screens/login_screen.dart';
import 'package:certain_salon/components/gallery/screen/gallery_screen.dart';
import 'package:certain_salon/components/home/components/home_scaffold.dart';
//import 'package:certain_salon/components/home/components/profile.dart';
import 'package:certain_salon/components/home/screens/home_screen.dart';
import 'package:certain_salon/components/home/screens/home_screen_old.dart';
import 'package:certain_salon/components/profile/screens/profile_edit_screen.dart';
import 'package:certain_salon/components/profile/screens/profile_screen.dart';
import 'package:certain_salon/components/service/screens/service_details_screen.dart';
import 'package:certain_salon/components/splash/screens/splash_screen.dart';
import 'package:certain_salon/routes/route_names.dart';

import 'package:certain_salon/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:certain_salon/components/bottom_navigation_bar/widgets/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../components/auth/screens/signup_screen.dart';
import 'dart:convert';

class AppRouter {
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    navigatorKey: rootNavigatorKey,
    //initialLocation: RouteNames.signup.toPath,
    initialLocation: RouteNames.splash.toPath,

    //initialLocation: '/a',
    routes: <RouteBase>[
      StatefulShellRoute.indexedStack(
          parentNavigatorKey: rootNavigatorKey,
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return BottomNavigationBarWidget(navigationShell: navigationShell);
          },
          branches: <StatefulShellBranch>[
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/a',
                  builder: (BuildContext context, GoRouterState state) =>
                      const HomeScreen(),
                  //builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
                  //builder: (BuildContext context, GoRouterState state) => const SignupScreen(),
                  routes: <RouteBase>[
                    GoRoute(
                      path: 'service_details/:serviceId',
                      builder: (BuildContext context, GoRouterState state) =>
                          ServiceDetailsScreen(
                              serviceId: state.pathParameters['serviceId']),
                    ),
                    GoRoute(
                      path: 'appointments/:serviceId',
                      builder: (BuildContext context, GoRouterState state) {
                        var serviceId = state.pathParameters['serviceId']!;
                        var serviceId2 = int.parse(serviceId);
                        return AppointmentScreen(serviceId: serviceId2);
                      },
                      //AppointmentScreen(serviceId: int.parse(state.pathParameters['serviceId']!)),
                    ),
                    GoRoute(
                      path: 'login',
                      builder: (BuildContext context, GoRouterState state) {                        
                        return const LoginScreen();
                      },
                      //AppointmentScreen(serviceId: int.parse(state.pathParameters['serviceId']!)),
                    ),
                    GoRoute(
                      path: 'guest_appointment',
                      name: RouteNames.guestAppointment.toName,
                      builder: (BuildContext context, GoRouterState state) {                        
                        return const GuestAppointmentScreen();
                      },
                      //AppointmentScreen(serviceId: int.parse(state.pathParameters['serviceId']!)),
                    ),



                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/b',
                  builder: (BuildContext context, GoRouterState state) => AppointmentScreen(),
                  routes:  <RouteBase>[
                          GoRoute(
                            path: RouteNames.successAppointment.toPath,
                            name: RouteNames.successAppointment.toName,
                            builder: (BuildContext context, GoRouterState state) {                        
                              return const AppointmentSuccessScreen();
                            },
                            //AppointmentScreen(serviceId: int.parse(state.pathParameters['serviceId']!)),
                          ),
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/c',
                  builder: (BuildContext context, GoRouterState state) =>
                       GalleryScreen(),
                  routes: const <RouteBase>[
                  
                  ],
                ),
              ],
            ),
            StatefulShellBranch(
              routes: <RouteBase>[
                GoRoute(
                  path: '/d',
                  builder: (BuildContext context, GoRouterState state) =>
                      //const ProfileScreen(),
                      Consumer<AuthProvider>(
                          builder: (context, auth, child) =>  
                            auth.isLoggedIn()?const ProfileScreen():const NotLoggedInScreen()
                      ),
                      
                  routes:  <RouteBase>[
                      GoRoute(
                        path: '/user_appointments',
                        builder: (BuildContext context, GoRouterState state) {
                          return UserAppointmentsScreen();
                        },
                      ),
                      GoRoute(
                        path: '/user_password',
                        builder: (BuildContext context, GoRouterState state) {
                          return ProfileEditScreen();
                          //return const NotLoggedInScreen();
                          //return const NotFoundScreen();
                          //return const AppointmentSuccessScreen();
                          //return const GuestAppointmentScreen();
                        },
                      ),
                      GoRoute(
                        path: '/user_logout',
                        builder: (BuildContext context, GoRouterState state) {
                          return UserAppointmentsScreen();
                        },
                      ),
                  ],
                ),
              ],
            ),
          ]),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: RouteNames.signup.toPath,
        name: RouteNames.signup.toName,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RouteNames.home.toPath,
        name: RouteNames.home.toName,
        builder: (context, state) => HomePage(
          currentIndex: 1,
        ),
      ),
      GoRoute(
        path: RouteNames.splash.toPath,
        name: RouteNames.splash.toName,
        builder: (context, state) => const SplashScreen(),
        //builder: (context, state) =>   const HomeScaffoldScreen(),
      ),
      GoRoute(
        path: RouteNames.login.toPath,
        name: RouteNames.login.toName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.profile.toPath,
        name: RouteNames.profile.toName,
        builder: (context, state) => const ProfileScreen(),
      ),
      /* GoRoute(
        path: RouteNames.guestAppointment.toPath,
        name: RouteNames.guestAppointment.toName,
        builder: (context, state) => const GuestAppointmentScreen(),
      ), */
    ],
  );
}



/* 
class AppRouter {
  static GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: RouteNames.profile.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: RouteNames.home.toPath,
        name: RouteNames.home.toName,
        builder: (context, state) => HomePage(
          currentIndex: 1,
        ),
      ),
      GoRoute(
        path: RouteNames.splash.toPath,
        name: RouteNames.splash.toName,
        builder: (context, state) =>   const HomeScaffoldScreen(),
      ),
      GoRoute(
        path: RouteNames.login.toPath,
        name: RouteNames.login.toName,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.profile.toPath,
        name: RouteNames.profile.toName,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
}
 */
