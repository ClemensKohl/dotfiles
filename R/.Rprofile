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

require("colorout")
#############

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

