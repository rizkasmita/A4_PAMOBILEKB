from django.test import TestCase
from .models import Image

class ImageModelTest(TestCase):
    def test_string_representation(self):
        image = Image(name="Test Image")
        self.assertEqual(str(image), "Test Image")
