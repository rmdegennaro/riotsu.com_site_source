strPathToImageSource="/home/riodeg242/LocalOnly/Documents/Development/riotsu.com_site_source/misc/make_photogrid_source/"
strPathToDestination="/home/riodeg242/LocalOnly/Documents/Development/riotsu.com_site_source/static/img/"
cd $strPathToImageSource
rm photogrid.jpg
montage *.jpg -background black -borderwidth 0 -geometry 20x20 -tile 7x4 photogrid.jpg
mv photogrid.jpg $strPathToDestination
