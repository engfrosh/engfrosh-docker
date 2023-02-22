DATABASE = {
    "ENGINE": "django.db.backends.mysql",
    "NAME": "engfrosh",
    "USER": "engfrosh_bot",
    "PASSWORD": "mypassword",
    "HOST": "127.0.0.1",
    "PORT": "3306",
    "OPTIONS": {
        'charset': 'utf8mb4',
        'use_unicode': True,
    },
}

INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'common_models.apps.CommonModelsConfig'
]
