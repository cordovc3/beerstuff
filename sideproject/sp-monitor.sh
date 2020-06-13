python sp.py

sort new_sp | sponge new_sp

cat new_sp | grep -vPi "sold out|no proxy|coming" | sponge new_sp


difference=$(grep -vf old_sp new_sp | tr '\n' ' ' )
if [ "$difference" ]; then
  echo sending message
  messer --command "m \"BeerNotifier Platinum Free Trial\" New at Side Project: $difference" 
  messer --command "m \"BeerNotifier Silver - NO CROSS TALK\" New at Side Project: $difference" 
else
  echo no change
fi

cat new_sp>>old_sp
cat old_sp | sort | uniq | sponge old_sp
rm new_sp
