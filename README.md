# motivation












# 📱 Notification Demo - Flutter

## Kijan pou Monte Pwojè a

### Etap 1: Kreye pwojè Flutter
```bash
flutter create notification_demo
cd notification_demo
```

### Etap 2: Ranplase fichye yo
- Kopye `lib/main.dart` → nan dosye `lib/` ou a
- Kopye `pubspec.yaml` → nan rasin pwojè ou a

### Etap 3: Enstale depandans yo
```bash
flutter pub get
```

### Etap 4: Mete pèmisyon Android
Louvri `android/app/src/main/AndroidManifest.xml` epi ajoute:
```xml
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
<uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
<uses-permission android:name="android.permission.USE_EXACT_ALARM" />
```

Tou ajoute BroadcastReceiver yo (gade `AndroidManifest_INSTRUCTIONS.xml`)

### Etap 5: Kouri aplikasyon an
```bash
flutter run
```

---

## 5 Tip Notifikasyon nan Aplikasyon an

| Bouton | Tip | Eksplikasyon |
|--------|-----|--------------|
| Immediate Notification | Notifikasyon Imedyat | Parèt tousuit |
| Scheduled Notification | Notifikasyon Pwograme | Parèt apre 5 segonn |
| Repeating Notification | Notifikasyon Repetitif | Repete chak minit |
| Big Text Notification | Notifikasyon Tèks Long | Montre plis tèks |
| Action Button Notification | Notifikasyon ak Aksyon | Bouton Aksepte/Refize |

---

## Bibliyotèk Itilize
- `flutter_local_notifications: ^17.0.0`
- `timezone: ^0.9.0`
A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
