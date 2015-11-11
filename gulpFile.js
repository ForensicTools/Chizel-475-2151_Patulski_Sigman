var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    less = require('gulp-less'),
    concat = require('gulp-concat');


var coffeeFile = '*.coffee';

var coffeeSource = 'src/';
var coffeeDest = 'static/scripts/';

var coffeeDir =
    ['browser/',
    'backside/',
    'render/'];

var jquerySource = ['node_modules/jquery/dist/*'];

var bootstrapSource = ['node_modules/bootstrap/dist/css/*',
                       'node_modules/bootstrap/dist/fonts/*',
                       'node_modules/bootstrap/dist/js/*'];

var bootstrapDest = ['static/lib/bootstrap/css/',
                     'static/lib/bootstrap/fonts/',
                     'static/lib/bootstrap/js/'];

var treeviewSource = ['node_modules/bootstrap-treeview/dist/*'];

var treeviewDest = 'static/lib/bootstrap-treeview/';

var lessSource = 'static/less/*.less';
var lessDest = 'static/css/';

gulp.task('coffee', function() {
    for (var _i = 0; _i < coffeeDir.length; _i++)
    {
        gulp.src(coffeeSource + coffeeDir[_i] + coffeeFile)
        .pipe( coffee({bare: true})
        .on('error',gutil.log))
        .pipe(gulp.dest(coffeeDest + coffeeDir[_i]));
    }

});

gulp.task('less', function(){
    gulp.src(lessSource)
    .pipe(less()
    .on('error',gutil.log))
    .pipe(gulp.dest(lessDest));
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

gulp.task('bootstrap-treeview', function(){
    gulp.src(treeviewSource).pipe(gulp.dest(treeviewDest));
});
gulp.task('genlib',['jquery', 'bootstrap', 'bootstrapFont','bootstrap-treeview']);

gulp.task('watch', function(){
    gulp.watch('src/**/*.coffee', ['coffee']);
    gulp.watch('static/less/*.less', ['less']);
});


gulp.task('default', ['coffee','less','watch']);
