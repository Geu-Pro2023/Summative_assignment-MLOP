# src/training.py
from tensorflow.keras.models import load_model
from tensorflow.keras.optimizers import Adam

def train_model(model, X_train, y_train, X_val, y_val, epochs=10, batch_size=32):
    # Freeze some layers
    for layer in model.layers[:-5]:
        layer.trainable = False

    # Compile the model
    model.compile(optimizer=Adam(learning_rate=1e-4),
                  loss='binary_crossentropy',
                  metrics=['accuracy'])

    # Train the model
    history = model.fit(X_train, y_train,
                        epochs=epochs,
                        validation_data=(X_val, y_val),
                        batch_size=batch_size)
    return history