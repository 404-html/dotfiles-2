
// Disable firefox auto-update
user_pref("app.update.enabled", false); 

// Multiprocess
user_pref("browser.tabs.remote.autostart", true);
user_pref("extensions.e10sBlocksEnabling", false);

// GPU accel
user_pref("layers.acceleration.force-enabled", true);
//user_pref("webgl.force-enabled", true);
//user_pref("webgl.msaa-force", true);

// Disable search in url bar 
user_pref("keyword.enabled", false);
user_pref("browser.fixup.alternate.enabled", false);

// Disable Cisco h264 decoder plugin
user_pref("media.gmp-provider.enabled", false);

// Default search engine
user_pref("browser.search.defaultenginename", "DuckDuckGo");

// When in socks proxy, also proxy dns requests 
user_pref("network.proxy.socks_remote_dns",	true);

// Disable the built-in PDF viewer (CVE-2015-2743)
user_pref("pdfjs.disabled",	true);

// Disable new tab tile ads 
user_pref("browser.newtabpage.enabled", false);

// Clear most stuff but keep history when Firefox closes
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown.siteSettings", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.passwords", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.history", false);

// Don't keep form and search history
user_pref("browser.formfill.enable", false);

// Disable fullscreen video warning.
user_pref("full-screen-api.warning.timeout", 0);

// Don't sugest history in url bar
user_pref("browser.urlbar.suggest.history", false);

// Don't provide search sugestion in search bar
user_pref("browser.search.suggest.enabled",	false);

// Don't warn when closing multiple tabs
user_pref("browser.tabs.warnOnClose", false);
user_pref("browser.tabs.warnOnCloseOtherTabs", false);

// Don't show warning in about:config
user_pref("general.warnOnAboutConfig", false);

// Don't show self-destructing cookies notifications
user_pref("extensions.jid0-9XfBwUWnvPx4wWsfBWMCm4Jj69E@jetpack.displayNotification", false);

// gnome-keyring, keyring name to be used by firefox
user_pref("extensions.gnome-keyring.keyringName", "firefox");

// Disable mouse middle click url bar paste
user_pref("middlemouse.contentLoadURL", false);

// Disable plugins by default
user_pref("plugin.default.state", 0);

// Disable addons by default
user_pref("plugin.defaultXpi.state", 0);

// Never restore last session
user_pref("browser.sessionstore.max_resumed_crashes", 0);
user_pref("browser.sessionstore.resume_from_crash", false);

// Don't animate fullscreen transition
user_pref("browser.fullscreen.animate", false);

// Don't animate fullscreen transition for videos
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");

// Disable tab animation
//user_pref("browser.tabs.animate", false);

// Kerberos authentication for fenix.ist.utl.pt
user_pref("network.negotiate-auth.trusted-uris", "id.tecnico.ulisboa.pt");

// Hide other search engines
user_pref("browser.search.hiddenOneOffs", "Google,Yahoo,Bing,Amazon.com,Debian packages,DuckDuckGo,Twitter,Wikipedia (en)");

// Cache to ram only
user_pref("browser.cache.disk.enable", false);
user_pref("browser.cache.offline.enable", false);
user_pref("browser.cache.memory.enable", true);
//user_pref("browser.cache.disk.parent_directory", "/dev/shm/firefox");

// Disable page thumbnails/screenshot collection
user_pref("browser.pagethumbnails.capturing_disabled", true);

// Do not track
user_pref("privacy.donottrackheader.enabled", true);
user_pref("privacy.trackingprotection.enabled", true);

// Allow cookies. No third-party cookies.
user_pref("network.cookie.cookieBehavior", 1);

// Open searches in new tab
user_pref("browser.search.openintab", true);

// time to disable buttons on security-sensitive dialog boxes.
user_pref("security.dialog_enable_delay", 0);

// Open all popups in a new tab.
user_pref("browser.link.open_newwindow.restriction", 0);

// Disable webrtc
user_pref("media.peerconnection.enabled", false);

// disable Location-Aware Browsing
// http://www.mozilla.org/en-US/firefox/geolocation/
user_pref("geo.enabled", false);

// Prevent font fingerprinting
// http://www.browserleaks.com/fonts
// https://github.com/pyllyukko/user.js/issues/120
//user_pref("browser.display.use_document_fonts", 0);

// disable webGL
// http://www.contextis.com/resources/blog/webgl-new-dimension-browser-exploitation/
user_pref("webgl.disabled", true);

// Flash plugin state - never activate
user_pref("plugin.state.flash", 0);

// Don't show warning about login in non https webpage. 
// This makes sense security wise, but it's very annoying.
user_pref("security.insecure_field_warning.contextual.enabled", false)


// Increase interval at which firefox saves session to 30m (default 15s)
// https://www.servethehome.com/firefox-is-eating-your-ssd-here-is-how-to-fix-it/
user_pref("browser.sessionstore.interval", 1800000);

// Don't automatically start videos!
user_pref("media.autoplay.enabled", false);

