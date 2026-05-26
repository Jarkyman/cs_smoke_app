# 📋 TODO — Util Master (CS2 Smoke App)

> Genereret fra code review d. 23. maj 2026
> Version: 1.2.2+12

---

## Fase 1 — Kritiske Fixes (Gør appen stabil)

// DONE {M} [data, crash] (H): #1 — Fix uendelig rekursion i JsonDataHandler.loadData()

- **Fil:** `lib/core/helper/json_data_handler.dart`
- Hvis netværket fejler, fanger `fetchAndSaveData()` fejlen stille, data gemmes aldrig, og `loadData()` kalder sig selv rekursivt → StackOverflowError
- Tilføj retry-counter eller returner tom liste efter fejlet fetch
- [x] Implementeret
- [x] Testet

// DONE {M} [url, crash] (H): #2 — Fix \_launchUrl der ødelægger email/telefon/SMS URLs

- **Fil:** `lib/core/helper/utils.dart`
- `openEmail`, `openPhoneCall`, `openSMS` sender fulde URIs (`mailto:`, `tel:`, `sms:`) til `_launchUrl` som tilføjer `https://` eller `youtube://` foran → helt ødelagte URLs
- `https: //` på linje 35 er et Dart label, ikke en kommentar
- Adskil YouTube deep-linking fra generel URL-åbning
- [x] Implementeret
- [x] Testet

// DONE {M} [navigation, crash] (H): #3 — Fix null-cast crash i RadarScreen

- **Fil:** `lib/view/screens/radar_screen.dart` (linje ~66)
- `as String ?? ''` — castet sker før `??` evalueres → `_CastError` hvis arguments er null
- Ret til `as String? ?? ''`
- [x] Implementeret
- [x] Testet

// DONE {M} [architecture, bug] (H): #4a — Flyt utilViewModel.loadData() ud af build() i MapsScreen

- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~68)
- Side-effect i `build()` kan forårsage uendelige rebuild loops
- Flyt til `initState()` eller `didChangeDependencies()`
- [x] Implementeret
- [x] Testet

// DONE {M} [architecture, bug] (H): #4b — Flyt \_loadVideoIfNeeded() ud af build() i InfoScreen

- **Fil:** `lib/view/screens/info_screen.dart` (linje ~113)
- Side-effect i `build()` kalder `_controller.loadVideoById` under rebuilds
- Flyt til `didChangeDependencies()` eller `initState()`
- [x] Implementeret
- [x] Testet

// DONE {M} [lifecycle, crash] (H): #5 — Fix dispose() rækkefølge i RadarScreen

- **Fil:** `lib/view/screens/radar_screen.dart` (linje ~34-36)
- `super.dispose()` kaldes FØR `_bannerAd?.dispose()` — state er allerede disposed
- Tilføj manglende `@override` annotation
- Kald `super.dispose()` sidst
- [x] Implementeret
- [x] Testet

// DONE {M} [firebase, config] (H): #6 — Tilføj DefaultFirebaseOptions til Firebase init

- **Fil:** `lib/main.dart` (linje 17)
- `Firebase.initializeApp()` kaldes uden options — brug `DefaultFirebaseOptions.currentPlatform`
- [x] Implementeret
- [x] Testet

// DONE {M} [firebase, config] (H): #7 — Ret iOS Bundle ID i Firebase options

- **Fil:** `lib/firebase_options.dart` (linje 73)
- `iosBundleId: 'com.example.csSmokeApp.RunnerTests'` — det er test runner ID, ikke appens rigtige bundle ID
- Kør `flutterfire configure` igen for at generere korrekt fil
- [x] Implementeret
- [x] Testet

// DONE {M} [security, config] (H): #8 — Flyt hardcoded AdMob production IDs ud af source code

- **Fil:** `lib/core/helper/ad_helper.dart`
- Produktions ad unit IDs er hardcoded og commited til Git
- Brug `--dart-define` eller en `.env` fil der er `.gitignore`'d
- Tilføj `kDebugMode` check for automatisk brug af test-ads under udvikling
- [x] Implementeret
- [x] Testet

