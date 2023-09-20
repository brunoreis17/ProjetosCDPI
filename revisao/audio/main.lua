display.setStatusBar (display.HiddenStatusBar)

local bgAudio = audio.loadStream ("audio_bg.mp3") 

audio.reserveChannels (1)

audio.setVolume (0.6, {channel=1})

audio.play (bgAudio, {channel=1, loops=-1})

local audioTiro = audio.loadSound ("tiro.wav")

local parametros = {time=2000, fadein=200}

local botaoTiro = display.newCircle (60, 400, 20)
botaoTiro:setFillColor (1, 0.7, 0.3)

local function tocarTiro ()
    audio.play (audioTiro, parametros)
end

botaoTiro:addEventListener ("tap", tocarTiro)

local audioMoeda = audio.loadSound ("moeda.wav")

local parametros = {time= 1000, fadein= 100}

local botaoMoeda = display.newCircle (250, 400, 20)
botaoMoeda:setFillColor (1, 0.1, 1)

local function tocarMoeda ()
    audio.play (audioMoeda, parametros)
end

botaoMoeda:addEventListener ("tap", tocarMoeda)