from django.db import models
from django.db import models
class MessagesModel(models.Model):
    ID = models.IntegerField()
    Category = models.IntegerField()
    Topic = models.IntegerField()
    Themes = models.IntegerField()
    Author = models.CharField(max_length=100)
    Text = models.CharField(max_length=1024)

    def __str__(self):
        return self.Text

    class Meta:
        db_table = "Messages"
        permissions = (("can_add_message", "Add message"), ("can_update_message", "Update message"),
                       ("can_delete_message", "Delete message"))