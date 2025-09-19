from django.shortcuts import render

# Create your views here.
def main_index(request):

    return render(request,'main/main-index.html')

def main_about(request):
    return render(request,'main/main-about.html')

def main_contact(request):
    return render(request,'main/main-contact.html')

# def main_user(request):
#     return render(request,'main/main-user.html')


def main_service(request):
    return render(request,'main/main-service.html')

# def main_registration(request):
#     return render(request,'main/main-registration.html')

