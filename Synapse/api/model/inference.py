import torch
import torch.nn.functional as F
from torchvision import transforms
from PIL import Image
import os

# Daftar kelas sesuai dengan struktur dataset Anda
class_names = ['adenocarcinoma', 'benign', 'squamous_cell_carcinoma']

# Transformasi yang digunakan selama pelatihan
transform = transforms.Compose([
    transforms.Resize(224),
    transforms.CenterCrop(224),
    transforms.ToTensor(),
    transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]),
])

# Definisikan kelas model sesuai dengan arsitektur yang digunakan
class ConvolutionalNetwork(torch.nn.Module):
    def __init__(self):
        super(ConvolutionalNetwork, self).__init__()
        self.conv1 = torch.nn.Conv2d(3, 6, 3, 1)
        self.conv2 = torch.nn.Conv2d(6, 16, 3, 1)
        self.fc1 = torch.nn.Linear(16 * 54 * 54, 120)
        self.fc2 = torch.nn.Linear(120, 84)
        self.fc3 = torch.nn.Linear(84, 20)
        self.fc4 = torch.nn.Linear(20, len(class_names))  # Sesuaikan dengan jumlah kelas yang ada

    def forward(self, X):
        X = F.relu(self.conv1(X))
        X = F.max_pool2d(X, 2, 2)
        X = F.relu(self.conv2(X))
        X = F.max_pool2d(X, 2, 2)
        X = X.view(-1, 16 * 54 * 54)
        X = F.relu(self.fc1(X))
        X = F.relu(self.fc2(X))
        X = F.relu(self.fc3(X))
        X = self.fc4(X)
        return F.log_softmax(X, dim=1)

# Fungsi untuk memuat model dari file
def load_model(model_path):
    model = ConvolutionalNetwork()
    model.load_state_dict(torch.load(model_path))
    model.eval()  # Set model ke evaluasi mode
    return model

# Fungsi untuk memprediksi kelas dari gambar
def predict_image(image_path, model, class_names):
    image = Image.open(image_path).convert("RGB")
    image = transform(image).unsqueeze(0)  # Tambahkan dimensi batch
    with torch.no_grad():
        output = model(image)
        _, predicted = torch.max(output, 1)
    return class_names[predicted.item()]
