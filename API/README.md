## Flask API
mines for parameters such as housing index, poverty rate etc from the internet based on user location and feeds it to the early warning system neural network. 
[link to deployed version](https://curb-corruption-api.herokuapp.com/?city=Mumbai&state=Maharashtra)

## Running the API
1. installing the , run the following command on shell
```
pip install -r requirements.txt
```  
2. Add below mentioned environment variables in .env file
```
FLASK_APP=main
```  
```
JSON_AS_ASCII=False
```  
3. to run the API
```
flask run
```
## Machine Dependencies
1. flask  
2. beautiful soup  
3. tensorflow  

