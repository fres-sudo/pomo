import 'package:pine/pine.dart';
import 'package:pomo/models/user/user.dart';
import 'package:pomo/services/network/user/user_service_v2.dart';
import "package:supabase_flutter/supabase_flutter.dart" as supa;

class UserMapper extends Mapper<supa.User, Future<User>> {
  final UserServiceV2 userService;
  const UserMapper({required this.userService});

  @override
  Future<User> from(supa.User from) async {
    final user = await userService.getUserProfile(from.id);
    return User(
      id: user["id"],
      email: user["email"],
      username: user["username"],
      createdAt: user["created_at"],
      avatar: user["avatar"],
      onboardingCompletedAt: user["onboarding_completed_at"],
    );
  }

  @override
  supa.User to(Future<User> to) => throw UnimplementedError();
}
