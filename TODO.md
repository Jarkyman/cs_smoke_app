# TODO - Util Master

> Cleaned up on July 7, 2026.
> Old completed code review items were removed so this file only tracks active and planned work.

## Active

### Expand test coverage

- [ ] Add more tests for `UtilViewModel` state transitions.
- [ ] Add more tests for `JsonDataHandler` error handling, cache, and fallback behavior.
- [ ] Add more model parsing edge cases.
- [ ] Add navigation/screen-flow tests where they provide real value.

### Store screenshots

- [ ] Add one extra Play Store and App Store screenshot showing the custom pin feature.

## Planned Feature: Self Sponsor Ads

### Sponsor data

- [x] Create a remote sponsor feed so sponsor campaigns can be changed without an app release.
- [x] Use a free v1 setup with GitHub Gist for the sponsor feed plus Firebase Analytics for click tracking.
- [x] Define the final JSON format before implementation, based on the draft fields: `version`, `sponsors`, `id`, `enabled`, `title`, `description`, `imageUrl`, `clickUrl`, `ctaText`, `apps`, optional `startsAt`, optional `endsAt`, and `weight`.
- [x] Add local cache/fallback so the app does not fail if the feed cannot be fetched.
- [x] Add app filtering so the same feed can be reused across Jackie's apps.

### Startup popup

- [x] Show sponsor popup on app start with a low random frequency, for example 10% chance.
- [x] Keep popup frequency low with random chance instead of a fixed cooldown.
- [x] Track sponsor link clicks.

### Video page

- [x] Rotate between Google native ads and self sponsor ads on the video page.
- [x] Start with every second ad slot.
- [x] Track sponsor impressions and sponsor clicks separately from Google ads.

### Admin workflow

- [x] Document how to add new sponsors and remove old ones.
- [x] Document image requirements, for example 300x300 square image.
- [ ] Revisit Gist vs Cloudflare later if click tracking or redirects need to move server-side.

## Ideas / Later

- [ ] #59 - Improve share menu priority so the app is suggested higher when users share from Instagram, TikTok, and YouTube.
- [ ] #60 - Open Instagram/TikTok videos directly in the native app, with browser fallback.
- [ ] #61 - Add "share with a friend" deep links to a specific info screen.
- [ ] #62 - Update the share button for custom pins so it links directly to the app instead of only the source video link.
- [ ] Rewrite `README.md` from the Flutter template to a real project README.
- [ ] Review web-build compatibility for `dart:io` imports.
