# 📋 TODO — Util Master (CS2 Smoke App)

> Genereret fra code review d. 23. maj 2026
> Version: 1.2.2+12

---

## Fase 1 — Kritiske Fixes (Gør appen stabil)

// FIXME {M} [data, crash] (H): #1 — Fix uendelig rekursion i JsonDataHandler.loadData()
- **Fil:** `lib/core/helper/json_data_handler.dart`
- Hvis netværket fejler, fanger `fetchAndSaveData()` fejlen stille, data gemmes aldrig, og `loadData()` kalder sig selv rekursivt → StackOverflowError
- Tilføj retry-counter eller returner tom liste efter fejlet fetch
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [url, crash] (H): #2 — Fix _launchUrl der ødelægger email/telefon/SMS URLs
- **Fil:** `lib/core/helper/utils.dart`
- `openEmail`, `openPhoneCall`, `openSMS` sender fulde URIs (`mailto:`, `tel:`, `sms:`) til `_launchUrl` som tilføjer `https://` eller `youtube://` foran → helt ødelagte URLs
- `https: //` på linje 35 er et Dart label, ikke en kommentar
- Adskil YouTube deep-linking fra generel URL-åbning
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [navigation, crash] (H): #3 — Fix null-cast crash i RadarScreen
- **Fil:** `lib/view/screens/radar_screen.dart` (linje ~66)
- `as String ?? ''` — castet sker før `??` evalueres → `_CastError` hvis arguments er null
- Ret til `as String? ?? ''`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [architecture, bug] (H): #4a — Flyt utilViewModel.loadData() ud af build() i MapsScreen
- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~68)
- Side-effect i `build()` kan forårsage uendelige rebuild loops
- Flyt til `initState()` eller `didChangeDependencies()`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [architecture, bug] (H): #4b — Flyt _loadVideoIfNeeded() ud af build() i InfoScreen
- **Fil:** `lib/view/screens/info_screen.dart` (linje ~113)
- Side-effect i `build()` kalder `_controller.loadVideoById` under rebuilds
- Flyt til `didChangeDependencies()` eller `initState()`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [lifecycle, crash] (H): #5 — Fix dispose() rækkefølge i RadarScreen
- **Fil:** `lib/view/screens/radar_screen.dart` (linje ~34-36)
- `super.dispose()` kaldes FØR `_bannerAd?.dispose()` — state er allerede disposed
- Tilføj manglende `@override` annotation
- Kald `super.dispose()` sidst
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [firebase, config] (H): #6 — Tilføj DefaultFirebaseOptions til Firebase init
- **Fil:** `lib/main.dart` (linje 17)
- `Firebase.initializeApp()` kaldes uden options — brug `DefaultFirebaseOptions.currentPlatform`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [firebase, config] (H): #7 — Ret iOS Bundle ID i Firebase options
- **Fil:** `lib/firebase_options.dart` (linje 73)
- `iosBundleId: 'com.example.csSmokeApp.RunnerTests'` — det er test runner ID, ikke appens rigtige bundle ID
- Kør `flutterfire configure` igen for at generere korrekt fil
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [security, config] (H): #8 — Flyt hardcoded AdMob production IDs ud af source code
- **Fil:** `lib/core/helper/ad_helper.dart`
- Produktions ad unit IDs er hardcoded og commited til Git
- Brug `--dart-define` eller en `.env` fil der er `.gitignore`'d
- Tilføj `kDebugMode` check for automatisk brug af test-ads under udvikling
- [ ] Implementeret
- [ ] Testet

---

## Fase 2 — Memory Leaks & Stabilitet

