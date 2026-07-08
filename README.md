# Util Master

Internal Flutter app for CS2 utility lineups. The app shows maps, radar pins,
throw positions, video guides, user-created pins, notifications, ads, and self
sponsor placements.

The repo is public, so keep secrets out of Git.

## Setup

Create a local `.env` file before running the app.

Required/used keys:

```env
MAP_DATA_URL=
ADMOB_BANNER_ANDROID=
ADMOB_BANNER_IOS=
ADMOB_NATIVE_ANDROID=
ADMOB_NATIVE_IOS=
SPONSOR_FEED_URL=
SPONSOR_APP_ID=util_master
```

`SPONSOR_FEED_URL` and `SPONSOR_APP_ID` have code fallbacks, but keeping them in
`.env` makes testing easier.

## Commands

```sh
flutter pub get
flutter analyze
flutter test
flutter run
```

## Notes

- Main screens are in `lib/view/screens/`.
- Data loading/cache is handled by `JsonDataHandler`.
- User-created pins are stored locally through `UserUtilStorage`.
- Self sponsor ads use a remote JSON feed and Firebase Analytics for clicks and
  impressions.
- Notification payloads currently pass a map name and open that map directly.

## License

Proprietary. Copyright (c) 2026 Hartvig Solutions. All rights reserved. See
`LICENSE`.
