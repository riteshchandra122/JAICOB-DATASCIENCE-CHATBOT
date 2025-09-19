from django.shortcuts import render,redirect
from userapp.models import *
from django.contrib import messages
# from userapp.models import UserFeedbackModel
from textblob import TextBlob
import pyttsx3


# Create your views here.
def user_index(request):
    return render(request,'user/user-index.html')

def user_about(request):
    return render(request,'user/user-about.html')

def user_contact(request):
    return render(request,'user/user-contact.html')


def user_feedback(request):
   
    user_id=request.session['user_id']
    user=UserModel.objects.get(user_id=user_id)

    if request.method == "POST":
        rating=request.POST.get("rating")
        text=request.POST.get("text")
        
        analysis = TextBlob(text)

        sentiment = ''
        if analysis.polarity >= 0.5:
            sentiment = 'Very Positive'
        elif analysis.polarity > 0 and analysis.polarity < 0.5:
            sentiment = 'Positive'
        elif analysis.polarity < 0 and analysis.polarity > -0.5:
            sentiment = 'Negative'
        elif analysis.polarity <= -0.5:
            sentiment = 'Very Negative'
        else:
            sentiment = 'Neutral'

        print(sentiment)
        user_feedback = UserFeedbackModel.objects.create(rating=rating,text=text,userfeedback=user,sentiment=sentiment)
        user_feedback.save()


        messages.success(request,"Successfully Sent")    
    return render(request,"user/user-feedback.html")

    return render(request,'user/user-feedback.html')

def user_animations(request):
    return render(request,'user/user-animations.html')

def user_services(request):
    return render(request,'user/user-service.html')


def main_registration(request):

    if request.method=="POST" and request.FILES['image']:
        name=request.POST.get('name')
        email=request.POST.get('email')
        password=request.POST.get('password')
        dob=request.POST.get('dob')
        contact=request.POST.get('contact')
        address=request.POST.get('address')
        image=request.FILES['image']
        type=request.POST.get('type')
        qualification=request.POST.get('qualification')

        print(name,email,password,dob,contact,address,image,type,qualification)
       

        userregistration=UserModel.objects.create(user_qualification=qualification,user_name=name,user_dob=dob,user_email=email,user_password=password,user_contact=contact,user_address=address,user_image=image,user_type=type)
       
        userregistration.save()
        if userregistration:
            messages.success(request,'successfully login')
            return redirect('main_user')
        else:
             messages.error(request,'Invalid Credentials')
             return redirect('main_registration')
        return redirect('main_user')
    return render(request,'main/main-registration.html')


def user_myprofile(request):
     user_id=request.session['user_id']
     userprofile=UserModel.objects.get(user_id=user_id)

     if request.method=="POST":

        name=request.POST.get('name')
        email=request.POST.get('email')
        password=request.POST.get('password')
        dob=request.POST.get('dob')
        contact=request.POST.get('contact')
        address=request.POST.get('address')
        qualification=request.POST.get('qualification')
        type=request.POST.get('type')
        print(name)


        # print(name,email)
        if len(request.FILES)!=0:
            image=request.FILES['image']
            userprofile.user_name=name
            userprofile.user_email=email
            userprofile.user_password=password
            userprofile.user_dob=dob
            userprofile.user_contact=contact
            userprofile.user_address=address
            userprofile.user_qualification=qualification
            userprofile.user_image=image
            userprofile.user_type=type
            userprofile.save()
        
        else:
             userprofile.user_name=name
             userprofile.user_email=email
             userprofile.user_password=password
             userprofile.user_dob=dob
             userprofile.user_contact=contact
             userprofile.user_address=address
             userprofile.user_qualification=qualification
             userprofile.user_type=type
             userprofile.save()

        messages.success(request,'Updated Successfully')

        return redirect('user_myprofile')

     return render(request,'user/user-myprofile.html',{'userprofile':userprofile})


# def user_myprofile(request):
#     # user_id=request.session['user_id']
#     x = UserModel.objects.all()
 #     if request.method == "POST":
#         name=request.POST.get('name')
#         email=request.POST.get('email')
#         password=request.POST.get('password')
#         dob=request.POST.get('dob')
#         contact=request.POST.get('contact')
#         address=request.POST.get('address')
#         qualification=request.POST.get('qualification')
#         type=request.POST.get('type')
#         image=request.POST.get('image')
        
        
#         x.user_name=name
#         x.user_dob=dob
#         x.user_qualification=qualification
#         x.user_type=type
#         x.user_image=image
#         x.user_email=email
#         x.user_password=password
#         x.user_contact=contact
#         x.user_address=address
#         x.save()

#         return redirect("user_myprofile")

#     return render(request,"user/user-myprofile.html")


def libraries(request):
    return render(request,'user/libraries.html')



def main_user(request):
  if request.method == "POST":
        email=request.POST.get("email")
        password=request.POST.get("password")

        try:
            print('tryyyyyyyyy')
            data2=UserModel.objects.get(user_email=email,user_password=password)
            request.session['user_id']=data2.user_id
            print('try2222')
            if data2.user_status == 'accepted':
                # print('accept')
                engine = pyttsx3.init()
                print(data2.user_name)
                engine. setProperty("rate", 110) 
                engine.say("welcome {}".format(data2.user_name))
                engine.runAndWait()
                messages.success(request, 'Successfully Login')
                return redirect('user_index')
            elif data2.user_status == 'pending':
                print('pending')
                messages.warning(request, 'Your request is in pending, please wait for until acceptance')
                return redirect('main_user')
            elif data2.user_status == 'declined':
                messages.error(request, 'Your request is declined, so you cannot login')
                return redirect('main_user')
        except:
            
            messages.warning(request, 'invalid login')
            return redirect('main_user')

        # if data2:
        #     messages.success(request,"Successfully Login")
        #     return redirect('user-home')
        # else:
        #     messages.error(request,"Invalid Login")
  return render(request,"main/main-user.html")

 



