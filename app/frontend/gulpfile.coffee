gulp = require 'gulp'
config = require './config'

$ = require('gulp-load-plugins')
  rename:
    'gulp-sourcemaps': 'sourceMaps'

if process.env.NODE_ENV in [undefined, 'development']
  $.bSync = require('browser-sync').create()

### JavaScript ###
#
gulp.task 'js', ->
  gulp.src config.js.manifest
    .pipe $.changed(config.BUILD_DEST)
    .pipe $.sourceMaps.init()
    .pipe $.if /.coffee/, $.coffee()
    .pipe $.concat('scripts.js')
    .pipe $.sourceMaps.write()
    .pipe gulp.dest(config.BUILD_DEST)
    .pipe $.bSync.stream()

### CSS ###
#
gulp.task 'css', ->
  gulp.src(config.css.manifest)
    .pipe $.changed(config.BUILD_DEST)
    # .pipe $.sourceMaps.init()
    .pipe $.cssGlobbing config.css.settings.cssGlobbing
    .pipe $.sass config.css.settingsDev.sass
    .pipe $.autoprefixer()
    # .pipe $.sourceMaps.write()
    .pipe $.concat('styles.css')
    .pipe gulp.dest(config.BUILD_DEST)
    .pipe $.bSync.stream()

### Fonts ###
#
gulp.task 'fonts', ->
  gulp.src(config.fonts.manifest)
    .pipe gulp.dest(config.BUILD_DEST)

### Images ###
#
gulp.task 'images', ->
  gulp.src(config.images.manifest)
    .pipe gulp.dest(config.BUILD_DEST)


### Production ###
#
gulp.task 'deploy:js', ->
  gulp.src config.js.manifest
    .pipe $.if /.coffee/, $.coffee()
    .pipe $.concat('scripts.js')
    .pipe $.uglify()
    .pipe $.rev()
    .pipe gulp.dest(config.PROD_DEST)
    .pipe $.rev.manifest('.gulp-js-manifest.json')
    .pipe gulp.dest(config.PROD_DEST)

gulp.task 'deploy:css', ->
  gulp.src(config.css.manifest)
    .pipe $.cssGlobbing config.css.settings.cssGlobbing
    .pipe $.sass config.css.settings.sass
    .pipe $.autoprefixer()
    .pipe $.concat('styles.css')
    .pipe $.rev()
    .pipe gulp.dest(config.PROD_DEST)
    .pipe $.rev.manifest('.gulp-css-manifest.json')
    .pipe gulp.dest(config.PROD_DEST)

gulp.task 'deploy:fonts', ->
  gulp.src(config.fonts.manifest)
    .pipe gulp.dest(config.PROD_DEST)

gulp.task 'deploy:images', ->
  gulp.src(config.images.manifest)
    .pipe gulp.dest(config.PROD_DEST)


### Tasks ###
#
gulp.task 'default', [ 'js', 'css', 'fonts', 'images', 'watch', 'bSync' ]
gulp.task 'build', [ 'js', 'css', 'fonts', 'images' ]
gulp.task 'deploy', [ 'deploy:js', 'deploy:css', 'deploy:fonts', 'deploy:images' ]

gulp.task 'watch', ->
  gulp.watch "#{ config.sources.css }**/*", ['css']
  gulp.watch "#{ config.sources.js  }**/*", ['js']

  gulp.watch("#{ config.sources.views }**/*").on 'change', $.bSync.reload
  gulp.watch("#{ config.sources.locales }**/*").on 'change', $.bSync.reload

gulp.task 'bSync', ->
  $.bSync.init
    port: 3001
    proxy: 'localhost:3000'
