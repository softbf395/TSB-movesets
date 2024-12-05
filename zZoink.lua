local Moveset="zZoink"
local ms=loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Utilities/refs/heads/main/TSB/V2/movesets.lua"))()
--local SFXM1=ms:SFX(false, "url", "path")
--local SFXM2=ms:SFX(false, "url", "path")
--local SFXM3=ms:SFX(false, "url", "path")
--local SFXM4=ms:SFX(false, "url", "path")local Moveset="zZoink"
local urlspaths={
  {path="tidal.png", url="https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/Tidal.png"};
  {path="wave.png", url="https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/Wave.png"}
}
for _, pathurlt in ipairs(urlspaths) do
  if not isfile(pathurlt.path) then
    writefile(pathurlt.path, game:HttpGet(pathurlt.url))
  end
end
local tidal=getcustomasset("tidal.png")
local wave=getcustomasset("wave.png")
function tw()
  spawn(function()
      local SG=Instance.new("ScreenGui", game.CoreGui)
      local TG=Instance.new("ImageLabel", SG)
      local WG=Instance.new("ImageLabel", SG)
      TG.Image=tidal
      WG.Image=wave
      TG.Size=UDim2.new(1,0,0.5,0)
      WG.Size=UDim2.new(1,0,0.5,0)
      WG.Position=UDim2.new(-1,0,0.5,0)
      TG.Position=UDim2.new(1,0,0,0)
      local ts=game:GetService("TweenService")
      ts:Create(TG, TweenInfo.new(1), {Position=UDim2.new(0,0,0,0)}):Play()
      wait(1)
      ts:Create(WG, TweenInfo.new(1), {Position=UDim2.new(0,0,0.5,0)}):Play()
      wait(1)
      ts:Create(TG, TweenInfo.new(3), {Position=UDim2.new(0,0,-1,0)}):Play()
      ta:Create(WG, TweenInfo.new(3), {Position=UDim2.new(0,0,1,0)}):Play()
    end)
end
      
local musicNormal=ms:SFX(true, "https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/Tidal.mp3", "music/TSB/ZoinkMusic.mp3")
musicNormal.PlaybackSpeed=0.7
local musicUlt=ms:SFX(true, "https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/Tidal.mp3", "music/TSB/ZoinkUlt.mp3")
musicNormal:Play()
ms:ReqChr("Cyborg" --[[Cyborg]])
ms:Ult("Beat Tidal Wave", Color3.fromRGB(0,255,255), function() tw() print("Ult Activated!") musicUlt.Volume=0 musicUlt:Play() game:GetService("TweenService"):Create(musicNormal, TweenInfo.new(2), {Volume=0}):Play() game:GetService("TweenService"):Create(musicUlt, TweenInfo.new(2), {Volume=1}):Play() wait(15) musicUlt:Stop() musicNormal.Volume=1 end)
ms:Create("1", --[[move ID, 1 to 15]] function() end, --[[Callback for when used]] 2, --[[Cooldown for custom moves]] "Bloodbath")
