/**
 * editor_plugin_src.js
 *
 * Copyright 2009, Moxiecode Systems AB
 * Released under LGPL License.
 *
 * License: http://tinymce.moxiecode.com/license
 * Contributing: http://tinymce.moxiecode.com/contributing
 */

(function() {
  tinymce.PluginManager.requireLangPack('flags');
  tinymce.create('tinymce.plugins.FlagsPlugin', {
    init : function(ed, url) {
      // Register commands
      ed.addCommand('mceFlag', function() {
        ed.windowManager.open({
          file : url + '/flags.htm',
          width : 250 + parseInt(ed.getLang('flags.delta_width', 0)),
          height : 160 + parseInt(ed.getLang('flags.delta_height', 0)),
          inline : 1
        }, {
          plugin_url : url
        });
      });

      // Register buttons
      ed.addButton('flags', {title : 'Flags', cmd : 'mceFlag', label : 'flags'});
    },

    getInfo : function() {
      return {
        longname : 'Flags',
        author : 'Moxiecode Systems AB',
        authorurl : 'http://tinymce.moxiecode.com',
        infourl : 'http://wiki.moxiecode.com/index.php/TinyMCE:Plugins/flags',
        version : tinymce.majorVersion + "." + tinymce.minorVersion
      };
    }
  });

  // Register plugin
  tinymce.PluginManager.add('flags', tinymce.plugins.FlagsPlugin);
})();
