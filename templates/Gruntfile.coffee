#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:

      stylesheets:
        files: "scss/*"
        tasks: "compass:dev"

      images:
        files: "images/*"
        tasks: "dev"

      partials:
        files: "partials/*"
        tasks: "concat:partials"

      javascript:
        files: ["coffee/*", "js/libs/*.js"]
        tasks: "javascript:dev"

      jsTesting:
        files: "dist/js/*.js"
        tasks: "jasmine"

      rootDirectory:
        files: [ "root-directory/**/*", "root-directory/.*" ]
        tasks: "default"

    compass:
        dev:
          options:
            environment: 'dev'
        dist:
          options:
            environment: 'production'

    coffee:
      compile:
        # options:
          # sourceMap: true
        files:
          "js/app.js": "coffee/app.coffee"
      glob_to_multiple:
        files: grunt.file.expandMapping(["specs/*.coffee"], "specs/js/", {
          rename: (destBase, destPath) ->
            destBase + destPath.replace(/\.coffee$/, ".js").replace(/specs\//, "");
        })

    concat:
      partials:
        options:
          process: true
        files:
          # destination as key, sources as value
          "dist/index.html": ["partials/_header.html", "partials/_build-header.html", "partials/_home-page.html", "partials/_footer.html"]
          "dist/hero.html": ["partials/_header.html", "partials/_hero.html", "partials/_footer.html"]
      js:
        #first concatenate libraries, then our own JS
        src: ["js/concat/*", "js/app.js"]
        #put it in dist/
        dest: "dist/js/<%= pkg.name %>.js"

    uglify:
      my_target:
        files: "dist/js/<%= pkg.name %>.js": ["js/concat/*", "js/app.js"]

    modernizr:
      devFile: "root-directory/js/libs/modernizr.js"
      outputFile: "dist/js/libs/modernizr.js"
      extra:
        shiv: true
        printshiv: false
        load: true
        mq: false
        cssclasses: true

      extensibility:
        addtest: false
        prefixed: false
        teststyles: false
        testprops: false
        testallprops: false
        hasevents: false
        prefixes: false
        domprefixes: false

      uglify: true
      parseFiles: true
      matchCommunityTests: false

    clean:
      all:
        src: "dist/*"
        dot: true # clean hidden files as well

    exec:
      copyRootDirectory:
        command: "cp -Rp root-directory/ dist/"
      sourceMapsCopy:
        command: "cp -Rp coffee/ dist/js/coffee/ && cp js/<%= pkg.name %>.js.map dist/js/"

    jasmine:
      src: "dist/**/*.js"
      options:
        specs: "specs/js/*Spec.js"
        helpers: "specs/js/*Helper.js"
        vendor: ["js/concat/jquery-1.9.1.min.js", "specs/lib/*.js"]

  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-modernizr"
  grunt.loadNpmTasks "grunt-notify"
  grunt.loadNpmTasks "grunt-exec"
  grunt.loadNpmTasks "grunt-contrib-uglify"

  # Clean dist/ and copy root-directory/
  # NOTE: this has to wipe out everything
  grunt.registerTask "root-canal", [ "clean:all", "exec:copyRootDirectory" ]

  # Clean, compile and concatenate JS
  grunt.registerTask "javascript:dev", [ "coffee", "concat:js"]
  grunt.registerTask "javascript:dist", [ "coffee", "uglify", "modernizr" ]

  # Production task
  grunt.registerTask "dev", [ "root-canal", "concat:partials", "javascript:dev", "compass:dev"]
  grunt.registerTask "dist", [ "root-canal", "concat:partials", "javascript:dist", "compass:dist"]

  # Default task
  grunt.registerTask "default", "dev"