---

## Fase 2 — Memory Leaks & Stabilitet

// DONE {M} [memory, lifecycle] (H): #9 — Cancel stream subscription i MapsScreen

- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~52)
- `listenNotifications()` opretter stream listener men subscription gemmes aldrig
- Ingen `dispose()` override overhovedet
- `onClickedNotification` bruger `Navigator.of(context)` på potentielt disposed context
- Gem i `StreamSubscription` variabel og cancel i `dispose()`
- [x] Implementeret
- [x] Testet

// DONE {M} [memory, ads] (H): #10 — Dispose ads i AdViewModel

- **Fil:** `lib/core/viewmodels/ad_view_model.dart`
- `_bannerAd` og `_nativeAd` allokeres men har ingen `dispose()` override
- Native ad-objekter lækker memory
- Override `dispose()` og kald `.dispose()` på begge
- [x] Implementeret
- [x] Testet

// DONE {S} [memory, notifications] (H): #11 — Luk BehaviorSubject i NotificationApi

- **Fil:** `lib/core/helper/notification_api.dart` (linje ~9)
- `static final onNotifications = BehaviorSubject<String?>()` lukkes aldrig
- Tilføj en `dispose()` metode der kalder `.close()`
- [x] Implementeret
- [x] Testet

// DONE {M} [ads, crash] (H): #12 — Fix double-dispose af native ad i InfoScreen

- **Fil:** `lib/view/screens/info_screen.dart`
- Hvis ad fejler loading, kalder `onAdFailedToLoad` allerede `ad.dispose()`
- Widget's `dispose()` kalder `_nativeAd.dispose()` igen → crash
- Tilføj null-check eller bool flag for om ad er allerede disposed
- [x] Implementeret
- [x] Testet

// DONE {M} [notifications, bug] (H): #13 — Fix notifikations-spam ved hvert screen-push

- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~37-41)
- Ny notification skemalægges i `initState()` HVER gang MapsScreen pushes — uden at annullere gamle
- Kald `NotificationApi.cancelAll()` først, eller brug et unikt fast ID
- [x] Implementeret
- [x] Testet

// DONE {M} [performance, ads] (M): #14 — Fjern spin-wait polling loop i InfoScreen

- **Fil:** `lib/view/screens/info_screen.dart` (linje ~181-184)
- `Future.doWhile` poller hvert 10ms for at vente på ad — ekstremt spildfuldt
- `_nativeAdIsLoaded` sættes allerede via `setState` — brug det direkte i build
- Erstat med: `if (_nativeAdIsLoaded) AdWidget(ad: _nativeAd) else SizedBox.shrink()`
- [x] Implementeret
- [x] Testet

---

## Fase 3 — Kodekvalitet & Arkitektur

// DONE {M} [async, architecture] (H): #15 — Gør async metoder til Future<void> i stedet for void

- **Filer:**
  - `lib/core/viewmodels/settings_view_model.dart` — `saveSettings()`, `toggleNotification()`, `checkPermission()`, `askPermission()`
  - `lib/core/viewmodels/util_view_model.dart` — `loadData()`
  - `lib/core/helper/notification_api.dart` — `showScheduledNotification()`
- Når async-funktioner returnerer `void`, forsvinder fejl stille
- [x] Implementeret
- [x] Testet

// DONE {S} [async, bug] (H): #15b — Fix race condition i SettingsViewModel constructor

- **Fil:** `lib/core/viewmodels/settings_view_model.dart` (linje ~9-12)
- `loadSettings()` og `checkPermission()` er begge async men awaites aldrig i constructor
- Begge ændrer `_isNotification` — uforudsigelig rækkefølge
- [x] Implementeret
- [x] Testet

// DONE {M} [responsive, deprecated] (H): #16 — Erstat Dimensions med MediaQuery-baseret responsive sizing

