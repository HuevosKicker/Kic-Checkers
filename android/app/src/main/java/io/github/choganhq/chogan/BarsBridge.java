package io.github.choganhq.chogan;

import android.app.Activity;
import android.os.Build;
import android.view.Window;
import android.webkit.JavascriptInterface;

import androidx.core.view.WindowCompat;
import androidx.core.view.WindowInsetsControllerCompat;

/**
 * Paints the system bars in the theme the page shows (#402).
 *
 * Capacitor's bundled SystemBars picks the bar icons from the device's night
 * mode and sets the window background to the theme's, so with the app in dark
 * and the device (or the window background) light, the navigation bar stayed
 * cream under a dark page. The app's own light/dark/auto setting lives in the
 * page, so the page reports it here as {@code window.ChoganBars.setDark(...)}.
 * Like ImageBridge it needs no permission, and the WebView only loads the app's
 * own assets, so no outside page can reach it.
 */
public class BarsBridge {

    // The page backgrounds (--c-bg in www/lib/chogan.css), light and dark
    static final int BG_LIGHT = 0xFFFBF6EF;
    static final int BG_DARK = 0xFF15120E;

    private final Activity activity;
    private Boolean dark = null;

    public BarsBridge(Activity activity) {
        this.activity = activity;
    }

    @JavascriptInterface
    public void setDark(boolean isDark) {
        dark = isDark;
        activity.runOnUiThread(this::apply);
    }

    /** Applies the last theme again: SystemBars resets the bars on a configuration change. */
    void reapply() {
        if (dark != null) apply();
    }

    @SuppressWarnings("deprecation")
    private void apply() {
        boolean d = Boolean.TRUE.equals(dark);
        int bg = d ? BG_DARK : BG_LIGHT;
        Window window = activity.getWindow();
        // Where the WebView is padded clear of the bars, this is what shows under them
        window.getDecorView().setBackgroundColor(bg);
        // Android 14 and older draw the bars in these colours; 15 and newer ignore them
        window.setStatusBarColor(bg);
        window.setNavigationBarColor(bg);
        // Android 15+ lays a light or dark scrim over 3-button navigation; the page is under it
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) window.setNavigationBarContrastEnforced(false);
        WindowInsetsControllerCompat bars = WindowCompat.getInsetsController(window, window.getDecorView());
        bars.setAppearanceLightStatusBars(!d);
        bars.setAppearanceLightNavigationBars(!d);
    }
}
