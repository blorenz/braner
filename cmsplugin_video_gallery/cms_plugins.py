from cms.plugin_base import CMSPluginBase
from cms.plugin_pool import plugin_pool
from django.utils.translation import ugettext_lazy as _

import admin
import models


class CMSVideoGalleryPlugin(CMSPluginBase):

    model = models.VideoGalleryPlugin
    inlines = [admin.VideoInline, ]
    name = _('Video gallery')
    render_template = 'cmsplugin_video_gallery/gallery.html'

    def render(self, context, instance, placeholder):
        context.update({
                        'videos': instance.video_set.all(),
                        'gallery': instance,
                       })
        self.render_template = instance.template
        return context


plugin_pool.register_plugin(CMSVideoGalleryPlugin)