- **Fil:** `lib/core/helper/dimensions.dart`
- `WidgetsBinding.instance.window` er deprecated siden Flutter 3.10
- Alle dimensioner beregnes statisk ved opstart og opdateres ALDRIG
- Brug `MediaQuery.sizeOf(context)` i stedet
- [x] Implementeret
- [x] Testet

// DONE {S} [ui, ux] (M): #17 — Erstat GestureDetector med InkWell for tap-feedback

- **Filer:**
  - `lib/view/widgets/buttons/menu_button.dart`
  - `lib/view/widgets/buttons/icon_button_close.dart`
  - `lib/view/widgets/buttons/rectangle_button.dart`
  - `lib/view/widgets/buttons/util_button.dart`
- Lige nu bruges `GestureDetector`, som ikke giver visuel feedback (ripple effect)
- [x] Implementeret
- [x] Testet

// DONE {S} [logging] (M): #18 — Erstat print() med debugPrint()/log() i hele kodebasen

- **Filer:** `ad_view_model.dart`, `json_data_handler.dart`, `info_screen.dart`, `maps_screen.dart`, `menu_screen.dart`, `radar_screen.dart`, `util_row.dart`, `utils.dart`
- `print()` forbliver i release builds og kan lække information
- Aktivér `avoid_print` lint-regel i `analysis_options.yaml`
- [x] Implementeret
- [x] Testet

// DONE {M} [state, architecture] (M): #19 — Tilføj loading/error states til ViewModels

- **Filer:** `UtilViewModel` osv.
- I øjeblikket antages det, at data altid er loadet korrekt, eller UI hænger hvis noget fejler (f.eks. `JSONDataHandler`).
- Tilføjet en `ViewState` enum (idle, loading, error, success)
- [x] Implementeret
- [x] Testet

// DONE {M} [code quality, enum] (M): #19b — Brug enums frem for strings/booleans i UtilViewModel

- **Filer:** `lib/core/viewmodels/util_view_model.dart`
- I stedet for string-matching ("Smoke", "Flash", osv.), bruges enums (`UtilType.smoke`, `UtilType.flash`).
- Sikrer type-safety og fjerner typo-risici.
- [x] Implementeret
- [x] Testet

// DONE {S} [responsive, bug] (M): #20 — Fix bredde-dimensioner der beregnes fra skærmhøjden

- **Fil:** `lib/core/helper/dimensions.dart` (linje ~29-34)
- `width5`, `width10` osv. dividerer `screenHeight` i stedet for `screenWidth`
- [x] Implementeret
- [x] Testet

// DONE {S} [deprecated] (M): #21 — Erstat Color.withOpacity() med withValues(alpha:)

- **Filer:** Flere UI filer bl.a.:
  - `floating_share_button.dart`
  - `floating_show_name_button.dart`
  - `icon_button_close.dart`
  - `rectangle_button.dart`
  - `util_button.dart`
  - `app_bar_card.dart`
- [x] Implementeret
- [x] Testet

// DONE {S} [architecture, model] (M): #22 — Flyt isSelected UI-state ud af UtilModel

- **Fil:** `lib/core/models/util_model.dart`
- `bool isSelected = false` er fjernet. Denne stat tilhører ViewModel'et, ikke i data model.
- [x] Implementeret
- [x] Testet

// DONE {S} [model, safety] (M): #23 — Gør model-felter final og fjern late keywords

- **Filer:**
  - `lib/core/models/info_model.dart`
  - `lib/core/models/util_model.dart`
- `late` felter er unødvendige og risikable — brug `final` med constructor initialization
- Tilføjet position-validering (længde-check på listen, falder tilbage til [0.0, 0.0] hvis den er tom)
- [x] Implementeret
- [x] Testet

// DONE {S} [platform, web] (M): #24 — Erstat dart:io Platform checks med defaultTargetPlatform

- **Fil:** `lib/view/screens/menu_screen.dart` (linje 1)
- `dart:io` import crasher på web
- Brugt `defaultTargetPlatform` fra `package:flutter/foundation.dart`
- [x] Implementeret
- [x] Testet

