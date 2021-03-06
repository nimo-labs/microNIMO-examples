#!/bin/bash
for d in */
do
	cd $d
	rm -f umakefile
	for f in umakefile*
	do
		echo -------------------
		echo "Processing $d$f..."
		echo -------------------
		cp $f umakefile
		/root/umake/umake.py clean
		/root/umake/umake.py
		make
		if [ $? -eq 0 ]; then
			echo -------------------
			echo Build of $d$f passed
			echo -------------------
		else
			echo build of $d$f failed
			exit 1
		fi
		rm -f umakefile
	done
	cd ..
done
echo -------------------
echo All builds completed successfully
echo -------------------