#now define weather if it is a corruption complaint or one of the last 10 states
#define 1 for corruption and 0 for non corruption
# isCorruption = 0

import numpy
from tensorflow import keras


# GDPCityDict = {'Mumbai':.7005, 'Chennai':.6469, 'Hyderabad':.5063, 'Kolkata':.4036, 'Bengaluru':.5051 }

# PopulationCityDict = {'Mumbai':1.2442373, 'Chennai':.4681087, 'Hyderabad':.6809970, 'Kolkata':.4486679, 'Bengaluru':.8436675 }

# UnemploymentStateDict = {'Maharashtra':.49, 'Tamil Nadu':.76, 'Telangana':.76, 'West Bengal':.46, 'Karnatka':.48 }

# PovertyStateDict = {'Maharashtra':.1735, 'Tamil Nadu':.1128, 'Telangana':.0920, 'West Bengal':.1998, 'Karnatka':.2091 }

# CrimeStatedict = {'Maharashtra':.24, 'Tamil Nadu':.29, 'Telangana':.36, 'West Bengal':.25, 'Karnatka':.31 }

# LiteracyStateDict = {'Maharashtra':.8291, 'Tamil Nadu':.8033, 'Telangana':.674, 'West Bengal':.7708, 'Karnatka':.7560 }

#make the dataset
def trainModel(PlaceData):
    # X = numpy.array([[GDPCityDict[city], PopulationCityDict[city], UnemploymentStateDict[state], PovertyStateDict[state], CrimeStatedict[state], LiteracyStateDict[state]]]) 

    #load the model defined with latest trainig weights
    model = keras.models.load_model('checkpoint/model.h5')

    for isCorruption in range(2):
        X = numpy.array([
                PlaceData[isCorruption]
            ])
        print(type(PlaceData[isCorruption]))
        print("Place Data: ", isCorruption, " => ", PlaceData[isCorruption])
        y = numpy.array([[isCorruption]])	
        print(y)

        # fit the keras model on the dataset
        model.fit(X, y, epochs=25, batch_size=1)
    
    model.save('checkpoint/model.h5')
    # print('Accuracy: %.2f' % (accuracy*100))

