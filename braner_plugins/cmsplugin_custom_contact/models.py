from django.db import models
from cmsplugin_contact.models import BaseContact
from django.utils.translation import ugettext_lazy as _

class CustomContact(BaseContact):
    phone_label = models.CharField(
        _('Phone label'),
        default=_('Phone'), max_length=20)
    name_label = models.CharField(
        _('Name label'),
        default=_('Name'), max_length=20)
    company_label = models.CharField(
        _('Company label'),
        default=_('Company'), max_length=20)
