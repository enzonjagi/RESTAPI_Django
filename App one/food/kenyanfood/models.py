from django.db import models


# Create your models here.
class Food(models.Model):
    """A model class for the food app"""

    name = models.CharField(max_length=200)
    description = models.CharField(max_length=500)