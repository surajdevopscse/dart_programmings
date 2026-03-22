import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/clean_arch_controller.dart';

class CleanArchPage extends GetView<CleanArchController> {
  const CleanArchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              if (!AS.deviceScreenType.isMobile)
                SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  flexibleSpace: PageHeader(headerName: 'Clean Architecture'),
                  backgroundColor: C.primary50,
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: ScreenSpecific(
                    desktop: EdgeInsets.only(left: 54.0.w, right: 54.0.w),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonHeight(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: BigText(
                                text: 'Clean Architecture',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/clean-architecture', pageTitle: 'Clean Architecture'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'The Three Layers',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Clean Architecture divides code into Presentation (UI + controllers), Domain (business logic, use cases, entities), and Data (repositories, data sources, models). Dependencies point inward.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Domain layer — pure Dart, no Flutter
class GetUserUseCase {
  final UserRepository repository;
  GetUserUseCase(this.repository);
  Future<User> call(String id) => repository.getUser(id);
}

// Data layer — implements domain interfaces
class UserRepositoryImpl implements UserRepository {
  final ApiDataSource _api;
  UserRepositoryImpl(this._api);
  @override
  Future<User> getUser(String id) async {
    final dto = await _api.fetchUser(id);
    return dto.toDomain();
  }
}

// Presentation layer — GetX
class UserController extends GetxController {
  final GetUserUseCase _useCase;
  UserController(this._useCase);
  var user = Rxn<User>();
  Future<void> load(String id) async {
    user.value = await _useCase(id);
  }
}"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Repository Pattern',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Define repository interfaces in the domain layer. Implement them in the data layer. This allows swapping implementations (e.g., API vs local DB) without changing business logic.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Domain: abstract interface
abstract class UserRepository {
  Future<User> getUser(String id);
  Future<List<User>> getUsers();
  Future<void> saveUser(User user);
}

// Data: implementation
class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource _remote;
  final LocalDataSource _local;

  UserRepositoryImpl(this._remote, this._local);

  @override
  Future<User> getUser(String id) async {
    try {
      return await _remote.fetchUser(id);
    } catch (_) {
      return await _local.getUser(id); // fallback
    }
  }
}"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Dependency Injection with GetX',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use GetX bindings or Get.put/Get.lazyPut to wire dependencies. Register them in route bindings to keep initialization scoped.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(
        Get.find<RemoteDataSource>(),
        Get.find<LocalDataSource>(),
      ),
    );
    Get.lazyPut<GetUserUseCase>(
      () => GetUserUseCase(Get.find()),
    );
    Get.lazyPut<UserController>(
      () => UserController(Get.find()),
    );
  }
}"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<CleanArchController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary700,
                      onPressed: controller.scrollToTop,
                      child: const Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
