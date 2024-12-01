function notif(title, desc)
  game:GetService("StarterGui"):SetCore("SendNotification",{Title = title or "Error", Text = desc or "Error"})
end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Normal Punch") then
	notif("Unable to start:", "Either holding a saitama move or arent saitama")
	return
	end
	if not game.Players.LocalPlayer.Backpack:FindFirstChild("Consecutive Punches") then
	notif("Unable to start:", "Either holding a saitama move or arent saitama")
	return
	end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Shove") then
	notif("Unable to start:", "Either holding a saitama move or arent saitama")
	return
	end
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Uppercut") then
	notif("Unable to start:", "Either holding a saitama move or arent saitama")
	return
	end
notif("Starting moveset:","Titan TV Man")
local ultText=game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth.TextLabel
local ultBar=ultText.Parent.Health.Bar
ultText.Text="Rage Mode"
ultBar.ImageColor3=Color3.new(1,0,1)
local tools=game.Players.LocalPlayer.Backpack
local move1=tools["Normal Punch"]
local move2=tools["Consecutive Punches"]
local move3=tools["Shove"]
local move4=tools["Uppercut"]
local hotbar=game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
hotbar["1"].Base.ToolName.Text="RSOD"
hotbar["2"].Base.ToolName.Text="Energy sword 1"
hotbar["3"].Base.ToolName.Text="Energy sword 2"
hotbar["4"].Base.ToolName.Text="Core blast"
local buttonevent=ultText.Parent.TextButton.MouseButton1Click:Connect(function()
              local canUse=ultText.Parent.Ult.Visible
    if canUse then
      local text=Instance.new("TextLabel", Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui))
      text.Size=UDim2.new(1,0,1,0)
      text.BackgroundTransparency=1
      text.TextScaled=true
      text.Text=""
      text.TextColor3=Color3.new(1,0,1)
      wait(1)
      text.Text="."
      wait(1)
      text.Text=".."
      wait(1)
      text.Text="..."
      if not isfile("SFX/TSB/TTM Awaken Start.mp3") then
        writefile("SFX/TSB/TTM Awaken Start.mp3", game:HttpGet("https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/TTMAwakenStart.mp3"))
      end
      local Sound=Instance.new("Sound", workspace)
      Sound.SoundId=getcustomasset("SFX/TSB/TTM Awaken Start.mp3")
      Sound:Play()
      text.Text="hehehehe.."
      wait(1.2)
      text.Text="You thought i was done?"
      wait(2.2)
      text.Text="Think again.."
      wait(1.3)
      text.Text="I am the titan tv man.."
      wait(2)
      text.Text="And you.. i will go all out!"
      wait(1)
      text:Destroy()
	end)
