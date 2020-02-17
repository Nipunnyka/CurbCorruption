'''
localhost:5000?city=Mumbai&state=Maharashtra&test=1
localhost:5000?city=Kolkatta&state=West Bengal&test=1
localhost:5000?city=Chennai&state=Tamil Nadu&test=1
'''
'''
25 epochs each
localhost:5000?city=Jaipur&state=Rajasthan&test=1
localhost:5000?city=Patna&state=Bihar&test=1
localhost:5000?city=Lucknow&state=Uttar Pradesh&test=1
localhost:5000?city=Ranchi&state=Jharkhand&test=1
localhost:5000?city=Hyderabad&state=Telangana&test=1
localhost:5000?city=Chandigarh&state=Punjab&test=1
localhost:5000?city=Bangalore&state=Karnataka&test=1
'''

from flask import (
    Blueprint, request
)
from bs4 import BeautifulSoup
import requests
import json

from . import train, test

bp = Blueprint('main', __name__)

# "https://en.wikipedia.org/wiki/List_of_Indian_states_and_union_territories_by_literacy_rate",
urls = [
    "https://en.wikipedia.org/wiki/List_of_cities_in_India_by_population",
    "https://en.wikipedia.org/wiki/List_of_states_and_union_territories_of_India_by_crime_rate",
    "https://en.wikipedia.org/wiki/List_of_Indian_states_and_union_territories_by_poverty_rate",
    "https://en.wikipedia.org/wiki/List_of_states_and_union_territories_of_India_by_tax_revenues"
]
url_headings = [
    "population",
    "crime",
    "poverty",
    "tax"
]
scraped_headings = [
    "State", "City", "State/UT", "State/U.T.", "State or union territory"
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
            if str(j.text).rstrip() == city:
                check = 1
            if city in str(j.text).rstrip():
                check = 1
            if check != 0:
                # if not (headings[check] in scraped_headings):
                ans[headings[check]] = str(j.text).rstrip()
                check += 1
        if check != 0:
            break
    return ans

def collectCityData(city, state):
    ans = {}
    ans['city'] = city
    ans['state'] = state
    for i in range(len(urls)):
        # print(urls[i])
        # print(ans)
        if i == 0:
            ans[url_headings[i]] = getData(city, urls[i])
        else:
            ans[url_headings[i]] = getData(state, urls[i])
    return ans

def cleanString(s):
    if ',' in s:
        s = s.split(",")
        ans = ""
        for i in s:
            ans += i
    return int(ans)

def FormList(jsonOutput):
    ans = [0] * 4
    ans[0] = (int(jsonOutput["crime"]["2014"]) + int(jsonOutput["crime"]["2015"]) + int(jsonOutput["crime"]["2016"])) / (3 * 1000000)
    ans[1] = (float(jsonOutput["poverty"]["Poverty (% of people below poverty line)[4]"])) / (100)
    ans[2] = (int(jsonOutput["tax"]["Tax Revenues (INR Billions) 2014-2019[1]"])) / (10000)
    ans[3] = (cleanString(jsonOutput["population"]["Population(2011)[3]"]) - cleanString(jsonOutput["population"]["Population(2001)"])) / (1000000)
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
        final_list = []
        ans = collectCityData("Thiruvananthapuram", "Kerala")
        if ans:
            final_list.append(FormList(ans))
        ans = collectCityData(jsonInput['city'], jsonInput['state'])
        print(ans)
        final_list.append(FormList(ans))
        if "test" in jsonInput and jsonInput['test'] == '1':
            ans['testing_results'] = test.getData(FormList(ans))
            print("testing data done")
        else:
            train.trainModel(final_list)
        if ans:
            print(ans)
            return ans
    return "Invalid Input"

