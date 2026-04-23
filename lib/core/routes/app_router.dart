import 'package:go_router/go_router.dart';

import '../../features/admin/add_parent_screen.dart';
import '../../features/admin/admin_shell.dart';
import '../../features/admin/admit_student_screen.dart';
import '../../features/admin/print_id_card_screen.dart';
import '../../features/admin/student_success_screen.dart';
import '../../features/auth/forgot_password_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/parent/parent_shell.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/student/guide_books_screen.dart';
import '../../features/student/short_notes_screen.dart';
import '../../features/student/student_shell.dart';
import '../../features/teacher/attendance_screen.dart';
import '../../features/teacher/gradebook_screen.dart';
import '../../features/teacher/teacher_shell.dart';
import 'route_names.dart';

GoRouter buildAppRouter({required bool isWeb}) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),

      /// student
      GoRoute(
        path: RouteNames.studentShell,
        builder: (context, state) => const StudentShell(),
      ),
      GoRoute(
        path: RouteNames.studentNotes,
        builder: (context, state) => const StudentShortNotesScreen(),
      ),
      GoRoute(
        path: RouteNames.studentBooks,
        builder: (context, state) => const StudentGuideBooksScreen(),
      ),

      /// parent
      GoRoute(
        path: RouteNames.parentShell,
        builder: (context, state) => const ParentShell(),
      ),

      /// teacher
      GoRoute(
        path: RouteNames.teacherShell,
        builder: (context, state) => const TeacherShell(),
      ),
      GoRoute(
        path: RouteNames.teacherGradebook,
        builder: (context, state) => const TeacherGradebookScreen(),
      ),
      GoRoute(
        path: RouteNames.teacherAttendance,
        builder: (context, state) => const TeacherAttendanceScreen(),
      ),

      /// admin
      GoRoute(
        path: RouteNames.adminShell,
        builder: (context, state) => const AdminShell(),
      ),
      GoRoute(
        path: RouteNames.adminAdmitStudent,
        builder: (context, state) => const AdmitStudentScreen(),
      ),
      GoRoute(
        path: RouteNames.adminAddParent,
        builder: (context, state) => const AddParentScreen(),
      ),
      GoRoute(
        path: RouteNames.adminSuccess,
        builder: (context, state) => const StudentSuccessScreen(),
      ),
      GoRoute(
        path: '/admin/print-id',
        builder: (context, state) => const PrintIdCardScreen(),
      ),
    ],
  );
}
