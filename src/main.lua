
cc.FileUtils:getInstance():setPopupNotify(false)
cc.FileUtils:getInstance():addSearchPath("src/")
cc.FileUtils:getInstance():addSearchPath("res/")

require "config"
require "cocos.init"

local function main()
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    print(msg)
end

-- set screen resolution details and asset folder paths
cc.Director:getInstance():getOpenGLView():setDesignResolutionSize(640,690, cc.ResolutionPolicy.SHOW_ALL)
local screenSize = cc.Director:getInstance():getVisibleSize()
local designSize = cc.size(640, 960)
    if (screenSize.width > 320) then cc.Director:getInstance():setContentScaleFactor(640/designSize.width)
cc.FileUtils:getInstance():addSearchPath("res/hd/")
    else
cc.Director:getInstance():setContentScaleFactor(320/designSize.width)
CC.FileUtils:getInstance():addSearchPath("res/sd/")
end

-- add background music and stuff

local bgMusicPath = cc.FileUtils:getInstance():fullPathForFilename("backgroundmusic.mp3")
cc.SimpleAudioEngine:getInstance():preloadMusic(bgMusicPath)
local effectPath = cc.FileUtils:getInstance():fullPathForFilename("match.wav")
cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
effectPath = cc.FileUtils:getInstance():fullPathForFilename("diamond.wav")
cc.SimpleAudioEngine:getInstance():preloadEffect(effectPath)
effectPath = cc.FileUtils:getInstance():fullPathForFilename("diamond2.wav")
cc.SimpleAudioEngine.getInstance():preloadEffect(effectPath)
effectPath = cc.FileUtils:getInstance():fullPathForFilename("wrong.wav")
cc.SimpleAudioEngine.getInstance():preloadEffect(effectPath)

-- create and run first scene?!?!?
local scene = require("MenuScene")
local menuScene = scene.create()
if cc.Director:getInstance():getRunningScene() then
cc.Director.getInstance():replaceScene(menuScene)
    else
cc.Director:getInstance():runWithScene(menuScene)
    end