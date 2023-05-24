"""
Serializers convert complex Django models to JSON objects, 
making data easily read on the API. Serializing makes data more readable on the API.
"""

from rest_framework import serializers
from .models import Food

class FoodSerializer(serializers.ModelSerializer):
    """A serializer for the Kenyan Food API"""

    class Meta:
        model = Food
        fields = ('name', 'description')