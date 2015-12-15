sources =
  js:     'javascripts/'
  css:    'stylesheets/'
  vendor: 'bower/'
  views:  '../views/'
  locales:  '../../config/locales/'

module.exports =
  BUILD_DEST: 'build/'
  PROD_DEST:  '../../public/assets/'

  sources: sources

  js:
    manifest: [
      # jQuery
      sources.vendor + 'jquery/dist/jquery.min.js'
      sources.vendor + 'jquery-ujs/src/rails.js'

      # Project folders
      sources.js + 'third-party/**/*'
      sources.js + 'public/**/*'
    ]

  css:
    manifest: [ sources.css + 'manifest.sass' ]

    settings:
      cssGlobbing:
        extensions: ['.css', '.sass', '.scss']
      sass:
        outputStyle: 'compressed'
        precision: 8

    settingsDev:
      sass:
        precision: 8
        sourceComments: true

  fonts:
    manifest: [ 'fonts/**/*' ]

  images:
    manifest: [ 'images/**/*' ]

  bSync:
    port: 3001
    proxy: 'localhost:3000'
