function notif(title, desc)
  game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = title or "Error",
	Text = desc or "Error"
})
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
local tools=game.Player.LocalPlayer.Backpack
local move1=tools["Normal Punch"]
local move2=tools["Consecutive Punches"]
local move3=tools["Shove"]
local move4=tools["Uppercut"]
local hotbar=game.Players.LocalPlayer.PlayerGui.Hotbar.Backpack.Hotbar
hotbar["1"].Base.ToolName.Text="RSOD"
hotbar["2"].Base.ToolName.Text="Energy sword 1"
hotbar["3"].Base.ToolName.Text="Energy sword 2
hotbar["4"].Base.ToolName.Text="Core blast"