// FIXME {M} [memory, lifecycle] (H): #9 — Cancel stream subscription i MapsScreen
- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~52)
- `listenNotifications()` opretter stream listener men subscription gemmes aldrig
- Ingen `dispose()` override overhovedet
- `onClickedNotification` bruger `Navigator.of(context)` på potentielt disposed context
- Gem i `StreamSubscription` variabel og cancel i `dispose()`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [memory, ads] (H): #10 — Dispose ads i AdViewModel
- **Fil:** `lib/core/viewmodels/ad_view_model.dart`
- `_bannerAd` og `_nativeAd` allokeres men har ingen `dispose()` override
- Native ad-objekter lækker memory
- Override `dispose()` og kald `.dispose()` på begge
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [memory, notifications] (H): #11 — Luk BehaviorSubject i NotificationApi
- **Fil:** `lib/core/helper/notification_api.dart` (linje ~9)
- `static final onNotifications = BehaviorSubject<String?>()` lukkes aldrig
- Tilføj en `dispose()` metode der kalder `.close()`
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [ads, crash] (H): #12 — Fix double-dispose af native ad i InfoScreen
- **Fil:** `lib/view/screens/info_screen.dart`
- Hvis ad fejler loading, kalder `onAdFailedToLoad` allerede `ad.dispose()`
- Widget's `dispose()` kalder `_nativeAd.dispose()` igen → crash
- Tilføj null-check eller bool flag for om ad er allerede disposed
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [notifications, bug] (H): #13 — Fix notifikations-spam ved hvert screen-push
- **Fil:** `lib/view/screens/maps_screen.dart` (linje ~37-41)
- Ny notification skemalægges i `initState()` HVER gang MapsScreen pushes — uden at annullere gamle
- Kald `NotificationApi.cancelAll()` først, eller brug et unikt fast ID
- [ ] Implementeret
- [ ] Testet

// FIXME {M} [performance, ads] (M): #14 — Fjern spin-wait polling loop i InfoScreen
- **Fil:** `lib/view/screens/info_screen.dart` (linje ~181-184)
- `Future.doWhile` poller hvert 10ms for at vente på ad — ekstremt spildfuldt
- `_nativeAdIsLoaded` sættes allerede via `setState` — brug det direkte i build
- Erstat med: `if (_nativeAdIsLoaded) AdWidget(ad: _nativeAd) else SizedBox.shrink()`
- [ ] Implementeret
- [ ] Testet

---

## Fase 3 — Kodekvalitet & Arkitektur

// TODO {M} [async, architecture] (H): #15 — Gør async metoder til Future<void> i stedet for void
- **Filer:**
  - `lib/core/viewmodels/settings_view_model.dart` — `saveSettings()`, `toggleNotification()`, `checkPermission()`, `askPermission()`
  - `lib/core/viewmodels/util_view_model.dart` — `loadData()`
  - `lib/core/helper/notification_api.dart` — `showScheduledNotification()`
- Når async-funktioner returnerer `void`, forsvinder fejl stille
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [async, bug] (H): #15b — Fix race condition i SettingsViewModel constructor
- **Fil:** `lib/core/viewmodels/settings_view_model.dart` (linje ~9-12)
- `loadSettings()` og `checkPermission()` er begge async men awaites aldrig i constructor
- Begge ændrer `_isNotification` — uforudsigelig rækkefølge
- [ ] Implementeret
- [ ] Testet

// TODO {M} [responsive, deprecated] (H): #16 — Erstat Dimensions med MediaQuery-baseret responsive sizing
- **Fil:** `lib/core/helper/dimensions.dart`
- `WidgetsBinding.instance.window` er deprecated siden Flutter 3.10
- Alle dimensioner beregnes statisk ved opstart og opdateres ALDRIG
- Brug `MediaQuery.sizeOf(context)` i stedet
- [ ] Implementeret
- [ ] Testet

// TODO {S} [ui, ux] (M): #17 — Erstat GestureDetector med InkWell for tap-feedback
- **Filer:**
  - `lib/view/widgets/buttons/menu_button.dart`
  - `lib/view/widgets/buttons/icon_button_close.dart`
  - `lib/view/widgets/buttons/rectangle_button.dart`
  - `lib/view/widgets/buttons/util_button.dart`
- Ingen ripple-effekt, ingen focus-håndtering, ingen hover-states
- [ ] Implementeret
- [ ] Testet

// TODO {S} [logging] (M): #18 — Erstat print() med debugPrint()/log() i hele kodebasen
- **Filer:** `ad_view_model.dart`, `json_data_handler.dart`, `info_screen.dart`, `maps_screen.dart`, `menu_screen.dart`, `radar_screen.dart`, `util_row.dart`, `utils.dart`
- `print()` forbliver i release builds og kan lække information
- Aktivér `avoid_print` lint-regel i `analysis_options.yaml`
- [ ] Implementeret
- [ ] Testet

