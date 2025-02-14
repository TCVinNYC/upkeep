import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:upkeep/routes/auth_guard.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  late final AuthGuard _authGuard;

  AppRouter(
    ApiService apiService,
  ) {
    _authGuard = AuthGuard(apiService);
  }

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreenRoute.page, initial: true),
    // AutoRoute(
    //   page: PermissionOnboardingRoute.page,
    //   guards: [_authGuard, _duplicateGuard],
    // ),
    // AutoRoute(page: LoginRoute.page, guards: [_duplicateGuard]),
    // AutoRoute(page: ChangePasswordRoute.page),
    // AutoRoute(
    //   page: SearchRoute.page,
    //   guards: [_authGuard, _duplicateGuard],
    //   maintainState: false,
    // ),
    // CustomRoute(
    //   page: TabControllerRoute.page,
    //   guards: [_authGuard, _duplicateGuard],
    //   children: [
    //     AutoRoute(
    //       page: PhotosRoute.page,
    //       guards: [_authGuard, _duplicateGuard],
    //     ),
    //     AutoRoute(
    //       page: SearchRoute.page,
    //       guards: [_authGuard, _duplicateGuard],
    //       maintainState: false,
    //     ),
    //     AutoRoute(
    //       page: LibraryRoute.page,
    //       guards: [_authGuard, _duplicateGuard],
    //     ),
    //     AutoRoute(
    //       page: AlbumsRoute.page,
    //       guards: [_authGuard, _duplicateGuard],
    //     ),
    //   ],
    // transitionsBuilder: TransitionsBuilders.fadeIn,
    // ),
    // AutoRoute(page: SettingsRoute.page, guards: [_duplicateGuard]),
    // AutoRoute(page: SettingsSubRoute.page, guards: [_duplicateGuard]),
    // AutoRoute(page: AppLogRoute.page, guards: [_duplicateGuard]),
    // AutoRoute(page: AppLogDetailRoute.page, guards: [_duplicateGuard]),
  ];
}

final appRouterProvider = Provider(
  (ref) => AppRouter(
    ref.watch(apiServiceProvider),
  ),
);
