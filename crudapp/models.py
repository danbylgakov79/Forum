from django.db import models

class CategoryModel(models.Model):
    ID = models.IntegerField()
    Name = models.CharField(max_length=100)
    Content = models.CharField(max_length=1024,blank=True)

    def __str__(self):
        return self.Name

    class Meta:
       db_table = 'Category'
       permissions = (("can_add_category","Add category"),("can_update_category","Update category"), ("can_delete_category","Delete category"))