// DONE {S} [widget, bug] (M): #25 — Fix SkewedClipper hardcoded 60px og shouldReclip

- **Fil:** `lib/view/widgets/skewed_clipper.dart`
- 60 pixels er hardcoded — ikke responsivt
- `shouldReclip` returnerer altid `false` — clippen opdateres aldrig selv om `skewLeft` ændres
- Implementeret med width procenter og korrekt shouldReclip
- [x] Implementeret
- [x] Testet

// DONE {S} [naming, convention] (M): #26 — Ret klasse-navne med lowercase til UpperCamelCase

- **Filer:**
  - `lib/view/widgets/ads/ad_banner_widget.dart` — `adBannerWidget` → `AdBannerWidget`
  - `lib/view/widgets/ads/ad_native_widget.dart` — `adNativeWidget` → `AdNativeWidget`
- [x] Implementeret
- [x] Testet

// DONE {S} [ads, null-safety] (M): #27 — Fix nullable ad-felter der force-unwrappes med !

- **Filer:**
  - `lib/view/widgets/ads/ad_banner_widget.dart`
  - `lib/view/widgets/ads/ad_native_widget.dart`
- Constructoren tager nu required, non-nullable parametre, som sikrer compiler-checks i resten af koden.
- [x] Implementeret
- [x] Testet

// DONE {S} [ui, scroll] (M): #28 — Fix NeverScrollableScrollPhysics på indholdsområde i InfoScreen

- **Fil:** `lib/view/screens/info_screen.dart` (linje ~159)
- `ListView` med `NeverScrollableScrollPhysics` — indhold under video kan ikke scrolles
- Hvis skærmen er lille, er controls og ad afskåret
- Rettet: `NeverScrollableScrollPhysics` fjernet, ListView'en ruller nu korrekt på alle skærmstørrelser.
- [x] Implementeret
- [x] Testet

// DONE {S} [data, cache] (M): #29 — Tilføj cache-invalidering og TTL på JSON data

- **Fil:** `lib/core/helper/json_data_handler.dart`
- GitHub Gist URL uden commit SHA — kan give forældet data
- Cached data refreshes aldrig — ingen TTL
- `SharedPreferences` bruges til potentielt stor JSON — har size-begrænsninger (~1MB Android)
- Rettet: Data caches nu i filsystemet via path_provider (bortset fra web, hvor det forbliver i SharedPreferences). Tilføjet tjek af en timestamp, der invalidere cachen efter 48 timer.
- [x] Implementeret
- [x] Testet

// DONE {S} [config, version] (M): #30 — Fix hardcoded app-version i Constants

- **Fil:** `lib/core/helper/constants.dart`
- `APP_VERSION = '1.2.0'` men pubspec siger `1.2.2`
- `APP_BUILD_VERSION = '3'` men pubspec siger `+12`
- Omskrevet til at bruge `package_info_plus` dynamisk
- [x] Implementeret
- [x] Testet

// DONE {C} [naming, convention] (L): #31 — Ret SCREAMING_SNAKE_CASE til lowerCamelCase i Constants

- **Fil:** `lib/core/helper/constants.dart`
- Dart-konventionen er `lowerCamelCase` for konstanter
- [x] Implementeret
- [x] Testet

// DONE {C} [architecture] (L): #32 — Erstat abstract class med final class + privat constructor

- **Fil:** `lib/view/shared/global.dart`
- `abstract class Global` → `final class Global { Global._(); ... }`
- [x] Implementeret
- [x] Testet

// DONE {S} [lifecycle, bug] (M): #33 — Flyt SystemChrome.setPreferredOrientations ud af build()

- **Fil:** `lib/main.dart`
- Kaldet til at låse orientation lå før i `build()` og kørte ved hvert redraw
- Er nu flyttet til `main()`
- [x] Implementeret
- [x] Testet

