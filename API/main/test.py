import numpy 
from tensorflow import keras

# GDPCityDict = {'Mumbai':.7005, 'Chennai':.6469, 'Hyderabad':.5063, 'Kolkata':.4036, 'Bengaluru':.5051 }

# PopulationCityDict = {'Mumbai':1.2442373, 'Chennai':.4681087, 'Hyderabad':.6809970, 'Kolkata':.4486679, 'Bengaluru':.8436675 }

# UnemploymentStateDict = {'Maharashtra':.49, 'Tamil Nadu':.76, 'Telangana':.76, 'West Bengal':.46, 'Karnatka':.48 }

# PovertyStateDict = {'Maharashtra':17.35, 'Tamil Nadu':.1128, 'Telangana':.0920, 'West Bengal':.1998, 'Karnatka':.2091 }

# CrimeStatedict = {'Maharashtra':.24, 'Tamil Nadu':.29, 'Telangana':.36, 'West Bengal':.25, 'Karnatka':.31 }

# LiteracyStateDict = {'Maharashtra':.8291, 'Tamil Nadu':.8033, 'Telangana':.674, 'West Bengal':.7708, 'Karnatka':.7560 }

def getData(PlaceData):
    #make the dataset
    X = numpy.array([
        PlaceData
    ]) 

    model = keras.models.load_model('checkpoint/model.h5')
    #model.summary()

    ans = model.predict(X)
    print("Prediction: ", ans)
    return float(ans[0][0])

