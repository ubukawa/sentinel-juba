echo "start"; date;
for f in 01_band/*.jp2; do gdal_translate ${f} 01_band/`basename ${f} .jp2`.tif; done;
for f in 01_band/*.tif; do gdal_calc.py -A ${f} --calc="(A<=0)*0 + (A>0)*(A<=3500)*A/14 + (A>3500)*250" --type=Byte --outfile 2_8bit/`basename ${f}`; done; echo "end"; date; 