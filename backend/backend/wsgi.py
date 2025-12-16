import os
from django.core.wsgi import get_wsgi_application
# from whitenoise import WhiteNoise

# Set the Django settings module for the 'django' command-line utility
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'backend.settings')

# Get the WSGI application
application = get_wsgi_application()
# application = WhiteNoise(application)
