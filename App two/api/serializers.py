# For serializing JSON objects on the api

from django.contrib.auth.models import User
from rest_framework import serializers
from rest_framework.validators import UniqueTogetherValidator


class UserSerializer(serializers.ModelSerializer):
    """Serializes the user JSON object(s)
    
    A serializer to map JSON to our model and vice-versa. 
    The unique together validator will allow us to verify that the combination of username and email 
    is unique for any particular user.
    """

    def create(self, validated_data):
        """Creating a new user JSON object"""

        user = User.objects.create_user(**validated_data)
        return user
    
    class Meta:
        model = User
        fields = (
            'username',
            'first_name',
            'last_name',
            'email',
            'password',
        )
        validators = [
            UniqueTogetherValidator(
                queryset=User.objects.all(),
                fields=['username', 'email']
            )
        ]