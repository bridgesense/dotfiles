/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
 	[INIT] =   "#1d2021",     /* after initialization */
 	[INPUT] =  "#076678",   /* during input */
	[FAILED] = "#9d0006",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
