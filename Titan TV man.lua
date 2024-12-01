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
function resetTools()
	local tools=game.Players.LocalPlayer.Backpack
local move1=tools["Normal Punch"]
local move2=tools["Consecutive Punches"]
local move3=tools["Shove"]
local move4=tools["Uppercut"]
local animRSOD=Instance.new("Animation", game.ReplicatedStorage)
animRSOD.AnimationId="rbxassetid://84331994888547"
local animES1=Instance.new("Animation", game.ReplicatedStorage)
animES1.AnimationId="rbxassetid://78236967627477"
local animES2=Instance.new("Animation", game.ReplicatedStorage)
animES2.AnimationId="rbxassetid://110998875969052"
local animCore=Instance.new("Animation", game.ReplicatedStorage)
animCore.AnimationId="rbxassetid://81133258017045"
function PlayAnim(anim)
	for _, t in ipairs(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do t:Stop() end
	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(anim):Play(0.1,10000,1)
end
	PlayAnim(animES2)
local hotbar=game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
move1.Activated:Connect(function()
		PlayAnim(animRSOD)
	end)
move2.Activated:Connect(function()
		PlayAnim(animES1)
	end)
move3.Activated:Connect(function()
		PlayAnim(animES2)
	end)
move4.Activated:Connect(function()
		PlayAnim(animCore)
	end)
hotbar["1"].Base.ToolName.Text="RSOD"
hotbar["2"].Base.ToolName.Text="Energy sword 1"
hotbar["3"].Base.ToolName.Text="Energy sword 2"
hotbar["4"].Base.ToolName.Text="Core blast"
end
function fullReset()
	resetTools()
	local ultText=game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth.TextLabel
local ultBar=ultText.Parent.Health.Bar
ultText.Text="Rage Mode"
ultBar.ImageColor3=Color3.new(1,0,1)

local buttonevent = ultText.Parent.TextButton.MouseButton1Click:Connect(function()
    local canUse = ultText.Parent.Ult.Visible
    if canUse then
        -- Create the TextLabel UI
        local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
        local text = Instance.new("TextLabel", screenGui)
        text.Size = UDim2.new(1, 0, 1, 0)
        text.BackgroundTransparency = 1
        text.TextScaled = true
        text.Text = ""
        text.TextColor3 = Color3.new(1, 0, 1)
        
        -- Perform the text animations
        task.wait(1)
        text.Text = "."
        task.wait(1)
        text.Text = ".."
        task.wait(1)
        text.Text = "..."
        
        -- Handle sound file download and playback
        if not isfile("SFX/TSB/TTM Awaken Start.mp3") then
            writefile("SFX/TSB/TTM Awaken Start.mp3", game:HttpGet("https://raw.githubusercontent.com/softbf395/TSB-movesets/refs/heads/main/TTMawakenStart.mp3"))
        end
        local sound = Instance.new("Sound", workspace)
        sound.SoundId = getcustomasset("SFX/TSB/TTM Awaken Start.mp3")
        sound:Play()
        
        -- Additional text animations
        text.Text = "hehehehe.."
        task.wait(1.2)
        text.Text = "You thought I was done?"
        task.wait(2.2)
        text.Text = "Think again.."
        task.wait(1.3)
        text.Text = "I am the titan tv man.."
        task.wait(2)
        text.Text = "And you.. I will go all out!"
        task.wait(4)
        
        -- Clean up UI
        text:Destroy()
        screenGui:Destroy()
    end
end)
end
fullReset()
game.Players.LocalPlayer.CharacterAdded:Connect(function()
		wait(1)
		fullReset()
end)
