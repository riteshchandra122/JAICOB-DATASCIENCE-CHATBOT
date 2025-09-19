from django.db import models

# Create your models here.
# Create your models here.
class UserModel(models.Model):
    user_id=models.AutoField(primary_key=True)
    user_name=models.CharField(help_text='user_name',max_length=50)
    user_email=models.EmailField(help_text='user_email',max_length=50)
    user_password=models.CharField(help_text='user_password',max_length=50)
    user_contact=models.CharField(help_text='user_contact', max_length=50)
    user_address=models.CharField(help_text='user_address', max_length=500)
    user_dob=models.DateField(help_text='user_dob',max_length=50)
    user_type=models.CharField(help_text='user_type',max_length=50)
    user_image=models.ImageField(upload_to='media/')
    user_qualification=models.CharField(help_text='user_qualification',max_length=100)
    user_status=models.CharField(help_text='user_status',max_length=50,null=True,default='pending')

    class Meta:
        db_table='user_complete_details'


class UserFeedbackModel(models.Model):
    feedback_id=models.AutoField(primary_key=True)
    userfeedback=models.ForeignKey(UserModel,models.CASCADE,null=True,related_name='userfeedback')
    rating=models.CharField(help_text='rating3',max_length=200,null=True)
    text=models.CharField(help_text='text',max_length=200,null=True)
    sentiment=models.CharField(help_text='sentiment',max_length=700,null=True)
    class Meta:
        db_table='user_feedback'