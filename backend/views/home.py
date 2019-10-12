from django.shortcuts import render
from django.http import JsonResponse
from django.views.generic import TemplateView

# Create your views here.


class ReactView(TemplateView):
    def get(self, request, *args, **kwargs):
        return render(request, 'index.html')
        