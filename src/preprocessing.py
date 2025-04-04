def load_and_preprocess_image(img_path, target_size=(150, 150)):
    """Load and preprocess single image"""
    img = cv2.imread(img_path)
    if img is None:
        return None
    img = cv2.resize(img, target_size)
    img = img / 255.0  # Normalize
    return img

def create_dataset(directory, label, target_size=(150, 150)):
    """Create labeled dataset from directory"""
    images = []
    labels = []
    for img_name in os.listdir(directory):
        if img_name.startswith('.'):
            continue
        img_path = os.path.join(directory, img_name)
        img = load_and_preprocess_image(img_path, target_size)
        if img is not None:
            images.append(img)
            labels.append(label)
    return np.array(images), np.array(labels)