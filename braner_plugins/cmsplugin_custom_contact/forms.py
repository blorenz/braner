from django import forms
from cmsplugin_contact.forms import ContactForm

class CustomContactForm(forms.Form):
    email = forms.EmailField()
    content = forms.CharField(widget=forms.Textarea())
    name = forms.CharField()
    company = forms.CharField()
    phone = forms.CharField()