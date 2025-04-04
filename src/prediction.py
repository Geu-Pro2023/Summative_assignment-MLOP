# src/prediction.py
import cv2
import numpy as np

def predict_image(model, image_path, img_size=(150, 150), threshold=0.3):
    # Load and preprocess the image
    img = cv2.imread(image_path)
    if img is None:
        raise ValueError("Error: Unable to load the image. Please check the file path and format.")

    # Convert grayscale to BGR if necessary
    if len(img.shape) == 2:
        img = cv2.cvtColor(img, cv2.COLOR_GRAY2BGR)

    # Resize and normalize the image
    img_resized = cv2.resize(img, img_size)
    img_normalized = img_resized / 255.0
    img_for_prediction = np.expand_dims(img_normalized, axis=0)

    # Make a prediction
    confidence_score = model.predict(img_for_prediction)[0][0]
    confidence_percentage = confidence_score * 100
    predicted_class = 'Endangered' if confidence_score < threshold else 'Non-Endangered'
    return predicted_class, confidence_percentage