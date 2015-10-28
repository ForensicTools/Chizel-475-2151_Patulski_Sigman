var BrowserWindow, app, crashReport, destoryWindow, path, spawnWindow, start;

app = require('app');

BrowserWindow = require('browser-window');

crashReport = require('crash-reporter');

path = require('path');

start = function() {
  var mainWindow;
  crashReport.start();
  mainWindow = null;
  app.on('ready', spawnWindow);
  return app.on('closed', destoryWindow);
};

destoryWindow = function() {
  return this.mainWindow = null;
};

spawnWindow = function() {
  path = path.dirname(__dirname);
  this.mainWindow = new BrowserWindow({
    width: 800,
    height: 600
  });
  return this.mainWindow.loadUrl('file://' + path + '/static/index.html');
};

start();
