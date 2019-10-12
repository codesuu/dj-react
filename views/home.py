from django.shortcuts import render
from django.http import JsonResponse
from django.views.generic import TemplateView

# Create your views here.


class ReactView(TemplateView):
    def __init__(self, *args, **kwargs):
        pass

    def get(self, request, *args, **kwargs):
        import os
        BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        test = os.path.join(BASE_DIR, 'frontend', 'build'), # append
        print(test)
        return render(request, 'index.html')
        