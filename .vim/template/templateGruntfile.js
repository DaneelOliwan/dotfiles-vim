'use strict';

module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({

   copy: {
      build: {
        cwd: 'src',
        src: ['404.html','api/**','data/**','img/**','partials/**','index.html','bower_components/**', 'scripts/**'],
        dest: 'build',
        expand: true
      },
    }, 
   uglify: {
       my_target: {
        files: [{
          expand: true,
          cwd: 'src/scripts',
          src: '**/*.js',
          dest: 'build/scripts'
        }]
       }
   },
    processhtml: {
        dist: {
          files: {
            'build/index.html': ['build/index.html'],
            'build/404.html': ['build/404.html']
          }
        }
    },
    shell: {
        options: {
            stderr: false
        },
        target: {
            command: './generate-qrc.py'
        }
    },

    less: {
      development: {
        options: {
            paths: ["src/style"],
            rootpath: '../img/',
            compress: true,
            ieCompat: true
        },
        files: {
          "build/style/style.min.css": "src/style/style.less"
        }
      }
      /*production: {
        options: {
          paths: ["assets/css"],
          plugins: [
            new (require('less-plugin-autoprefix'))({browsers: ["last 2 versions"]}),
            new (require('less-plugin-clean-css'))(cleanCssOptions)
          ],
          modifyVars: {
            imgPath: '"http://mycdn.com/path/to/images"',
            bgColor: 'red'
          }
        },
        files: {
          "path/to/result.css": "path/to/source.less"
        }
      }*/
    },

    // Before generating any new files,
    // remove any previously-created files.
    clean: {
      all: ['build/']
    }
  });

  // Load npm plugins to provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-processhtml');
  grunt.loadNpmTasks('grunt-shell');

  // Default task to be run.
  grunt.registerTask('default', ['copy', 'less','processhtml','shell']);
};
