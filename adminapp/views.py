from django.shortcuts import render,redirect,get_object_or_404
from userapp.models import UserFeedbackModel
from django.contrib import messages
from userapp.models import UserModel

# Create your views here.
def admin_dashboard(request):
    user=UserModel.objects.all().count()
    return render(request,'admin/admin-dashboard.html',{'user':user})

def admin_pendinguser(request):
    items = UserModel.objects.order_by('-user_id')

    return render(request,'admin/admin-pending-user.html',{'items':items})


def admin_allusers(request):
    user=UserModel.objects.filter(user_status='accepted').order_by('-user_id')
    return render(request,'admin/admin-all-users.html',{'user':user})

def admin_userfeedback(request):
#    user_id=request.session['user_id']
   data=UserFeedbackModel.objects.all().order_by('-feedback_id')

   return render(request,"admin/admin-user-feedback.html",{'data':data})

   return render(request,'admin/admin-user-feedback.html')

def admin_sentimentanalysis(request):

    verypositive=UserFeedbackModel.objects.filter(sentiment='Very Positive').count()
    positive=UserFeedbackModel.objects.filter(sentiment='Positive').count()
    verynegative=UserFeedbackModel.objects.filter(sentiment='Very Negative').count()
    negative=UserFeedbackModel.objects.filter(sentiment='Negative').count()
    neutral=UserFeedbackModel.objects.filter(sentiment='Neutral').count()

    return render(request,'admin/admin-sentiment-analysis.html',{'i':verypositive,'j':positive,'k':verynegative,'l':negative,'m':neutral})


def main_admin(request):
    if request.method == "POST":
        username=request.POST.get("username")
        password=request.POST.get("password")

        if username == "admin" and password == "admin":
            messages.success(request,'Successfully Login')
            return redirect('admin_dashboard')
        else:
            messages.warning(request,'invalid login')
            return redirect('main_admin')

     
    return render(request,"main/main-admin.html")
    return render(request,'main/main-admin.html')



def accept_user(request,id):
    accept = get_object_or_404(UserModel,user_id=id)
    accept.user_status = "accepted"
    accept.save(update_fields=["user_status"])
    accept.save()

    return redirect('admin_pendinguser')

def decline_user(request,id):
    decline = get_object_or_404(UserModel,user_id=id)
    decline.user_status = "declined"
    decline.save(update_fields=["user_status"])
    decline.save()

    return redirect('admin_pendinguser')
