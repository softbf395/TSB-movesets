function notif(title, desc)
  game:GetService("StarterGui"):SetCore("SendNotification",{Title = title or "Error", Text = desc or "Error"})
end
local moves={character="Cyborg", Moves={[1]="Machine Gun Blows", [2]="Ignition Burst", [3]="Blitz Shot", [4]="Jet Dive"}}
for _, move in ipairs(moves.Moves) do
  if not game.Players.LocalPlayer.Backpack:FindFirstChild(move) then
	notif("Unable to start:", "Either holding a "..moves.character .." move or arent "..moves.character)
	return
	end
end
notif("Starting moveset:","PM-Damian")
function resetTools()
	local tools=game.Players.LocalPlayer.Backpack
local move1=tools[moves.Moves[1]]
local move2=tools[moves.Moves[2]]
local move3=tools[moves.Moves[3]]
local move4=tools[moves.Moves[4]]
local animRSOD=Instance.new("Animation", game.ReplicatedStorage)
animRSOD.AnimationId="rbxassetid://84331994888547"
local animES1={
     {
      Part="HumanoidRootPart",
      P=Vector3.new(0,0,0),
      R=Vector3.new(0,0,0),
      TimeStart=0
    },
      {
      Part="Head",
      P=Vector3.new(0,-0.25,0),
      R=Vector3.new(-15,0,0),
      TimeStart=0.1
    },
    {
      Part="Head",
      P=Vector3.new(0,0.25,0),
      R=Vector3.new(15,0,0),
      TimeStart=3.2
    }
}
local animES2= {
    -- Arm goes back to charge
    {
        Part = "Right Arm",
        P = Vector3.new(0, -1, -0.5), -- Slightly backward and downward
        R = Vector3.new(-20, 0, 0), -- Tilt backward
        TimeStart = 0.1, -- Delay before movement
        FrameRate = 0.03 -- 30ms updates
    },
    -- Arm moves forward for the blast
    {
        Part = "Right Arm",
        P = Vector3.new(0, 1, 1.5), -- Push forward
        R = Vector3.new(30, 0, 0), -- Tilt forward
        TimeStart = 0.5, -- Starts after the charge
        FrameRate = 0.03 -- 30ms updates
    }
}
local animCore=Instance.new("Animation", game.ReplicatedStorage)
animCore.AnimationId="rbxassetid://81133258017045"
function PlayAnim(anim)
    -- Stop all currently playing animations
    for _, t in ipairs(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):GetPlayingAnimationTracks()) do
        t:Stop()
    end

    -- Iterate through animation information
    for _, info in ipairs(anim) do
        local part = game.Players.LocalPlayer.Character:FindFirstChild(info.Part)
        if part and part:IsA("BasePart") then
            -- Create OG folder for storing original position and rotation if it doesn't exist
				local og
            if not part:FindFirstChild("OG") then
                local ogF = Instance.new("Folder", part)
                ogF.Name = "OGVALUESPM"
					og = ogF

                local PosX, PosY, PosZ = Instance.new("NumberValue", ogF), Instance.new("NumberValue", ogF), Instance.new("NumberValue", ogF)
                PosX.Name, PosY.Name, PosZ.Name = "X", "Y", "Z"
                PosX.Value, PosY.Value, PosZ.Value = part.Position.X, part.Position.Y, part.Position.Z

                local RotX, RotY, RotZ = Instance.new("NumberValue", ogF), Instance.new("NumberValue", ogF), Instance.new("NumberValue", ogF)
                RotX.Name, RotY.Name, RotZ.Name = "RotX", "RotY", "RotZ"
                RotX.Value, RotY.Value, RotZ.Value = part.Orientation.X, part.Orientation.Y, part.Orientation.Z
				else
					og=part.OG
            end

            -- Animation parameters
            local Pos = info.P
            local Rot = info.R
            local delay = info.TimeStart
            local frameRate = info.FrameRate or 0.05 -- Time between each update (50ms default)

            -- Anchor the part if not already anchored
            --if not part.Anchored then
                part.Anchored = true
            --end

            -- Constant animation (step-by-step frame updates)
            spawn(function()
                wait(delay)

                local OGPos = Vector3.new(og.X.Value, og.Y.Value, og.Z.Value)
                local OGRot = Vector3.new(og.RotX.Value, og.RotY.Value, og.RotZ.Value)

                local targetPos = OGPos + Pos
                local targetRot = OGRot + Rot

                -- Simulate constant movement
                local currentPos = OGPos
                local currentRot = OGRot
                local stepSize = 999 -- Step size for movement/rotation updates

                while (currentPos - targetPos).Magnitude > stepSize or (currentRot - targetRot).Magnitude > stepSize do
                    -- Update position
                    currentPos = currentPos:Lerp(targetPos, stepSize)
                    -- Update rotation
                    currentRot = currentRot:Lerp(targetRot, stepSize)

                    -- Apply updates to the part
                    part.CFrame = CFrame.new(currentPos) * CFrame.Angles(math.rad(currentRot.X), math.rad(currentRot.Y), math.rad(currentRot.Z))

                    wait(frameRate)
                end

                -- Ensure final position/rotation is exact
                part.CFrame = CFrame.new(targetPos) * CFrame.Angles(math.rad(targetRot.X), math.rad(targetRot.Y), math.rad(targetRot.Z))
            end)
        else
            warn("Part " .. info.Part .. " not found in character.")
        end
        
    end
    for _, part in ipairs(game.Players.LocalPlayer.Character:GetChildren()) do
      if part:IsA("BasePart") then part.Anchored=false end
      if part:FindFirstChild("OGVALUESPM") then part.OGVALUESPM:Destroy() end
    end
