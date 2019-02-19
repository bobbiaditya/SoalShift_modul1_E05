{
    if($1 == "United States" && $7 == "2012"){
        productLineQuantity[$4] += $10;
    }
}

END {
    for(key in productLineQuantity){
        print productLineQuantity[key] " " key;
    }
}