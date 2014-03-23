from inline_ordering.admin import OrderableStackedInline
import forms
import models


class VideoInline(OrderableStackedInline):

    model = models.Video
    form = forms.VideoForm
# gallery = models.ForeignKey(VideoGalleryPlugin, verbose_name=_("Gallery"))
# src = models.ImageField(_("Poster image file"), upload_to=get_media_path,
#                         height_field='src_height',
#                         width_field='src_width')
# src_height = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)
# src_width = models.PositiveSmallIntegerField(_("Poster image height"), editable=False, null=True)
# title = models.CharField(_("Title"), max_length=255, blank=True, null=True)
# alt = models.TextField(_("Alt text"), blank=True, null=True)
# link = models.CharField(_("Link"), max_length=255, blank=True, null=True)
# extended_content = models.TextField(_("Extended Content"), blank=True, null=True)
#     video_duration = models.CharField(max_length=20, null=True, blank=True)
#
# video_id = models.CharField(_('video id'), max_length=60)
#
# autoplay = models.BooleanField(
#     _('autoplay'),
#     default=settings.CMS_VIMEO_DEFAULT_AUTOPLAY
# )
#
# width = models.IntegerField(_('width'),
#                             default=settings.CMS_VIMEO_DEFAULT_WIDTH)
# height = models.IntegerField(_('height'),
#                              default=settings.CMS_VIMEO_DEFAULT_HEIGHT)
# border = models.BooleanField(_('border'),
#                              default=settings.CMS_VIMEO_DEFAULT_BORDER)
#
# loop = models.BooleanField(_('loop'),
#                            default=settings.CMS_VIMEO_DEFAULT_LOOP)
    fieldsets = (
        (None,
         {
             'fields': ( 'src','title',),
        }
        ),
        ('Info', {
            'fields': ('extended_content',),
            'classes': ('collapse',),
        }),
        ('Video', {
            'fields': ('video_id', 'autoplay', 'width', 'height', 'video_duration', 'border', 'loop'),
            'classes': ('collapse',),
        }),
        ('Advanced',
         {
             'fields': ('alt','link','inline_ordering_position',),
             'classes': ('collapse',),
             }
        )

    )
    class Media:
        js = ('js/jqueryFix.js','js/jquery-ui-1.10.3.custom.min.js',)
        css = {
            "all": ("css/jquery-ui-1.10.3.custom.min.css",)
        }

    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name == 'src' or db_field.name == 'poster_src':
            kwargs.pop('request', None)
            kwargs['widget'] = forms.AdminImageWidget
            return db_field.formfield(**kwargs)
        return super(VideoInline, self).\
            formfield_for_dbfield(db_field, **kwargs)
