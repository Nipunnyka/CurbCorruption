from flask import (
    Blueprint, request
)
from bs4 import BeautifulSoup
import requests
import json

bp = Blueprint('main', __name__)

# "https://en.wikipedia.org/wiki/List_of_Indian_states_and_union_territories_by_literacy_rate",
urls = [
    "https://en.wikipedia.org/wiki/List_of_cities_in_India_by_population",
    "https://en.wikipedia.org/wiki/List_of_states_and_union_territories_of_India_by_crime_rate",
    "https://en.wikipedia.org/wiki/List_of_Indian_states_and_union_territories_by_poverty_rate",
    "https://en.wikipedia.org/wiki/List_of_states_and_union_territories_of_India_by_tax_revenues"
]

def getData(city, url):
    res = requests.get(url)
    soup = BeautifulSoup(res.text,'lxml')
    info = soup.find('table',{'class':'wikitable'})
    para = info.find_all('tr')
    headings = []
    heading = para[0].find_all('th')
    if heading == None:
        heading = para[0].find_all('td')
    for i in heading:
        headings.append(str(i.text).rstrip())

    idx = 0
    ans = {}
    for i in para:
        if idx == 0:
            pass
            idx += 1

        row = i.find_all('td')
        check = 0
        for j in row:
            if j.text == city:
                check = 1
            if check != 0:
                ans[headings[check]] = str(j.text).rstrip()
                check += 1
        if check != 0:
            break
    return ans

def collectCityData(city, state):
    ans = {}
    for i in range(len(urls)):
        print(urls[i])
        print(ans)
        if i == 0:
            ans[str(i)] = getData(city, urls[i])
        else:
            ans[str(i)] = getData(state, urls[i])
    return ans

@bp.route('/', methods=('GET', 'POST'))
def index():
    jsonInput = {}
    if request.method == 'POST':
        postInput = None
        if request.data:
            postInput = request.data
        if request.form:
            postInput = request.form
        if request.json:
            postInput = request.json
        
        # print(postInput)
        
        if postInput:
            try:
                postInput = postInput.decode('utf8')
                jsonInput = json.loads(postInput)
                # print(jsonInput)
            except:
                for i in postInput:
                    jsonInput[i] = postInput[i]
                # print(jsonInput)
        

    if request.method == 'GET':
        for i in request.args:
            jsonInput[i] = request.args[i]
    if jsonInput:
        print("LOL")
        ans = collectCityData(jsonInput['city'], jsonInput['state'])
        if ans:
            print(ans)
            return ans
    return "Invalid Input"

