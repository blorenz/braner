from django.conf.urls.defaults import *
from django.conf.urls.i18n import i18n_patterns
from django.conf.urls.shortcut import patterns
from django.contrib import admin
from django.conf import settings

admin.autodiscover()

urlpatterns = patterns('',
                       url(r'^$', 'braner.views.home' ),
                       (r'^tinymce/', include('tinymce.urls')),
                       )

urlpatterns = i18n_patterns('',
                            url(r'^admin/', include(admin.site.urls)),
                            url(r'^', include('cms.urls')),

                            ) + urlpatterns

if settings.DEBUG:
    urlpatterns = patterns('',
                           url(r'^media/(?P<path>.*)$', 'django.views.static.serve',
                               {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
                           url(r'', include('django.contrib.staticfiles.urls')),
                           ) + urlpatterns