// DONE {C} [security, env] (L): #34 — Gennemgå appen for andre hardcodede URLs/nøgler til .env

- Tjek om der findes andre hemmeligheder, API-nøgler eller URLs som burde ligge i `.env` i stedet for at være hardcodet.
- Eksempel: Firebase konfiguration (hvis relevant), andre API endpoints, analytics keys.
- Rettet: `SHARE_APP_URL` er nu flyttet til `.env` og trækkes via `dotenv` i `menu_screen`.
- Firebase konfigurationen genereres af `flutterfire` i `firebase_options.dart`. Den anbefales at forblive i sin auto-genererede fil, da den indeholder non-secret konfigurationsdetaljer til Firebase SDK, som alligevel vil blive overskrevet, næste gang FlutterFire køres.
- [x] Implementeret
- [x] Testet

// DONE {S} [permissions, async] (M): #35 — Await notification permission request i main()

- **Fil:** `lib/main.dart` (linje 23-26)
- `Permission.notification.request()` er async og blev ikke awaitet.
- Appen venter nu rent faktisk på brugerens godkendelse/afvisning, før den går videre.
- [x] Implementeret
- [x] Testet

---

## Fase 4 — Polish & Cleanup

// DONE {S} [logging, cleanup] (M): #35 — Fjern alle print() statements og aktivér avoid_print lint

- 8+ filer har `print()` — se #18 for fuld liste (Dette blev faktisk gjort i #18)
- Tilføjet `avoid_print: true` i `analysis_options.yaml` (Allerede aktiveret via flutter_lints)
- [x] Implementeret
- [x] Testet

// DONE {C} [i18n, cleanup] (L): #36 — Standardiser sprog i kommentarer og fejlbeskeder

- Filer som `json_data_handler.dart`, `radar_screen.dart`, `youtube_controls.dart` havde danske kommentarer og throw Exceptions
- Nu er alt på engelsk
- [x] Implementeret

// DONE {C} [cleanup] (L): #37 — Fjern dead code og kommenteret kode

- `lib/core/helper/ad_helper.dart` — test ad class udkommenteret (Slettet)
- `lib/view/screens/menu_screen.dart` — test notification kode (Slettet)
- `lib/view/widgets/youtube/youtube_controls.dart` — udkommenteret PlayerStateSection (Slettet)
- `lib/view/widgets/youtube/youtube_video_position_seek_and_play.dart` — mute-knap + `_isMuted` ValueNotifier ubrugt (Slettet)
- `lib/main.dart` — SystemUiMode udkommenteret (Slettet)
- Har kørt `dart format lib/`
- [x] Implementeret

// TODO {M} [testing] (H): #38 — Tilføj rigtige tests (der er nul i dag)

- **Fil:** `test/widget_test.dart`
- Den eneste test er default counter-test fra `flutter create` — tester `Icons.add` og counter der ikke eksisterer
- Prioritér tests for:
  - [ ] UtilViewModel state-overgange
  - [ ] JsonDataHandler fejlhåndtering + rekursion
  - [ ] Model parsing fra JSON (edge cases)
  - [ ] Navigation mellem skærme

// DONE {S} [a11y] (M): #39 — Tilføj accessibility labels på alle interaktive elementer

- FloatingActionButtons mangler `tooltip`
- GestureDetectors mangler `Semantics` wrapping
- Billeder mangler `semanticLabel`
- **Filer:** Alle button widgets + `grid_view_widget.dart`
- [x] Implementeret
- [x] Testet

// TODO {W} [architecture] (L): #40 — Erstat custom Pos klasse med Flutters Offset

- **Fil:** `lib/core/viewmodels/radar_view_model.dart` (linje ~106)
- Custom `Pos(x, y)` har utyped parametre (dynamic) — brug `Offset` i stedet
- [ ] Implementeret

// DONE {C} [cleanup] (L): #41 — Dokumentér magic numbers eller gør dem til named constants

