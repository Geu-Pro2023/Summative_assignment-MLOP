from sklearn.metrics import classification_report, confusion_matrix
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np  # Add this import

def evaluate_model(model, X_val, y_val):
    # Make predictions
    y_pred = model.predict(X_val)
    y_pred_classes = (y_pred > 0.5).astype(int)

    # Debug: Print unique values in predictions and true labels
    print("Unique values in y_pred_classes:", np.unique(y_pred_classes))
    print("Unique values in y_val:", np.unique(y_val))

    # Classification report
    print("Classification Report:")
    print(classification_report(y_val, y_pred_classes, target_names=['Endangered', 'Non-Endangered']))

    # Confusion matrix
    cm = confusion_matrix(y_val, y_pred_classes)
    plt.figure(figsize=(6, 4))
    sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
                xticklabels=['Endangered', 'Non-Endangered'],
                yticklabels=['Endangered', 'Non-Endangered'])
    plt.title('Confusion Matrix')
    plt.xlabel('Predicted')
    plt.ylabel('Actual')
    plt.show()

    # Validation metrics
    val_loss, val_accuracy = model.evaluate(X_val, y_val, verbose=1)
    print(f"Validation Loss: {val_loss}")
    print(f"Validation Accuracy: {val_accuracy}")