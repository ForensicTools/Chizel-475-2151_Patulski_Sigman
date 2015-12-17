![Alt text](https://github.com/patulskitime/Chizel-475-2151_Patulski_Sigman/blob/master/Chizel_asciiArt.PNG)

#WELCOME TO CHIZEL. ENJOY!!!!!

##ABOUT
Chizel is a cloud storage interrogator.  It streamlines the process of collecting, analyzing, and presenting cloud storage artifacts.


##INSTALLATION / BUILD
* Chizel can be packaged into an exe with the use of electron-packager. <https://github.com/maxogden/electron-packager>

##Usage
* Runs locally on a targets machine collecting data.

## Gulp
* Uses gulp to create workflow - defined in the gulpFile.js file
* Some tasks are:
* gulp - default task complies coffeescript and less files.
* gulp genlib - moves all the dependecies into the right folders.
* gulp build - uses electron-packager to build app into exe.

##Progress
###TO-DONE
* UI is laid out
* Basic structure of app is designed
* File System - Able to index file system to find files associated with
cloud storage services. - parse files found and send data to the applications view.
* Registry - Able to search registry for cloud storage services entries   

###TO-DO
* Registry - parse information found and send data to the applications view.
* RAM - accept ram dumps, analyze, and display info found.
* Console output and progress bars
* Move Chizel from a "live-box forensics" application to a "dead-box forensics" application (features: parse dd files etc.) . 

##View of Chizel
![Alt text](https://github.com/patulskitime/Chizel-475-2151_Patulski_Sigman/blob/master/Chizel.png)
###Elements
* Side Bar: Holds Action Buttons (ex: Create new case, Analyze OneDrive Files)
* Gutter: Holds tree view of files found
* Main Window Tab: Holds tabs to other main window displays
* Main Window Display: displays information on what was found on the computer.
* Main Window Console: logs what is happening to the application.

##Example of TreeView
![Alt text](https://github.com/patulskitime/Chizel-475-2151_Patulski_Sigman/blob/master/Chizel_ex_TreeView.PNG)

##The making of Chizel
* Chizel is made using web technologies made possible by
GitHub's Electron. Electron is a framework that lets you develop Desktop application
using web technologies (Javascript, html, css).
###Research
* Link to a study done on cloud storage forensics. Where we got most of are information on cloud storage services.
* <https://digital-forensics.sans.org/summit-archives/Prague_Summit/Cloud_Storage_Forensics_Mattia_Eppifani.pdf>

##Resources and links
* <http://electron.atom.io> -Electron's home site
* <http://Nodejs.org> -javascript runtime used by electron
* <https://github.com/sindresorhus/awesome-electron> - other electron projects and tools for developing in electron.

##CONTACT
* Rich Patulski rwp7402@rit.edu
* Jason Sigman js2181@rit.edu
