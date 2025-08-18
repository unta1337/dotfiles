#define USE_EXTERNAL_COLOR

/* Terminal colors (16 first used in escape sequence) */
static const char *colorname[] = {
  [0] = "#15161E",
  [1] = "#f7768e",
  [2] = "#9ece6a",
  [3] = "#e0af68",
  [4] = "#7aa2f7",
  [5] = "#bb9af7",
  [6] = "#7dcfff",
  [7] = "#a9b1d6",

  [8] = "#414868",
  [9] = "#f7768e",
  [10] = "#9ece6a",
  [11] = "#e0af68",
  [12] = "#7aa2f7",
  [13] = "#bb9af7",
  [14] = "#7dcfff",
  [15] = "#c0caf5",

  /* special colors */
  [256] = "#1a1b26", /* background */
  [257] = "#c0caf5", /* foreground */
};

/*
 * Default colors (colorname index)
 * foreground, background, cursor, reverse cursor
 */
unsigned int defaultfg = 257;
unsigned int defaultbg = 256;
unsigned int defaultcs = 257;
static unsigned int defaultrcs = 257;
