var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat');


var coffeeSources =
    ['src/browser/*.coffee'];


gulp.task('coffee', function() {
    gulp.src(coffeeSources)
    .pipe( coffee({bare: true})
        .on('error',gutil.log))
    .pipe(gulp.dest('./scripts'));
});

gulp.task('watch', function(){
    gulp.watch(coffeeSources, ['coffee']);
});


gulp.task('default', ['coffee','watch']);
