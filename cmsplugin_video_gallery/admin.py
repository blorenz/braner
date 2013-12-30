from inline_ordering.admin import OrderableStackedInline
import forms
import models


class VideoInline(OrderableStackedInline):

    model = models.Video

    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name == 'src':
            kwargs.pop('request', None)
            kwargs['widget'] = forms.AdminImageWidget
            return db_field.formfield(**kwargs)
        return super(VideoInline, self).\
            formfield_for_dbfield(db_field, **kwargs)
