# Calorie Counter Application using Flutter
The importance of calorie tracking is gaining wide acceptance in health and fitness sector. It becomes important to ensure that process is simple, fast, and effective. Estimation of right nutrient intake through food consumption has become increasingly significant to maintain the proper health of the wellbeing. The existing fitness applications require manual entry of food items to calculate calorie intake. The growing need of diet tracking in the world has evolved many applications that shows user the calories intake a food product can provide, this project does it in a different manner. It will provide the option of taking the input as an image. The application will take the image of the food product as the input from the user and process it to show the output i.e., the calories and other nutrition contents like proteins, fats, and carbohydrates in the food item. The most significant component of this project is image classification model designed using Deep learning’s Convolutional Neural Network model trained on relevant dataset. The calorie tracking application has been designed using Flutter SDK along with TensorFlow Lite framework’s support to load CNN model and predict food name using user input image.
<br>
![Login Screen](https://github.com/imatulkt/Calorie-Counter-Application-using-Flutter/blob/main/Documentation/Login%20Screen.png)

<br>
<br>
The project will cater to the audience who are fitness and health conscious. Our project will help make such an audience that is looking for strategies to make calorie tracking an efficient and simpler process. The project offers a database which contains a variety of Indian food items which are frequently consumed, it will act as a unique feature and as well as lend scope to be scaled up as a separate product. The project can be used by gym trainers as well as nutritionists to check the daily calorie intake of their clients which can help them determine the type of training, exercises, or diet one needs to follow to keep themselves fit. If an application allows the user to be notified with the number of calories from a food image, it might help the user to track the calorie intake easily. A person cannot rely on memory to recall the food they consumed during the day. Even if they can recall what they ate, it is nearly impossible to track every meal. Hence, they are not likely to get a precise calorie number if their food journal is incomplete. Calorie counters and nutrient tracking-based smartphone applications will be extremely useful for an individual who is trying to lose, maintain or even gain weight, basically such an application will help track the calorie intake. This kind of mobile application can turn out to be quite useful to society as it provides an ease to measure dietary intake.
<br>
<br>
The project would use Convolutional Neural Network for image classification. Convolutional Neural Network is a Deep Learning algorithm which can take in an input image, assign weights and biases to various aspects/objects in the image and then is able to differentiate among them. The Convolutional Neural Network model was created using Python’s Keras framework and training and validation data were fitted on the model. To decide upon the correct selection of parameters   hit and trail approach was to be done to select appropriate values for model. Various combinations of number of filters, activation functions and number of epochs were to do, and changes would be observed in validation accuracy and loss. Training Accuracy and Training Loss are metrics associated with model’s performance with training dataset i.e., seen data, whereas Validation accuracy and validation loss refers to performance of model w.r.t. unseen data. The output of CNN model is an integer corresponding to label defined in training. A map/dictionary of indices as key and food name as value was created. The trained model along with weights would be saved in h5 extension, which could be further converted into tflite – TensorFlow Lite, an android/iOS suitable extension which can used in developing mobile application. A mobile application was to be built to enhance the reach of the project and make it much more usable. The mobile application would have several screens, including login, home page, profile, and so on. The user input option to upload an image from the mobile gallery will be available on the main page. The image processing model is loaded, and the food index is predicted as soon as the user uploads an image. Within the program, the projected meal index is utilized as a key to find the correct calories and nutrition information, such as proteins and carbs, from a text file. In mobile applications, the concept of file handling will be used extensively.
