from inline_ordering.admin import OrderableStackedInline
import forms
import models


class VideoInline(OrderableStackedInline):

    model = models.Video

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
            'fields': ('poster_src', 'mp4_file', 'ogv_file', 'webm_file', 'video_width', 'video_height', 'video_duration'),
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
