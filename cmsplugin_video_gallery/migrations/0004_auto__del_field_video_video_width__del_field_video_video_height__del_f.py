# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting field 'Video.video_width'
        db.delete_column(u'cmsplugin_video_gallery_video', 'video_width')

        # Deleting field 'Video.video_height'
        db.delete_column(u'cmsplugin_video_gallery_video', 'video_height')

        # Deleting field 'Video.mp4_file'
        db.delete_column(u'cmsplugin_video_gallery_video', 'mp4_file')

        # Deleting field 'Video.poster_src_width'
        db.delete_column(u'cmsplugin_video_gallery_video', 'poster_src_width')

        # Deleting field 'Video.webm_file'
        db.delete_column(u'cmsplugin_video_gallery_video', 'webm_file')

        # Deleting field 'Video.ogv_file'
        db.delete_column(u'cmsplugin_video_gallery_video', 'ogv_file')

        # Deleting field 'Video.poster_src_height'
        db.delete_column(u'cmsplugin_video_gallery_video', 'poster_src_height')

        # Deleting field 'Video.poster_src'
        db.delete_column(u'cmsplugin_video_gallery_video', 'poster_src')

        # Adding field 'Video.video_id'
        db.add_column(u'cmsplugin_video_gallery_video', 'video_id',
                      self.gf('django.db.models.fields.CharField')(default='89298139', max_length=60),
                      keep_default=False)

        # Adding field 'Video.autoplay'
        db.add_column(u'cmsplugin_video_gallery_video', 'autoplay',
                      self.gf('django.db.models.fields.BooleanField')(default=True),
                      keep_default=False)

        # Adding field 'Video.width'
        db.add_column(u'cmsplugin_video_gallery_video', 'width',
                      self.gf('django.db.models.fields.IntegerField')(default=640),
                      keep_default=False)

        # Adding field 'Video.height'
        db.add_column(u'cmsplugin_video_gallery_video', 'height',
                      self.gf('django.db.models.fields.IntegerField')(default=420),
                      keep_default=False)

        # Adding field 'Video.border'
        db.add_column(u'cmsplugin_video_gallery_video', 'border',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)

        # Adding field 'Video.loop'
        db.add_column(u'cmsplugin_video_gallery_video', 'loop',
                      self.gf('django.db.models.fields.BooleanField')(default=False),
                      keep_default=False)


    def backwards(self, orm):
        # Adding field 'Video.video_width'
        db.add_column(u'cmsplugin_video_gallery_video', 'video_width',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.video_height'
        db.add_column(u'cmsplugin_video_gallery_video', 'video_height',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.mp4_file'
        db.add_column(u'cmsplugin_video_gallery_video', 'mp4_file',
                      self.gf('django.db.models.fields.files.FileField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.poster_src_width'
        db.add_column(u'cmsplugin_video_gallery_video', 'poster_src_width',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.webm_file'
        db.add_column(u'cmsplugin_video_gallery_video', 'webm_file',
                      self.gf('django.db.models.fields.files.FileField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.ogv_file'
        db.add_column(u'cmsplugin_video_gallery_video', 'ogv_file',
                      self.gf('django.db.models.fields.files.FileField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.poster_src_height'
        db.add_column(u'cmsplugin_video_gallery_video', 'poster_src_height',
                      self.gf('django.db.models.fields.PositiveSmallIntegerField')(null=True, blank=True),
                      keep_default=False)

        # Adding field 'Video.poster_src'
        db.add_column(u'cmsplugin_video_gallery_video', 'poster_src',
                      self.gf('django.db.models.fields.files.ImageField')(max_length=100, null=True, blank=True),
                      keep_default=False)

        # Deleting field 'Video.video_id'
        db.delete_column(u'cmsplugin_video_gallery_video', 'video_id')

        # Deleting field 'Video.autoplay'
        db.delete_column(u'cmsplugin_video_gallery_video', 'autoplay')

        # Deleting field 'Video.width'
        db.delete_column(u'cmsplugin_video_gallery_video', 'width')

        # Deleting field 'Video.height'
        db.delete_column(u'cmsplugin_video_gallery_video', 'height')

        # Deleting field 'Video.border'
        db.delete_column(u'cmsplugin_video_gallery_video', 'border')

        # Deleting field 'Video.loop'
        db.delete_column(u'cmsplugin_video_gallery_video', 'loop')


    models = {
        'cms.cmsplugin': {
            'Meta': {'object_name': 'CMSPlugin'},
            'changed_date': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'}),
            'creation_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'max_length': '15', 'db_index': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.CMSPlugin']", 'null': 'True', 'blank': 'True'}),
            'placeholder': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.Placeholder']", 'null': 'True'}),
            'plugin_type': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'}),
            'position': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'cms.placeholder': {
            'Meta': {'object_name': 'Placeholder'},
            'default_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slot': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'})
        },
        u'cmsplugin_video_gallery.video': {
            'Meta': {'ordering': "('inline_ordering_position',)", 'object_name': 'Video'},
            'alt': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'autoplay': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'border': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'extended_content': ('django.db.models.fields.TextField', [], {'null': 'True', 'blank': 'True'}),
            'gallery': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['cmsplugin_video_gallery.VideoGalleryPlugin']"}),
            'height': ('django.db.models.fields.IntegerField', [], {'default': '344'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inline_ordering_position': ('django.db.models.fields.IntegerField', [], {'null': 'True', 'blank': 'True'}),
            'link': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'loop': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'src': ('django.db.models.fields.files.ImageField', [], {'max_length': '100'}),
            'src_height': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'src_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255', 'null': 'True', 'blank': 'True'}),
            'video_duration': ('django.db.models.fields.CharField', [], {'max_length': '20', 'null': 'True', 'blank': 'True'}),
            'video_id': ('django.db.models.fields.CharField', [], {'max_length': '60'}),
            'width': ('django.db.models.fields.IntegerField', [], {'default': '425'})
        },
        u'cmsplugin_video_gallery.videogalleryplugin': {
            'Meta': {'object_name': 'VideoGalleryPlugin', 'db_table': "u'cmsplugin_videogalleryplugin'", '_ormbases': ['cms.CMSPlugin']},
            u'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'template': ('django.db.models.fields.CharField', [], {'default': "'cmsplugin_video_gallery/gallery.html'", 'max_length': '255'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['cmsplugin_video_gallery']