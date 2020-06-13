 curl --silent "https://togo.holymountainbrewing.com/" | grep "BOOTSTRAP" | cut -c38- | perl -ple 'chop' | jq -c ".commerceLinks.products[] | \"\(.name) https://togo.holymountainbrewing.com\"" | tr -d '"'| grep -viP "SAGE|T-Shirt|Pin|Ginger beer|Keg|COAL|Koozie|Underberg|hoodie|cider|glass|shrit|tote" > new

difference=$(grep -vf old new | tr '\n' ' ')
if [ "$difference" ]; then
  echo sending message
  messer --command "m \"BeerNotifier Platinum Free Trial\" New at homo: $difference"
  messer --command "m \"BeerNotifier Silver - NO CROSS TALK\" New at homo: $difference"
else
  echo no change
fi

mv new old
