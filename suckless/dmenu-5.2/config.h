/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1; /* -b  option; if 0, dmenu appears at bottom     */
static const unsigned int alpha =
    (255 / 100) * 90;       /* (255 / 100) * percentage */
static int centered = 1;    /* -c option; centers dmenu on screen */
static int min_width = 500; /* minimum width when centered */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {"monospace:size=10"};
static const char *prompt =
    NULL; /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
    /*     fg         bg       */
    [SchemeNorm] = {"#cdd6f4", "#1e1e2e"},
    [SchemeSel] = {"#1e1e2e", "#cba6f7"},
    [SchemeOut] = {"#000000", "#89dceb"},
    [SchemeSelHighlight] = {"#ffc978", "#005577"},
    [SchemeNormHighlight] = {"#ffc978", "#222222"},
    [SchemeOutHighlight] = {"#ffc978", "#00ffff"},
};

static const unsigned int alphas[SchemeLast][2] = {
    [SchemeNorm] = {OPAQUE, alpha},
    [SchemeSel] = {OPAQUE, alpha},
    [SchemeOut] = {OPAQUE, alpha},
};

/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines = 20;
static unsigned int columns = 3;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 2;
