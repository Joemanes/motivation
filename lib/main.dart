import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const InitializationSettings initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  await flutterLocalNotificationsPlugin.initialize(initSettings);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.requestNotificationsPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'motive m',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

<<<<<<< HEAD
=======

>>>>>>> 1929150 ( notifikasyon)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward();

<<<<<<< HEAD
=======

>>>>>>> 1929150 ( notifikasyon)
    Future.delayed(const Duration(seconds: 6), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const NotificationScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade700,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.notifications_active,
                    size: 70,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  'motive m',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Notifikasyon pou chak moman',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 50),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  Future<void> showSportNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'sport_channel',
      'Notifikasyon Spò',
      channelDescription: 'Notifikasyon pou aktivite spò',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notifDetails =
        NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
      1,
      '⚽ Tan Spò!',
      'Leve kanpe! Kò ou bezwen mouvement. Fè egzèsis ou jodi a!',
      notifDetails,
    );
  }

  Future<void> showEtidNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'etid_channel',
      'Notifikasyon Etid',
      channelDescription: 'Notifikasyon pou rèvize ak etidye',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails notifDetails =
        NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      '📚 Tan pou Etidye!',
      'Konkou ap vini! Louvri liv ou epi kòmanse rèvize kounye a.',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      notifDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showSanteNotification() async {
    const BigTextStyleInformation bigTextStyle = BigTextStyleInformation(
      'Sante ou se richès ou! Sonje:\n'
      '• Bwè omwen 8 vè dlo pa jou\n'
      '• Dòmi 7-8 è pa nwit\n'
      '• Manje fwi ak legim chak jou\n'
      '• Verifye pulsasyon kè ou (60-100 bpm nòmal)',
      contentTitle: '❤️ Konsèy Sante Jounen an',
      summaryText: 'Pran swen kò ou',
    );
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'sante_channel',
      'Notifikasyon Sante',
      channelDescription: 'Konsèy sante ak byennèt',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigTextStyle,
    );
    const NotificationDetails notifDetails =
        NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
      3,
      '❤️ Konsèy Sante Jounen an',
      'Deplwaye pou wè konsèy sante ou yo...',
      notifDetails,
    );
  }

  Future<void> showRepoNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'repo_channel',
      'Notifikasyon Repo',
      channelDescription: 'Rapèl pou repoze kò ak lespri ',
      importance: Importance.max,
      priority: Priority.high,
      actions: <AndroidNotificationAction>[
        AndroidNotificationAction(
          'repose_action',
          '😴 Repoze Kounye a',
          showsUserInterface: false,
        ),
        AndroidNotificationAction(
          'later_action',
          '⏰ Pi Devan',
          showsUserInterface: false,
          cancelNotification: true,
        ),
      ],
    );
    const NotificationDetails notifDetails =
        NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.show(
      4,
      '😴 Tan Repo!',
      'Ou travay anpil. Kò ou bezwen repoze. Èske ou vle repoze kounye a?',
      notifDetails,
    );
  }

  Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('motive m'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildNotificationButton(
              label: '⚽ Spò',
              description: 'Rapèl pou fè egzèsis ak aktivite fizik',
              color: Colors.blue,
              onPressed: showSportNotification,
            ),
            const SizedBox(height: 12),
            _buildNotificationButton(
              label: '📚 Etid',
              description: 'Rapèl pou etidye ak rèvize (apre 5 segonn)',
              color: Colors.orange,
              onPressed: showEtidNotification,
            ),
            const SizedBox(height: 12),
            _buildNotificationButton(
              label: '❤️ Sante',
              description: 'Konsèy sante ak byennèt jounen an',
              color: Colors.red,
              onPressed: showSanteNotification,
            ),
            const SizedBox(height: 12),
            _buildNotificationButton(
              label: '😴 Repo',
              description: 'Rapèl pou repoze kò ak lespri ou',
              color: Colors.purple,
              onPressed: showRepoNotification,
            ),
            const Spacer(),
            OutlinedButton.icon(
              onPressed: cancelAllNotifications,
              icon: const Icon(Icons.cancel, color: Colors.grey),
              label: const Text(
                'Anile tout notifikasyon',
                style: TextStyle(color: Colors.grey),
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationButton({
    required String label,
    required String description,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        side: BorderSide(color: color, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
