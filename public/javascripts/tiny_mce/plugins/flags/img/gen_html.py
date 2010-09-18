import os

for f in os.listdir('.'):
  base = f.split(".")[0]
  print '<td><a href="javascript:FlagsDialog.insert("%s","flags_dlg.%s");"><img src="img/%s" width="16" height="11" border="0" alt="{#flags_dlg.%s}" title="{#flags_dlg.%s}" /></a></td>' % (f, base, f, base, base)
