# Import libraries
import requests
import urllib.request
import time
from bs4 import BeautifulSoup

base_url = 'https://www.liquor.com'
buffer = []

def recursiveFoo(url):
    # Connect to the URL
    response = requests.get(url)
    # Parse HTML and save to BeautifulSoup object¶
    soup = BeautifulSoup(response.text, "html.parser")
    div_tags = soup.findAll('div')
    if(soup.findAll('div',attrs={"class":"measure"})):
        # print(url)
        getIngrediants(url)
        return 1

    a_tags = soup.findAll('a')
    temp = ' '
    for i in a_tags:
        href_string = i['href']

        if(href_string.find('recipes') != -1 and href_string.find('mosaic') == -1 and href_string.find('page') == -1 and href_string.find('liquor') != -1):
            if(temp != href_string):
                temp = href_string
                recursiveFoo(href_string)
        elif(href_string.find('page') != -1):
            if(int(url.rsplit('/')[-2]) == 47):
                print('\nPage '+url.rsplit('/')[-2]+" Done!\n")
                # writeBuffer()
                return -1
            elif(int(url.rsplit('/')[-2]) == (int(href_string.rsplit('/')[-2]) - 1)):
                print('Page '+url.rsplit('/')[-2]+" Done!")
                if(recursiveFoo(href_string)==-1):
                    return -1

def getIngrediants(url):
    response = requests.get(url)
    # Parse HTML and save to BeautifulSoup object¶
    file = open("recipes.txt",'a+')
    file.write("\n" + url.rsplit('/')[-2] + "{\n")
    # recipeString = "\n" + url.rsplit('/')[-2] + "{\n"
    measures = []
    ingred = []
    soup = BeautifulSoup(response.text, "html.parser")
    for i in soup.findAll('div',attrs={"class":"measure"}):
        numb = i.text
        numb = numb.replace('\n','')
        numb = numb.replace('\t','')
        numb = numb.replace('\xa0',' ')
        measures.append(numb)
    for i in soup.findAll('div',attrs={"class":"x-recipe-ingredient"}):
        numb = i.text
        numb = numb.replace('\n','')
        numb = numb.replace('\t','')
        ingred.append(numb)
    for i in range(len(ingred)):
        file.write("    " + measures[i]+" "+ingred[i]+"\n")
        # recipeString = recipeString + "    " + measures[i]+" "+ingred[i]+"\n"
    # recipeString = recipeString + "}\n"
    # buffer.append(recipeString)
    file.write("}\n")
    file.close()
    time.sleep(1)

def writeBuffer():
    file = open("recipes.txt",'a+')
    for recipe in buffer:
        file.write(recipe)
    file.close()


# Set the URL you want to webscrape from
start_url = 'https://www.liquor.com/recipes/page/1/?'

recursiveFoo(start_url)
print("All done: check for recipes.txt in the folder you ran this in")
