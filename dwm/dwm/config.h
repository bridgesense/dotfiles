/* See LICENSE file for copyright and license details. */
/* for XF86 Media Keys */
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 8;        /* gaps between windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#928374";
static const char col_gray3[]       = "#a89984";
static const char col_gray4[]       = "#ebdbb2";
static const char col_cyan[]        = "#83a598";
static const char col_black[]       = "#1d2021";
static const char col_red[]         = "#cc241d";
static const char col_yellow[]      = "#d79921";
static const char col_white[]       = "#ebdbb2";

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray4, col_gray1, col_black },
	[SchemeSel]  = { col_cyan, col_gray1,  col_cyan },
    [SchemeWarn] = { col_yellow, col_gray1, col_yellow},
	[SchemeUrgent] = { col_red, col_gray1, col_red },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "nemo",     NULL,       NULL,       0,            0,           -1 },
	{ "nextcloud",NULL,       NULL,       0,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *bashtop[] = { "alacritty", "-e", "bpytop" };
static const char *ranger[] = { "alacritty", "-e", "ranger" };
static const char *brightnessdown[] = { "cbacklight", "--dec", "10" };
static const char *brightnessup[] = { "cbacklight", "--inc", "10" };

static Key keys[] = {
/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = bashtop } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,             XK_h,      rotatestack,    {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_l,      rotatestack,    {.i = +1 } },
	{ MODKEY,                       XK_h,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_l,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
    { MODKEY|ShiftMask,             XK_j,      rotatestack,    {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      rotatestack,    {.i = -1 } },
    { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,             XK_bracketleft,      setmfact,       {.f = -0.05} },
	{ MODKEY,             XK_bracketright,     setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY|ShiftMask,             XK_m,      togglefullscr,  {0} },
	{ MODKEY,                       XK_n,      spawn,          {.v = ranger } },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("nemo --no-desktop") },
    { MODKEY,                       XK_space,  spawn,          SHCMD("$SHELL ~/.config/scripts/dmenu-app-launcher") },
	{ MODKEY|ShiftMask,             XK_space,  spawn,          SHCMD("$SHELL ~/.config/scripts/dmenu-app-launcher -build") },
	{ MODKEY,                       XK_r,      spawn,          SHCMD("$SHELL ~/.config/scripts/screen-init") },
	{ MODKEY|ShiftMask,             XK_r,      spawn,          SHCMD("$SHELL ~/.config/scripts/reboot-confirm") },
	{ MODKEY|ShiftMask,             XK_x,      spawn,          SHCMD("$SHELL ~/.config/scripts/shutdown-confirm") },
	{ MODKEY,                       XK_s,      spawn,          SHCMD("flameshot gui") },
	{ MODKEY,                       XK_c,      spawn,          SHCMD("$SHELL ~/.config/scripts/toggle-coffee-mode") },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -5 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +5 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
    { 0, XF86XK_AudioMute,                     spawn,          SHCMD("pactl set-sink-mute 0 toggle") },
    { 0, XF86XK_AudioRaiseVolume,              spawn,          SHCMD("$SHELL ~/.config/scripts/amixer Master 2%+") },
    { 0, XF86XK_AudioLowerVolume,              spawn,          SHCMD("$SHELL ~/.config/scripts/amixer Master 2%-") },
    { 0, XF86XK_AudioMicMute,                  spawn,          SHCMD("$SHELL ~/.config/scripts/amixer Capture toggle") },
    { 0, XF86XK_MonBrightnessDown,             spawn,          {.v = brightnessdown } },
    { 0, XF86XK_MonBrightnessUp,               spawn,          {.v = brightnessup } },
    { 0, XF86XK_Display,                       spawn,          SHCMD("arandr") },
    { 0, XF86XK_WLAN,                          spawn,          SHCMD("$SHELL ~/.config/scripts/toggle-wifi") },
    { 0, XF86XK_Tools,                         spawn,          SHCMD("$SHELL ~/.config/scripts/hibernate")  },
    { 0, XF86XK_Search,                        spawn,          SHCMD("st -e nmtui") },
    { 0, XF86XK_LaunchA,                       spawn,          SHCMD("st -e alsamixer") }, 
    { 0, XF86XK_Favorites,                     spawn,          SHCMD("st -e alsamixer") }, 
    { 0, XF86XK_Explorer,                      spawn,          SHCMD("$SHELL ~/.config/scripts/toggle-touchpad") },
    { 0, XF86XK_PowerOff,                      spawn,          SHCMD("$SHELL ~/.config/scripts/shutdown-confirm") },
    { 0, XF86XK_Suspend,                       spawn,          SHCMD("systemctl suspend && xautolock -locknow") },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ ControlMask|ShiftMask,        XK_t,      spawn,          SHCMD("python ~/.config/alacritty/set_colorscheme.py") },
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

