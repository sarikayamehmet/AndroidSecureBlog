
#####################################保留Android 4大组件#######################################

-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class com.android.vending.licensing.ILicensingService

#keep all classes that might be used in XML layouts
-keep public class * extends android.os.Bundle
-keep public class * extends android.view.View
-keep public class * extends android.app.Fragment
-keep public class * extends android.support.v4.Fragment

#keep all public and protected methods that could be used by java reflection
-keepclassmembernames class * {
    public protected <methods>;
}

-keepclasseswithmembernames class * {
    native <methods>;
}

-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet);
}

-keepclasseswithmembernames class * {
    public <init>(android.content.Context, android.util.AttributeSet, int);
}


-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

##############################保留Android support控件######################################

# view res/layout/design_navigation_item.xml #generated:17
-keep class android.support.design.internal.NavigationMenuItemView { <init>(...); }

# view res/layout/design_navigation_menu.xml #generated:17
-keep class android.support.design.internal.NavigationMenuView { <init>(...); }

# view res/layout/app_bar_main.xml #generated:11
-keep class android.support.design.widget.AppBarLayout { <init>(...); }

# view res/layout/app_bar_main.xml #generated:2
# view res/layout/design_bottom_sheet_dialog.xml #generated:17
-keep class android.support.design.widget.CoordinatorLayout { <init>(...); }

# view res/layout/app_bar_main.xml #generated:27
-keep class android.support.design.widget.FloatingActionButton { <init>(...); }

# view res/layout/activity_main.xml #generated:17
-keep class android.support.design.widget.NavigationView { <init>(...); }

# view res/layout/design_layout_snackbar.xml #generated:18
# view sw600dp-v13\res/layout-sw600dp-v13/design_layout_snackbar.xml #generated:18
-keep class android.support.design.widget.Snackbar$SnackbarLayout { <init>(...); }

# view res/layout/activity_main.xml #generated:2
-keep class android.support.v4.widget.DrawerLayout { <init>(...); }

# view res/layout/abc_alert_dialog_material.xml #generated:75
-keep class android.support.v4.widget.NestedScrollView { <init>(...); }

# view res/layout/abc_alert_dialog_button_bar_material.xml #generated:40
-keep class android.support.v4.widget.Space { <init>(...); }

# view res/layout/abc_action_menu_item_layout.xml #generated:17
-keep class android.support.v7.view.menu.ActionMenuItemView { <init>(...); }

# view res/layout/abc_expanded_menu_layout.xml #generated:17
-keep class android.support.v7.view.menu.ExpandedMenuView { <init>(...); }

# view res/layout/abc_list_menu_item_layout.xml #generated:17
# view res/layout/abc_popup_menu_item_layout.xml #generated:17
-keep class android.support.v7.view.menu.ListMenuItemView { <init>(...); }

# view res/layout/abc_screen_toolbar.xml #generated:27
-keep class android.support.v7.widget.ActionBarContainer { <init>(...); }

# view res/layout/abc_action_mode_bar.xml #generated:19
# view res/layout/abc_screen_toolbar.xml #generated:43
-keep class android.support.v7.widget.ActionBarContextView { <init>(...); }

# view res/layout/abc_screen_toolbar.xml #generated:17
-keep class android.support.v7.widget.ActionBarOverlayLayout { <init>(...); }

# view res/layout/abc_action_menu_layout.xml #generated:17
-keep class android.support.v7.widget.ActionMenuView { <init>(...); }

# view res/layout/abc_activity_chooser_view.xml #generated:19
-keep class android.support.v7.widget.ActivityChooserView$InnerLayout { <init>(...); }

# view res/layout/abc_alert_dialog_button_bar_material.xml #generated:18
-keep class android.support.v7.widget.ButtonBarLayout { <init>(...); }

# view res/layout/abc_screen_content_include.xml #generated:19
-keep class android.support.v7.widget.ContentFrameLayout { <init>(...); }

# view res/layout/abc_alert_dialog_material.xml #generated:48
-keep class android.support.v7.widget.DialogTitle { <init>(...); }

# view res/layout/abc_screen_simple_overlay_action_mode.xml #generated:23
-keep class android.support.v7.widget.FitWindowsFrameLayout { <init>(...); }

# view res/layout/abc_dialog_title_material.xml #generated:22
# view res/layout/abc_screen_simple.xml #generated:17
-keep class android.support.v7.widget.FitWindowsLinearLayout { <init>(...); }

# view res/layout/abc_search_view.xml #generated:78
-keep class android.support.v7.widget.SearchView$SearchAutoComplete { <init>(...); }

# view res/layout/abc_screen_toolbar.xml #generated:36
# view res/layout/app_bar_main.xml #generated:16
-keep class android.support.v7.widget.Toolbar { <init>(...); }

# view res/layout/abc_screen_simple.xml #generated:25
# view res/layout/abc_screen_simple_overlay_action_mode.xml #generated:32
-keep class android.support.v7.widget.ViewStubCompat { <init>(...); }


###############################保留R文件和Activity################################################
-keep class **.R$*
-keepclasseswithmembernames class * {
    protected void onCreate(**);
}
