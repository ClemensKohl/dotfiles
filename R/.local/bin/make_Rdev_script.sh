#!/bin/bash

export RSOURCES=~/src
export RDEVEL=~/R-devel

cat <<EOF>~/bin/Rdev;
#!/bin/bash

export R_LIBS=$RDEVEL/library
export PATH="$RDEVEL/bin/:\$PATH"
R "\$@"
EOF

cat <<EOF>~/bin/rstudio-dev;
#!/bin/bash
export R_LIBS=$RDEVEL/library
export PATH="$RDEVEL/bin/:\$PATH"
export RSTUDIO_WHICH_R=$RDEVEL/bin/R
rstudio
EOF

chmod a+x ~/bin/Rdev
chmod a+x ~/bin/rstudio-dev
