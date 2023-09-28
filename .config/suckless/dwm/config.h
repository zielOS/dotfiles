/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx    = 4;   
static const int corner_radius        = 14;
static const unsigned int barborderpx = 0;  
static const unsigned int snap        = 32; 
static const int scalepreview         = 8;        
static const unsigned int gappih      = 12;  
static const unsigned int gappiv      = 12;  
static const unsigned int gappoh      = 12;  
static const unsigned int gappov      = 12;  
static const int smartgaps_fact       = 0;   
static const int showbar              = 1;   
static const int topbar               = 0;   
static const int vertpad              = 5;  
static const int sidepad              = 5;

#define ICONSIZE 20    
#define ICONSPACING 5  

/* Status is to be shown on:
   -1 (all monitors),
   0 (a specific monitor by index),
   'A' (active monitor) */

static const int statusmon               = -1;
static const int horizpadbar             = 5;   
static const int vertpadbar              = 11;
static const int vertpadtab              = 35;
static const int horizpadtabi            = 15;
static const int horizpadtabo            = 15;
static const char buttonbar[]            = "";
static const unsigned int systrayspacing = 2;   
static const int showsystray             = 1;   
static const unsigned int ulinepad       = 5;         
static const unsigned int ulinestroke    = 3;     
static const unsigned int ulinevoffset   = 0;     
static const int ulineall                = 0;                  



/* Indicators: see patch/bar_indicators.h for options */
static int tagindicatortype        = INDICATOR_NONE;
static int tiledindicatortype      = INDICATOR_NONE;
static int floatindicatortype      = INDICATOR_NONE;
static const char *fonts[]         = {
  "JetBrainsMono Nerd Font:size=16" 
};
static const char dmenufont[]      = "monospace:size=10";

static char c000000[]              = "#000000"; 

static char normfgcolor[]          = "#CDD6F4";
static char normbgcolor[]          = "#11111B";
static char normbordercolor[]      = "#313244";
static char normfloatcolor[]       = "#F5C2E7";

static char selfgcolor[]           = "#CDD6F4";
static char selbgcolor[]           = "#B4BEFE";
static char selbordercolor[]       = "#B4BEFE";
static char selfloatcolor[]        = "#B4BEFE";

static char titlenormfgcolor[]     = "#CDD6F4";
static char titlenormbgcolor[]     = "#11111B";
static char titlenormbordercolor[] = "#313244";
static char titlenormfloatcolor[]  = "#F5C2E7";

static char titleselfgcolor[]      = "#CDD6F4";
static char titleselbgcolor[]      = "#B4BEFE";
static char titleselbordercolor[]  = "#B4BEFE";
static char titleselfloatcolor[]   = "#B4BEFE";

static char tagsnormfgcolor[]      = "#CDD6F4";
static char tagsnormbgcolor[]      = "#11111B";
static char tagsnormbordercolor[]  = "#313244";
static char tagsnormfloatcolor[]   = "#db8fd9";

static char tagsselfgcolor[]       = "#CDD6F4";
static char tagsselbgcolor[]       = "#B4BEFE";
static char tagsselbordercolor[]   = "#B4BEFE";
static char tagsselfloatcolor[]    = "#B4BEFE";

static char hidnormfgcolor[]       = "#B4BEFE";
static char hidselfgcolor[]        = "#89B4FA";
static char hidnormbgcolor[]       = "#11111B";
static char hidselbgcolor[]        = "#11111B";

static char urgfgcolor[]           = "#CDD6F4";
static char urgbgcolor[]           = "#11111B";
static char urgbordercolor[]       = "#F38BA8";
static char urgfloatcolor[]        = "#F5C2E7";



static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const unsigned int alphas[][3] = {
	/*                       fg      bg        border     */
	[SchemeNorm]         = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]          = { OPAQUE, baralpha, borderalpha },
	[SchemeTitleNorm]    = { OPAQUE, baralpha, borderalpha },
	[SchemeTitleSel]     = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsNorm]     = { OPAQUE, baralpha, borderalpha },
	[SchemeTagsSel]      = { OPAQUE, baralpha, borderalpha },
	[SchemeHidNorm]      = { OPAQUE, baralpha, borderalpha },
	[SchemeHidSel]       = { OPAQUE, baralpha, borderalpha },
	[SchemeUrg]          = { OPAQUE, baralpha, borderalpha },
};