// TODO {M} [state, architecture] (M): #19 — Tilføj loading/error states til ViewModels
- **Fil:** `lib/core/viewmodels/util_view_model.dart`
- Ingen `isLoading`, `hasError`, `errorMessage` felter
- `loadData()` kalder aldrig `notifyListeners()` når data er loadet
- UI kan ikke vise loading-indikator eller fejlbesked
- [ ] Implementeret
- [ ] Testet

// TODO {S} [architecture, state] (M): #19b — Brug enums i stedet for string-matching og booleans i UtilViewModel
- **Fil:** `lib/core/viewmodels/util_view_model.dart`
- 6 booleans (`_isSmokeT`, `_isSmokeCt`, osv.) bør erstattes af ét enum
- `toggleUtil()` bruger magic strings (`'smokeT'`, `'smokeCt'`) — fejlprone
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [responsive, bug] (M): #20 — Fix bredde-dimensioner der beregnes fra skærmhøjden
- **Fil:** `lib/core/helper/dimensions.dart` (linje ~29-34)
- `width5`, `width10` osv. dividerer `screenHeight` i stedet for `screenWidth`
- [ ] Implementeret
- [ ] Testet

// TODO {S} [deprecated] (M): #21 — Erstat Color.withOpacity() med withValues(alpha:)
- **Filer:**
  - `lib/view/widgets/buttons/floating_share_button.dart`
  - `lib/view/widgets/buttons/floating_show_name_button.dart`
  - `lib/view/widgets/buttons/icon_button_close.dart`
  - `lib/view/widgets/buttons/rectangle_button.dart`
  - `lib/view/widgets/buttons/util_button.dart`
  - `lib/view/widgets/appbar/app_bar_card.dart`
- [ ] Implementeret
- [ ] Testet

// TODO {S} [architecture, model] (M): #22 — Flyt isSelected UI-state ud af UtilModel
- **Fil:** `lib/core/models/util_model.dart`
- `bool isSelected = false` er UI-state der hører i ViewModel'et, ikke i data model
- [ ] Implementeret
- [ ] Testet

// TODO {S} [model, safety] (M): #23 — Gør model-felter final og fjern late keywords
- **Filer:**
  - `lib/core/models/info_model.dart`
  - `lib/core/models/util_model.dart`
- `late` felter er unødvendige og risikable — brug `final` med constructor initialization
- Tilføj position-validering (længde-check på listen)
- [ ] Implementeret
- [ ] Testet

// TODO {S} [platform, web] (M): #24 — Erstat dart:io Platform checks med defaultTargetPlatform
- **Fil:** `lib/view/screens/menu_screen.dart` (linje 1)
- `dart:io` import crasher på web
- Brug `defaultTargetPlatform` fra `package:flutter/foundation.dart`
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [widget, bug] (M): #25 — Fix SkewedClipper hardcoded 60px og shouldReclip
- **Fil:** `lib/view/widgets/skewed_clipper.dart`
- 60 pixels er hardcoded — ikke responsivt
- `shouldReclip` returnerer altid `false` — clippen opdateres aldrig selv om `skewLeft` ændres
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [naming, convention] (M): #26 — Ret klasse-navne med lowercase til UpperCamelCase
- **Filer:**
  - `lib/view/widgets/ads/ad_banner_widget.dart` — `adBannerWidget` → `AdBannerWidget`
  - `lib/view/widgets/ads/ad_native_widget.dart` — `adNativeWidget` → `AdNativeWidget`
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [ads, null-safety] (M): #27 — Fix nullable ad-felter der force-unwrappes med !
- **Filer:**
  - `lib/view/widgets/ads/ad_banner_widget.dart`
  - `lib/view/widgets/ads/ad_native_widget.dart`
- Constructoren tager `required BannerAd? bannerAd` (nullable) men bruger `_bannerAd!` (force-unwrap)
- Gør enten parameteren non-nullable, eller håndter null-casen
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [ui, scroll] (M): #28 — Fix NeverScrollableScrollPhysics på indholdsområde i InfoScreen
- **Fil:** `lib/view/screens/info_screen.dart` (linje ~159)
- `ListView` med `NeverScrollableScrollPhysics` — indhold under video kan ikke scrolles
- Hvis skærmen er lille, er controls og ad afskåret
- [ ] Implementeret
- [ ] Testet