- `lib/core/helper/dimensions.dart` — divisorer: 105.5, 84.4, 56.27, 70.333
- `lib/core/viewmodels/radar_view_model.dart` — scale-limits: 2.0, 4.0
- `lib/view/widgets/skewed_clipper.dart` — 60px hardcoded
- `lib/view/widgets/appbar/app_bar_card.dart` — +28 offset
- [x] Implementeret

// DONE {S} [a11y, ux] (M): #42 — Tilføj Semantics/Tooltip til alle knapper og interaktive elementer

- Se #39 — ingen af appens elementer har accessibility labels
- [x] Implementeret

// DONE {S} [network, resilience] (M): #43 — Tilføj HTTP timeout på data-fetch

- **Fil:** `lib/core/helper/json_data_handler.dart`
- `http.get(Uri.parse(url))` har ingen timeout — kan hænge uendeligt
- Brug `.timeout(Duration(seconds: 20))`
- [x] Implementeret
- [x] Testet

// DONE {S} [android, config] (M): #44 — Ret Android namespace fra com.example til produktions-ID

- **Fil:** `android/app/build.gradle` (linje 39)
- `namespace "com.example.cs_smoke_app"` — bør matche `applicationId` (`com.hartvig_develop.util_master`)
- [x] Implementeret
- [x] Testet

// DONE {C} [ads, architecture] (L): #45 — Fix AdViewModel — tilføj getters og notifyListeners

- **Fil:** `lib/core/viewmodels/ad_view_model.dart`
- `_bannerAd` og `_nativeAd` gemmes men har ingen getters — UI'et kan ikke tilgå dem
- `loadAd()` kalder ikke `notifyListeners()` når ad er loadet
- [x] Implementeret
- [x] Testet

// DONE {C} [cleanup] (L): #46 — Ret stavefejl i log-beskeder og fjern redundante checks

- **Fil:** `lib/core/viewmodels/settings_view_model.dart` — "premission" → "permission" (6 gange)
- **Fil:** `lib/core/helper/utils.dart` — redundant `Platform.isIOS` check inde i iOS-blok (Allerede fixet)
- [x] Implementeret

---

## Fase 5 — Fremtidige / Extra Tasks

// DONE {M} [UI, UX] (H): #47 — Add Cache map to callouts, map logo, maps, radar.

// TODO {M} [Feature] (H): #49 — Add yor own vidoe from instagram, youtube, tiktok, etc. to map. This need to be specified in a bigger refactor plan.

// DONE {M} [UI, UX] (H): #51 — Add a splash/launcher screen native for Android and iOS.

- [x] Tilføjet `flutter_native_splash` og genereret native splash-skærm for både iOS og Android baseret på din HSL tailormade baggrundsfarve `#02010F` og dit højopløselige `Logo.png` asset.

// DONE {S} [audio] (M): #52 — Add sound to notification. Find sound to use.

- [x] Konfigureret med nem placeholder support i `NotificationApi` (lyd-filer klar til drop-in i raw/ og Resources/)

// DONE {M} [performance] (H): #53 — Investigate/fix Android "Skipped 52 frames! The application may be doing too much work on its main thread." on startup.

- [x] Omskrevet `main()` til at køre tunge SDK initialiseringer (MobileAds, Review, Constants, Timezones) asynkront i baggrunden uden at blokere den første frame
- [x] Flyttet anmodning om notifikationstilladelse til post-frame callback for at undgå sort skærm ved opstart

// DONE {S} [ads] (M): #54 — No native ad on info screen on Android device, investigate why.

- [x] Root cause: emulator had outdated Google Play Services (found 231818044, required 252431000)
- [x] Confirmed working on real device and updated emulator — code is correct

// DONE {M} [backend] (H): #55 — User rating system (thumbs up/down on videos). Free backend (Firebase Firestore free tier). Includes reporting flagged videos via predefined options. this should not be visable for the user, only for me in firebase, no read only send when selected. Save the like/dislike lokally, when or if the user changes their mind, update the backend and local storage. This is to get an idea of which videos are most useful for users. Also add a flag/report function, so users can report if a video is outdated or wrong, this should also be saved in the backend and not visible to the user. give 3 or 5 pre difind options to select form when reporting, like "outdated video", "wrong data", "video do not work", ect. no text field to specify if other is selected, thats not needed. Its okay to select more than one option when reporting. This is to get an idea of which videos are most useful for users and which ones need to be updated or removed.

