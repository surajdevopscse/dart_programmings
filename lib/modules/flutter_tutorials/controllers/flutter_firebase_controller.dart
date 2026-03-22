import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterFirebaseController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Firebase is Google\'s Backend-as-a-Service platform. It provides Firestore (NoSQL database), Authentication, Cloud Storage, Cloud Functions, Analytics, and more. Use FlutterFire to integrate Firebase with Flutter.';
  String setupCode = '''# Install FlutterFire CLI
\$ dart pub global activate flutterfire_cli

# Configure Firebase for your Flutter project
\$ flutterfire configure

# This generates lib/firebase_options.dart

# pubspec.yaml dependencies
# firebase_core: ^2.24.0
# cloud_firestore: ^4.13.0
# firebase_auth: ^4.15.0
# firebase_storage: ^11.5.0

// main.dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}''';
  String firestoreCode = '''import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;

// CREATE — Add document
Future<void> addUser(String name, String email) async {
  await db.collection('users').add({
    'name': name,
    'email': email,
    'createdAt': FieldValue.serverTimestamp(),
  });

  // With specific document ID
  await db.collection('users').doc('user123').set({
    'name': name,
    'email': email,
  });
}

// READ — Get document
Future<Map<String, dynamic>?> getUser(String userId) async {
  final doc = await db.collection('users').doc(userId).get();
  return doc.data();
}

// UPDATE — Partial update
Future<void> updateUserName(String userId, String newName) async {
  await db.collection('users').doc(userId).update({
    'name': newName,
    'updatedAt': FieldValue.serverTimestamp(),
  });
}

// DELETE
Future<void> deleteUser(String userId) async {
  await db.collection('users').doc(userId).delete();
}

// QUERY
Future<List<Map<String, dynamic>>> getActiveUsers() async {
  final snapshot = await db.collection('users')
      .where('isActive', isEqualTo: true)
      .orderBy('createdAt', descending: true)
      .limit(20)
      .get();

  return snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList();
}

// REAL-TIME LISTENER
StreamBuilder<QuerySnapshot>(
  stream: db.collection('messages').orderBy('timestamp').snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData) return const CircularProgressIndicator();
    final docs = snapshot.data!.docs;
    return ListView.builder(
      itemCount: docs.length,
      itemBuilder: (context, i) => Text(docs[i]['text'] ?? ''),
    );
  },
)''';
  String authCode = '''import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

// Sign up with email and password
Future<UserCredential> signUp(String email, String password) async {
  return await auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
}

// Sign in
Future<UserCredential> signIn(String email, String password) async {
  return await auth.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
}

// Sign out
Future<void> signOut() => auth.signOut();

// Get current user
User? get currentUser => auth.currentUser;

// Listen to auth state changes
StreamBuilder<User?>(
  stream: auth.authStateChanges(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    }
    if (snapshot.hasData) {
      return const HomePage();
    }
    return const LoginPage();
  },
)

// Update profile
await auth.currentUser?.updateDisplayName('John Doe');
await auth.currentUser?.updatePhotoURL('https://example.com/photo.jpg');

// Send password reset email
await auth.sendPasswordResetEmail(email: 'user@example.com');''';
  List<String> tips = [
    'Always handle FirebaseException in try-catch blocks',
    'Use FirebaseFirestore.instance.enablePersistence() for offline support',
    'Structure Firestore data to minimize reads — flatten when possible',
    'Security Rules are critical — never leave Firestore open to all reads/writes',
    'Use Firebase Emulator Suite for local development and testing',
    'Cloud Functions trigger serverless code on database events',
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
      child: SideNavBarChildEnum.flutterFirebase,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterFirebase;
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