// TODO {S} [data, cache] (M): #29 — Tilføj cache-invalidering og TTL på JSON data
- **Fil:** `lib/core/helper/json_data_handler.dart`
- GitHub Gist URL uden commit SHA — kan give forældet data
- Cached data refreshes aldrig — ingen TTL
- `SharedPreferences` bruges til potentielt stor JSON — har size-begrænsninger (~1MB Android)
- Overvej at bruge lokal fil eller SQLite i stedet
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [config, version] (M): #30 — Fix hardcoded app-version i Constants
- **Fil:** `lib/core/helper/constants.dart`
- `APP_VERSION = '1.2.0'` men pubspec siger `1.2.2`
- `APP_BUILD_VERSION = '3'` men pubspec siger `+12`
- Brug `package_info_plus` til at læse runtime-versionen
- [ ] Implementeret
- [ ] Testet

// TODO {C} [naming, convention] (L): #31 — Ret SCREAMING_SNAKE_CASE til lowerCamelCase i Constants
- **Fil:** `lib/core/helper/constants.dart`
- `APP_NAME` → `appName`, `APP_VERSION` → `appVersion`, osv.
- Dart-konventionen er `lowerCamelCase` for konstanter
- [ ] Implementeret
- [ ] Testet

// TODO {C} [architecture] (L): #32 — Erstat abstract class med final class + privat constructor
- **Fil:** `lib/view/shared/global.dart`
- `abstract class Global` → `final class Global { Global._(); ... }`
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [lifecycle, bug] (M): #33 — Flyt SystemChrome.setPreferredOrientations ud af build()
- **Fil:** `lib/main.dart` (linje 38-41)
- Side-effect i `build()` — flyt til `initState()` eller `main()`
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [permissions, async] (M): #34 — Await notification permission request i main()
- **Fil:** `lib/main.dart` (linje 18-22)
- `Permission.notification.request()` er async men awaites aldrig
- Appen fortsætter uden at vente på brugerens svar
- [ ] Implementeret
- [ ] Testet

---

## Fase 4 — Polish & Cleanup

// TODO {S} [logging, cleanup] (M): #35 — Fjern alle print() statements og aktivér avoid_print lint
- 8+ filer har `print()` — se #18 for fuld liste
- Tilføj `avoid_print: true` i `analysis_options.yaml`
- [ ] Implementeret
- [ ] Testet

// TODO {C} [i18n, cleanup] (L): #36 — Standardiser sprog i kommentarer og fejlbeskeder
- Filer som `json_data_handler.dart`, `radar_screen.dart`, `youtube_controls.dart` har danske kommentarer
- Resten er på engelsk — vælg ét sprog
- [ ] Implementeret

// TODO {C} [cleanup] (L): #37 — Fjern dead code og kommenteret kode
- `lib/core/helper/ad_helper.dart` — test ad class udkommenteret
- `lib/view/screens/menu_screen.dart` — test notification kode
- `lib/view/widgets/youtube/youtube_controls.dart` — udkommenteret PlayerStateSection
- `lib/view/widgets/youtube/youtube_video_position_seek_and_play.dart` — mute-knap + `_isMuted` ValueNotifier ubrugt
- `lib/main.dart` — SystemUiMode udkommenteret
- [ ] Implementeret

// TODO {M} [testing] (H): #38 — Tilføj rigtige tests (der er nul i dag)
- **Fil:** `test/widget_test.dart`
- Den eneste test er default counter-test fra `flutter create` — tester `Icons.add` og counter der ikke eksisterer
- Prioritér tests for:
  - [ ] UtilViewModel state-overgange
  - [ ] JsonDataHandler fejlhåndtering + rekursion
  - [ ] Model parsing fra JSON (edge cases)
  - [ ] Navigation mellem skærme

// TODO {S} [a11y] (M): #39 — Tilføj accessibility labels på alle interaktive elementer
- FloatingActionButtons mangler `tooltip`
- GestureDetectors mangler `Semantics` wrapping
- Billeder mangler `semanticLabel`
- **Filer:** Alle button widgets + `grid_view_widget.dart`
- [ ] Implementeret
- [ ] Testet

// TODO {C} [architecture] (L): #40 — Erstat custom Pos klasse med Flutters Offset
- **Fil:** `lib/core/viewmodels/radar_view_model.dart` (linje ~106)
- Custom `Pos(x, y)` har utyped parametre (dynamic) — brug `Offset` i stedet
- [ ] Implementeret