// DONE {M} [analytics] (H): #56 — Optimize Google Analytics. Track active users, selected maps, ad clicks. Filter out default noise events like user_engagement, screen_view, session_start. Add Crashlytics.

- [x] Created `lib/core/helper/analytics_helper.dart` — centralized analytics service with structured events
- [x] `map_selected` event: logged when user taps a map (replaces raw event name that broke Firebase naming rules)
- [x] `util_selected` event: logged on smoke/flash/molotov toggle with util_type, team, map_name params
- [x] `ad_clicked` event: logged via `onAdClicked` callback in NativeAdListener on InfoScreen
- [x] Added `firebase_crashlytics: ^5.2.2` to pubspec.yaml
- [x] Crashlytics wired up in `main.dart`: `FlutterError.onError` + `PlatformDispatcher.instance.onError`
- [ ] Filter noise events (user_engagement, screen_view, session_start) in Firebase Console → Events → Manage

// DONE {M} [i18n] (H): #57 — Language implementation using official flutter_localizations. Supported: English, Russian, Turkish, Portuguese (BR), Chinese, Spanish, German, Polish, Danish, Swedish, Norwegian, Finnish, Mongolian, Romanian, French, Japanese, Ukrainian.

- [ ] lille bug, hvis jeg skifter sprog så husker den det ikke til næste opstart.

---

## 📦 Forældede Packages (fra Pubgrade)

// DONE {M} [dependencies] (H): #50 — Opdater alle forældede packages

### 🔴 Breaking Changes (major version bump)

- [x] `bordered_text` 2.0.0 → 3.0.2
- [x] `firebase_analytics` 11.6.0 → 12.4.1
- [x] `firebase_core` 3.15.2 → 4.9.0
- [x] `flutter_local_notifications` 18.0.1 → 21.0.0
- [x] `flutter_timezone` 4.1.1 → 5.0.2
- [x] `google_mobile_ads` 6.0.0 → 8.0.0
- [x] `permission_handler` 11.4.0 → 12.0.1
- [x] `share_plus` 10.1.4 → 13.1.0
- [x] `youtube_player_iframe` 5.2.2 → 6.0.0

### 🟡 Minor Updates (bør være bagudkompatible)

- [x] `cupertino_icons` 1.0.8 → 1.0.9
- [x] `http` 1.5.0 → 1.6.0
- [x] `rate_my_app` 2.3.2 → 2.4.0
- [x] `shared_preferences` 2.5.3 → 2.5.5

### ✅ Tjek status

- [x] `flutter_launch_store` 1.0.8 — stadig vedligeholdt ✅ (v1.0.8 udgivet juli 2024, inkl. Gradle-fixes)
- [x] `rxdart` 0.28.0 — up to date ✅
- [x] `url_launcher` 6.3.2 — up to date ✅
- [x] `flutter_lints` 6.0.0 — up to date ✅
- [x] `provider` 6.1.5+1 — up to date ✅

> [!WARNING]
> 9 packages har **breaking changes** — opdater dem én ad gangen og test grundigt efter hver opdatering. Start med `firebase_core` + `firebase_analytics` da mange andre packages afhænger af Firebase.

---

## 📊 Statistik

| Kategori    | MoSCoW | Antal |
| ----------- | ------ | ----- |
| Must Have   | {M}    | 18    |
| Should Have | {S}    | 22    |
| Could Have  | {C}    | 7     |
| Won't Have  | {W}    | 0     |

| Prioritet  | Antal |
| ---------- | ----- |
| (H) High   | 18    |
| (M) Medium | 21    |
| (L) Low    | 8     |
