global.highScore = 0;
global.lockMouse = false;
global.fullScreen = false; 
global.sensitivity = 5;
function save(){
    
    ini_open(working_directory+"save.ini");
    ini_write_string("save","highScore",global.highScore)
    ini_write_string("save","lockMouse",global.lockMouse)
    ini_write_string("save","fullScreen",global.fullScreen)
    ini_write_string("save","sensitivity",global.sensitivity)
    ini_close();
    
}
function loadFile(){
    ini_open(working_directory+"save.ini");
    var loadString = ini_read_string("save","highScore","0")
    global.highScore = real(loadString)
    
    loadString = ini_read_string("save","lockMouse","0")
    global.lockMouse = min(1, floor(real(loadString)))
    
    loadString = ini_read_string("save","fullScreen","0")
    global.fullScreen = min(1, floor(real(loadString)))
    
    loadString = ini_read_string("save","sensitivity","5")
    global.sensitivity = real(loadString)
    ini_close();
}
function loadGame(){
    if file_exists(working_directory+"save.ini")
    {
        loadFile()
    }
    else 
    {
        save()
    }
}
loadGame()