end

	PlayAnim(animES2)
local hotbar=game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
move1.Activated:Connect(function()
		--PlayAnim(animRSOD)
	end)
    local br=game.Lighting.Brightness
move2.Activated:Connect(function()
		PlayAnim(animES1)
        workspace.CurrentCamera.CameraType="Scriptable"
        local ts=game:GetService("TweenService")
        local head=game.Players.LocalPlayer.Character.Head
        local cam=workspace.CurrentCamera
        ts:Create(cam, TweenInfo.new(1), {CFrame=CFrame.new((head.CFrame * CFrame.new(-0.3,-0.1,-2)).Position, head.Position)}):Play()
        wait(1.25)
        ts:Create(cam, TweenInfo.new(1), {CFrame=CFrame.new((head.CFrame * CFrame.new(0,-0.25,5)).Position, head.Position)}):Play()
        ts:Create(game.Lighting, TweenInfo.new(1), {Brightness=-9999}):Play()
        local Highlight=Instance.new("Highlight", head.Parent)
        Highlight.OutlineColor3=Color3.new(1,1,1)
			Highlight.FillColor=Color3.new(0,0,0)
			local Highlight2=Highlight:Clone()
			Highlight2.OutlineTransparency=1
			Highlight2.FillTransparency=0
        Highlight.OutlineTransparency=0
        wait(1.75)
        Highlight:Destroy()
			Highlight2:Destroy()
        ts:Create(game.Lighting, TweenInfo.new(1), {Brightness=br}):Play()
        wait(0.2)
        workspace.CurrentCamera.CameraType="Custom"
	end)
move3.Activated:Connect(function()
		PlayAnim(animES2)
	end)
move4.Activated:Connect(function()
		--PlayAnim(animCore)
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
            game:GetService("TweenService"):Create(cdf, TweenInfo.new(CD, Enum.EasingStyle.Linear), {Size=UDim2.new(1,0,0,0), Position=UDim2.new(0,0,1,0)}):Play()
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
       
		humanoidRootPart.CFrame = targetCFrame
		humanoidRootPart.Anchored = false
            
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

hotbar["1"].Base.ToolName.Text="IDK"
hotbar["2"].Base.ToolName.Text="Pierce"
hotbar["3"].Base.ToolName.Text="KI ball"
hotbar["4"].Base.ToolName.Text="IDK"
hotbar["5"].Base.ToolName.Text="Teleport"
hotbar["5"].Base.Reuse.Visible=false
hotbar["5"].Visible = true
hotbar["5"].Base.MouseButton1Click:Connect(function()
			if customSlotCD(10, 5) then
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
						press=true
                triggerTeleport(game.Players.LocalPlayer:GetMouse().Hit.Position)
               
                end)
              repeat wait() until press
              connect:Disconnect()
              Hint:Destroy()
            end
	end)
end
function fullReset()
	resetTools()
	local ultText=game.Players.LocalPlayer.PlayerGui.ScreenGui.MagicHealth.TextLabel
local ultBar=ultText.Parent.Health.Bar
ultText.Text="go back to normal"
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
        --sound:Play()
        
        -- Additional text animations
        text.Text = "guys"
        task.wait(1.2)
        text.Text = "note:"
        task.wait(2.2)
        text.Text = "idk what to"
        task.wait(1.3)
        text.Text = "put"
        task.wait(2)
        text.Text = "here"
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
