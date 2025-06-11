--Made By BluezModZ
--https://www.bluezmodz-scripts.weebly.com
--password = 1667


local ScreenGui = Instance.new("ScreenGui")
local LoginGui = Instance.new("Frame")
local GuiTittle = Instance.new("TextLabel")
local password = Instance.new("TextBox")
local Login = Instance.new("TextButton")
local CheatGui = Instance.new("Frame")
local GuiTittle_2 = Instance.new("TextLabel")
local WalkSpeed = Instance.new("TextButton")
local JumpPower = Instance.new("TextButton")
local Exit = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

LoginGui.Name = "LoginGui"
LoginGui.Parent = ScreenGui
LoginGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LoginGui.Position = UDim2.new(0.392886013, 0, 0.275459111, 0)
LoginGui.Size = UDim2.new(0, 286, 0, 210)
LoginGui.Active = true
LoginGui.Draggable = true

GuiTittle.Name = "GuiTittle"
GuiTittle.Parent = LoginGui
GuiTittle.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
GuiTittle.Size = UDim2.new(0, 286, 0, 50)
GuiTittle.Font = Enum.Font.Ubuntu
GuiTittle.Text = "BluezModZ / simple"
GuiTittle.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiTittle.TextSize = 25.000

password.Name = "password"
password.Parent = LoginGui
password.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
password.BorderColor3 = Color3.fromRGB(0, 0, 127)
password.Position = UDim2.new(0.132867128, 0, 0.309452742, 0)
password.Size = UDim2.new(0, 210, 0, 50)
password.Font = Enum.Font.SourceSans
password.Text = "Password"
password.TextColor3 = Color3.fromRGB(0, 0, 127)
password.TextSize = 30.000

Login.Name = "Login"
Login.Parent = LoginGui
Login.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Login.BorderColor3 = Color3.fromRGB(0, 0, 127)
Login.Position = UDim2.new(0.132867128, 0, 0.661513925, 0)
Login.Size = UDim2.new(0, 210, 0, 50)
Login.Font = Enum.Font.SourceSans
Login.Text = "Login"
Login.TextColor3 = Color3.fromRGB(0, 0, 127)
Login.TextSize = 30.000
Login.MouseButton1Down:connect(function()
	if password.Text == "1667" then
		LoginGui.Visible = false
		CheatGui.Visible = true
	else
	    LoginGui.Visible = false
		print(os.date('Incorrect Login Info %m/%d/%Y'))
	end
end)

CheatGui.Name = "CheatGui"
CheatGui.Parent = ScreenGui
CheatGui.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
CheatGui.Position = UDim2.new(0.390460789, 0, 0.298831373, 0)
CheatGui.Size = UDim2.new(0, 331, 0, 240)
CheatGui.Visible = false
CheatGui.Active = true
CheatGui.Draggable = true

GuiTittle_2.Name = "GuiTittle"
GuiTittle_2.Parent = CheatGui
GuiTittle_2.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
GuiTittle_2.Size = UDim2.new(0, 331, 0, 50)
GuiTittle_2.Font = Enum.Font.Oswald
GuiTittle_2.Text = "Simple Gui Made By BluezModZ"
GuiTittle_2.TextColor3 = Color3.fromRGB(0, 0, 0)
GuiTittle_2.TextSize = 25.000

WalkSpeed.Name = "WalkSpeed"
WalkSpeed.Parent = CheatGui
WalkSpeed.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
WalkSpeed.Position = UDim2.new(0.069486402, 0, 0.333333343, 0)
WalkSpeed.Size = UDim2.new(0, 284, 0, 50)
WalkSpeed.Font = Enum.Font.SourceSans
WalkSpeed.Text = "Walk Speed"
WalkSpeed.TextColor3 = Color3.fromRGB(0, 0, 0)
WalkSpeed.TextSize = 43.000
WalkSpeed.MouseButton1Down:connect(function()
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	
	char.Humanoid.WalkSpeed = 75
end)

JumpPower.Name = "JumpPower"
JumpPower.Parent = CheatGui
JumpPower.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
JumpPower.Position = UDim2.new(0.069486402, 0, 0.60833329, 0)
JumpPower.Size = UDim2.new(0, 284, 0, 50)
JumpPower.Font = Enum.Font.SourceSans
JumpPower.Text = "Jump Power"
JumpPower.TextColor3 = Color3.fromRGB(0, 0, 0)
JumpPower.TextSize = 43.000
JumpPower.MouseButton1Down:connect(function()
	local plr = game.Players.LocalPlayer
	local char = plr.Character
	
	char.Humanoid.JumpPower = 100
end)

Exit.Name = "Exit"
Exit.Parent = CheatGui
Exit.BackgroundColor3 = Color3.fromRGB(0, 0, 127)
Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit.Position = UDim2.new(0.912386715, 0, -2.79396772e-08, 0)
Exit.Size = UDim2.new(0, 29, 0, 22)
Exit.Font = Enum.Font.SourceSans
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit.TextSize = 14.000
Exit.MouseButton1Down:connect(function()
	CheatGui.Visible = false
	print('Thanks For Using BluezModZ Scripts!')
end)