static char *colors[][ColCount] = {
	/*                       fg                bg                border                float */
	[SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
	[SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
	[SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
	[SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
	[SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
	[SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
	[SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
	[SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },
	[SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
};




const char *spcmd1[] = {"st", "-n", "spterm", "-g", "120x34", NULL };
const char *spcmd2[] = {"st", "-n", "spranger", "-g", "120x34", "-e", "ranger", NULL };
const char *spcmd3[] = {"st", "-n", "splvim", "-g", "120x34", "-e", "lvim", NULL };
const char *spcmd4[] = {"st", "-n", "spvifm", "-g", "120x34", "-e", "vifm", NULL };

static Sp scratchpads[] = {
  {"spterm",   spcmd1},
  {"spranger", spcmd2},
  {"splvim",   spcmd3},
  {"spvifm",   spcmd4},
};

static char *tagicons[][NUMTAGS] =
{
  [DEFAULT_TAGS]        = { "", "", "", "", "", "", "", "", "" },
  [ALTERNATIVE_TAGS]    = { "A", "B", "C", "D", "E", "F", "G", "H", "I" },
  [ALT_TAGS_DECORATION] = { "<1>", "<2>", "<3>", "<4>", "<5>", "<6>", "<7>", "<8>", "<9>" },
};



static const Rule rules[] = {
    // class      instance  title  wintype  tags mask  isfloating  monitor
  { "Gimp",      NULL,     NULL,  NULL,    1 << 4,    0,          -1 },
  { "Firefox",   NULL,     NULL,  NULL,    1 << 7,    0,          -1 },
  { "eww",       NULL,     NULL,  NULL,    0,         1,          -1 },
  { NULL,        NULL,     "emacs-run-launcher",  NULL,    0,         1,          -1 },
  { "qalculate-gtk", NULL,     NULL,  NULL,    0,         1,          -1 },

  /* xprop(1):
   *	WM_CLASS(STRING) = instance, class
   *	WM_NAME(STRING) = title
   *	WM_WINDOW_ROLE(STRING) = role
   *	_NET_WM_WINDOW_TYPE(ATOM) = wintype
   */
};

static const MonitorRule monrules[] = {
  /* monitor  layout  mfact  nmaster  showbar  topbar */
  {  1,       0,      -1,    -1,      -1,      -1     }, 
  {  -1,      1,      -1,    -1,      -1,      -1     }, 
};


static const BarRule barrules[] = {
  /* monitor   bar    alignment         widthfunc       drawfunc         lickfunc         overfunc    ame */
  { -1,        0,     BAR_ALIGN_LEFT,   width_stbutton, draw_stbutton,  click_stbutton,  NULL,       "statusbutton" },
  { -1,        0,     BAR_ALIGN_LEFT,   width_tags,     draw_tags,      click_tags,      hover_tags, "tags" },
  {  0,        0,     BAR_ALIGN_RIGHT,  width_systray,  draw_systray,   click_systray,   NULL,       "systray" },
  { -1,        0,     BAR_ALIGN_LEFT,   width_ltsymbol, draw_ltsymbol,  click_ltsymbol,  NULL,       "layout" },
  { statusmon, 0,     BAR_ALIGN_RIGHT,  width_status2d, draw_status2d,  click_statuscmd, NULL,       "status2d" },
};

/* layout(s) */
static const float mfact        = 0.55; 
static const int nmaster        = 1;    
static const int resizehints    = 0;    
static const int lockfullscreen = 1; 



static const Layout layouts[] = {
  /* symbol     arrange function */
  { "(@)",      spiral },
  { "[]=",      tile },    
  { "><>",      NULL },    
  { "[M]",      monocle },
  { "|M|",      centeredmaster }, 

};


/* key definitions */
#define MOD Mod4Mask
#define ALT Mod1Mask
#define CTRL ControlMask
#define SHIFT ShiftMask

#define TAGKEYS(KEY,TAG) \
  { MOD,            KEY,  view,       {.ui = 1 << TAG} },	\
	{ MOD|CTRL,       KEY,  toggleview, {.ui = 1 << TAG} }, \
	{ MOD|SHIFT,      KEY,  tag,        {.ui = 1 << TAG} }, \
	{ MOD|CTRL|SHIFT, KEY,  toggletag,  {.ui = 1 << TAG} },


/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *btncmd[]     = { "dwmmenu", NULL };
static const char *jgmenucmd[]  = { "jgmenu_run", NULL };

/* commands spawned when clicking statusbar */
static const StatusCmd statuscmds[] = {
  { "notifications", 1 },
  { "calendar", 2 },
  { "eww open --toggle menu", 3 },
  { "eww open --toggle powermenu", 4},
};

/* test the above with: xsetroot -name "$(printf '\x01Volume |\x02 CPU |\x03 Battery')" */
static const char *statuscmd[] = { "/bin/sh", "-c", NULL, NULL };


static const Key keys[] = {
  /* modifier           key            function                argument */
  /* Kill client */
  { MOD,                XK_q,          killclient,             {0} },

  /* Manage DWM Session */ 
  { MOD|SHIFT,          XK_r,          self_restart,           {0} },
  { MOD|SHIFT,          XK_q,          quit,                   {0} },

  /* Switch Windows */
  { MOD,                XK_Left,       focusdir,               {.i = 0 } }, 
  { MOD,                XK_Right,      focusdir,               {.i = 1 } }, 
  { MOD,                XK_Up,         focusdir,               {.i = 2 } }, 
  { MOD,                XK_Down,       focusdir,               {.i = 3 } }, 

  /* Move Windows */
  { MOD|SHIFT, 		XK_Left,       movestack,              {.i = +1 } }, 
  { MOD|SHIFT, 		XK_Right,      movestack,              {.i = -1 } },

  /* Resize Windows */
  { MOD|CTRL, 		XK_Left,       setmfact,               {.f = -0.05} },
  { MOD|CTRL, 		XK_Right,      setmfact,               {.f = +0.05} },
  { MOD|CTRL,           XK_Up,         setcfact,               {.f = +0.05} },
  { MOD|CTRL,           XK_Down,       setcfact,               {.f = -0.05} },
  { MOD|CTRL,           XK_o,          setcfact,               {0} },

  /* WIndows between monitors */
  { MOD,                XK_comma,      focusmon,               {.i = -1 } },
  { MOD,                XK_period,     focusmon,               {.i = +1 } },
  { MOD|SHIFT,          XK_comma,      tagmon,                 {.i = -1 } },
  { MOD|SHIFT,          XK_period,     tagmon,                 {.i = +1 } },

  /* i3-like Scratchpads */
  { MOD,                XK_minus,      scratchpad_hide,        {0} },
  { MOD|SHIFT,          XK_minus,      scratchpad_show,        {0} },
  { MOD,                XK_equal,      scratchpad_remove,      {0} },

  /* Toggle stuff */
  { MOD,                XK_b,          togglebar,              {0} },
  { MOD|SHIFT,          XK_space,      togglefloating,         {0} },
  { MOD,                XK_f,          togglefullscreen,       {0} },
  /* Tag management */
  { MOD,                XK_Return,     zoom,                   {0} },
  { MOD,                XK_Tab,        view,                   {0} },
  
  { MOD|ALT,            XK_Left,       viewtoleft,             {0} }, 
  { MOD|ALT,            XK_Right,      viewtoright,            {0} }, 
  { MOD|ALT|CTRL,       XK_Left,       tagtoleft,              {0} }, 
  { MOD|ALT|CTRL,       XK_Right,      tagtoright,             {0} }, 
  { MOD|ALT|SHIFT,      XK_Left,       tagandviewtoleft,       {0} },
  { MOD|ALT|SHIFT,      XK_Right,      tagandviewtoright,      {0} },

  TAGKEYS(              XK_1,                                   0)
  TAGKEYS(              XK_2,                                   1)
  TAGKEYS(              XK_3,                                   2)
  TAGKEYS(              XK_4,                                   3)
  TAGKEYS(              XK_5,                                   4)
  TAGKEYS(              XK_6,                                   5)
  TAGKEYS(              XK_7,                                   6)
  TAGKEYS(              XK_8,                                   7)
  TAGKEYS(              XK_9,                                   8)

};


/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
  /* click            event mask   button     function        argument */
  { ClkButton,        0,           Button1,   spawn,          {.v = btncmd } },
  { ClkLtSymbol,      0,           Button1,   setlayout,      {0} },
  { ClkLtSymbol,      0,           Button3,   setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,      0,           Button2,   zoom,           {0} },
  { ClkStatusText,    0,           Button1,   spawn,          {.v = statuscmd } },
  { ClkStatusText,    0,           Button2,   spawn,          {.v = statuscmd } },
  { ClkStatusText,    0,           Button3,   spawn,          {.v = statuscmd } },
  { ClkClientWin,     MOD,         Button1,   movemouse,      {0} },
  { ClkClientWin,     MOD,         Button2,   togglefloating, {0} },
  { ClkClientWin,     MOD,         Button3,   resizemouse,    {0} },
  { ClkClientWin,     MOD|SHIFT,   Button3,   dragcfact,      {0} },
  { ClkClientWin,     MOD|SHIFT,   Button1,   dragmfact,      {0} },
  { ClkTagBar,        0,           Button1,   view,           {0} },
  { ClkTagBar,        0,           Button3,   toggleview,     {0} },
  { ClkTagBar,        MOD,         Button1,   tag,            {0} },
  { ClkTagBar,        MOD,         Button3,   toggletag,      {0} },
  { ClkWinTitle,      0,           Button1,   spawn,          {.v = jgmenucmd } },
  { ClkWinTitle,      0,           Button3,   spawn,          {.v = jgmenucmd } },
  { ClkRootWin,       0,           Button3,   spawn,          {.v = jgmenucmd } },

};

/* signal definitions */
/* signum must be greater than 0 */
/* trigger signals using `xsetroot -name "fsignal:<signame> [<type> <value>]"` */
static const Signal signals[] = {
  /* signum                    function */
  { "focusstack",         focusstack },
  { "setmfact",           setmfact },
  { "togglebar",          togglebar },
  { "incnmaster",         incnmaster },
  { "togglefloating",     togglefloating },
  { "focusmon",           focusmon },
  { "viewtoleft",         viewtoleft },
  { "viewtoright",        viewtoright },
  { "tagtoleft",          tagtoleft },
  { "tagtoright",         tagtoright},
  { "tagandviewtoleft",   tagandviewtoleft },
  { "tagandviewtoright",  tagandviewtoright },
  { "setcfact",           setcfact },
  { "tagmon",             tagmon },
  { "zoom",               zoom },
  { "incrgaps",           incrgaps },
  { "incrigaps",          incrigaps },
  { "incrogaps",          incrogaps },
  { "incrihgaps",         incrihgaps },
  { "incrivgaps",         incrivgaps },
  { "incrohgaps",         incrohgaps },
  { "incrovgaps",         incrovgaps },
  { "togglegaps",         togglegaps },
  { "defaultgaps",        defaultgaps },
  { "setgaps",            setgapsex },
  { "view",               view },
  { "viewall",            viewallex },
  { "viewex",             viewex },
  { "toggleview",         toggleview },
  { "shiftboth",          shiftboth },
  { "shiftview",          shiftview },
  { "shiftviewclients",   shiftviewclients },
  { "self_restart",       self_restart },
  { "toggleviewex",       toggleviewex },
  { "tag",                tag },
  { "tagall",             tagallex },
  { "tagex",              tagex },
  { "toggletag",          toggletag },
  { "toggletagex",        toggletagex },
  { "togglefullscreen",   togglefullscreen },
  { "togglescratch",      togglescratch },
  { "killclient",         killclient },
  { "quit",               quit },
  { "setlayout",          setlayout },
  { "setlayoutex",        setlayoutex },
};

