var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    concat = require('gulp-concat');


var coffeeSources =
    ['src/browser/*.coffee'];

var jquerySource = ['node_modules/jquery/dist/*'];

var bootstrapSource = ['node_modules/bootstrap/dist/css/*',
                       'node_modules/bootstrap/dist/fonts/*',
                       'node_modules/bootstrap/dist/js/*'];

var bootstrapDest = ['static/lib/bootstrap/css/',
                     'static/lib/bootstrap/fonts/',
                     'static/lib/bootstrap/js/'];


gulp.task('coffee', function() {
    gulp.src(coffeeSources)
    .pipe( coffee({bare: true})
        .on('error',gutil.log))
    .pipe(gulp.dest('./scripts'));
});

gulp.task('jquery', function (){
  gulp.src(jquerySource).pipe(gulp.dest('static/lib/jquery/'));
});

gulp.task('bootstrap', function(){
  gulp.src(bootstrapSource[0]).pipe(gulp.dest(bootstrapDest[0]));
  gulp.src(bootstrapSource[2]).pipe(gulp.dest(bootstrapDest[2]));
});

gulp.task('bootstrapFont', function(){
     gulp.src(bootstrapSource[1]).pipe(gulp.dest(bootstrapDest[1]));
});

gulp.task('genlib',['jquery', 'bootstrap', 'bootstrapFont']);

gulp.task('watch', function(){
    gulp.watch(coffeeSources, ['coffee']);
});


gulp.task('default', ['coffee','watch']);
