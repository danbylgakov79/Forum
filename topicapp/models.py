from django.db import models

class TopicModel(models.Model):
    ID = models.IntegerField()
    Category = models.IntegerField()
    Name = models.CharField(max_length=256)
    Content = models.CharField(max_length=1024,blank=True)

    def __str__(self):
        return self.Name

    class Meta:
        db_table = 'Topic'
        permissions = (("can_add_topic", "Add topic"), ("can_update_topic", "Update topic"),
                       ("can_delete_topic", "Delete topic"))