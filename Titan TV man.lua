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
	local function isNearWall(player, distanceThreshold)
    local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
    local rayOrigin = humanoidRootPart.Position
    local rayDirection = Vector3.new(0, -1, 0) -- Check downward to avoid collisions with other objects

    -- Cast ray in all directions to detect proximity to walls
    local raycastParams = RaycastParams.new()
    raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    raycastParams.FilterDescendantsInstances = {player.Character}  -- Exclude player's own character

    -- Raycast for collisions in all directions (e.g., forward, backward, left, right)
    local directions = {
        Vector3.new(1, 0, 0), -- Right
        Vector3.new(-1, 0, 0), -- Left
        Vector3.new(0, 0, 1), -- Forward
        Vector3.new(0, 0, -1), -- Backward
    }

    for _, dir in ipairs(directions) do
        local raycastResult = workspace:Raycast(rayOrigin, dir * distanceThreshold, raycastParams)
        if raycastResult then
            return true -- Player is too close to a part, can't teleport
        end
    end

    return false -- Player is not near any part, teleportation is allowed
end
	local customCooldowns={["0"]=math.huge}
function customSlotCD(CD, MID)
			if not customCooldowns[tostring(MID)] then
        local move=hotbar[tostring(MID)].Base
        local cdf=Instance.new("Frame", hotbar[tostring(MID)].Base)
        cdf.Size=UDim2.new(1,0,1,0)
        cdf.BackgroundColor3=Color3.new(1,0,0)
        cdf.BackgroundTransparency=0.6
        cdf.ZIndex=10
        customCooldowns[tostring(MID)]=CD
        spawn(function()
            game:GetService("TweenService"):Create(cdf, TweenInfo.new(CD, enum.EasingStyle.Linear), {Size=UDim2.new(1,0,0,0), Position=UDim2.new(0,0,1,0)}):Play()
            wait(CD)
            cdf:Destroy()
            customCooldowns[tostring(MID)]=nil
				end)
        return true
      else
        return false
      end
    end
		
local function triggerTeleport(targetPosition)
    --local currentTime = tick()
    
        local character = game.Players.LocalPlayer.Character
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        
        -- Check if the player is too close to any part (1.5 studs)
        if isNearWall(game.Players.LocalPlayer, 1.5) then
            print("Cannot teleport too close to a wall!")
            return  -- Abort teleportation if near a wall
        end
        local humanoid = character:WaitForChild("Humanoid")
        if humanoid:GetState() == Enum.HumanoidStateType.Seated then
            print("Cannot teleport while stunned!")
            return
        end

        -- Anchor the HumanoidRootPart during teleportation to prevent weird movement
        humanoidRootPart.Anchored = true

        -- Perform teleportation (adjust position)
        local targetCFrame = CFrame.new(targetPosition+Vector3.new(0,3,0)) * CFrame.Angles(0, humanoidRootPart.CFrame.Rotation.Y, 0)
        

        -- Trigger particle effects
        local particles = Instance.new("ParticleEmitter", humanoidRootPart)
		particles.Rate=500
		particles.SpreadAngle=Vector2.new(180,180)
		particles.Color=ColorSequence.new(Color3.new(0,0,0))
		particles.Lifetime=NumberRange.new(1)
		particles.Texture="rbxassetid://377156649"
        particles.Enabled = true

        -- Teleportation completed event (when particles are gone)
        wait(2)
		humanoidRootPart.CFrame = targetCFrame
		humanoidRootPart.Anchored = false
		wait(2)
            
            teleporting = false
        particles:Destroy()

        -- Handle damage detection and cooldown
        humanoid.HealthChanged:Connect(function(health)
            if teleporting and health < humanoid.Health then
                humanoidRootPart.Anchored = false
                particles.Enabled = false
                teleporting = false
                print("Teleportation cancelled due to damage!")
            end
        end)

        teleporting = true
        lastTeleport = currentTime
    
end

hotbar["1"].Base.ToolName.Text="RSOD"
hotbar["2"].Base.ToolName.Text="Energy sword 1"
hotbar["3"].Base.ToolName.Text="Energy sword 2"
hotbar["4"].Base.ToolName.Text="Core blast"
hotbar["5"].Base.ToolName.Text="Shadow Teleportation"
hotbar["5"].Base.Reuse.Visible=false
hotbar["5"].Visible = true
hotbar["5"].Base.MouseButton1Click:Connect(function()
			if customSlotCD(4, 5) then
            local Hint=Instance.new("Hint", workspace)
            wait(1)
            Hint.Text="3"
            wait(1)
            Hint.Text="2"
            wait(1)
            Hint.Text="1"
            wait(1)
            Hint.Text="Click anywhere to start teleportation!"
            local press=false
            local connect=game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
                triggerTeleport(game.Players.LocalPlayer:GetMouse().Hit.Position)
               press=true
                end)
              repeat wait() until press
              connect:Disconnect()
              Hint:Destroy()
            end)
	end
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
