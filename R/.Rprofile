# Sample Rprofile.site file

# Things you might want to change
# options(papersize="a4")
# options(editor="notepad")
# options(pager="internal")

# R interactive prompt
# options(prompt="> ")
# options(continue="+ ")

# to prefer Compiled HTML
# help options(chmhelp=TRUE)
# to prefer HTML help
# options(htmlhelp=TRUE)

# General options
#options(tab.width = 2)
#options(width = 130)
#options(graphics.record=TRUE)


assign(".First", function(){
	 os_name <- system('bash ~/bin/R-version.sh', intern = TRUE)

	if (R.Version()$status != "Under development (unstable)"){
	 maj <- R.Version()$major
	 min <- substr(R.Version()$minor, 1,1)

	 home <- system('echo $HOME', intern=TRUE)
	 lib_dir <- paste0(home,"/R/",os_name,"/R",maj,".",min)
	 system(paste0('mkdir -p ', lib_dir))

	  .libPaths(c(lib_dir, .libPaths()))
	}
	 

	# cat("\nRprofile startup script run. New library location:\n", lib_dir, "\nWelcome! ", date(), "\n")
}, envir = globalenv())

#assign(".Last", function() cat("\n   Goodbye!\n\n"), envir = globalenv())

# Colorout setup 
require("colorout")

#' Helper for generating ansi color codes with hex color codes.
#'
#' After generating ansi color codes, feed input to `colorout::setOutputColors`.
#'
#' @param fg Foreground color in hex format (ie '#000000'). Leave blank for default.
#' @param bg Background color in hex format (ie '#000000'). Leave blank for default.
#' @param fo Formatting (see details)
#' 
#' @details
#' Value	Formating
#' 0	No formating
#' 1	Bold or bright
#' 2	Faint
#' 3	Italic or inverse
#' 4	Underline
#' 5	Blink slowly
#' 6	Blink quickly
#' 7	Invert

# to_ansi <- function(col, fg = '', bg = '', fo = '') {
#
#   escape <- '\\x1b['
#
#   if (fg != '') fg <- {
#     rgb_fg <- col2rgb(fg)
#     paste0("38;2;", rgb_fg[1], ";", rgb_fg[2], ";", rgb_fg[3])
#   }
#   if (bg != '') bg <- {
#     rgb_bg <- col2rgb(bg)
#     paste0(";48;2;", rgb_bg[1], ";", rgb_bg[2], ";", rgb_bg[3])
#   }
#   fo <- if (fo != '') paste0(';', fo)
#
#   # Use `cat`, not `paste0`, for correctly printing escape char '\x1b['
#   cat(col, ': ', escape, fg, bg, fo, 'm', '\n', sep = '')
# }


# General ---------------------------------------- 
if (require("colorout")){

    colorout::setOutputColors(

                              index    = "\x1b[38;2;115;121;148m", #'\x1b[38;2;76;86;106m',
                              normal   = "\x1b[38;2;140;170;238m", #"\x1b[38;2;198;208;245m", #'\x1b[38;2;216;222;233m',

                              number   = "\x1b[38;2;242;213;207m",  #'\x1b[38;2;236;239;244m',
                              negnum   = "\x1b[38;2;244;184;228m", #'\x1b[38;2;180;142;173m',
                              zero     = "\x1b[38;2;238;190;190m", #"\x1b[38;2;186;187;241m", #'\x1b[38;2;136;192;208m',
                              zero.limit = 0.01,
                              infinite = "\x1b[38;2;244;184;228m", #'\x1b[38;2;236;239;244m',

                              string   = "\x1b[38;2;166;209;137m", #'\x1b[38;2;235;203;139m',
                              date     = "\x1b[38;2;229;200;144m", #'\x1b[38;2;236;239;244m',
                              const    = "\x1b[38;2;229;200;144m", #'\x1b[38;2;136;192;208m',

                              true     = "\x1b[38;2;129;200;190m", #'\x1b[38;2;163;190;140m',
                              false    = "\x1b[38;2;244;184;228m", #'\x1b[38;2;191;97;106m',

                              warn     = "\x1b[38;2;239;159;118m", #'\x1b[38;2;235;203;139m',
                              stderror = "\x1b[38;2;186;187;241m", #"\x1b[38;2;231;130;132m", #'\x1b[38;2;191;97;106m',
                              error = "\x1b[38;2;231;130;132m", #'\x1b[38;2;191;97;106m',

                              verbose  = FALSE
    )

    # Custom patterns --------------------------------

    # NOTE Do not copy all. Pick what you use/like.

    # _ {data.table} ---------------------------------

    # colorout::addPattern('[0-9]*:',  '\x1b[38;2;143;188;187m')  # Row num
    # colorout::addPattern('---',      '\x1b[38;2;76;86;106m')  # Row splitter 
    # colorout::addPattern('<[a-z]*>', '\x1b[38;2;143;188;187m')  # Col class 
    #
    # _ `str` ----------------------------------------

    # Class
    colorout::addPattern(' num ',        "\x1b[38;2;129;200;190m")
    colorout::addPattern(' int ',        "\x1b[38;2;129;200;190m")
    colorout::addPattern(' chr ',        "\x1b[38;2;129;200;190m")
    colorout::addPattern(' Factor ',     "\x1b[38;2;129;200;190m")
    colorout::addPattern(' Ord.factor ', "\x1b[38;2;129;200;190m")
    colorout::addPattern(' logi ',       "\x1b[38;2;129;200;190m")
    colorout::addPattern('function ',    "\x1b[38;2;129;200;190m")
    colorout::addPattern(' dbl ',        "\x1b[38;2;129;200;190m")
    colorout::addPattern(' lgcl ',       "\x1b[38;2;129;200;190m")
    colorout::addPattern(' cplx ',       "\x1b[38;2;129;200;190m")
    # Misc
    colorout::addPattern('$ ',           "\x1b[38;2;129;200;190m")

    # _ `str`, {mlr3} --------------------------------

    # R6 field name
    colorout::addPattern('* [A-z]*:',                      '\x1b[38;2;235;203;139m')
    colorout::addPattern("* [A-z]* [A-z]*:",               '\x1b[38;2;235;203;139m')
    colorout::addPattern("* [A-z]* [A-z]* [A-z]*:",        '\x1b[38;2;235;203;139m')
    colorout::addPattern("* [A-z]* [A-z]* [A-z]* [A-z]*:", '\x1b[38;2;235;203;139m')
    # So on...

    #############

}
#.First <- function(){
# os_name <- system('bash ~/PhD/scripts/R-version.sh', intern = TRUE)
#
#if (R.Version()$status != "Under development (unstable)"){
# maj <- R.Version()$major
# min <- substr(R.Version()$minor, 1,1)
#
# home <- system('echo $HOME', intern=TRUE)
# lib_dir <- paste0(home,"/R/",os_name,"/R",maj,".",min)
# system(paste0('mkdir -p ', lib_dir))
#
#  .libPaths(c(lib_dir, .libPaths()))
#}
# 
#
# cat("\nRprofile startup script run. New library location:\n", lib_dir, "\nWelcome! ", date(), "\n")
#}
#.Last <- function(){
# cat("\nGoodbye at ", date(), "\n")
#}


