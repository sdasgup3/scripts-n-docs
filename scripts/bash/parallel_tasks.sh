#!/bin/bash
# Our custom function
#cust_func(){
#  file=$1 
#  echo 
#  echo $file;
#  echo =======;
##nice -10 ~/Github/strata/stoke/bin/stoke_debug_circuit --strata_path ../circuits --opc $file --smtlib_format &> concrete_instances/memory-variants/instructions/$file/$file.strata.sym
#  
#  ~/x86-semantics/scripts/z3compare.pl --file concrete_instances/memory-variants/instructions/$file/$file.strata.sym  --file concrete_instances/memory-variants/instructions/$file/$file.strata.alt.sym --opcode $file ; z3 ~/Junk/LOCKER/$file.z3
#}
## For loop
#filelist=$1
#for i in $(cat $filelist)
#do
##cust_func $i &
#	cust_func $i &
#done
# 
#wait 
#echo "All done"


# for file in $(find . -name "*.strata.sym"); do txt=$(grep "sigsegv" $file); if [ "$txt" == "" ]; then echo $file; fi; done
# find . -name "*.strata.sym"| xargs grep -i "error\|fail\|assert\|abort\|exception"
#diffTxt=$(diff  -I "sigsegv\|Value\|was read at" <(sed -e 's/TMP_BV_[0-9]*_[0-9]*/TEMP_BV/g' -e 's/TMP_BOOL_[0-9]*/TMP_BOOL/g' concrete_instances/memory-variants/instructions/$file/$file.strata.sym) <(sed -e 's/TMP_BV_[0-9]*_[0-9]*/TEMP_BV/g'  -e 's/TMP_BOOL_[0-9]*/TMP_BOOL/g' concrete_instances/memory-variants/instructions/$file/$file.strata.alt.sym))
#  if [ "$diffTxt" != "" ]; then
#    echo $file
#    echo ======
#    echo $diffTxt
#  fi

#for file in $(ls ~/Junk/LOCKER/*); do grep "check" $file &> log; if [ "$?" != "0" ] ; then echo $file; fi   ;  done

circuits="/home/sdasgup3/Github/strata-data/circuits/"
file=$1
#parallel -a $file "echo; echo {}; ~/Github/strata/stoke/bin/stoke_debug_circuit --strata_path $circuits --opc {} --smtlib_format &> concrete_instances/memory-variants/instructions/{}/{}.strata.sym"

#parallel  -a $file "echo; echo {}; ~/Github/master_stoke/bin/stoke_debug_formula --opc {} --smtlib_format &>  concrete_instances/memory-variants/instructions/{}/{}.strata.alt.sym"

parallel  -a $file "echo; echo {}; ~/x86-semantics/scripts/z3compare.pl --file concrete_instances/memory-variants/instructions/{}/{}.strata.sym  --file concrete_instances/memory-variants/instructions/{}/{}.strata.alt.sym --opcode {} ; z3 ~/Junk/LOCKER/{}.z3"
