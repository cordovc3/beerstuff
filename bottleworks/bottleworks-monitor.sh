python bottleworks.py

sort new_bottleworks | sponge new_bottleworks

cat new_bottleworks | grep -vPi "maisel|benedik|apothecary|bavik|double mountain|buoy|Dwinell|machine house|crux|whitewood|North Coast|ablis|ferment.+can|Finnriver|Lowercase|matchless|pfriem|seapine|shampoo|soap|locust|old stove|tieton|standard|icicle|baerlic|orval|alaskan|deschutes|garden path" | sponge new_bottleworks

difference=$(grep -vf old_bottleworks new_bottleworks | tr '\n' ' ' )
if [ "$difference" ]; then
  echo sending message
  messer --command "m \"BeerNotifier Platinum Free Trial\" New at bottleworks: $difference" 
  messer --command "m \"BeerNotifier Silver - NO CROSS TALK\" New at bottleworks: $difference" 
else
  echo no change
fi

mv new_bottleworks old_bottleworks
