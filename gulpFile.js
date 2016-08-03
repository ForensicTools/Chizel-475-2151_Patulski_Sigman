var gulp = require('gulp'),
    gutil = require('gulp-util'),
    coffee = require('gulp-coffee'),
    less = require('gulp-less'),
    concat = require('gulp-concat'),
    packager =  require('electron-packager');
//     electron = require('electron-connect').server.create( //{
// //   electron: require('electron-prebuilt')
// // // }
// );
//

var coffeeFile = '*.coffee';
var coffeeSource = 'src/';
var coffeeDest = 'static/scripts/';
var coffeeDir = ['browser/','backside/','render/'];

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

var d3Source = 'node_modules/d3/d3.min.js'

// gulp.task('serve', function(){
//     console.log(process.cwd())
//     electron.start();
//     gulp.watch(['static/scripts/backside/*','static/scripts/browser/*'],['electron:restart']);
//     gulp.watch(['static/index.html','static/lib/*','static/scripts/render/*'],['electron:reload']);
// });
// gulp.task('electron:restart', function(){
//     electron.restart();
// });
// gulp.task('electron:reload', function(){
//     electron.reload();
// });


gulp.task('d3',  function(){
   gulp.src(d3Source)
   .pipe(gulp.dest('static/d3/'));
});
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

gulp.task('genlib',['jquery', 'bootstrap', 'bootstrapFont','bootstrap-treeview','d3']);

gulp.task('watch', function(){
    gulp.watch('src/**/*.coffee', ['coffee']);
    gulp.watch('static/less/*.less', ['less']);

});

gulp.task('build', function(){
    opts = {
        dir:'.',
        name:'Chizel',
        platform:'win32',
        arch:'x64',
        version:'0.35.4'

    };
    packager(opts, function done (err, appPath){

    });
});
gulp.task('default', ['coffee','less','watch']);
