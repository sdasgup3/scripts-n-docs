for file in $(cat fileList.txt); do 
  x=$(grep $file ~/Junk/remill.csv);
  y=$(grep $file ~/Junk/revamb.csv);
  z=$(grep $file ~/Junk/orig.csv);

  x_status=$(echo $x | cut -d "," -f 1);
  x_time=$(echo $x | cut -d "," -f 2);

  y_status=$(echo $y | cut -d "," -f 1);
  y_time=$(echo $y | cut -d "," -f 2);

  z_time=$(echo $z | cut -d "," -f 1);

  echo Benchmarks/$file,$z_time,$x_status,$x_time,$y_status,$y_time;
done

