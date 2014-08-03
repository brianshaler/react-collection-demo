gulp = require 'gulp'
browserify = require 'gulp-browserify'
coffee = require 'gulp-coffee'
rename = require 'gulp-rename'

gulp.task 'browserify', ->
  gulp.src 'src/demo.coffee', {read: false}
  .pipe browserify
    transform: ['coffeeify']
    extensions: ['.coffee']
  .pipe rename 'demo.js'
  .pipe gulp.dest 'public'

gulp.task 'watch', ['browserify'], ->
  gulp.watch ['src/**/*.coffee'], ['browserify']

gulp.task 'default', ['browserify'], ->
