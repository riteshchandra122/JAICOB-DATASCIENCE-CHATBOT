"""jaicob URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from adminapp import views as adminapp_views
from userapp import views as userapp_views
from mainapp import views as mainapp_views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),

# create mainappviews

   path('',mainapp_views.main_index,name='main_index'),
   path('main-about',mainapp_views.main_about,name='main_about'),
   path('main-contact',mainapp_views.main_contact,name='main_contact'),
   path('main-user',userapp_views.main_user,name='main_user'),
   path('main-service',mainapp_views.main_service,name='main_service'),
   path('main-admin',adminapp_views.main_admin,name='main_admin'),
   path('main-registration',userapp_views.main_registration,name='main_registration'),

  
# adminapp  views
   path('admin-dashboard',adminapp_views.admin_dashboard,name='admin_dashboard'),
   path('admin-pendinguser',adminapp_views.admin_pendinguser,name='admin_pendinguser'),
   path('admin-all-users',adminapp_views.admin_allusers,name='admin_allusers'),
   path('admin-user-feedback',adminapp_views.admin_userfeedback,name='admin_userfeedback'),
   path('admin-sentiment-analysis',adminapp_views.admin_sentimentanalysis,name='admin_sentimentanalysis'),
   path('accepted-user/<int:id>/',adminapp_views.accept_user,name="accepted-user"),
   path('declined-user/<int:id>/',adminapp_views.decline_user,name="declined-user"),

# userapp views

   path('user-about',userapp_views.user_about,name='user_about'),
   path('user-contact',userapp_views.user_contact,name='user_contact'),
   path('user-index',userapp_views.user_index,name='user_index'),
   path('user-services',userapp_views.user_services,name='user_services'),
   path('user-myprofile',userapp_views.user_myprofile,name='user_myprofile'),
   path('user-feedback',userapp_views.user_feedback,name='user_feedback'),
   path('user-animations',userapp_views.user_animations,name='user_animations'),
   path('libraries',userapp_views.libraries,name='libraries'),

  

]+ static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)

