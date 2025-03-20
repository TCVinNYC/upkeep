import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upkeep_mobile/providers/api.provider.dart';
import 'package:upkeep_mobile/providers/gallery_permission.provider.dart';
import 'package:upkeep_mobile/routes/auth_guard.dart';
import 'package:upkeep_mobile/routes/duplicate_guard.dart';
import 'package:upkeep_mobile/services/api.service.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  late final AuthGuard _authGuard;
  late final DuplicateGuard _duplicateGuard;

  AppRouter(
    ApiService apiService,
    GalleryPermissionNotifier galleryPermissionNotifier,
  ) {
    _authGuard = AuthGuard(apiService);
    _duplicateGuard = DuplicateGuard();
    // _backupPermissionGuard = BackupPermissionGuard(galleryPermissionNotifier);
  }

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  late final List<AutoRoute> routes = [
    // AutoRoute(page: SplashScreenRoute.page, initial: true),
    // AutoRoute(
    //   page: PermissionOnboardingRoute.page,
    //   guards: [_authGuard, _duplicateGuard],
    // ),
    // AutoRoute(page: LoginRoute.page, guards: [_duplicateGuard]),
    // AutoRoute(page: ChangePasswordRoute.page),
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
    //   transitionsBuilder: TransitionsBuilders.fadeIn,
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
    ref.watch(galleryPermissionNotifier.notifier),
  ),
);
