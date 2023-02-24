/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 10;        /* gaps between windows */
static const unsigned int snap      = 0;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const int user_bh            = 20;        /* 0 means that dwm will calculate bar height, >= 1 means dwm will user_bh as bar height */
static const char *fonts[]          = { "monospace:size=9:antialias=true" };
static const char dmenufont[]       = { "monospace:size=9:antialias=true" };
static const char col_gray1[]       = "#282828";
static const char col_gray2[]       = "#282828";
static const char col_gray3[]       = "#ebdbb2";
static const char col_gray4[]       = "#282828";
static const char col_cyan[]        = "#ebdbb2";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
	[SchemeStatus]  = { col_gray3, col_gray1,  "#282828"  }, // Statusbar right {text,background,not used but cannot be empty}
	[SchemeTagsSel]  = { col_gray4, col_cyan,  "#282828"  }, // Tagbar left selected {text,background,not used but cannot be empty}
	[SchemeTagsNorm]  = { col_gray3, col_gray1,  "#282828"  }, // Tagbar left unselected {text,background,not used but cannot be empty}
	[SchemeInfoSel]  = { col_gray4, col_cyan,  "#282828"  }, // infobar middle  selected {text,background,not used but cannot be empty}
	[SchemeInfoNorm]  = { col_gray3, col_gray1,  "#282828"  }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
  /* class             instance              title            tags mask     isfloating   monitor */
	{ "Gimp",            NULL,                 NULL,            0,            1,           -1 },
	{ "st-256color",     "st-256color" ,       "pulsemixer",    0,            1,           -1 },
	{ "st-256color",     "st-256color" ,       "peaclock",      0,            1,           -1 },
	{ "Firefox",         NULL,                 NULL,            1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster        = 1;    /* number of clients in master area */
static const int resizehints    = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* Teminal Application */
static const char *nvim[] = { "st",  "-e", "nvim", NULL };
static const char *fb[] = { "st",  "-e", "lfub", NULL };
static const char *mixer[] = { "st",  "-e", "pulsemixer", NULL };
static const char *htop[] = { "st",  "-e", "htop", NULL };
static const char *music[] = { "st",  "-e", "ncmpcpp", NULL };
static const char *netman[] = { "st",  "-e", "nmtui", NULL };
static const char *chkdsk[] = { "st",  "-e", "ncdu", NULL };
static const char *esession[] = { "sysact", NULL };
static const char *mpctoggle[] = { "mpc", "toggle", NULL };
static const char *mpcnegseek[] = { "mpc", "seek", "-10", NULL };
static const char *mpcposseek[] = { "mpc", "seek", "+10", NULL };
static const char *mpcnext[] = { "mpc", "next", NULL };
static const char *mpcprev[] = { "mpc", "prev", NULL };

/* GUI Application */
static const char *web[] = { "chromium", NULL };
/* static const char *ide[] = { "mousepad", NULL }; */
static const char *signaldesk[] = { "signal-desktop", NULL };
static const char *pass[] = { "keepassxc", NULL };
static const char *pdf[] = { "zathura", NULL };
static const char *sshot[] = { "flameshot", "gui", NULL };

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
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };

static const Key keys[] = {
	/* modifier                     key        function        argument */
	/*                       TERMINAL APPLICATIONS                      */
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd   } },
  { MODKEY|ShiftMask,             XK_n,      spawn,          {.v = music     } },
	{ MODKEY|ShiftMask,             XK_h,      spawn,          {.v = htop      } },
	{ MODKEY|ShiftMask,             XK_v,      spawn,          {.v = nvim      } },
	{ MODKEY|ShiftMask,             XK_f,      spawn,          {.v = fb        } },
  { MODKEY|ShiftMask,             XK_F4,     spawn,          {.v = mixer     } },
  { MODKEY|ShiftMask,             XK_F8,     spawn,          {.v = netman    } },
  { MODKEY|ShiftMask,             XK_F7,     spawn,          {.v = chkdsk    } },
	/*                       NCMPCPP   CONTROLS                         */
  { MODKEY,                       XK_F2,     spawn,          {.v = mpctoggle } },
	{ MODKEY,                       XK_F1,     spawn,          {.v = mpcnegseek } },
  { MODKEY|ShiftMask,             XK_F1,     spawn,          {.v = mpcprev } },
	{ MODKEY,                       XK_F3,     spawn,          {.v = mpcposseek } },
  { MODKEY|ShiftMask,             XK_F3,     spawn,          {.v = mpcnext } },
	/*                       GUI      APPLICATIONS                      */
  { MODKEY|ShiftMask,             XK_w,      spawn,          {.v = web       } },
  { MODKEY|ShiftMask,             XK_r,      spawn,          {.v = pdf       } },
  { MODKEY|ShiftMask,             XK_F9,     spawn,          {.v = signaldesk} },
  { MODKEY|ShiftMask,             XK_F12,    spawn,          {.v = pass      } },
	/*                       dmenu    APPLICATIONS                      */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd  } },
	{ MODKEY|ShiftMask,             XK_s,      spawn,          {.v = sshot     } },
	{ MODKEY|ShiftMask,             XK_q,      spawn,          {.v = esession  } },

	/*                              DWM SETTINGS                        */
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_o,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY,                       XK_minus,  setgaps,        {.i = -2 } },
	{ MODKEY,                       XK_equal,  setgaps,        {.i = +2 } },
	{ MODKEY|ShiftMask,             XK_equal,  setgaps,        {.i = 0  } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	/* { MODKEY|ShiftMask,             XK_q,      quit,           {0} }, */
	{ MODKEY|ControlMask|ShiftMask, XK_q,      quit,           {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
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

