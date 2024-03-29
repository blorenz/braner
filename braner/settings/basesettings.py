"""
Django settings for braner project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# -*- coding: utf-8 -*-
import os
gettext = lambda s: s
PROJECT_PATH = os.path.split(os.path.abspath(os.path.dirname(__file__)))[0]
# Take it from the Braner app to the project path because of the settings file
# is now in its own directory
PROJECT_PATH = os.path.join(PROJECT_PATH, '..')

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'x0bu$1_hi_ugp-of%%zd(xrq78&4f#y(d3jm6d0-p(-vpbgpv!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

SITE_ID = 1

# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',

    # my own
    'braner',

    'cms',
    'mptt',
    'menus',
    'south',
    'sekizai',
    'cms_redirects',

    'tinymce',
    # 'cms.plugins.flash',
    'braner_plugins.googlemap',
    'cms.plugins.link',
    # 'cms.plugins.snippet',
    'cms.plugins.text',
    # 'cms.plugins.twitter',
    'filer',
    'easy_thumbnails',
    'cmsplugin_filer_file',
    'cmsplugin_filer_folder',
    'cmsplugin_filer_image',
    'cmsplugin_filer_teaser',
    'cmsplugin_filer_video',

    'cmsplugin_gallery',
    'cmsplugin_video_gallery',
    'cmsplugin_file_gallery',

    'cmsplugin_contact',
    'braner_plugins.cmsplugin_custom_contact',

    'reversion',
    'inline_ordering',
    'gunicorn',

    'widget_tweaks',
    'cmsplugin_vimeo',


)

THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)


MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'cms.middleware.page.CurrentPageMiddleware',
    'cms.middleware.user.CurrentUserMiddleware',
    'cms.middleware.toolbar.ToolbarMiddleware',
    'cms.middleware.language.LanguageCookieMiddleware',
    'cms_redirects.middleware.RedirectFallbackMiddleware',
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.i18n',
    'django.core.context_processors.request',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'cms.context_processors.media',
    'sekizai.context_processors.sekizai',
)

STATIC_ROOT = os.path.join(PROJECT_PATH, "static")
STATIC_URL = "/static/"

MEDIA_ROOT = os.path.join(PROJECT_PATH, "media")
MEDIA_URL = "/media/"

TEMPLATE_DIRS = (
    # The docs say it should be absolute path: PROJECT_PATH is precisely one.
    # Life is wonderful!
    os.path.join(PROJECT_PATH, "templates"),
)
CMS_TEMPLATES = (
    ('home.html', 'Home Page Template'),
    ('products_overview.html', 'Products Overview Template'),

    ('products_features.html', 'Products Features Template'),
    ('products_installations.html', 'Products Installations Template'),
    ('products_movies.html', 'Products Movies Template'),
    ('products_articles.html', 'Products Articles Template'),

    ('services.html', 'Services Template'),
    ('contact.html', 'Contact Template'),
)


LANGUAGES = [
    ('en', gettext('English')),
    ('es', gettext('Spanish')),
    ]

CMS_LANGUAGES = LANGUAGES
CMS_HIDE_UNTRANSLATED = True
CMS_LANGUAGE_CONF = {
    'es': ['en',],
    }

ROOT_URLCONF = 'braner.urls'

WSGI_APPLICATION = 'braner.wsgi.application'


# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

CMS_MENU_TITLE_OVERWRITE = True
CMS_SEO_FIELDS = True
CMS_REDIRECTS = True


THUMBNAIL_PROCESSORS = (
    'easy_thumbnails.processors.colorspace',
    'easy_thumbnails.processors.autocrop',
    #'easy_thumbnails.processors.scale_and_crop',
    'filer.thumbnail_processors.scale_and_crop_with_subject_location',
    'easy_thumbnails.processors.filters',
)

# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        }
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
            },
        }
}

AUTH_USER_MODEL = 'auth.User'

# TINYMCE_JS_URL = '//tinymce.cachefly.net/4.0/tinymce.min.js'
TINYMCE_DEFAULT_CONFIG = {
    'plugins': "fullscreen,table,spellchecker,paste,searchreplace",
    'toolbar': "fullscreen",
    'theme': "advanced",
    'theme_advanced_buttons3_add' : "fullpage",
    'cleanup_on_startup': True,
    'custom_undo_redo_levels': 10,
    'relative_urls': False,
    'content_css' : "/static/css/tinymce.css",

    }

TINYMCE_SPELLCHECKER = True
TINYMCE_COMPRESSOR = True