#!/bin/bash

onlygetallurls()
{
    echo "Enter the location of file having list of domains:- "
    read FILE
    echo "Enter file name to save all the urls:- "
    read name
    echo -e "\n[+] Getting all the URLs from different sources [+]"
    cat "$FILE" | gau >> URL${name}.txt            #Tool used:- getallurls
    sort -uo URL${name}.txt URL${name}.txt
    echo "[+] Done [+]"
    echo "URLs are saved into URL${name}.txt file"
}


onlygetalljsurls()
{
    local FILE
    echo "Input file containing URLS:-"
    read FILE
    subjs -i "$FILE" >> JS${FILE}
    getJS -input="$FILE" -complete >> JS${FILE}
    sort -uo JS${FILE} JS${FILE}
}

getallurls_getalljsurls()
{
    onlygetallurls
    #Grabbing JS links
    echo -e "\n[+] Getting all the JS files [+]"
    subjs -i URL${name}.txt >> JS${name}.txt
    getJS -input=URL${name}.txt -complete >> JS${name}.txt
    sort -uo JS${name}.txt JS${name}.txt 
    echo "Output is saved into JS${name}.txt"
}


main()
{
    echo "1) Get URLs from different sources"
    echo "2) Get JS files from list of URLs"
    echo "3) I want to do Both [Get URLs + Get JS files]"
    echo "4) Quit"

    echo "Please enter your choice: "
    read n

    case $n in
        1) onlygetallurls;;
        2) onlygetalljsurls;;
        3) getallurls_getalljsurls;;
        4) exit;;
        *) echo "Invalid option";;
    esac
}

main
