from django.conf import settings

# Autoplay
CMS_VIMEO_DEFAULT_AUTOPLAY = getattr(settings, 'CMS_VIMEO_DEFAULT_AUTOPLAY', True)

# Width & Height
CMS_VIMEO_DEFAULT_WIDTH = getattr(settings, 'CMS_VIMEO_DEFAULT_WIDTH', 640)
CMS_VIMEO_DEFAULT_HEIGHT = getattr(settings, 'CMS_VIMEO_DEFAULT_HEIGHT', 420)

# Border
CMS_VIMEO_DEFAULT_BORDER = getattr(settings, 'CMS_VIMEO_DEFAULT_BORDER', False)

# Loop
CMS_VIMEO_DEFAULT_LOOP = getattr(settings, 'CMS_VIMEO_DEFAULT_LOOP', False)