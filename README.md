# AINS Studio Glasswing for Safari

Safari-targeted WebExtension source for **AINS Studio v5.0.1**. This folder contains the AINS Studio feature scripts and styles plus a small namespace adapter for Safari’s `browser.*` WebExtension APIs.

## What is included

- The Glasswing settings center, reading dashboard, theme, translation, and Excel assistant.
- A Safari manifest scoped to `https://ains.moe.gov.my/web/*` with a Safari minimum of 15.4.
- A namespace bridge so the shared Promise-based extension code can use Safari’s `browser` APIs.
- A macOS packaging script that uses Apple’s Safari Web Extension Packager to create an Xcode app project.

## Package on a Mac

Safari extensions are distributed inside a macOS or iOS app. Apple’s packager and Xcode are required to convert this WebExtension source into the app project Safari can run.

1. Copy this folder to a Mac with Xcode and its Command Line Tools installed.
2. In Terminal, run `chmod +x package-safari.sh` once, then run `./package-safari.sh`.
3. The script runs `xcrun safari-web-extension-packager` and writes an Xcode project to the sibling `AINS-Studio-Glasswing-Safari-Xcode` folder. Pass a different output path as the first argument if preferred.
4. Open the generated Xcode project, select your Apple development team, and build/run the containing app.
5. Enable **AINS Studio Glasswing** in Safari Settings → Extensions and grant access to `ains.moe.gov.my` when Safari asks.

To distribute it to other people, configure the app’s signing and App Store Connect listing in Xcode. This Windows-prepared folder is the WebExtension source; it is not a signed `.app` or App Store package.

## Development

The extension uses Manifest V3 and a non-persistent background service worker. The content scripts are injected only on AINS web pages. Safari requires the user to grant website access before the extension can read or modify those pages. The adapter does not add permissions or broaden the website match patterns.

Safari 15.4 and later support Manifest V3, according to Apple’s Safari Web Extensions compatibility documentation. Validate the complete feature set in Safari after generating the Xcode project; browser APIs and site markup can behave differently from Chrome.

## Package contents

`manifest.json`, `background.js`, `browser-compat.js`, `theme.js`, `bulk-import.js`, `studio-dashboard.js`, `styles.css`, and `studio-nav.css` are the source files passed to Apple’s packager.

Safari version: `5.0.1` · Codename: **Glasswing**


### v5.0.1 background timer update
The Excel assistant now uses a persisted absolute deadline for its approval prompt. It resumes at the correct remaining time after background-tab throttling. If the browser or device suspends execution, the page continues when scheduled again.


