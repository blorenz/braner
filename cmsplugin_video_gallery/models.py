import threading

from cms.models import CMSPlugin
from django.db import models
from django.utils.translation import ugettext_lazy as _
from inline_ordering.models import Orderable

import utils

localdata = threading.local()
localdata.TEMPLATE_CHOICES = utils.autodiscover_templates()
TEMPLATE_CHOICES = localdata.TEMPLATE_CHOICES


class VideoGalleryPlugin(CMSPlugin):

    title = models.CharField(_("Gallery Title"), max_length=255)

    def copy_relations(self, oldinstance):
        for video in oldinstance.video_set.all():
            new_img = Video()
            new_img.gallery=self
            new_img.src = video.src
            new_img.src_height = video.src_height
            new_img.src_width = video.src_width

            new_img.poster_src = video.poster_src
            new_img.poster_src_height = video.poster_src_height
            new_img.poster_src_width = video.poster_src_width

            new_img.title = video.title
            new_img.alt = video.alt
            new_img.link = video.link
            new_img.extended_content = video.extended_content

            new_img.mp4_file = video.mp4_file
            new_img.ogv_file = video.ogv_file
            new_img.webm_file = video.webm_file
            new_img.video_width = video.video_width
            new_img.video_height = video.video_height
            new_img.video_duration = video.video_duration
            new_img.save()

    template = models.CharField(max_length=255,
                                choices=TEMPLATE_CHOICES,
                                default='cmsplugin_video_gallery/gallery.html',
                                editable=len(TEMPLATE_CHOICES) > 1)

    def __unicode__(self):
        return _(u'%(count)d video(s) in gallery') % {'count': self.video_set.count()}



class Video(Orderable):

    def get_media_path(self, filename):
        pages = self.gallery.placeholder.page_set.all()
        return pages[0].get_media_path(filename)

    gallery = models.ForeignKey(VideoGalleryPlugin, verbose_name=_("Gallery"))
    src = models.ImageField(_("Poster image file"), upload_to=get_media_path,
                            height_field='src_height',
                            width_field='src_width')
    src_height = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)
    src_width = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)
    title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
    alt = models.TextField(_("Alt text"), blank=True, null=True)
    link = models.CharField(_("Link"), max_length=255, blank=True, null=True)
    extended_content = models.TextField(_("Extended Content"), blank=True, null=True)

    poster_src = models.ImageField(_("Poster image file"), upload_to=get_media_path,
                            height_field='src_height',
                            width_field='src_width', blank=True, null=True)
    poster_src_height = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True, blank=True)
    poster_src_width = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True, blank=True)

    mp4_file = models.FileField(_("MP4 video file"), upload_to=get_media_path, null=True, blank=True)
    ogv_file = models.FileField(_("Ogg video file"), upload_to=get_media_path, null=True, blank=True)
    webm_file = models.FileField(_("WebM video file"), upload_to=get_media_path, null=True, blank=True)

    video_width = models.PositiveSmallIntegerField(_("Video width"), null=True, blank=True)
    video_height = models.PositiveSmallIntegerField(_("Video height"), null=True, blank=True)
    video_duration = models.CharField(max_length=20, null=True, blank=True)

    def __unicode__(self):
        return self.title or self.alt or str(self.pk)
