
#!/bin/bash

#https://stackoverflow.com/questions/15674683/run-the-development-version-of-r-along-side-the-stable-version
#https://logfc.wordpress.com/2015/07/01/r-devel-in-parallel-to-regular-r-installation/

export RSOURCES=~/src
export RDEVEL=~/R-devel

mkdir -p $RSOURCES
cd $RSOURCES
svn co https://svn.r-project.org/R/trunk R-devel
R-devel/tools/rsync-recommended

mkdir -p $RDEVEL
cd $RDEVEL

$RSOURCES/R-devel/configure --enable-R-shlib && make -j
#$RSOURCES/R-devel/configure && make -j
#$RSOURCES/R-devel/configure --with-readline=no --with-x=no --enable-R-shlib && make -j

# Rdev installation done

#Here is a script that saves the script automatically to your ~/bin/ directory:
#
#cat <<EOF>~/bin/Rdev;
##!/bin/bash
#
#export R_LIBS=$RDEVEL/library
#export PATH="$RDEVEL/bin/:\$PATH"
#R "\$@"
#EOF
#chmod a+x ~/bin/Rdev
#
#Now you can simply run Rdev as if you were running R, and you will have the development version of R, which will install packages in $RDEVEL/library.

