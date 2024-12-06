from django.shortcuts import render
from django.http import JsonResponse
from .model.inference import predict_image, load_model, class_names
from django.core.files.storage import FileSystemStorage
from django.views.decorators.csrf import csrf_exempt
from django.middleware.csrf import get_token
import os
from django.conf import settings
from django.http import FileResponse

# Muat model
model = load_model('api/model/garden/lung_cnn.pkl')

def serve_image(request, filename):
    filepath = os.path.join(settings.BASE_DIR, filename)
    print(f"Attempting to open file at: {filepath}")
    return FileResponse(open(filepath, 'rb'), content_type='image/jpeg')

@csrf_exempt
def get_csrf_token(request):
    token = get_token(request)
    return JsonResponse({'csrfToken': token})

@csrf_exempt
def predict_image_view(request):
    if request.method == 'POST' and request.FILES['image']:
        
        # transform = transforms.Compose([
        #     transforms.Resize(224),
        #     transforms.CenterCrop(224),
        #     transforms.ToTensor(),
        #     transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225]),
        # ])
        image_file = request.FILES['image']
        
        # Simpan file sementara
        fs = FileSystemStorage()
        filename = fs.save(image_file.name, image_file)
        # filepath = fs.url(filename)
        filepath = fs.path(filename)

        # predicted_class = predict_image(filepath, model, transform, class_names)
        predicted_class = predict_image(filepath, model, class_names)
        
        return JsonResponse({'predicted_class': predicted_class, 'image_path': filepath})
    return JsonResponse({'error': 'No image uploaded'}, status=400)
