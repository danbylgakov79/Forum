from django.db import models

class ThemesModel(models.Model):
    ID = models.IntegerField()
    Category = models.IntegerField()
    Topic = models.IntegerField()
    Name = models.CharField(max_length=256)
    Content = models.CharField(max_length=512,blank=True)

    def __str__(self):
        return self.Name

    class Meta:
       db_table = 'Themes'