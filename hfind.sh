# hfind.sh
#
#   Find file (esp. tagfile) in hh repos, i.e. in ~/Dokumente/NN/XY/XY/XY/
#     - NB: "../NN/XY/NN/NN/" would match squi named repos only, but not those with "clear names"
#
#   ! Zugleich Test: "Continue if no error" statt "Exit if error"
#

declare strNeedle="$1"
declare intContinue=1

echoHR() {
  echo "--------------------------------------------------------------------------------"
}
showHintWritingVariants() {
  echo "!! Für Schreibvarianten - v.a. GROSS / klein - entsprechenden Regex-String eingeben"
}
showSyntax() {
  echo "Syntax: ... NEEDLE"
}
exitShowSyntax() {
  intContinue=
  showSyntax
}
checkNeedleParameter() {
  [ "$intContinue" != 1 ] && return
  if  [ ! "$strNeedle" ]
    then
    exitShowSyntax
  fi
}
searchNeedle() {
  [ "$intContinue" != 1 ] && return
  echo "# ... Doing **find ~/Dokumente -mindepth 5 -maxdepth 5 -regex \".*/[0-9][0-9]/[^0-9]*/.*/.*/.*$strNeedle.*\" | grep -n --color=always \"$strNeedle\"**" ...
  echoHR
    # cd + find separat, damit find nicht jedes Mal kompletten Pfad expandiert vorne dran klatscht
  cd ~/Dokumente
  find -mindepth 5 -maxdepth 5 -regex ".*/[0-9][0-9]/[^0-9]*/.*/.*/.*$strNeedle.*" | grep -n --color=always "$strNeedle"
  echoHR
  showHintWritingVariants
}

checkNeedleParameter
searchNeedle

# ()