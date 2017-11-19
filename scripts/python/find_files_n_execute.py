import os
import subprocess


bcfiles = []
for root, dirs, files in os.walk('.'):
  for file in files:
    if file.endswith('.bc'):
      print 'llvm-dis '  + os.path.join(root, file)
      #subprocess.call(['llvm-dis', os.path.join(root, file)], shell=True)
      output = subprocess.check_output('llvm-dis ' + os.path.join(root, file))









      #bcfiles.append(os.path.join(root, file))
