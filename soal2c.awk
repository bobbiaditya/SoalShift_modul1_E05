{
    if($1 == "United States" && $7 == "2012"){
        if($4 == "Personal Accessories" ||
            $4 == "Camping Equipment"   ||
             $4 == "Outdoor Protection") {
                productQuantity[$6] += $10;
             }
    }
}

END {
    for(key in productQuantity){
        print productQuantity[key] " " key;
    }
}