from django.shortcuts import render
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .models import Food
from .serializer import FoodSerializer

# Create your views here.
@api_view(['GET'])
def getFood(request):
    """A view for the food api."""
    
    food = Food.objects.all()
    serializer = FoodSerializer(food, many=True)

    return Response(serializer.data)

@api_view(['POST'])
def postFood(request):
    """View to aloow post requests on the food api"""

    serializer = FoodSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()

    return Response(serializer.data)