// TODO {C} [cleanup] (L): #41 — Dokumentér magic numbers eller gør dem til named constants
- `lib/core/helper/dimensions.dart` — divisorer: 105.5, 84.4, 56.27, 70.333
- `lib/core/viewmodels/radar_view_model.dart` — scale-limits: 2.0, 4.0
- `lib/view/widgets/skewed_clipper.dart` — 60px hardcoded
- `lib/view/widgets/appbar/app_bar_card.dart` — +28 offset
- [ ] Implementeret

// TODO {S} [a11y, ux] (M): #42 — Tilføj Semantics/Tooltip til alle knapper og interaktive elementer
- Se #39 — ingen af appens elementer har accessibility labels
- [ ] Implementeret

// TODO {S} [network, resilience] (M): #43 — Tilføj HTTP timeout på data-fetch
- **Fil:** `lib/core/helper/json_data_handler.dart`
- `http.get(Uri.parse(url))` har ingen timeout — kan hænge uendeligt
- Brug `.timeout(Duration(seconds: 10))`
- [ ] Implementeret
- [ ] Testet

// FIXME {S} [android, config] (M): #44 — Ret Android namespace fra com.example til produktions-ID
- **Fil:** `android/app/build.gradle` (linje 39)
- `namespace "com.example.cs_smoke_app"` — bør matche `applicationId` (`com.hartvig_develop.util_master`)
- [ ] Implementeret
- [ ] Testet

// TODO {C} [ads, architecture] (L): #45 — Fix AdViewModel — tilføj getters og notifyListeners
- **Fil:** `lib/core/viewmodels/ad_view_model.dart`
- `_bannerAd` og `_nativeAd` gemmes men har ingen getters — UI'et kan ikke tilgå dem
- `loadAd()` kalder ikke `notifyListeners()` når ad er loadet
- [ ] Implementeret
- [ ] Testet

// TODO {C} [cleanup] (L): #46 — Ret stavefejl i log-beskeder og fjern redundante checks
- **Fil:** `lib/core/viewmodels/settings_view_model.dart` — "premission" → "permission" (6 gange)
- **Fil:** `lib/core/helper/utils.dart` — redundant `Platform.isIOS` check inde i iOS-blok
- [ ] Implementeret

---

## 📦 Forældede Packages (fra Pubgrade)

// TODO {M} [dependencies] (H): #47 — Opdater alle forældede packages

### 🔴 Breaking Changes (major version bump)
- [ ] `bordered_text` 2.0.0 → 3.0.2
- [ ] `firebase_analytics` 11.6.0 → 12.4.1
- [ ] `firebase_core` 3.15.2 → 4.9.0
- [ ] `flutter_local_notifications` 18.0.1 → 21.0.0
- [ ] `flutter_timezone` 4.1.1 → 5.0.2
- [ ] `google_mobile_ads` 6.0.0 → 8.0.0
- [ ] `permission_handler` 11.4.0 → 12.0.1
- [ ] `share_plus` 10.1.4 → 13.1.0
- [ ] `youtube_player_iframe` 5.2.2 → 6.0.0

### 🟡 Minor Updates (bør være bagudkompatible)
- [ ] `cupertino_icons` 1.0.8 → 1.0.9
- [ ] `http` 1.5.0 → 1.6.0
- [ ] `rate_my_app` 2.3.2 → 2.4.0
- [ ] `shared_preferences` 2.5.3 → 2.5.5

### ⚠️ Tjek status
- [ ] `flutter_launch_store` 1.0.8 — tjek om denne pakke stadig vedligeholdes
- [ ] `rxdart` 0.28.0 — up to date ✅
- [ ] `url_launcher` 6.3.2 — up to date ✅
- [ ] `flutter_lints` 6.0.0 — up to date ✅
- [ ] `provider` 6.1.5+1 — up to date ✅

> [!WARNING]
> 9 packages har **breaking changes** — opdater dem én ad gangen og test grundigt efter hver opdatering. Start med `firebase_core` + `firebase_analytics` da mange andre packages afhænger af Firebase.

---

## 📊 Statistik

| Kategori | MoSCoW | Antal |
|----------|--------|-------|
| Must Have | {M} | 18 |
| Should Have | {S} | 22 |
| Could Have | {C} | 7 |
| Won't Have | {W} | 0 |

| Prioritet | Antal |
|-----------|-------|
| (H) High | 18 |
| (M) Medium | 21 |
| (L) Low | 8 |
