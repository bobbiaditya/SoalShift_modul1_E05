{
    if($7 == "2012"){
        countryQuantity[$1] += $10;
    }
}

END {
    maxQuantity=0;
    maxCountry=""
    
    for(key in countryQuantity){
        if(maxQuantity < countryQuantity[key]){
            maxQuantity = countryQuantity[key];
            maxCountry = key;
        }
    }

    print maxCountry " " maxQuantity;
}