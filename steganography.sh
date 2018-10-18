!#/bin bash

#Analyzers
#Tools to run in the beginning. Allow you to get a broad idea of what you are dealing with.

#file 	Check out what kind of file you have
file stego.jpg
#exiftool 	Check out metadata of media files
exiftool stego.jpg
#binwalk 	Check out if other files are embedded/appended
binwalk stego.jpg
#strings 	Check out if there are interesting readable characters in the file
strings stego.jpg
#foremost 	Carve out embedded/appended files
foremost stego.jpg
#pngcheck 	Get details on a PNG file (or find out is is actually something else)
pngcheck stego.png
#identify 	GraphicMagick tool to check what kind of image a file is. Checks also if image is corrupted.
identify -verbose stego.jpg
#ffmpeg 	ffmpeg can be used to check integrity of audio files and let it report infos and errors
ffmpeg -v info -i stego.mp3 -f null - to recode the file and throw away the result

#Detection
#Tools designed to detect steganography in files. Mostly perform statistical tests.
#They will reveal hidden messages only in simple cases.
#However, they may provide hints what to look for if they find interesting irregularities.

#stegoVeritas 	Images (JPG, PNG, GIF, TIFF, BMP) 	A wide variety of simple and advanced checks. Check out stegoveritas.py -h. Checks metadata, creates many transformed images and saves them to a directory, Brute forces LSB, ...
stegoveritas.py stego.jpg to run all checks
#zsteg 	Images (PNG, BMP) 	Detects various LSB stego, also openstego and the Camouflage tool
zsteg -a stego.jpg to run all checks
#stegdetect 	Images (JPG) 	Performs statistical tests to find if a stego tool was used (jsteg, outguess, jphide, ...). Check out man stegdetect for details.
stegdetect stego.jpg
#stegbreak 	Images (JPG) 	Brute force cracker for JPG images. Claims it can crack outguess, jphide and jsteg.
stegbreak -t o -f wordlist.txt stego.jpg, #use -t o for outguess, -t p for jphide or -t j for jsteg
