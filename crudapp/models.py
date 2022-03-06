from django.db import models

class CategoryModel(models.Model):
    ID = models.IntegerField()
    Name = models.CharField(max_length=100)
    Content = models.CharField(max_length=1024)

    def __str__(self):
        return self.Name

    class Meta:
       #managed = False
       db_table = 'Category'