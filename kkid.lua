

getgenv().SantoWareLoaded = true


local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LuaName = "OLD TABLE"


local initialized = false
local sessionid = ""


Name = "santoware" --* Application Name
Ownerid = "vUlrYHBJqJ" --* OwnerID
APPVersion = SantoWare.Options.Version     --* Application Version

local req = game:HttpGet('https://keyauth.win/api/1.1/?name=' .. Name .. '&ownerid=' .. Ownerid .. '&type=init&ver=' .. APPVersion)



local data = HttpService:JSONDecode(req)

if data.success == true then
   initialized = true
   sessionid = data.sessionid
   --print(req)
elseif (data.message == "invalidver") then
   print(" Please update table version")

   StarterGui:SetCore("SendNotification", {
	   Title = LuaName,
	   Text = " Please update table version",
	   Duration = 3
   })

   return false
else
   print(" Error: " .. data.message)
   return false
end

local SantoWareLogo, GetTime = game:HttpGet("https://cdn.discordapp.com/attachments/1189307770390974525/1224787305982726306/S_Logo_-_Original_-_5000x5000.png?ex=661ec311&is=660c4e11&hm=4c4559744c5a3d09b7d36a066d133d0798b5584c41167ac994f8eb3c005afadc&"), os.clock()

local NoclipMacro, Macro, PanicMode, TriggerBot, Desync, FreezePos, FrameSkip, FakeSpike = false, false, false, false, false, false, false, false
local ClosestPointCF, ToolConnection, SilentTarget, AimTarget, ForceLock, keybindTime, LastStutter = nil, nil, nil, nil, nil, 0, tick()
local SmoothingFactor, PositionData, PositionData2, CurrentIndex, CurrentIndex2, CurrentVelocity, CurrentVelocity2 = 6, {}, {}, 1, 1, Vector3.zero, Vector3.zero

local Script = {Functions = {}, Friends = {}, Drawing = {}, EspPlayers = {}, NotifyNote = {}, BeizerManager = {}, BeizerCurve = {}, PanicModeSaves = {}, SavedValue = {}}

local Saves = {ShotCheck = {}, CharCheck = {}, AddedCheck = {}}
local Detection = {OldAmmo = {}, Suspicious = {}, NewBullets = nil}

local Players, Client, Mouse, RS, Camera, GuiS, Uis, Tween = game:GetService("Players"), game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer:GetMouse(), game:GetService("RunService"), game:GetService("Workspace").CurrentCamera, game:GetService("GuiService"), game:GetService("UserInputService"), game:GetService("TweenService")
local Text_1, Text_2, Text_3, Text_4, Text_5, Text_6, Text_7 = tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum)), tostring("." .. math.random(1, 99) .. " MB"), tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum)), tostring("." .. math.random(1, 99) .. " MB"), tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum)), tostring("."..math.random(1, 999)), tostring("."..math.random(1, 999))

Script.SavedValue.SilentPart = SantoWare.Silent.Part
Script.SavedValue.AimAssistSmoothX = SantoWare.AimAssist.Smoothness_X
Script.SavedValue.AimAssistSmoothY = SantoWare.AimAssist.Smoothness_Y
Script.SavedValue.ShakeX = SantoWare.AimAssist.Shake.Shake_X
Script.SavedValue.ShakeY = SantoWare.AimAssist.Shake.Shake_Y
Script.SavedValue.ShakeZ = SantoWare.AimAssist.Shake.Shake_Z

Script.BeizerCurve.Offset = Vector2.new(0,0)

-- // Using Thise For TweenService Support + Im 2 Lazy
local SilentFovRadius = Instance.new("NumberValue")
SilentFovRadius.Name = "DevConsole"
SilentFovRadius.Parent = nil
SilentFovRadius.Value = SantoWare.Silent.Fov.Radius

-- // Main Intro Local
if SantoWare.Options.Intro then


local gui = 
{
	blazedLoader = Instance.new("ScreenGui"),
	Frame = Instance.new("Frame"),
	UICorner = Instance.new("UICorner"),
	TextLabel = Instance.new("TextLabel"),
	TextLabel_1 = Instance.new("TextLabel"),
	signin_load = Instance.new("TextButton"),
	UICorner_1 = Instance.new("UICorner"),
	UIStroke = Instance.new("UIStroke"),
	TextLabel_2 = Instance.new("TextLabel"),
	fps_checkbox = Instance.new("Frame"),
	UICorner_2 = Instance.new("UICorner"),
	UICorner_3 = Instance.new("UICorner"),
	UIStroke_1 = Instance.new("UIStroke"),
	ImageLabel = Instance.new("ImageLabel"),
	fpscheckbox_button = Instance.new("TextButton"),
	TextLabel_3 = Instance.new("TextLabel"),
	UICorner_4 = Instance.new("UICorner"),
	UIStroke_2 = Instance.new("UIStroke"),
	UIStroke_3 = Instance.new("UIStroke"),
    
}
local TweenService = game:GetService("TweenService")


gui.blazedLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.blazedLoader.Name = "blazedLoader"
gui.blazedLoader.Parent = game:GetService("CoreGui")

gui.Frame.BorderSizePixel = 0
gui.Frame.Size = UDim2.new(0, 396, 0, 60)
gui.Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
gui.Frame.Name = "Frame"
gui.Frame.Position = UDim2.new(0.396226, 0, 0.362031, 0)
gui.Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
gui.Frame.Parent = gui.blazedLoader

gui.UICorner.Name = "UICorner"
gui.UICorner.CornerRadius = UDim.new(0, 12)
gui.UICorner.Parent = gui.Frame

gui.TextLabel.BorderSizePixel = 0
gui.TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gui.TextLabel.FontFace = Font.new("rbxassetid://11702779517", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
gui.TextLabel.TextSize = 30
gui.TextLabel.Position = UDim2.new(0.244949, 0, 0.11245, 0)
gui.TextLabel.Size = UDim2.new(0, 147, 0, 50)
gui.TextLabel.Name = "TextLabel"
gui.TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
gui.TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
gui.TextLabel.Text = "SANTO"
gui.TextLabel.BackgroundTransparency = 1
gui.TextLabel.Parent = gui.Frame

gui.TextLabel_1.BorderSizePixel = 0
gui.TextLabel_1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gui.TextLabel_1.FontFace = Font.new("rbxassetid://16964794940", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
gui.TextLabel_1.TextSize = 20
gui.TextLabel_1.Position = UDim2.new(0.479798, 0, 0.11245, 0)
gui.TextLabel_1.Size = UDim2.new(0, 106, 0, 57)
gui.TextLabel_1.Name = "TextLabel"
gui.TextLabel_1.TextColor3 = Color3.fromRGB(82, 93, 178)
gui.TextLabel_1.BorderColor3 = Color3.fromRGB(0, 0, 0)
gui.TextLabel_1.Text = "   v" .. getgenv().SantoWare.Options.Version
gui.TextLabel_1.BackgroundTransparency = 1
gui.TextLabel_1.Parent = gui.Frame

local sound = Instance.new("Sound")

-- Set the SoundId to the audio file you want to play
sound.SoundId = "rbxassetid://2811598570"

-- Parent the Sound object to a part or model in your game
sound.Parent = workspace -- or any other parent object




Wait(2)
local tweenInfo = TweenInfo.new(
    2, -- Duration of the Tween in seconds
    Enum.EasingStyle.Quad, -- Easing style of the Tween
    Enum.EasingDirection.Out, -- Easing direction of the Tween
    0, -- Number of times the Tween will repeat
    false, -- Should the Tween repeat?
    0 -- Delay time before the Tween starts
)

-- Define the goal state for the Tween. In this case, we want the Position to change.
local goal = {Position = UDim2.new(0.396226, 0, 10.362031, 0)}
local goalFrame = {Position = UDim2.new(0.244949, 0, 10.11245, 0)}
local goalTextLabel_1 = {Position = UDim2.new(0.479798, 0, 10.11245, 0)}

-- Create the Tweens
local tween = TweenService:Create(gui.TextLabel, tweenInfo, goal)
local tweenFrame = TweenService:Create(gui.Frame, tweenInfo, goalFrame)
local tweenTextLabel_1 = TweenService:Create(gui.TextLabel_1, tweenInfo, goalTextLabel_1)

-- Play the Tweens
tween:Play()
tweenFrame:Play()
tweenTextLabel_1:Play()

-- Use coroutine.wrap to wait for each tween to complete without blocking the script
coroutine.wrap(function() tween.Completed:Wait() end)()
coroutine.wrap(function() tweenFrame.Completed:Wait() end)()
coroutine.wrap(function() tweenTextLabel_1.Completed:Wait() end)()

-- Wait for a bit before destroying the loader to ensure the tweens have time to complete
Wait(2) -- Adjust this wait time as needed

-- Destroy the loader after the Tweens have completed
gui.blazedLoader:Destroy()

    local Flash = Instance.new("ColorCorrectionEffect")
    local Blur = Instance.new("BlurEffect")
    local Gui = Instance.new("ScreenGui")
    local Image = Instance.new("ImageLabel")
    
    Flash.Parent = game.Lighting

    Blur.Parent = game.Lighting
    Blur.Size = 0
    
    Gui.Name = "RobloxGui"
    Gui.Parent = game.CoreGui
    Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    Image.Parent = Gui
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.000
    Image.Position = UDim2.new(0.405, 0, 0.405, 0)
    Image.Size = UDim2.new(0.17, 0, 0.27, 0)
    Image.ImageTransparency = 1
    Image.Image = "rbxassetid://16986622572"
    
    local Create = Tween:Create(Blur, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {Size = 50})
    Create:Play()
    Create.Completed:Wait()
    local Create2 = Tween:Create(Image, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {ImageTransparency = 0.2})
    Create2:Play()
    Create2.Completed:Wait()
    local Create3 = Tween:Create(Image, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Size = UDim2.new(0.15, 0, 0.25, 0)})
    Create3:Play()
    local Create4 = Tween:Create(Image, TweenInfo.new(0.3, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {Position = UDim2.new(0.415, 0, 0.415, 0)})
    Create4:Play()
    sound:Play()
    Flash.TintColor = Color3.fromRGB(223, 91, 91)
    Tween:Create(Flash, TweenInfo.new(0.7), {TintColor = Color3.fromRGB(255, 255, 255)}):Play()
    task.wait(1)
    Tween:Create(Image, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
    local Create5 = Tween:Create(Blur, TweenInfo.new(3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = 0})
    Create5:Play()
    Create5.Completed:Wait()
    
    Gui:Destroy()
    Flash:Destroy()
    Blur:Destroy()
end





-- // Low Gfx Function
if SantoWare.Options.AutoLowGfx then
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
            v.Material = Enum.Material.SmoothPlastic
            if v:IsA("Texture") then
                v:Destroy()
            end
        end
    end
end

-- // BoomBox Mute Function
if SantoWare.Options.MuteBoomBox then
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Sound") and not (v.Name == "ShootSound" or v.Name == "NoAmmo") then
            v.Volume = 0
        end
    end
end

-- // Seat Remove Function
if SantoWare.Options.RemoveSeats then
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("Seat") then
            v:Destroy()
        end
    end
end

-- // The Gui V2. Not Giving Away

-- // Drawing For AimAssist, SilentAim And Desync Dot
Script.Drawing.SilentCircle = Drawing.new("Circle")
Script.Drawing.SilentCircle.Color = Color3.new(1,1,1)
Script.Drawing.SilentCircle.Thickness = 1
Script.Drawing.SilentCircle.NumSides = 128

Script.Drawing.AimAssistCircle = Drawing.new("Circle")
Script.Drawing.AimAssistCircle.Color = Color3.new(1,1,1)
Script.Drawing.AimAssistCircle.Thickness = 1
Script.Drawing.AimAssistCircle.NumSides = 128

Script.Drawing.DesyncCircle = Drawing.new("Circle")
Script.Drawing.DesyncCircle.Color = SantoWare.Desync.Visualize.Color
Script.Drawing.DesyncCircle.NumSides = 128
Script.Drawing.DesyncCircle.Transparency = 1
Script.Drawing.DesyncCircle.Radius = SantoWare.Desync.Visualize.Radius
Script.Drawing.DesyncCircle.Filled = true
Script.Drawing.DesyncCircle.Visible = false

-- // Checks If The Player Is Alive
Script.Functions.Alive = function(Plr)
    return (Plr and Plr.Character and Plr.Character:FindFirstChild("Humanoid") and Plr.Character:FindFirstChild("HumanoidRootPart")) and true or false
end

-- // Checks If Player Is On Your Screen
Script.Functions.OnScreen = function(Object)
    local _, OnScreen = Camera:WorldToScreenPoint(Object.Position)
    return OnScreen
end

-- // Gets The Fov Method
Script.Functions.GetFovPosition = function()
    if SantoWare.Silent.Fov.Method == ("Screen") then
        return Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    else
        return Vector2.new(Mouse.X, Mouse.Y)
    end
end

-- // Gets Magnitude From Part Position And Mouse
Script.Functions.GetMagnitudeFromMouse = function(Part)
    local PartPos, OnScreen = Camera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local GetScreenPos = Script.Functions.GetFovPosition()
        local Magnitude = ((Vector2.new(PartPos.X, PartPos.Y) - GetScreenPos) - SantoWare.Silent.Fov.Offset).Magnitude
        return Magnitude
    end
    return math.huge
end

-- // Makes Random Number With Vector3 
Script.Functions.RandomVec3 = function(Number, Multi)
    return (Vector3.new(math.random(-Number, Number), math.random(-Number, Number), math.random(-Number, Number)) * Multi or 1)
end

-- // Checks If The Player Is Behind A Wall Or Something Else
Script.Functions.WallCheck = function(Pos, PartDescendant)
    local Character = Client.Character
    local Origin = Camera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, Camera}

    local Result = Workspace.Raycast(Workspace, Origin, Pos - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end

-- // Random Number To Compare
Script.Functions.CalculateChance = function(Percentage)
    Percentage = math.floor(Percentage)
    return math.random(0, 99) < Percentage
end

-- // Check If Crew Folder Is A Thing
Script.Functions.FindCrew = function(Plr)
	if Plr:FindFirstChild("DataFolder") and Plr.DataFolder:FindFirstChild("Information") and Plr.DataFolder.Information:FindFirstChild("Crew") and Client:FindFirstChild("DataFolder") and Client.DataFolder:FindFirstChild("Information") and Client.DataFolder.Information:FindFirstChild("Crew") then
        if Client.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Plr.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Plr.DataFolder.Information:FindFirstChild("Crew").Value ~= ("") and Client.DataFolder.Information:FindFirstChild("Crew").Value ~= ("") then 
			return true
		end
	end
	return false
end

-- // Clears AnyThing In The Console
Script.Functions.ClearConsole = function()
    coroutine.resume(coroutine.create(function()
        local DevConsole = game:GetService("CoreGui"):WaitForChild("DevConsoleMaster")
        local DevWindow = DevConsole:WaitForChild("DevConsoleWindow")
        local DevUI = DevWindow:WaitForChild("DevConsoleUI")
        local MainView = DevUI:WaitForChild("MainView")
        local ClientLog = MainView:WaitForChild("ClientLog")
        for _, v in pairs(ClientLog:GetChildren()) do
            if v:IsA("GuiObject") and v.Name == v.Name:match("%d+") then
                v:Destroy()
            end
        end
    end))
end

-- // Calculates The Velocity
Script.Functions.GetVelocity = function(PositionData)
	local TotalVelocity = 0
	local AveragePosition = Vector3.zero
	local AverageTime = 0
	local GetData = #PositionData
	if GetData == 0 then
		return AveragePosition, AverageTime
	end
	for i = 1, GetData do
		local Data = PositionData[i]
		if Data and Data.Position then
			local Velocity = SmoothingFactor - i + 1
			AveragePosition = AveragePosition + (Data.Position * Velocity)
			AverageTime = AverageTime + (Data.Time * Velocity)
			TotalVelocity = TotalVelocity + Velocity
		end
	end
	AveragePosition = AveragePosition / TotalVelocity
	AverageTime = AverageTime / TotalVelocity
	return AveragePosition, AverageTime
end

-- // Smoothness The Velocity Out
Script.Functions.ComPlexVelocity = function(Plr, CurrentPos, Mode)
	local GetTick = tick()
    local GetPos = CurrentPos

    -- // Fixes Calculating The Wrong Position
    if Mode then
        if PositionData2[CurrentIndex2] and PositionData2[CurrentIndex2].Target and tostring(Plr) ~= PositionData2[CurrentIndex2].Target then
            PositionData2[CurrentIndex2] = {Target = tostring(Plr), Position = GetPos, Time = GetTick}
            return Vector3.zero
        end
    else
        if PositionData[CurrentIndex] and PositionData[CurrentIndex].Target and tostring(Plr) ~= PositionData[CurrentIndex].Target then
            PositionData[CurrentIndex] = {Target = tostring(Plr), Position = GetPos, Time = GetTick}
            return Vector3.zero
        end
    end

    if Mode then
    	PositionData2[CurrentIndex2] = {Target = tostring(Plr), Position = GetPos, Time = GetTick}
    	CurrentIndex2 = (CurrentIndex2 % SmoothingFactor) + 1
    	local AveragePosition, AverageTime = Script.Functions.GetVelocity(PositionData2)
    	local PreviousData = PositionData2[CurrentIndex2]
    	if PreviousData and PreviousData.Position then
    		local Velocity = (GetPos - PreviousData.Position) / (GetTick - PreviousData.Time)
    		return Velocity
    	end
    else
    	PositionData[CurrentIndex] = {Target = tostring(Plr), Position = GetPos, Time = GetTick}
    	CurrentIndex = (CurrentIndex % SmoothingFactor) + 1
    	local AveragePosition, AverageTime = Script.Functions.GetVelocity(PositionData)
    	local PreviousData = PositionData[CurrentIndex]
    	if PreviousData and PreviousData.Position then
    		local Velocity = (GetPos - PreviousData.Position) / (GetTick - PreviousData.Time)
    		return Velocity
    	end
    end
    return Vector3.zero
end

-- // Changes The Mouse Position
Script.Functions.MouseOffset = function(self, X, Y)
    local NewPosition = Vector2.new(X, Y) - SantoWare.Silent.Fov.Offset
    mousemoveabs(NewPosition.X, NewPosition.Y)
end

-- // Splits The Gun Name And Splits []
Script.Functions.GetGunName = function(Name)
    local split = string.split(string.split(Name, "[")[2], "]")[1]
    return split
end

-- // Gets Current Gun
Script.Functions.GetCurrentWeaponName = function()
    if Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
       local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
       if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
          return Script.Functions.GetGunName(Tool.Name)
       end
    end
    return nil
end

-- // Drawing Function With Property Attached
Script.Functions.NewDrawing = function(Type, Properties)
    local NewDrawing = Drawing.new(Type)
    for i, v in next, Properties or {} do
        NewDrawing[i] = v
    end
    return NewDrawing
end

-- // Draws For The New Players Joining For Esp
Script.Functions.NewPlayer = function(Plr)
    Script.EspPlayers[Plr] = {
        Name = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255,2550, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        BoxOutline = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        Box = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Visible = false}),
        
        HealthBarOutline = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        HealthBar = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        HealthText = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(0, 255, 0), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        ArmorBarOutline = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        ArmorBar = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        ArmorText = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(0, 255, 0), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        Distance = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        Tool = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        Flag = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        
        Tracer = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(255, 255, 244), Thickness = 1, Visible = false}),
    }
end



-- // The Notification Ui Function
Script.Functions.CreateNotification = function(Text, CustomColor)
	local Gap = 25
	local Width = 18
	local Alpha = 255
	local Time = 0
	local EStep = 0
	local EEStep = 0.02
	local InSety = 0

	local Note = {
		Enabled = true,
		TargetPos = Vector2.new(50, 500),
		Size = Vector2.new(200, Width),
		
		Drawings = {
		    Outline = Script.Functions.NewDrawing("Square", {Size = Vector2.new(202, Width + 2), Filled = false, Visible = true, Thickness = 1, Position = Vector2.new(), Color = Color3.new(0, 0, 0)}),
			Fade = Script.Functions.NewDrawing("Square", {Size = Vector2.new(202, Width + 2), Filled = false, Visible = true, Thickness = 1, Position = Vector2.new(), Color = Color3.new(0, 0, 0)}),
		},
        
		Remove = function(self, Part)
			if Part.Position.x < Part.Size.x then
				for _, v in pairs(self.Drawings) do
					v:Remove()
					v = false
				end
				self.Enabled = false
			end
		end,

		Update = function(self, Number, ListLength, Dt)
            local Pos = self.TargetPos
            local indexOffset = (ListLength - Number) * Gap
                    
            -- Update InSety based on vertical position instead of horizontal
            if InSety < indexOffset then
                InSety = InSety - (InSety - indexOffset) * 0.2
            else
                InSety = indexOffset
            end
        
            local Size = self.Size
            -- Adjust LastPos calculation to move downwards
            local LastPos = Vector2.new(Pos.x, Pos.y + InSety)
            self.Pos = LastPos
            
            local CurrentPos = {
                X = math.ceil(LastPos.x),
                Y = math.ceil(LastPos.y),
                W = math.floor(Size.x - (255 - Alpha) / (255 * 70)),
                H = Size.y,
            }
			
			local Fade = math.min(Time * 12, Alpha)
			Fade = Fade > 255 and 255 or Fade < 0 and 0 or Fade

			if self.Enabled then
				local LineRepeat = 1
				for i, v in pairs(self.Drawings) do
					v.Transparency = Fade / 255
					if type(i) == ("number") then
						v.Position = Vector2.new(CurrentPos.X + 1, CurrentPos.Y + i)
						v.Size = Vector2.new(CurrentPos.W - 2, 1)
					elseif i == ("Image") then
					    v.Position = LastPos + Vector2.new(6, 2)
					elseif i == ("Text") then
						v.Position = LastPos + Vector2.new(25, 2)
					elseif i == ("Outline") then
						v.Position = Vector2.new(CurrentPos.X, CurrentPos.Y)
						v.Size = Vector2.new(CurrentPos.W, CurrentPos.H)
					elseif i == ("Fade") then
						v.Position = Vector2.new(CurrentPos.X - 1, CurrentPos.Y - 1)
						v.Size = Vector2.new(CurrentPos.W + 2, CurrentPos.H + 2)
						local T = (200 - Fade) / 255 / 3
						v.Transparency = T < 0.4 and 0.4 or T
					elseif i:find("line") then
						v.Position = Vector2.new(CurrentPos.X + LineRepeat, CurrentPos.Y + 1)
						LineRepeat = LineRepeat + 1
					end
				end

				Time = Time + EStep * Dt * 128 
				EStep = EStep + EEStep * Dt * 64
			end
		end,

		Fade = function(self, Number, Len, Dt)
			if self.Pos.x > self.TargetPos.x - 0.2 * Len or self.Fading then
				if not self.Fading then
					EStep = 0
				end
				self.Fading = true
				Alpha = Alpha - EStep / 4 * Len * Dt * 50
				EEStep = EEStep + 0.01 * Dt * 100
			end
			
            if Alpha <= 0 then
				self:Remove(self.Drawings[1])
			end
		end,
	}

    for i = 1, Note.Size.y - 2 do
    	local X = 0.28 - i / 80
    	Note.Drawings[i] = Script.Functions.NewDrawing("Square", {Size = Vector2.new(200, 1), Filled = true, Visible = true, Thickness = 1, Position = Vector2.new(), Color = Color3.new(X, X, X)})
    end
    
    local C = CustomColor or Color3.fromRGB(170, 130, 255)
    Note.Drawings.Text = Script.Functions.NewDrawing("Text", {Size = 13,Text = Text , Visible = true, Center = false, Outline = true, Font = 2, Position = Vector2.new(), Color = Color3.new(1, 1, 1)})
    Note.Drawings.Image = Script.Functions.NewDrawing("Image", {Size = Vector2.new(15,15), Visible = true, Position = Vector2.new(), Data = SantoWareLogo})

    if Note.Drawings.Text.TextBounds.x + 7 > Note.Size.x then
    	Note.Size = Vector2.new(Note.Drawings.Text.TextBounds.x + 27, Note.Size.y)
    end
    
    Note.Drawings.line = Script.Functions.NewDrawing("Square", {Size = Vector2.new(1, Note.Size.y - 2), Filled = true, Visible = true, Thickness = 1, Position = Vector2.new(), Color = C})
    Note.Drawings.line1 = Script.Functions.NewDrawing("Square", {Size = Vector2.new(1, Note.Size.y - 2), Filled = true, Visible = true, Thickness = 1, Position = Vector2.new(), Color = C})
    Script.NotifyNote[#Script.NotifyNote + 1] = Note
end

-- // Gets The Closest Part Of The Character To Cursor
Script.Functions.GetClosestBodyPart = function(Char)
    local Distance = math.huge
    local ClosestPart = nil
    local Filterd = {}

    local Parts = Char:GetChildren()
    for _, v in pairs(Parts) do
        if SantoWare.Silent.UseWhitelistedParts and table.find(SantoWare.Silent.WhitelistedPart, v.Name) == nil then continue end
        if v:IsA("MeshPart") and v:IsA("BasePart") and Script.Functions.OnScreen(v) then
            table.insert(Filterd, v)
            for _, v in pairs(Filterd) do                
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(v)
                if Magnitude < Distance then
                    ClosestPart = v
                    Distance = Magnitude
                end
            end
        end
    end
    return ClosestPart
end

-- // Gets An Random Part Of The Character
Script.Functions.GetRandomBodyPart = function(Char)
    local CurrentParts = {}
    local Parts = Char:GetChildren()
    
    for _, v in pairs(Parts) do
        if SantoWare.Silent.UseWhitelistedParts and table.find(SantoWare.Silent.WhitelistedPart, v.Name) == nil then continue end
        if v:IsA("MeshPart") and v:IsA("BasePart") and Script.Functions.OnScreen(v) then
            table.insert(CurrentParts, v)
        end
    end
    
    local Randomize = CurrentParts[math.random(1, #CurrentParts)]
    return Randomize
end

-- // Gets The Closest Point From Cursor
Script.Functions.GetClosestPointOnPart = function(Part)
    local Transform = Part.CFrame:PointToObjectSpace(Mouse.Hit.Position)
    return Part.CFrame * Vector3.new(
        math.clamp(Transform.X, - Part.Size.X % (SantoWare.Silent.ClosestPointScale / 2), Part.Size.X % (SantoWare.Silent.ClosestPointScale / 2)), 
        math.clamp(Transform.Y, - Part.Size.Y % (SantoWare.Silent.ClosestPointScale / 2), Part.Size.Y % (SantoWare.Silent.ClosestPointScale / 2)), 
        math.clamp(Transform.Z, - Part.Size.Z % (SantoWare.Silent.ClosestPointScale / 2), Part.Size.Z % (SantoWare.Silent.ClosestPointScale / 2))
    )
end

-- // Mod Detection Function
Script.Functions.CheckIfMod = function(Plr)
    if SantoWare.ModDetection.Enabled then
        if (game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.CreatorType == "Group" and true or false) == true then
            local GetId = game:GetService("GroupService"):GetGroupInfoAsync(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Creator.CreatorTargetId).Id
            local GroupId = tonumber(GetId)
            
            if Plr:IsInGroup(GroupId) and Plr:GetRankInGroup(GroupId) > SantoWare.ModDetection.Rank then
                if SantoWare.ModDetection.Method == ("Kick") then 
                    task.wait(SantoWare.ModDetection.Delay)
                    Client:Kick("Detected Moderator / Admin: " .. tostring(Plr))
                elseif SantoWare.ModDetection.Method == ("Notification") then
                    Script.Functions.CreateNotification("Detected Moderator / Admin: " .. tostring(Plr), Color3.fromRGB(170, 130, 255))
                end
            end
        end
    end
end

-- // Gets The Closest Player For Cursor (Silent Aim)
Script.Functions.GetClosestPlayer = function(Mode)
    local Target, Closest, HitChance = nil, math.huge, Script.Functions.CalculateChance(SantoWare.Silent.HitChance)
    
    if not HitChance then
        return nil
    end
    if Mode then
        for _, v in pairs(Players:GetPlayers()) do
            if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
                if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then continue end
                if SantoWare.UniversalCheck.WallCheck and not Script.Functions.WallCheck(v.Character.HumanoidRootPart.Position, v.Character) then continue end
                local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)
                if (SantoWare.Silent.ForceLock and Script.Drawing.SilentCircle.Radius + (Distance * 0.3) < Distance) then continue end
                if Distance < Closest then
                    Closest = Distance
                    Target = v
                end
            end
        end
    else
        if SantoWare.Silent.ForceLock_AimAssistTarget and Script.Functions.Alive(AimTarget) then
            Target = AimTarget
        elseif SantoWare.Silent.ForceLock_AimAssistTarget == false then
            Target = ForceLock
        end
    end
    
    if Script.Functions.Alive(Target) then
        local Velocity = Script.Functions.ComPlexVelocity(Target, Target.Character.HumanoidRootPart.Position, false)
        CurrentVelocity = Velocity
    else
        CurrentVelocity = Vector3.zero
    end

    return Target
end

-- // Target Check For Silent Aim Target
Script.Functions.SilentCheck = function(Plr)
    if SantoWare.UniversalCheck.KoCheck and Plr.Character:FindFirstChild("BodyEffects") then
        local KoCheck = false
        if Plr.Character.BodyEffects:FindFirstChild("K.O") then
            KoCheck = Plr.Character.BodyEffects["K.O"].Value
        elseif Plr.Character.BodyEffects:FindFirstChild("KO") then
            KoCheck = Plr.Character.BodyEffects.KO.Value
        end
        local Grabbed = Plr.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
        if KoCheck or Grabbed then 
            return false 
        end
    end
    if SantoWare.UniversalCheck.FriendCheck and table.find(Script.Friends, Plr) then
        return false  
    end
    if SantoWare.UniversalCheck.TargetDeathCheck and Plr.Character:FindFirstChild("Humanoid") and Plr.Character.Humanoid.health < 4 then
        return false 
    end
    if SantoWare.UniversalCheck.ForceFieldCheck and Plr.Character:FindFirstChildOfClass("ForceField") then
        return false
    end
    if SantoWare.UniversalCheck.InVisibleCheck and Plr.Character:FindFirstChild("Head") and Plr.Character.Head.Transparency > 0.5 then
        return false  
    end
    if SantoWare.UniversalCheck.CrewCheck and Script.Functions.FindCrew(Plr) and Plr.DataFolder.Information:FindFirstChild("Crew").Value ~= Client.DataFolder.Information:FindFirstChild("Crew").Value then 
        return false  
    end
    if SantoWare.UniversalCheck.TeamCheck and Client.Team ~= nil and Plr.Team ~= nil and Plr.Team == Client.Team then 
        return false 
    end
    return true
end

-- // Error Detection Function

-- // Cheater Detection Function

-- // Gets The Closest Part From The Target And Checks If AimAssist Is On To Save Fps
Script.Functions.GetClosestPartMethod = function(Plr)
    local ClosestPart, PartClosest, Filterd = nil, math.huge, {}
    
    if SantoWare.Silent.LegitMode then
        if SantoWare.Silent.ClosestPart == false and Plr.Character:FindFirstChild(SantoWare.Silent.Part) then
            return Plr.Character[SantoWare.Silent.Part]
        elseif AimTarget and SantoWare.AimAssist.ClosestPart and Plr.Character:FindFirstChild(SantoWare.AimAssist.Part) then
            return Plr.Character[SantoWare.AimAssist.Part]
        end
        return nil
    end
    
    if Script.Functions.Alive(Plr) then
        if SilentTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            local AirHitChance = Script.Functions.CalculateChance(SantoWare.Silent.AirHitChance)
            if not AirHitChance then
                return nil
            end
            if SantoWare.Silent.UseAirPart and SilentTarget.Character:FindFirstChild(SantoWare.Silent.AirPart) then
                return SilentTarget.Character[SantoWare.Silent.AirPart]
            end
        else
            if SantoWare.Silent.UseAirPart and SilentTarget.Character:FindFirstChild(Script.SavedValue.SilentPart) then
                return SilentTarget.Character[Script.SavedValue.SilentPart]
            end
        end
        
        if SantoWare.Silent.ClosestPart == false and Plr.Character:FindFirstChild(SantoWare.Silent.Part) then
            local PartDistance = Script.Functions.GetMagnitudeFromMouse(Plr.Character[SantoWare.Silent.Part])

            if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > PartDistance) or SantoWare.Silent.ForceLock == true then
                return Plr.Character[SantoWare.Silent.Part]
            end
            return nil
        end
        
        local Parts = Plr.Character:GetChildren()
        for _, v in pairs(Parts) do
            if SantoWare.Silent.UseWhitelistedParts and table.find(SantoWare.Silent.WhitelistedPart, v.Name) == nil then continue end
            if v:IsA("MeshPart") and v:IsA("BasePart") and Script.Functions.OnScreen(v) then
                table.insert(Filterd, v)
                for _, v in pairs(Filterd) do
                    local Mag = Script.Functions.GetMagnitudeFromMouse(v)
                    if (SantoWare.Silent.ForceLock == false and SantoWare.Silent.LegitMode == false and Script.Drawing.SilentCircle.Radius + 4 < Mag) then continue end
                    if Mag < PartClosest then
                        ClosestPart = v
                        PartClosest = Mag
                    end
                end
            end
        end
        
        return ClosestPart
    end
    return nil
end

-- // Gets Closest Player From Mouse For AimAssist
Script.Functions.GetClosestPlayer2 = function()
    local Target, Distance, Closest = nil, nil, math.huge
    
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then continue end
            if SantoWare.UniversalCheck.WallCheck and not Script.Functions.WallCheck(v.Character.HumanoidRootPart.Position, v.Character) then continue end
        	if SantoWare.UniversalCheck.InVisibleCheck and v.Character:FindFirstChild("Head") then
        		if v.Character.Head.Transparency > 0.5 then
        			continue
        		end
        	end
            if SantoWare.UniversalCheck.ForceField and not v.Character:FindFirstChildOfClass("ForceField") then
                continue
            end
        	if SantoWare.UniversalCheck.CrewCheck and Script.Functions.FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value ~= Client.DataFolder.Information:FindFirstChild("Crew").Value then
        		continue
        	end
            if SantoWare.UniversalCheck.TeamCheck and Client.Team ~= nil and v.Team ~= nil and v.Team ~= Client.Team then
                continue
            end
            if SantoWare.UniversalCheck.FriendCheck and table.find(Script.Friends, v) ~= nil then
                continue
            end
            local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)
            if Distance < Closest then
                if (SantoWare.AimAssist.UseCircleRadius and Script.Drawing.AimAssistCircle.Radius + (Distance * 0.3) < Distance) then continue end
                Closest = Distance
                Target = v
            end
        end
    end

    return Target
end

-- // Main Functions For The BeizerManager Functions
Script.BeizerManager.__index = Script.BeizerManager

-- // The Main Function That Makes It Work
Script.BeizerManager.New = function()
    local self = setmetatable({}, Script.BeizerManager)
    
    self.T = 0
    self.T_Threshold = 0.99995
    self.StartPoint = Vector2.new()
    self.EndPoint = Vector2.new()
    self.CurvePoints = {
        Vector2.new(1, 1),
        Vector2.new(1, 1)
    }
    self.Active = false
    self.Smoothness = 0.0025
    self.DrawPath = false
    self.Function = Script.Functions.MouseOffset

    self.Started = false

    return self
end

-- // Changes Current self Propertiesself.T 
Script.BeizerManager.ChangeData = function(self, Data)
    self.StartPoint = (self.GetStartPoint() or Data.StartPoint)
    self.EndPoint = self.ModifyEndPoint(Data.TargetPosition)
    self.Smoothness = Data.Smoothness or self.Smoothness
    self.CurvePoints = Data.CurvePoints or self.CurvePoints
    self.DrawPath = Data.DrawPath or self.DrawPath

    self.T = 0
    self.Active = true
end

-- // Calculates Every Points For More Accuracy
Script.BeizerManager.CubicCurve = function(T, StartPoint, EndPoint, ControlPointA, ControlPointB)
    local T1 = (1 - T)

    local A = T1^3 * StartPoint
    local B = 3 * T1^2 * T * ControlPointA
    local C = 3 * T1 * T^2 * ControlPointB
    local D = T^3 * EndPoint
    
    return A + B + C + D
end

-- // Controls And Calculates StartPoint And Other Stuff
Script.BeizerManager.DoControlPoint = function(StartPoint, EndPoint, ControlPointA, ControlPointB)
    local Change = (EndPoint - StartPoint)

    local A = StartPoint + (Change * ControlPointA)
    local B = StartPoint + (Change * ControlPointB)
    return A, B
end

-- // Draws Circle Where The CurvePosition And The Client Position
Script.BeizerManager.DrawPathFunc = function(CurvePosition, A, B)
    local Path = Script.Functions.NewDrawing("Circle", {Color = Color3.fromRGB(255, 150, 150), Radius = 2, Visible = true, Position = CurvePosition,})
    task.delay(1, function()
        Path:Remove()
    end)

    local ControlPointA = Script.Functions.NewDrawing("Circle", {Color = Color3.fromRGB(255, 150, 255), Radius = 5, Visible = true, Position = A,})
    task.delay(1, function()
        ControlPointA:Remove()
    end)

    local ControlPointB = Script.Functions.NewDrawing("Circle", {Color = Color3.fromRGB(255, 150, 255), Radius = 5, Visible = true, Position = B,})
    task.delay(1, function()
        ControlPointB:Remove()
    end)
end

-- // Changes The self For The Curving To Happend
Script.BeizerManager.DoIteration = function(self)
    if (self.Active == false) then
        return
    end
    local BeizerCurve = self.CubicCurve
    local T = self.T
    while (T <= 1 and self.Active) do RS.RenderStepped:Wait()
        T = T + self.Smoothness
        if (T >= self.T_Threshold) then
            local clampedT = math.clamp(T, 0, 1)
            local New = self.StartPoint:Lerp(self.EndPoint, clampedT)

            self:Function(New.X, New.Y)
        else
            local A, B = self.DoControlPoint(self.StartPoint, self.EndPoint, unpack(self.CurvePoints))
            local CurvePosition = BeizerCurve(T, self.StartPoint, self.EndPoint, A, B)
                
            if (self.DrawPath) then
                Script.BeizerManager.DrawPathFunc(CurvePosition, A, B)
            end
            self:Function(CurvePosition.X, CurvePosition.Y)
        end
    end
    self.Active = false
end

-- // Modifies The EndPoint Just For Double Checks
Script.BeizerManager.ModifyEndPoint = function(EndPoint)
    return EndPoint
end

-- // Starts The Motion
Script.BeizerManager.Start = function(self)
    self.Started = true

    local Thread = coroutine.resume(coroutine.create(function()
        while (self.Started) do RS.RenderStepped:Wait()
            self:DoIteration()
        end
    end))

    return Thread
end

-- // Stops The Motion
Script.BeizerManager.Stop = function(self)
    self.Started = false
end

-- // Stops The Current Motion
Script.BeizerManager.StopCurrent = function(self)
    self.Active = false
    self.T = 0
end

-- // Gets Camera Instead Of Mouse
Script.BeizerManager.CameraMode = function(self)
    self.GetStartPoint = function()
        local Pitch, Yaw, _ = Camera.CFrame:ToEulerAnglesYXZ()
        local StartPoint = Vector2.new(Pitch, Yaw)
        return StartPoint
    end

    self.ModifyEndPoint = function(EndPoint)
        local LookAtEndPoint = CFrame.lookAt(Camera.CFrame.Position, EndPoint)
        local Pitch, Yaw, _ = LookAtEndPoint:ToEulerAnglesYXZ()
        EndPoint = Vector2.new(Pitch, Yaw)
        return EndPoint
    end

    self.Function = function(self, Pitch, Yaw)
        local RotationMatrix = CFrame.fromEulerAnglesYXZ(Pitch, Yaw, 0)
        Camera.CFrame = CFrame.new(Camera.CFrame.Position) * RotationMatrix
    end

    self.DrawPathFunc = function()
        -- // Working On It
    end
end

-- // Gets Mouse Position ServerSided
Script.BeizerManager.GetStartPoint = function()
    return Uis:GetMouseLocation()
end

-- // Gets Mouse Instead Of Camera
Script.BeizerManager.MouseMode = function(self)
    self.GetStartPoint = Script.BeizerManager.GetStartPoint
    self.ModifyEndPoint = Script.BeizerManager.ModifyEndPoint
    self.Function = Script.Functions.MouseOffset
    self.DrawPathFunc = Script.BeizerManager.DrawPathFunc
end

-- // Start BeizerCurve
local ManagerA = Script.BeizerManager.New()
local ManagerB = Script.BeizerManager.New()
Script.BeizerCurve.ManagerA = ManagerA
Script.BeizerCurve.ManagerB = ManagerB

Script.BeizerCurve.AimTo = function(...)
    ManagerA:ChangeData(...)
end

Script.BeizerCurve.AimToB = function(...)
    ManagerB:ChangeData(...)
end

ManagerB:CameraMode()

ManagerB.Function = function(self, Pitch, Yaw)
    local RotationMatrix = CFrame.fromEulerAnglesYXZ(Pitch, Yaw, 0)
    Utilities.SetCameraCFrame(CFrame.new(Camera.CFrame.Position) * RotationMatrix)
end

ManagerA:Start()
ManagerB:Start()

-- // Silent Get Part Position
Script.Functions.GetPartPosition = function(Plr)
    local TargetCF = nil
    local TargetFalling = false
    local SilentPos = nil
    
    if SantoWare.Silent.ClosestPoint then
        TargetCF = ClosestPointCF
    else
        if Plr.Character:FindFirstChild(SantoWare.Silent.Part) then
            TargetCF = Plr.Character[SantoWare.Silent.Part].Position
        end
    end

    if SantoWare.Silent.AntiGroundShots and CurrentVelocity.Y < SantoWare.Silent.AntiGroundActivation then
        TargetFalling = true
    end
    if TargetCF and CurrentVelocity then
        SilentPos = TargetCF
        if SantoWare.Silent.PredictMovement then 
            if SantoWare.Silent.BlatantMode then
                local Enabled = true
                local Mag = (Plr.Character.Humanoid.MoveDirection).Magnitude
                local SilentVel = Plr.Character.HumanoidRootPart.Velocity
                if (SilentVel).Magnitude > 100 then
                    Enabled = false
                elseif SilentVel.Y > 50 then
                    Enabled = false
                elseif SilentVel.Y < -35 then
                    Enabled = false
                elseif SilentVel.Y > 75 then
                    Enabled = false
                elseif (SilentVel).Magnitude < 1 and Mag > 0.01 then
                    Enabled = false
                elseif (SilentVel).Magnitude > 5 and Mag < 0.01 then
                    Enabled = false
                end
                if Enabled and SantoWare.UniversalCheck.WallCheck_V2 and not Script.Functions.WallCheck(Plr.Character.HumanoidRootPart.Position + (SilentTarget.Character.HumanoidRootPart.Velocity * SantoWare.Silent.Prediction), Plr.Character) then
                    return
                end
                if Enabled then
                    if TargetFalling then
                        SilentPos = SilentPos + (Vector3.new(SilentVel.X, (SilentVel.Y * SantoWare.Silent.AntiGroundValue), SilentVel.Z) * SantoWare.Silent.Prediction)
                    else
                        SilentPos = SilentPos + (SilentVel * SantoWare.Silent.Prediction)
                    end
                else
                    if TargetFalling then
                        SilentPos = SilentPos + (Vector3.new(CurrentVelocity.X, (CurrentVelocity.Y * SantoWare.Silent.AntiGroundValue), CurrentVelocity.Z) * SantoWare.Silent.Prediction)
                    else
                        SilentPos = SilentPos + (CurrentVelocity * SantoWare.Silent.Prediction)
                    end
                end
            else
                if TargetFalling then
                    SilentPos = SilentPos + (Vector3.new(CurrentVelocity.X, (CurrentVelocity.Y * SantoWare.Silent.AntiGroundValue), CurrentVelocity.Z) * SantoWare.Silent.Prediction)
                else
                    SilentPos = SilentPos + (CurrentVelocity * SantoWare.Silent.Prediction)
                end
            end
        end
        if SantoWare.Silent.Humanize then
            local HumanizeValue = SantoWare.Silent.HumanizeValue 
            SilentPos = (SilentPos + Script.Functions.RandomVec3(HumanizeValue, 0.01))
        end
    end
    if SilentPos then
        if SantoWare.Silent.LegitMode then
            local PartPos = Camera:WorldToScreenPoint(SilentPos)
            local GetScreenPos = Script.Functions.GetFovPosition()
            local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - GetScreenPos).Magnitude

            if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > Magnitude) or SantoWare.Silent.ForceLock == true then
                return SilentPos
            end
        else
            return SilentPos
        end
    end
    return nil
end

local MousePosChanger2 = nil 
MousePosChanger2 = hookmetamethod(game, "__index", function(self, Index)
    if not checkcaller() and SantoWare.Silent.Enabled and SantoWare.Silent.AntiAimViewer == false and self == Mouse and Script.Functions.Alive(SilentTarget) then
        if Index == ("Hit") then
            local EndPoint = Script.Functions.GetPartPosition(SilentTarget)
            if EndPoint then
                return EndPoint
            end
        elseif Index == ("Target") and SilentTarget.Character:FindFirstChild(SantoWare.Silent.Part) then 
            return SilentTarget.Character[SantoWare.Silent.Part]
        end
    end
    return MousePosChanger2(self, Index)
end)

-- // The AimAssist Mouse Dragging/Check Functions
Script.Functions.MouseChanger = function()
    if SantoWare.AimAssist.Enabled and not Uis:GetFocusedTextBox() and Script.Functions.Alive(AimTarget) and Script.Functions.Alive(Client) and AimTarget.Character:FindFirstChild(SantoWare.AimAssist.Part) then
        local EndPosition = nil
        local TargetPos = AimTarget.Character[SantoWare.AimAssist.Part].Position

        if SantoWare.AimAssist.ThirdPerson and SantoWare.AimAssist.FirstPerson == false then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude < 1 then
                return
            end
        elseif SantoWare.AimAssist.ThirdPerson == false and SantoWare.AimAssist.FirstPerson then
            if (Camera.Focus.p - Camera.CoordinateFrame.p).Magnitude > 1 then
                return
            end
        end
        CurrentVelocity2 = Script.Functions.ComPlexVelocity(AimTarget, AimTarget.Character.HumanoidRootPart.Position, true)
        if CurrentVelocity2 == nil then return end
        if SantoWare.AimAssist.EnableChance then
            local Chance = Script.Functions.CalculateChance(SantoWare.AimAssist.Chance)
            if not Chance then
                return
            end
        end
        if SantoWare.UniversalCheck.ToolOut and not Client.Character:FindFirstChildWhichIsA("Tool") then
            return
        end
        if SantoWare.UniversalCheck.ForceFieldCheck and AimTarget.Character:FindFirstChildOfClass("ForceField") then
            AimTarget = nil
            CurrentVelocity2 = Vector3.zero
            return
        end
        if SantoWare.AimAssist.RandomPart or SantoWare.AimAssist.ClosestPart then
            if Script.Functions.OnScreen(AimTarget.Character.HumanoidRootPart) then
                if SantoWare.AimAssist.RandomPart then
                    local RandomizedPart = Script.Functions.GetRandomBodyPart(AimTarget.Character)
                    if RandomizedPart ~= nil then
                        SantoWare.AimAssist.Part = tostring(RandomizedPart)
                    end
                elseif SantoWare.AimAssist.ClosestPart then
                    local ClosestPart = Script.Functions.GetClosestBodyPart(AimTarget.Character)
                    SantoWare.AimAssist.Part = tostring(ClosestPart)
                end
            else
                if SantoWare.AimAssist.Method == ("Mouse") then
                    return
                end
            end
        end
        if SantoWare.UniversalCheck.ReloadCheck then
            for _, v in pairs(Client.Character.Humanoid.Animator:GetPlayingAnimationTracks()) do
                if tostring(v) == ("Animation") then
                    return
                end
            end
        end
        if SantoWare.UniversalCheck.NoAmmoCheck and Client.Character:FindFirstChildWhichIsA("Tool") and Client.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo") then
            if Client.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Ammo").Value <= 0 then
                return
            end
        end
        if SantoWare.AimAssist.Advanced.WallCheck_V2 and not Script.Functions.WallCheck(AimTarget.Character.HumanoidRootPart.Position, AimTarget.Character) then 
            return
        end
        if SantoWare.AimAssist.DisableOutSideCircle then
            local Magnitude = Script.Functions.GetMagnitudeFromMouse(AimTarget.Character.HumanoidRootPart)
            if (Script.Drawing.AimAssistCircle.Radius + 4) < Magnitude then
                return
            end
        end
        if SantoWare.UniversalCheck.PlayerDeathCheck then
            if Client.Character.Humanoid.health < 4 then
                AimTarget = nil
                CurrentVelocity2 = Vector3.zero
                return
            end
        end
        if SantoWare.UniversalCheck.KoCheck and AimTarget.Character:FindFirstChild("BodyEffects") then 
            local Grabbed = AimTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            local KoCheck = true
            if AimTarget.Character.BodyEffects:FindFirstChild("K.O") then
                KoCheck = AimTarget.Character.BodyEffects["K.O"].Value
            elseif AimTarget.Character.BodyEffects:FindFirstChild("KO") then
                KoCheck = AimTarget.Character.BodyEffects.KO.Value
            end
            if KoCheck or Grabbed then
                AimTarget = nil
                CurrentVelocity2 = Vector3.zero
                return
            end
        end
        if SantoWare.UniversalCheck.TargetDeathCheck then
            if AimTarget.Character.Humanoid.health < 4 then
                AimTarget = nil
                CurrentVelocity2 = Vector3.zero
                return
            end
        end
        if SantoWare.AimAssist.Shake.AirShake or SantoWare.AimAssist.AirSmoothness then
            if AimTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                if SantoWare.AimAssist.AirSmoothness then
                    SantoWare.AimAssist.Smoothness_X = SantoWare.AimAssist.AirSmoothness_X
                    SantoWare.AimAssist.Smoothness_X = SantoWare.AimAssist.AirSmoothness_Y
                end
                if SantoWare.AimAssist.Shake.AirShake then
                    if SantoWare.AimAssist.Shake.Shake_X == Script.SavedValue.ShakeX then
                        SantoWare.AimAssist.Shake.Shake_X = SantoWare.AimAssist.Shake.Shake_X * (SantoWare.AimAssist.Shake.AirPercentage / 100)
                    end
                    if SantoWare.AimAssist.Shake.Shake_Y == Script.SavedValue.ShakeY then
                        SantoWare.AimAssist.Shake.Shake_Y = SantoWare.AimAssist.Shake.Shake_Y * (SantoWare.AimAssist.Shake.AirPercentage / 100)
                    end
                    if SantoWare.AimAssist.Shake.Shake_Z == Script.SavedValue.ShakeZ then
                        SantoWare.AimAssist.Shake.Shake_Z = SantoWare.AimAssist.Shake.Shake_Z * (SantoWare.AimAssist.Shake.AirPercentage / 100)
                    end
                end
            else
                if SantoWare.AimAssist.AirSmoothness then
                    if SantoWare.AimAssist.Smoothness_X ~= Script.SavedValue.AimAssistSmoothX then
                        SantoWare.AimAssist.Smoothness_X = Script.SavedValue.AimAssistSmoothX
                    end
                    if SantoWare.AimAssist.Smoothness_Y ~= Script.SavedValue.AimAssistSmoothY then
                        SantoWare.AimAssist.Smoothness_Y = Script.SavedValue.AimAssistSmoothY
                    end
                end
                if SantoWare.AimAssist.Shake.AirShake then
                    if SantoWare.AimAssist.Shake.Shake_X ~= Script.SavedValue.ShakeX then
                        SantoWare.AimAssist.Shake.Shake_X = Script.SavedValue.ShakeX
                    end
                    if SantoWare.AimAssist.Shake.Shake_Y ~= Script.SavedValue.ShakeY then
                        SantoWare.AimAssist.Shake.Shake_Y = Script.SavedValue.ShakeY
                    end
                    if SantoWare.AimAssist.Shake.Shake_Z ~= Script.SavedValue.ShakeZ then
                        SantoWare.AimAssist.Shake.Shake_Z = Script.SavedValue.ShakeZ
                    end
                end
            end
        end
        
        if FrameSkip and SantoWare.AimAssist.FrameSkip.TargetPart.Enabled and AimTarget.Character:FindFirstChild(SantoWare.AimAssist.FrameSkip.TargetPart.Part) then
            if SantoWare.AimAssist.FrameSkip.UsePrediction then
                EndPosition = AimTarget.Character[SantoWare.AimAssist.FrameSkip.TargetPart.Part].Position + (CurrentVelocity2 * SantoWare.AimAssist.Prediction)
            else
                EndPosition = AimTarget.Character[SantoWare.AimAssist.FrameSkip.TargetPart.Part].Position
            end
        elseif FrameSkip then
            if SantoWare.AimAssist.FrameSkip.UsePrediction then
                EndPosition = TargetPos + (CurrentVelocity2 * SantoWare.AimAssist.Prediction)
            else
                EndPosition = TargetPos
            end
        elseif SantoWare.AimAssist.PredictMovement then
            EndPosition = TargetPos + (CurrentVelocity2 * SantoWare.AimAssist.Prediction)
        else
            EndPosition = TargetPos
        end

        if (EndPosition and (tick() - LastStutter) >= (SantoWare.AimAssist.Advanced.Stutter / 1000)) then
            LastStutter = tick()
            if SantoWare.AimAssist.Shake.Enabled and FrameSkip == false then
                local Mag = math.ceil((EndPosition - Client.Character.HumanoidRootPart.Position).Magnitude)
                EndPosition = EndPosition + (Vector3.new(
                    math.random(-Mag * SantoWare.AimAssist.Shake.Shake_X, Mag * SantoWare.AimAssist.Shake.Shake_X), 
                    math.random(-Mag * SantoWare.AimAssist.Shake.Shake_Y, Mag * SantoWare.AimAssist.Shake.Shake_Y), 
                    math.random(-Mag * SantoWare.AimAssist.Shake.Shake_Z, Mag * SantoWare.AimAssist.Shake.Shake_Z)) / 1000
                )
            end
            if SantoWare.AimAssist.Method == ("Mouse") then
                local Vec2Pos = Camera:WorldToScreenPoint(EndPosition)
                local InCrementX = (Vec2Pos.X - SantoWare.Silent.Fov.Offset.X) * (SantoWare.AimAssist.UseSmoothness and SantoWare.AimAssist.Smoothness_X or 1)
                local InCrementY = (Vec2Pos.Y - SantoWare.Silent.Fov.Offset.Y) * (SantoWare.AimAssist.UseSmoothness and SantoWare.AimAssist.Smoothness_Y or 1)
                if FrameSkip then
                    FrameSkip = false
                    InCrementX = ((Vec2Pos.X - SantoWare.Silent.Fov.Offset.X) - Mouse.X) * SantoWare.AimAssist.FrameSkip.Power
                    InCrementY = ((Vec2Pos.Y - SantoWare.Silent.Fov.Offset.Y) - Mouse.Y) * SantoWare.AimAssist.FrameSkip.Power
                end
                mousemoverel(InCrementX, InCrementY)
            elseif SantoWare.AimAssist.Method == ("Camera") then
                local Vec3Pos = CFrame.new(Camera.CFrame.p, EndPosition)
                if FrameSkip then
                    FrameSkip = false
                    Camera.CFrame = Camera.CFrame:Lerp(Vec3Pos, SantoWare.AimAssist.FrameSkip.Power, SantoWare.AimAssist.Advanced.EasingStyle, SantoWare.AimAssist.Advanced.EasingDirection)
                    return
                end
                Camera.CFrame = Camera.CFrame:Lerp(Vec3Pos, (SantoWare.AimAssist.UseSmoothness and SantoWare.AimAssist.Smoothness_X or 1), SantoWare.AimAssist.Advanced.EasingStyle, SantoWare.AimAssist.Advanced.EasingDirection)
            end
        end
    end
end

-- // Silent Features That Needs To Be Looping
Script.Functions.SilentMisc = function()
    if SantoWare.Silent.PingPrediction.Enabled and SantoWare.Silent.PredictMovement and SantoWare.Silent.GunSettings.Methods.Prediction == false and game:GetService("Stats") and game:GetService("Stats"):FindFirstChild("Network") and game:GetService("Stats").Network:FindFirstChild("ServerStatsItem") and game:GetService("Stats").Network.ServerStatsItem:FindFirstChild("Data Ping") then
        local Ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        if SantoWare.Silent.PingPrediction.AutoMatic == false then
            if Ping > 200 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P200_Inf
            elseif Ping > 190 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P190_200
            elseif Ping > 180 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P180_190
            elseif Ping > 170 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P170_180
            elseif Ping > 160 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P160_170
            elseif Ping > 150 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P150_160
            elseif Ping > 140 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P140_150
            elseif Ping > 130 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P130_140
            elseif Ping > 120 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P120_130
            elseif Ping > 110 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P110_120
            elseif Ping > 100 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P100_110
            elseif Ping > 90 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P90_100
            elseif Ping > 80 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P80_90
            elseif Ping > 70 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P70_80
            elseif Ping > 60 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P60_70
            elseif Ping > 50 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P50_60
            elseif Ping > 40 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P40_50
            elseif Ping > 30 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P30_40
            elseif Ping > 20 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P20_30
            elseif Ping > 10 then
                SantoWare.Silent.Prediction = SantoWare.Silent.PingPrediction.P10_20
            end
        end
    end
end

-- // Gets Silent Target And Velocity
Script.Functions.GetSilentTarget = function()
    local Target = Script.Functions.GetClosestPlayer(not SantoWare.Silent.ForceLock)

    if SantoWare.Silent.AntiAimViewer == false and Script.Functions.Alive(Target) and Script.Functions.SilentCheck(Target) then 
        SilentTarget = Target
        local GetPart = Script.Functions.GetClosestPartMethod(Target)
        if GetPart ~= nil then
            SantoWare.Silent.Part = tostring(GetPart)
            Script.SavedValue.SilentPart = tostring(GetPart)
            if SantoWare.Silent.ClosestPoint then
                ClosestPointCF = Script.Functions.GetClosestPointOnPart(GetPart)
            end
        else
            SilentTarget = nil
        end
    else
        SilentTarget = Target
    end
end

-- // Desync Main Function. Velocity Change
Script.Functions.Desync = function()
    if Desync and Script.Functions.Alive(Client) and Client.Character.Humanoid.health > SantoWare.Desync.HealthDeActivation then
        if SantoWare.Desync.Method == ("Freeze_Pos") and sethiddenproperty then
            FreezePos = not FreezePos
            sethiddenproperty(Client.Character.HumanoidRootPart, "NetworkIsSleeping", FreezePos)
        elseif SantoWare.Desync.Method == ("Slow_Data") and setfflag then
            setfflag("S2PhysicsSenderRate", 3)
        else
            local SaveVelocity = Client.Character.HumanoidRootPart.AssemblyLinearVelocity
            local SaveRotVelocity = Client.Character.HumanoidRootPart.AssemblyAngularVelocity
            if SantoWare.Desync.Method == ("Vel_StandBy") then
                Client.Character.HumanoidRootPart.Velocity = Vector3.new(1,1,1) * (2^16)
                Client.Character.HumanoidRootPart.RotVelocity = Vector3.new(1,1,1) * (2^16)
            elseif SantoWare.Desync.Method == ("Vel_Multi") then
                Client.Character.HumanoidRootPart.Velocity = Client.Character.HumanoidRootPart.Velocity * SantoWare.Desync.Power
            elseif SantoWare.Desync.Method == ("Custom_Vel") then
                Client.Character.HumanoidRootPart.Velocity = Vector3.new(SantoWare.Desync.Custom.Vel_X, SantoWare.Desync.Custom.Vel_Y, SantoWare.Desync.Custom.Vel_Z)
            elseif SantoWare.Desync.Method == ("Vel_Under") then
                Client.Character.HumanoidRootPart.Velocity = Vector3.new(0, -SantoWare.Desync.Power, 0)
            elseif SantoWare.Desync.Method == ("Vel_Over") then
                Client.Character.HumanoidRootPart.Velocity = Vector3.new(0, SantoWare.Desync.Power, 0)
            elseif SantoWare.Desync.Method == ("Vel_Zero") then
                Client.Character.HumanoidRootPart.Velocity = Vector3.zero
            end
            
            if SantoWare.Desync.Visualize.Enabled then
                local GetMag = (Camera.CoordinateFrame.p - (Client.Character.HumanoidRootPart.Position + (Client.Character.HumanoidRootPart.Velocity * 0.13))).Magnitude
                local GetPos, OnScreen = Camera:WorldToScreenPoint(Client.Character.HumanoidRootPart.Position + (Client.Character.HumanoidRootPart.Velocity * 0.13))
                if OnScreen then
                    Script.Drawing.DesyncCircle.Visible = true
                    Script.Drawing.DesyncCircle.Color = SantoWare.Desync.Visualize.Color
                    Script.Drawing.DesyncCircle.Radius = (SantoWare.Desync.Visualize.Radius * 10) / GetMag
                    Script.Drawing.DesyncCircle.Position = Vector2.new(GetPos.X, GetPos.Y)
                else
                    Script.Drawing.DesyncCircle.Visible = false
                end
            else
                Script.Drawing.DesyncCircle.Visible = false
            end
            
            RS.RenderStepped:Wait()
            
            Client.Character.HumanoidRootPart.AssemblyLinearVelocity = SaveVelocity
            Client.Character.HumanoidRootPart.AssemblyAngularVelocity = SaveRotVelocity
        end
    else
        if SantoWare.Desync.Visualize.Enabled then
            Script.Drawing.DesyncCircle.Visible = false
        end
    end
end

-- // Cheater Detection Function. Not Giving Away

-- // Update Properties Of Circle
Script.Functions.UpdateFOV = function()
    local GetScreenPos = Script.Functions.GetFovPosition()
    Script.Drawing.AimAssistCircle.Visible = SantoWare.AimAssist.Fov.Visible
    Script.Drawing.AimAssistCircle.Filled = SantoWare.AimAssist.Fov.Filled
    Script.Drawing.AimAssistCircle.Color = SantoWare.AimAssist.Fov.Color
    Script.Drawing.AimAssistCircle.Transparency = SantoWare.AimAssist.Fov.Transparency
    if SantoWare.Silent.Fov.Method == ("Screen") then
        Script.Drawing.AimAssistCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y) - SantoWare.Silent.Fov.Offset
    else
        Script.Drawing.AimAssistCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y + GuiS:GetGuiInset().Y) - SantoWare.Silent.Fov.Offset
    end

	Script.Drawing.AimAssistCircle.Radius = SantoWare.AimAssist.Fov.Radius * 3
    
    Script.Drawing.SilentCircle.Visible = SantoWare.Silent.Fov.Visible
    Script.Drawing.SilentCircle.Color = SantoWare.Silent.Fov.Color
    Script.Drawing.SilentCircle.Filled = SantoWare.Silent.Fov.Filled
    Script.Drawing.SilentCircle.Transparency = SantoWare.Silent.Fov.Transparency
    if SantoWare.Silent.Fov.StickyFov and Script.Functions.Alive(SilentTarget) and SilentTarget.Character:FindFirstChild(SantoWare.Silent.Part) then
        local PartPos, OnScreen = Camera:WorldToViewportPoint(SilentTarget.Character[SantoWare.Silent.Part].Position)
        if OnScreen then
            local Magnitude = ((Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(GetScreenPos.X, GetScreenPos.Y + GuiS:GetGuiInset().Y)) - SantoWare.Silent.Fov.Offset).Magnitude

            if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > Magnitude) or SantoWare.Silent.ForceLock == true then
                Script.Drawing.SilentCircle.Position = Vector2.new(PartPos.X, PartPos.Y) - SantoWare.Silent.Fov.Offset
            else
                if SantoWare.Silent.Fov.Method == ("Screen") then
                    Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y) - SantoWare.Silent.Fov.Offset
                else
                    Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y + GuiS:GetGuiInset().Y) - SantoWare.Silent.Fov.Offset
                end
            end
        else
            if SantoWare.Silent.Fov.Method == ("Screen") then
                Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y) - SantoWare.Silent.Fov.Offset
            else
                Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y + GuiS:GetGuiInset().Y) - SantoWare.Silent.Fov.Offset
            end
        end
    else
        if SantoWare.Silent.Fov.Method == ("Screen") then
            Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y) - SantoWare.Silent.Fov.Offset
        else
            Script.Drawing.SilentCircle.Position = Vector2.new(GetScreenPos.X, GetScreenPos.Y + GuiS:GetGuiInset().Y) - SantoWare.Silent.Fov.Offset
        end
    end
	Script.Drawing.SilentCircle.Radius = SilentFovRadius.Value * 3
end

-- // Updates Esp Posistions
Script.Functions.UpdateEsp = function()
    for i, v in pairs(Script.EspPlayers) do
        if SantoWare.Esp.Enabled and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
            local Hum = i.Character.Humanoid
            local Hrp = i.Character.HumanoidRootPart
            
            local Vector, OnScreen = Camera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
            local Size = (Camera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1
            
            if OnScreen then
                if SantoWare.Esp.Name.Enabled then
                    v.Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.Name.Outline = SantoWare.Esp.Name.OutLine
                    v.Name.Text = Hum.DisplayName
                    v.Name.Color = SantoWare.Esp.Name.Color
                    v.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Name.Font = 0
                    v.Name.Size = SantoWare.Esp.TextSize

                    v.Name.Visible = true
                else
                    v.Name.Visible = false
                end

                if SantoWare.Esp.Distance.Enabled and Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
                    v.Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.Distance.Outline = SantoWare.Esp.Distance.OutLine
                    v.Distance.Text = "[" .. math.floor((Hrp.Position - Client.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                    v.Distance.Color = SantoWare.Esp.Distance.Color
                    v.Distance.OutlineColor = Color3.fromRGB(0, 0, 0)

                    v.Distance.Font = 0
                    v.Distance.Size = SantoWare.Esp.TextSize

                    v.Distance.Visible = true
                else
                    v.Distance.Visible = false
                end

                if SantoWare.Esp.Tool.Enabled then
                    if SantoWare.Esp.Distance.Enabled then
                        v.Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset + 13)
                    else
                        v.Tool.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    end
                    v.Tool.Outline = SantoWare.Esp.Tool.OutLine
                    if i.Character:FindFirstChildWhichIsA("Tool") then
                        if i.Character:FindFirstChild("GunScript", true) ~= nil or i.Character:FindFirstChild("FlameThrowerScript", true) ~= nil or i.Character:FindFirstChild("RPGScript", true) ~= nil then
                            v.Tool.Text = i.Character:FindFirstChildWhichIsA("Tool").Name
                        else
                            v.Tool.Text = "[" .. i.Character:FindFirstChildWhichIsA("Tool").Name .. "]"
                        end
                    else
                        v.Tool.Text = "[None]"
                    end
                    v.Tool.Color = SantoWare.Esp.Tool.Color
                    v.Tool.OutlineColor = Color3.fromRGB(0, 0, 0)
                    
                    v.Tool.Font = 0
                    v.Tool.Size = SantoWare.Esp.TextSize

                    v.Tool.Visible = true
                else
                    v.Tool.Visible = false
                end

                if SantoWare.Esp.Box.Enabled then
                    v.BoxOutline.Size = BoxSize
                    v.BoxOutline.Position = BoxPos
                    v.BoxOutline.Visible = SantoWare.Esp.Box.OutLine
                    v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
                    
                    v.Box.Size = BoxSize
                    v.Box.Position = BoxPos
                    if SantoWare.Esp.TargetColor.Enabled and SilentTarget ~= nil and i == SilentTarget then
                        v.Box.Color = SantoWare.Esp.TargetColor.Color
                    elseif SantoWare.Esp.CrewColor.Enabled and Script.Functions.FindCrew(i) and i.DataFolder.Information:FindFirstChild("Crew").Value == Client.DataFolder.Information:FindFirstChild("Crew").Value then
                        v.Box.Color = SantoWare.Esp.CrewColor.Color
                    else
                        v.Box.Color = SantoWare.Esp.Box.Color
                    end
                    v.Box.Visible = true
                else
                    v.BoxOutline.Visible = false
                    v.Box.Visible = false
                end

                if SantoWare.Esp.HealthBar.Enabled then
                    if SantoWare.Esp.HealthBar.HealthColor then
                        local Health = i.Character.Humanoid.Health / i.Character.Humanoid.MaxHealth
                        v.HealthBar.Color = Color3.fromHSV(Health * 0.3, 1, 1) 
                    else
                        v.HealthBar.Color = SantoWare.Esp.HealthBar.Color
                    end

                    v.HealthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.HealthBar.To = Vector2.new(v.HealthBar.From.X, v.HealthBar.From.Y - (Hum.Health / Hum.MaxHealth) * BoxSize.Y)
                    v.HealthBar.Visible = true

                    v.HealthBarOutline.From = Vector2.new(v.HealthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.HealthBarOutline.To = Vector2.new(v.HealthBar.From.X, (v.HealthBar.From.Y - 1 * BoxSize.Y) - 1)
                    v.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
                    v.HealthBarOutline.Visible = SantoWare.Esp.HealthBar.OutLine
                else
                    v.HealthBarOutline.Visible = false
                    v.HealthBar.Visible = false
                end

                if SantoWare.Esp.HealthText.Enabled then
                    local Offset = 22
                    if SantoWare.Esp.ArmorBar.Enabled == false then
                        Offset = Offset - 7
                    end
                    if SantoWare.Esp.HealthBar.Enabled == false then
                        Offset = Offset - 7
                    end

                    if SantoWare.Esp.HealthText.HealthColor then
                        local Health = i.Character.Humanoid.Health / i.Character.Humanoid.MaxHealth
                        v.HealthText.Color = Color3.fromHSV(Health * 0.3, 1, 1) 
                    else
                        v.HealthText.Color = SantoWare.Esp.HealthText.Color
                    end
                    
                    v.HealthText.Text = tostring(math.floor((Hum.Health / Hum.MaxHealth) * 100 + 0.5))
                    v.HealthText.Position = Vector2.new((BoxPos.X - Offset), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) - 1)
                    v.HealthText.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.HealthText.Outline = SantoWare.Esp.HealthText.OutLine

                    v.HealthText.Font = 0
                    v.HealthText.Size = SantoWare.Esp.TextSize

                    v.HealthText.Visible = true
                else
                    v.HealthText.Visible = false
                end

                if SantoWare.Esp.Flags.Enabled then
                    local Offset = 10
                    if SantoWare.Esp.ArmorBar.Enabled == false then
                        Offset = Offset - 7
                    end
                    if SantoWare.Esp.HealthBar.Enabled == false then
                        Offset = Offset - 7
                    end
                    if i.Character.HumanoidRootPart.Velocity.Magnitude > 120 and SantoWare.Esp.Flags.DesyncState then
                        v.Flag.Text = "Desyncing"
                    elseif i.Character.HumanoidRootPart.Velocity.Y > 2 and SantoWare.Esp.Flags.WalkingState then
                        v.Flag.Text = "Jumping"
                    elseif i.Character.HumanoidRootPart.Velocity.Y < -2 and SantoWare.Esp.Flags.WalkingState then
                        v.Flag.Text = "Falling"
                    elseif i.Character.HumanoidRootPart.Velocity.Magnitude > 2 and SantoWare.Esp.Flags.WalkingState then
                        v.Flag.Text = "Walking"
                    elseif i.Character.HumanoidRootPart.Velocity.Magnitude < 1 and SantoWare.Esp.Flags.WalkingState then
                        v.Flag.Text = "Standing"
                    end
                    v.Flag.Position = Vector2.new((BoxPos.X - Offset) - (string.len(v.Flag.Text) * 3), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) + 22)
                    v.Flag.Color = SantoWare.Esp.Flags.Color
                    v.Flag.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Flag.Outline = SantoWare.Esp.Flags.OutLine

                    v.Flag.Font = 0
                    v.Flag.Size = SantoWare.Esp.TextSize

                    v.Flag.Visible = true
                else
                    v.Flag.Visible = false
                end

                if SantoWare.Esp.Tracer.Enabled then
                    if SantoWare.Esp.Tracer.Method == ("Screen") then
                        v.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                    else
                        v.Tracer.From = Vector2.new(Mouse.X, Mouse.Y + GuiS:GetGuiInset().Y)
                    end
                    v.Tracer.To = Vector2.new(Vector.X, Vector.Y)
                    v.Tracer.Thickness = SantoWare.Esp.Tracer.Thickness
                    v.Tracer.Color = SantoWare.Esp.Tracer.Color
                    v.Tracer.Visible = true
                else
                    v.Tracer.Visible = false
                end

                if i.Character:FindFirstChild("BodyEffects") and i.Character:FindFirstChild("BodyEffects"):FindFirstChild("Armor") then
                    if SantoWare.Esp.ArmorBar.Enabled then
                        if SantoWare.Esp.HealthBar.Enabled then
                            v.ArmorBar.From = Vector2.new((BoxPos.X - 9), BoxPos.Y + BoxSize.Y)
                        else
                            v.ArmorBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                        end
                        v.ArmorBar.To = Vector2.new(v.ArmorBar.From.X, v.ArmorBar.From.Y - (i.Character.BodyEffects.Armor.Value / 200) * BoxSize.Y)
                        v.ArmorBar.Color = SantoWare.Esp.ArmorBar.Color
                        v.ArmorBar.Visible = true

                        v.ArmorBarOutline.From = Vector2.new(v.ArmorBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                        v.ArmorBarOutline.To = Vector2.new(v.ArmorBar.From.X, (v.ArmorBar.From.Y - 1 * BoxSize.Y) - 1)
                        v.ArmorBarOutline.Color = Color3.fromRGB(0, 0, 0)
                        v.ArmorBarOutline.Visible = SantoWare.Esp.ArmorBar.OutLine
                    else
                        v.ArmorBarOutline.Visible = false
                        v.ArmorBar.Visible = false
                    end
                    if SantoWare.Esp.ArmorText.Enabled then
                        local Offset = 22
                        if SantoWare.Esp.ArmorBar.Enabled == false then
                            Offset = Offset - 7
                        end
                        if SantoWare.Esp.HealthBar.Enabled == false then
                            Offset = Offset - 7
                        end
                        v.ArmorText.Text = tostring(math.floor((i.Character.BodyEffects.Armor.Value / 2) + 0.5))
                        if SantoWare.Esp.HealthText.Enabled then
                            v.ArmorText.Position = Vector2.new((BoxPos.X - Offset), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) + 11)
                        else
                            v.ArmorText.Position = Vector2.new((BoxPos.X - Offset), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) - 1)
                        end
                        v.ArmorText.Color = SantoWare.Esp.ArmorText.Color
                        v.ArmorText.OutlineColor = Color3.fromRGB(0, 0, 0)
                        v.ArmorText.Outline = SantoWare.Esp.ArmorText.OutLine

                        v.ArmorText.Font = 0
                        v.ArmorText.Size = SantoWare.Esp.TextSize

                        v.ArmorText.Visible = true
                    else
                        v.ArmorText.Visible = false
                    end
                else
                    v.ArmorBarOutline.Visible = false
                    v.ArmorBar.Visible = false
                    v.ArmorText.Visible = false
                end 
            else
                v.Name.Visible = false
                v.BoxOutline.Visible = false
                v.Box.Visible = false
                v.HealthBarOutline.Visible = false
                v.HealthBar.Visible = false
                v.HealthText.Visible = false
                v.ArmorBarOutline.Visible = false
                v.ArmorBar.Visible = false
                v.ArmorText.Visible = false
                v.Distance.Visible = false
                v.Tool.Visible = false
                v.Flag.Visible = false
                v.Tracer.Visible = false
            end
        else
            v.Name.Visible = false
            v.BoxOutline.Visible = false
            v.Box.Visible = false
            v.HealthBarOutline.Visible = false
            v.HealthBar.Visible = false
            v.HealthText.Visible = false
            v.ArmorBarOutline.Visible = false
            v.ArmorBar.Visible = false
            v.ArmorText.Visible = false
            v.Distance.Visible = false
            v.Tool.Visible = false
            v.Flag.Visible = false
            v.Tracer.Visible = false
        end
    end
end

-- // Recreates An Table
Script.Functions.GetTable = function(Table)
    if type(Table) == ("table") then
        local Writer = {}
        Writer.__index = Writer
    
        Writer.New = function()
            local self = setmetatable({}, Writer)
            self.Indent = 0
            self.Text = ""
            return self
        end
    
        Writer.WriteIndentation = function(self)
            for i = 1, self.Indent do
                self.Text = self.Text .. "\t"
            end
        end
    
        Writer.Write = function(self, Text)
            self.Text = self.Text .. Text
        end
    
        Writer.WriteLine = function(self, Text)
            self.Text = self.Text .. Text .. "\n"
        end
    
        Writer.WriteIndent = function(self, Text)
            self:WriteIndentation()
            self:Write(Text)
        end
    
        Writer.IncIndent = function(self)
            self.Indent = self.Indent + 1
        end
    
        Writer.Unindent = function(self)
            self.Indent = self.Indent - 1
        end
    
        Writer.ToString = function(self)
            return self.Text
        end
    
        Writer.Clear = function(self)
            self.Text = ""
            self.Indent = 0
        end
    
        local TableDump = {}
        TableDump.__index = TableDump
    
        TableDump.New = function(Table)
            local self = setmetatable({}, TableDump)
            self.Writer = Writer.New()
            self.Ot = Table
            self.Memory = {}
            self.VisitedTables = {}
            return self
        end
    
        TableDump.CacheGlobalMemory = function(self)
            local CurrentTrack = {"_G"}
            local Functions = {}
    
            Functions.InternalCount = function(Table)
                local Current = 0
                for _, __ in pairs(Table) do
                    Current = Current + 1
                end
                return Current
            end
    
            Functions.CreateNamespace = function()
                local NameSpace = ""
                for Index, Value in pairs(CurrentTrack) do
                    if Value ~= ("_G") and Value ~= ("package") then
                        NameSpace = NameSpace .. Value .. "."
                    end
                end
                return NameSpace
            end
    
            Functions.InternalCache = function(Table)
                local Len = Functions.InternalCount(Table)
                local Current = 0
                for Index, value in pairs(Table) do
                    Current = Current + 1
                    if type(value) == ("function") or type(value) == ("table") then
                        if type(value) == ("table") and self.VisitedTables[value] == nil then
                            self.VisitedTables[value] = Index
                            CurrentTrack[#CurrentTrack + 1] = Index
                            Functions.InternalCache(value)
                        end
                        self.Memory[value] = Functions.CreateNamespace() .. Index
                    end
                    if Current == Len then
                        table.remove(CurrentTrack, #CurrentTrack)
                    end
                end
            end
    
            Functions.InternalCache(_G)
        end
    
        TableDump.Resolve = function(self)
            self:CacheGlobalMemory()
            local Functions = {}

            Functions.InternalResolveSpecial = function(Value)
                if Value == _G then
                    return "_G"
                end
                if self.Memory[Value] then
                    return self.Memory[Value]
                end
                if type(Value) == ("table") then
                    if self.VisitedTables[Value] ~= nil then
                        if self.VisitedTables[Value] == true then
                            return "{...}"
                        end
                        return self.VisitedTables
                    end
                    Functions.InternalResolve(Value)
                    return ""
                elseif type(Value) == ("function") then
                    return '"Function Couldnt Be Added: ' .. tostring(Value) .. '"'
                end
                return tostring(Value)
            end
    
            Functions.InternalResolveValue = function(Value)
                if type(Value) == ("function") or type(Value) == ("table") then
                    return Functions.InternalResolveSpecial(Value)
                elseif type(Value) == ("string") then
                    return '"' .. tostring(Value) .. '"'
                elseif type(Value) == ("number") and Value == math.huge then
                    return "math.huge"
                elseif type(Value) == ("number") and Value == math.pi then
                    return "math.pi"
                elseif typeof(Value) == ("Color3") then
                    return "Color3.new(" .. tostring(Value) .. ")"
                elseif typeof(Value) == ("Vector2") then
                    return "Vector2.new(" .. tostring(Value) .. ")"
                elseif typeof(Value) == ("Vector3") then
                    return "Vector3.new(" .. tostring(Value) .. ")"
                else
                    return tostring(Value)
                end
            end
    
            Functions.InternalCount = function(Table)
                local Current = 0
                for _, __ in pairs(Table) do
                    Current = Current + 1
                end
                return Current
            end
    
            Functions.InternalResolve = function(Table, Index)
                local Len = Functions.InternalCount(Table)
                local Current = 0

                if Len ~= 0 then
                    self.Writer:WriteLine("{")
                else
                    self.Writer:Write("{")
                end

                self.Writer:IncIndent()
                self.VisitedTables[Table] = true

                if Index then
                    self.VisitedTables[Table] = Index
                end

                for Index, value in pairs(Table) do
                    Current = Current + 1
                    if type(Index) == ("string") then
                        if string.find(Index, " ") then
                            self.Writer:WriteIndent('["' .. Index .. '"] = ')
                        else
                            self.Writer:WriteIndent(Index .. " = ")
                        end

                        self.Writer:Write(Functions.InternalResolveValue(value))
                    elseif type(Index) == ("number") then
                        self.Writer:WriteIndent("[" .. tostring(Index) .. "] = ")
                        self.Writer:Write(Functions.InternalResolveValue(value))
                    elseif type(Index) == ("table") then
                        self.Writer:WriteIndent("[")
                        Functions.InternalResolve(Index)
                        self.Writer:Write("] = ")
                        self.Writer:Write(Functions.InternalResolveValue(value))
                    elseif type(Index) == ("function") then
                        self.Writer:WriteIndent(Functions.InternalResolveValue(Index) .. " = ")
                        self.Writer:Write(Functions.InternalResolveValue(value))
                    else
                        self.Writer:WriteIndent(Functions.InternalResolveValue(Index) .. " = ")
                        self.Writer:Write(Functions.InternalResolveValue(value))
                    end
                    if Current == Len then
                        self.Writer:WriteLine("")
                    else
                        self.Writer:WriteLine(",")
                    end
                end

                self.Writer:Unindent()
                if Len ~= 0 then
                    self.Writer:WriteIndent("}")
                else
                    self.Writer:Write("}")
                end
            end
            Functions.InternalResolve(self.Ot)
        end
    
        TableDump.ToString = function(self)
            self:Resolve()
            return self.Writer:ToString()
        end
    
        return "return " .. TableDump.New(Table):ToString()
    else
        return "Error: Table Not Found"
    end
end

-- // Chat Change Check
Client.Chatted:Connect(function(Msg)
    if Msg == SantoWare.ChatCommands.CrashMode then
        if SantoWare.ChatCommands.CrashMethod == ("Freeze") then
            while true do end
        elseif SantoWare.ChatCommands.CrashMethod == ("Shutdown") then
            game:Shutdown()
        end
    elseif Msg == SantoWare.ChatCommands.RejoinServer then
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, Client)
    elseif Msg == SantoWare.ChatCommands.RandomServer then
        game:GetService("TeleportService"):Teleport(game.PlaceId, Client) 
    end
    local Splitted = string.split(Msg, " ")
    if Splitted[1] and Splitted[2] and SantoWare.ChatCommands.Enabled then
        if Splitted[1] == SantoWare.ChatCommands.LoadConfig then
            if isfolder("SantoWare/" .. game.PlaceId) and isfolder("SantoWare/" .. game.PlaceId .. "/Configs") and isfile("SantoWare/" .. game.PlaceId .. "/Configs/" .. Splitted[2] .. ".lua") then
                local Table = loadfile("SantoWare/" .. game.PlaceId .. "/Configs/" .. Splitted[2] .. ".lua")()
                SantoWare = Table
                Script.Functions.CreateNotification("SuccesFully Loaded File (Name: " .. Splitted[2] .. ")", Color3.fromRGB(0, 255, 0))
            else
                Script.Functions.CreateNotification("Error: Couldnt Find File (Name: " .. Splitted[2] .. ")", Color3.fromRGB(255, 0, 0))
            end
        elseif Splitted[1] == SantoWare.ChatCommands.SaveConfig then
            if not isfolder("SantoWare") then
                makefolder("SantoWare")
            end
            if not isfolder("SantoWare/" .. game.PlaceId) then
                makefolder("SantoWare/" .. game.PlaceId)
            end
            if not isfolder("SantoWare/" .. game.PlaceId .. "/Configs") then
                makefolder("SantoWare/" .. game.PlaceId .. "/Configs")
            end
            if not isfile("SantoWare/" .. game.PlaceId .. "/Configs/" .. Splitted[2] .. ".lua") then
                writefile("SantoWare/" .. game.PlaceId .. "/Configs/" .. Splitted[2] .. ".lua", Script.Functions.GetTable(SantoWare))
                Script.Functions.CreateNotification("SuccesFully Created File (Name: " .. Splitted[2] .. ")", Color3.fromRGB(0, 255, 0))
            else
                Script.Functions.CreateNotification("Error: File Already Exists (Name: " .. Splitted[2] .. ")", Color3.fromRGB(255, 0, 0))
            end
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_Prediction then
            SantoWare.Silent.Prediction = Splitted[2]
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_Fov_Size then
            SilentFovRadius.Value = Splitted[2]
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_Fov_Show then
            if Splitted[2] == ("true") then
                SantoWare.Silent.Fov.Visible = true
            else
                SantoWare.Silent.Fov.Visible = false
            end
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_Enabled then
            if Splitted[2] == ("true") then
                SantoWare.Silent.Enabled = true
            else
                SantoWare.Silent.Enabled = false 
            end
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_HitChance then
            SantoWare.Silent.HitChance = Splitted[2]
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_LegitMode then
            if Splitted[2] == ("true") then
                SantoWare.Silent.LegitMode = true
            else
                SantoWare.Silent.LegitMode = false
            end
        elseif Splitted[1] == SantoWare.ChatCommands.Silent_BlatantMode then
            if Splitted[2] == ("true") then
                SantoWare.Silent.BlatantMode = true
            else
                SantoWare.Silent.BlatantMode = false
            end
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_Prediction then
            SantoWare.AimAssist.Prediction = Splitted[2]
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_Fov_Size then
            SantoWare.AimAssist.Fov.Radius = Splitted[2]
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_Fov_Show then
            if Splitted[2] == ("true") then
                SantoWare.AimAssist.Fov.Visible = true
            else
                SantoWare.AimAssist.Fov.Visible = false
            end
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_Enabled then
            if Splitted[2] == ("true") then
                SantoWare.AimAssist.Enabled = true
            else
                SantoWare.AimAssist.Enabled = false
            end
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_SmoothX then
            SantoWare.AimAssist.Smoothness_X = Splitted[2]
            Script.SavedValue.AimAssistSmoothX = SantoWare.AimAssist.Smoothness_X
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_SmoothY then
            SantoWare.AimAssist.Smoothness_Y = Splitted[2]
            Script.SavedValue.AimAssistSmoothY = SantoWare.AimAssist.Smoothness_Y
        elseif Splitted[1] == SantoWare.ChatCommands.AimAssist_Shake then
            SantoWare.AimAssist.Shake.Shake_X = Splitted[2]
            SantoWare.AimAssist.Shake.Shake_Y = Splitted[2]
            SantoWare.AimAssist.Shake.Shake_Z = Splitted[2]
            Script.SavedValue.ShakeX = SantoWare.AimAssist.Shake.Shake_X
            Script.SavedValue.ShakeY = SantoWare.AimAssist.Shake.Shake_Y
            Script.SavedValue.ShakeZ = SantoWare.AimAssist.Shake.Shake_Z
        end
    end
end)

-- // KeyDown Mouse Check
Uis.InputBegan:connect(function(input, Gp)
    if not Gp then
        -- // Not ElseIf So You Can Use Multiple Same Keybinds
        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.InventorySorter.KeyBind)] and SantoWare.InventorySorter.Enabled and Script.Functions.Alive(Client) then
            local GunOrder = SantoWare.InventorySorter.Slots
            local BackPack = Client.Backpack
            local CurrentTime = tick()
            local GunLoop = 10 - #GunOrder
            local TimeSinceLastKeybind = CurrentTime - keybindTime

            if TimeSinceLastKeybind >= 5 then
                keybindTime = CurrentTime
                local GunFolder = Instance.new("Folder")
                GunFolder.Name = "GunFolder"
                GunFolder.Parent = game.Workspace
                local GunFolderID = game.Workspace.GunFolder

                for _, v in pairs(BackPack:GetChildren()) do
                    if v:IsA("Tool") then
                        v.Parent = game.Workspace.GunFolder
                    end
                end

                for _, v in pairs(GunOrder) do
                    local Gun = GunFolderID:FindFirstChild(v)
                    if Gun then
                        Gun.Parent = BackPack
                        wait(0.05)
                    else
                        GunLoop = GunLoop + 1
                    end
                end

                if SantoWare.InventorySorter.UseFood then
                    for _, v in pairs(GunFolderID:GetChildren()) do
                        if v:FindFirstChild("Drink") or v:FindFirstChild("Eat") then
                            v.Parent = BackPack
                            GunLoop = GunLoop -1
                        end
                    end
                end

                if GunLoop > 0 then
                    for i = 1, GunLoop do
                        local InvisTool = Instance.new("Tool")
                        InvisTool.Name = ""
                        InvisTool.ToolTip = "PlaceHolder"
                        InvisTool.GripPos = Vector3.new(0, 1, 0)
                        InvisTool.RequiresHandle = false
                        InvisTool.Parent = BackPack
                    end
                end

                for _, v in pairs(GunFolderID:GetChildren()) do
                    if v:IsA("Tool") then
                        v.Parent = BackPack
                    end
                end

                for _, v in pairs(BackPack:GetChildren()) do
                    if v.Name == "" then
                        v:Destroy()
                    end
                end

                GunFolder:Destroy()
            end
        end
        
        if SantoWare.FakeSpike.Enabled and input.KeyCode == Enum.KeyCode[string.upper(SantoWare.FakeSpike.KeyBind)] then
            if SantoWare.FakeSpike.ToggleMode then
                FakeSpike = not FakeSpike
                if FakeSpike == true then
                    settings().Network.IncomingReplicationLag = (SantoWare.FakeSpike.Power * 0.001)
                    if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.FakeSpike then
                        Script.Functions.CreateNotification("FakeSpike: " .. tostring(FakeSpike), Color3.fromRGB(170, 130, 255))
                    end
                else
                    settings().Network.IncomingReplicationLag = 0
                    if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.FakeSpike then
                        Script.Functions.CreateNotification("FakeSpike: " .. tostring(FakeSpike), Color3.fromRGB(170, 130, 255))
                    end
                end
            else
                settings().Network.IncomingReplicationLag = (SantoWare.FakeSpike.Power * 0.001)
                if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.FakeSpike then
                    Script.Functions.CreateNotification("FakeSpike: " .. tostring(FakeSpike), Color3.fromRGB(170, 130, 255))
                end
                task.wait(SantoWare.FakeSpike.Delay)
                settings().Network.IncomingReplicationLag = 0
                if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.FakeSpike then
                    Script.Functions.CreateNotification("FakeSpike: " .. tostring(FakeSpike), Color3.fromRGB(170, 130, 255))
                end
            end
        end

        if SantoWare.F9Cleaner.Enabled and input.KeyCode == Enum.KeyCode[string.upper(SantoWare.F9Cleaner.KeyBind)] then
            Script.Functions.ClearConsole()
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.AimAssist.FrameSkip.KeyBind)] and Script.Functions.Alive(AimTarget) and SantoWare.AimAssist.FrameSkip.Enabled then
            FrameSkip = true
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Silent.ForceKeyBind)] and SantoWare.Silent.ForceLock_AimAssistTarget == false and SantoWare.Silent.ForceLock then
            if ForceLock == nil then
                ForceLock = Script.Functions.GetClosestPlayer(true)
        		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Misc and ForceLock ~= nil then
        		    Script.Functions.CreateNotification("Locked: " .. tostring(ForceLock), Color3.fromRGB(170, 130, 255))
        		end
            else
                if ForceLock ~= nil then
                    ForceLock = nil
            		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Misc then
            		    Script.Functions.CreateNotification("Unlocked", Color3.fromRGB(170, 130, 255))
            		end
        		end
            end
        end

        if input.KeyCode == Enum.KeyCode.I and SantoWare.Macro.Speed_MacroAbuse and Script.Functions.Alive(Client) then
            if Client.Character:FindFirstChild("GunScript", true) ~= nil or Client.Character:FindFirstChild("FlameThrowerScript", true) ~= nil or Client.Character:FindFirstChild("RPGScript", true) ~= nil then
                local Controller = require(Client:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetCameras().activeCameraController
                Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance - 5)
            end
        end

        if input.KeyCode == Enum.KeyCode.O and SantoWare.Macro.Speed_MacroAbuse and Script.Functions.Alive(Client) then
            if Client.Character:FindFirstChild("GunScript", true) ~= nil or Client.Character:FindFirstChild("FlameThrowerScript", true) ~= nil or Client.Character:FindFirstChild("RPGScript", true) ~= nil then
                local Controller = require(Client:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetCameras().activeCameraController
                Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance + 5)
            end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.AimAssist.KeyBind)] and SantoWare.AimAssist.Enabled then
            if AimTarget == nil then
                CurrentVelocity2 = Vector3.zero
                AimTarget = Script.Functions.GetClosestPlayer2()
                if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.AimAssist and AimTarget ~= nil then
                    Script.Functions.CreateNotification("Locked: " .. tostring(AimTarget), Color3.fromRGB(170, 130, 255))
                end
                if AimTarget and AimTarget.Character then
                    PositionData2 = {Target = tostring(AimTarget), Position = AimTarget.Character.HumanoidRootPart.Position, Time = tick()}
                end
            else
                if AimTarget ~= nil then
                    AimTarget = nil
                    CurrentVelocity2 = Vector3.zero
                    if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.AimAssist then
                        Script.Functions.CreateNotification("Unlocked", Color3.fromRGB(170, 130, 255))
                    end
                end
            end
        end

        if SantoWare.Silent.TriggerBot and SantoWare.Silent.TriggerBot_HotKey == false and input.UserInputType == Enum.UserInputType[SantoWare.Silent.TriggerBotMouseKey] then
            TriggerBot = not TriggerBot
        end

        if SantoWare.Silent.TriggerBot and SantoWare.Silent.TriggerBot_HotKey and input.KeyCode == Enum.KeyCode[SantoWare.Silent.TriggerBotKey] then
            TriggerBot = not TriggerBot
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Silent.KeyBind)] and SantoWare.Silent.UseSilentKeyBind then
            SantoWare.Silent.Enabled = not SantoWare.Silent.Enabled
            if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Silent then
                Script.Functions.CreateNotification("Silent Aim: " .. tostring(SantoWare.Silent.Enabled), Color3.fromRGB(170, 130, 255))
            end
            CurrentVelocity = Vector3.zero
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Lay_KeyBind)] and SantoWare.Macro.Lay_Emote and game.PlaceId ~= 9825515356 then
            local Args = {
                [1] = "AnimationPack",
                [2] = "Lay"
            }
            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Greet_Keybind)] and SantoWare.Macro.Greet_Emote and game.PlaceId ~= 9825515356 then
            local Args = {
                [1] = "AnimationPack",
                [2] = "Greet"
            }
            game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Esp.EspKey)] and SantoWare.Esp.UseEspKeyBind then
    		SantoWare.Esp.Enabled = not SantoWare.Esp.Enabled
    		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Esp then
    		    Script.Functions.CreateNotification("Esp: " .. tostring(SantoWare.Esp.Enabled), Color3.fromRGB(170, 130, 255))
    		end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Desync.DesyncKey)] and SantoWare.Desync.Enabled and SantoWare.Desync.UseDesyncKey then
    		Desync = not Desync
    		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Esp then
    		    Script.Functions.CreateNotification("Desync: " .. tostring(Desync), Color3.fromRGB(170, 130, 255))
    		end
            if SantoWare.Desync.Method == ("Slow_Data") then
                wait()
                setfflag("S2PhysicsSenderRate", 15)
            end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Noclip_KeyBind)] and SantoWare.Macro.Noclip_Macro then
            NoclipMacro = not NoclipMacro
            if not NoclipMacro then return end
            repeat task.wait()
                for _, v in pairs(Client.Backpack:GetChildren()) do
                    if Script.Functions.Alive(Client) then
                        if v.Name == ("[TacticalShotgun]") then
                            v.Parent = Client.Character
                            task.wait(0.1)
                            if v then
                                v.Parent = Client.Backpack
                            end
                        elseif v.Name == ("[Shotgun]") then
                            v.Parent = Client.Character
                            task.wait(0.1)
                            if v then
                                v.Parent = Client.Backpack
                            end
                        end
                    end
                end
            until NoclipMacro == false
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Speed_KeyBind)] and SantoWare.Macro.Speed_Enabled then
            Macro = not Macro
            repeat RS.Heartbeat:Wait()
            if SantoWare.Macro.Speed_Method == ("FirstPerson") then
                local Controller = require(Client:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetCameras().activeCameraController
                Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance - 1)
                for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                    RS.Heartbeat:Wait()
                end
                Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance + 1)
            elseif SantoWare.Macro.Speed_Method == ("Shift") then
                keypress(0xA0)
                for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                    RS.Heartbeat:Wait()
                end
                keypress(0xA0)
                for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                    RS.Heartbeat:Wait()
                end
                keyrelease(0xA0)
                for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                    RS.Heartbeat:Wait()
                end
                keyrelease(0xA0)
            elseif SantoWare.Macro.Speed_Method == ("ThirdPerson") then
                if SantoWare.Macro.Speed_ThirdPersonV2 then
                    local Controller = require(Client:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetCameras().activeCameraController
                    Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance - 8)
                    for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                        RS.Heartbeat:Wait()
                    end
                    Controller:SetCameraToSubjectDistance(Controller.currentSubjectDistance + 5)
                else
                    keypress(0x49)
                    for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                        RS.Heartbeat:Wait()
                    end
                    keypress(0x4F)
                    for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                        RS.Heartbeat:Wait()
                    end
                    keyrelease(0x49)
                    for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                        RS.Heartbeat:Wait()
                    end
                    keyrelease(0x4F)
                end
            end
            for i = 1, math.ceil(SantoWare.Macro.Speed_Delay) do
                RS.Heartbeat:Wait()
            end
            until Macro == false
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.PanicMode.KeyBind)] and SantoWare.PanicMode.Enabled then
            PanicMode = not PanicMode
            if PanicMode then
                if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.PanicMode then
                    Script.Functions.CreateNotification("PanicMode: " .. tostring(PanicMode), Color3.fromRGB(170, 130, 255))
                end
                if SantoWare.Options.NotificationMode == true then
                    Script.PanicModeSaves.CurrentNotificationState = SantoWare.Options.NotificationMode
                    SantoWare.Options.NotificationMode = not SantoWare.Options.NotificationMode
                end
                if SantoWare.Silent.Enabled == true then
                    Script.PanicModeSaves.CurrentSilentState = SantoWare.Silent.Enabled
                    SantoWare.Silent.Enabled = not SantoWare.Silent.Enabled
                end
                if SantoWare.AimAssist.Enabled == true then
                    Script.PanicModeSaves.CurrentAimAssistState = SantoWare.AimAssist.Enabled
                    SantoWare.AimAssist.Enabled = not SantoWare.AimAssist.Enabled
                end
                if SantoWare.AimAssist.Fov.Visible == true then
                    Script.PanicModeSaves.CurrentAimAssistFov = SantoWare.AimAssist.Fov.Visible
                    SantoWare.AimAssist.Fov.Visible = not SantoWare.AimAssist.Fov.Visible
                end
                if SantoWare.Silent.Fov.Visible == true then
                    Script.PanicModeSaves.CurrentSilentFov = SantoWare.Silent.Fov.Visible
                    SantoWare.Silent.Fov.Visible = not SantoWare.Silent.Fov.Visible
                end
            else
                if Script.PanicModeSaves.CurrentNotificationState then
                    SantoWare.Options.NotificationMode = not SantoWare.Options.NotificationMode
                end
                if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.PanicMode then
                    Script.Functions.CreateNotification("PanicMode: " .. tostring(PanicMode), Color3.fromRGB(170, 130, 255))
                end
                if Script.PanicModeSaves.CurrentSilentState then
                    SantoWare.Silent.Enabled = Script.PanicModeSaves.CurrentSilentState
                end
                if Script.PanicModeSaves.CurrentAimAssistState then
                    SantoWare.AimAssist.Enabled = Script.PanicModeSaves.CurrentAimAssistState
                end
                if Script.PanicModeSaves.CurrentAimAssistFov then
                    SantoWare.AimAssist.Fov.Visible = Script.PanicModeSaves.CurrentAimAssistFov
                end
                if Script.PanicModeSaves.CurrentSilentFov then
                    SantoWare.Silent.Fov.Visible = Script.PanicModeSaves.CurrentSilentFov
                end
            end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Rotation_KeyBind)] and SantoWare.Macro.RotationMode then
            if SantoWare.AimAssist.Enabled then
                SantoWare.AimAssist.Enabled = false
            end
            for i = 1, math.floor(SantoWare.Macro.Degrees / SantoWare.Macro.RotationSpeed) do
                Camera.CoordinateFrame = Camera.CoordinateFrame * CFrame.Angles(0, math.rad(SantoWare.Macro.RotationSpeed), 0)
                RS.Heartbeat:Wait()
            end
            if SantoWare.AimAssist.Enabled then
                SantoWare.AimAssist.Enabled = true
            end
        end
    end
end)

-- // KeyUp Mouse Check
Uis.InputEnded:connect(function(input, Gp)
    if not Gp then
        if SantoWare.Silent.TriggerBot and TriggerBot and SantoWare.Silent.TriggerBot_HotKey == false and SantoWare.Silent.TriggerBot_HoldMode and input.UserInputType == Enum.UserInputType[SantoWare.Silent.TriggerBotMouseKey] then
            TriggerBot = false
        end

        if SantoWare.Silent.TriggerBot and TriggerBot and SantoWare.Silent.TriggerBot_HotKey and SantoWare.Silent.TriggerBot_HoldMode and input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Silent.TriggerBotKey)] then
            TriggerBot = false
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Esp.EspKey)] and SantoWare.Esp.UseEspKeyBind and SantoWare.Esp.HoldMode and SantoWare.Esp.Enabled then
    		SantoWare.Esp.Enabled = false
    		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Esp then
    		    Script.Functions.CreateNotification("Esp: " .. tostring(SantoWare.Esp.Enabled), Color3.fromRGB(170, 130, 255))
    		end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.AimAssist.KeyBind)] and SantoWare.AimAssist.Enabled and SantoWare.AimAssist.HoldMode then
    		AimTarget = nil
    		CurrentVelocity2 = Vector3.zero
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Desync.DesyncKey)] and SantoWare.Desync.HoldMode and SantoWare.Desync.UseDesyncKey and SantoWare.Desync.Enabled then
    		Desync = false
    		if SantoWare.Options.NotificationMode.Enabled and SantoWare.Options.NotificationMode.Desync then
    		    Script.Functions.CreateNotification("Desync: " .. tostring(Desync), Color3.fromRGB(170, 130, 255))
    		end
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Speed_KeyBind)] and SantoWare.Macro.Speed_Enabled and SantoWare.Macro.Speed_HoldMode and Macro then
            Macro = false
        end

        if input.KeyCode == Enum.KeyCode[string.upper(SantoWare.Macro.Noclip_KeyBind)] and SantoWare.Macro.Noclip_Macro and SantoWare.Macro.Noclip_HoldMode and NoclipMacro then
            NoclipMacro = false
        end
    end
end)

-- // Anti Aim Viewer Functions
Script.Functions.ToolActivated = function()
    if SantoWare.Silent.Enabled and SantoWare.Silent.AntiAimViewer and Script.Functions.Alive(SilentTarget) and Script.Functions.SilentCheck(SilentTarget) then
        local TargetCF = nil
        local TargetFalling = false

        local GetPart = Script.Functions.GetClosestPartMethod(SilentTarget)
        if GetPart == nil then return end
        SantoWare.Silent.Part = tostring(GetPart)
        Script.SavedValue.SilentPart = tostring(GetPart)
        
        if SantoWare.Silent.ClosestPoint then
            TargetCF = Script.Functions.GetClosestPointOnPart(GetPart)
        else
            TargetCF = GetPart.Position
        end

        if SantoWare.Silent.AntiGroundShots and CurrentVelocity.Y < SantoWare.Silent.AntiGroundActivation then
            TargetFalling = true
        end
        
        if TargetCF and CurrentVelocity then
            if SantoWare.Silent.PredictMovement then 
                if SantoWare.Silent.BlatantMode then
                    local Enabled = true
                    local Mag = (SilentTarget.Character.Humanoid.MoveDirection).Magnitude
                    local SilentVel = SilentTarget.Character.HumanoidRootPart.Velocity
                    if (SilentVel).Magnitude > 110 then
                        Enabled = false
                    elseif SilentVel.Y > 50 then
                        Enabled = false
                    elseif SilentVel.Y < -35 then
                        Enabled = false
                    elseif SilentVel.Y > 75 then
                        Enabled = false
                    elseif (SilentVel).Magnitude < 1 and Mag > 0.01 then
                        Enabled = false
                    elseif (SilentVel).Magnitude > 5 and Mag < 0.01 then
                        Enabled = false
                    end
                    if Enabled and SantoWare.UniversalCheck.WallCheck_V2 and not Script.Functions.WallCheck(SilentTarget.Character.HumanoidRootPart.Position + (SilentVel * SantoWare.Silent.Prediction), SilentTarget.Character) then
                        return
                    end
                    if Enabled then
                        if TargetFalling then
                            TargetCF = TargetCF + (Vector3.new(SilentVel.X, (SilentVel.Y * SantoWare.Silent.AntiGroundValue), SilentVel.Z) * SantoWare.Silent.Prediction)
                        else
                            TargetCF = TargetCF + (SilentVel * SantoWare.Silent.Prediction)
                        end
                    else
                        if TargetFalling then
                            TargetCF = TargetCF + (Vector3.new(CurrentVelocity.X, (CurrentVelocity.Y * SantoWare.Silent.AntiGroundValue), CurrentVelocity.Z) * SantoWare.Silent.Prediction)
                        else
                            TargetCF = TargetCF + (CurrentVelocity * SantoWare.Silent.Prediction)
                        end
                    end
                else
                    if TargetFalling then
                        TargetCF = TargetCF + (Vector3.new(CurrentVelocity.X, (CurrentVelocity.Y * SantoWare.Silent.AntiGroundValue), CurrentVelocity.Z) * SantoWare.Silent.Prediction)
                    else
                        TargetCF = TargetCF + (CurrentVelocity * SantoWare.Silent.Prediction)
                    end
                end
            end
            if SantoWare.Silent.Humanize then
                local HumanizeValue = SantoWare.Silent.HumanizeValue 
                TargetCF = (TargetCF + Script.Functions.RandomVec3(HumanizeValue, 0.01))
            end
        end
        if TargetCF then
            if SantoWare.Silent.LegitMode then
                local PartPos = Camera:WorldToScreenPoint(TargetCF)
                local GetScreenPos = Script.Functions.GetFovPosition()
                local Magnitude = ((Vector2.new(PartPos.X, PartPos.Y) - GetScreenPos) - SantoWare.Silent.Fov.Offset).Magnitude

                if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > Magnitude) or SantoWare.Silent.ForceLock == true then
                    return
                end
            end

            if SantoWare.Silent.Custom_AntiAimViewerPoint.Enabled == false then
                if game.PlaceId == 13873488228 or game.PlaceId == 13872892064 or game.PlaceId == 13872913451 then
                    local Args = {
                        [1] = "MOUSE",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").MAINEVENT:FireServer(unpack(Args))
                elseif game.PlaceId == 13397024889 then
                    local Args = {
                        [1] = "MOUSE",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").MAINEVENT:FireServer(unpack(Args))
                elseif game.PlaceId == 9825515356 then
                    local Args = {
                        [1] = "GetMousePos",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
                elseif game.PlaceId == 9183932460 then
                    local Args = {
                        [1] = "UpdateMousePos",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage"):FindFirstChild(".gg/untitledhood"):FireServer(unpack(Args))
                elseif game.PlaceId == 5602055394 then
                    local Args = {
                        [1] = "MousePos",
                        [2] = TargetCF,
                        [3] = "P"
                    }
                    game:GetService("ReplicatedStorage").Bullets:FireServer(unpack(Args))
                elseif game.PlaceId == 13051460029 or game.PlaceId == 11833542073 or game.PlaceId == 13051527453 or game.PlaceId == 13395952276 then
                    local Args = {
                        [1] = "UpdateMousePos",
                        [2] = {
                            ["MousePos"] = TargetCF,
                            ["Camera"] = Vector3.new(Camera.CFrame.X, Camera.CFrame.Y, Camera.CFrame.Z)
                        }
                    }
                    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
                elseif game.PlaceId == 13051527453 then
                    local Args = {
                        [1] = "UpdateMousePos",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
                elseif game.PlaceId == 12618586930 then
                    local Args = {
                        [1] = "UpdateMousePos",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").Remote:FireServer(unpack(Args))
                else
                    local Args = {
                        [1] = "UpdateMousePos",
                        [2] = TargetCF
                    }
                    game:GetService("ReplicatedStorage").MainEvent:FireServer(unpack(Args))
                end
            else
                if type(SantoWare.Silent.Custom_AntiAimViewerPoint.RemoteEvent) == ("function") then
                    local Args, MainEvent = SantoWare.Silent.Custom_AntiAimViewerPoint.RemoteEvent(TargetCF)
                    if type(Args) == ("table") and MainEvent:IsA("RemotEvent") then
                        MainEvent:FireServer(unpack(Args))
                    end
                end
            end
        end
    end
end

-- // Connects The AntiAimViewer To Gun
Script.Functions.GetConnections = function(Tool)
    if Tool:IsA("Tool") then
        if ToolConnection then
            ToolConnection:Disconnect()
        end
        ToolConnection = Tool.Activated:Connect(Script.Functions.ToolActivated)
    end
end

-- // Gets Character When New Character Is Added
Script.Functions.WhenCharacterAdded = function(Character)
    Character.ChildAdded:Connect(Script.Functions.GetConnections)
end

-- // Connects The LocalPlayer Character
if Client.Character then
    Script.Functions.WhenCharacterAdded(Client.Character)
end
Client.CharacterAdded:Connect(Script.Functions.WhenCharacterAdded)

-- // Memory Spoofer Functions
Script.Functions.ChangeText = function()
    pcall(function()
        coroutine.resume(coroutine.create(function()
            local PerformanceStats = game:GetService("CoreGui").RobloxGui:FindFirstChild("PerformanceStats")
            if not PerformanceStats then return end
            for _, v in pairs(PerformanceStats:GetDescendants()) do
                if v.ClassName == "TextLabel" then
                    if v.Text:match("MB") then
                        if v.Name == "ValueLabel" then
                            v.Text = Text_1 .. "" .. Text_2
                        end
                        if v.Name == "Label" then
                            if v.Text:match("Current") then
                                v.Text = "Current " .. Text_1 .. "" .. Text_2
                            end
                            if v.Text:match("Average") then
                                v.Text = "Average " .. Text_3.. "" .. Text_4
                            end
                        end
                    end
                end
            end
        end))
        local DevConsole = game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster")
        if not DevConsole then return end
        for _, v in pairs(DevConsole:GetDescendants()) do
            if v.ClassName == "TextButton" then
                if v.Text:match("MB") and not v.Text:match("Value MB") then
                    v.Text = Text_5 .. " MB"
                end
            end
        end
        if DevConsole:FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("value") then
            DevConsole.DevConsoleWindow.DevConsoleUI.MainView.ClientMemory.Entries.Memory.value.Text =  Text_5 .. "" .. Text_6
        end
        
        local Graph = DevConsole:FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph"):FindFirstChild("graph")
        local Graph2 = DevConsole:FindFirstChild("DevConsoleWindow"):FindFirstChild("DevConsoleUI"):FindFirstChild("MainView"):FindFirstChild("ClientMemory"):FindFirstChild("Entries"):FindFirstChild("Memory"):FindFirstChild("Graph")
        if Graph then
            if Graph:FindFirstChild("LatestEntryText") then
                Graph:FindFirstChild("LatestEntryText").Text = Text_1 .. Text_7
                Graph:FindFirstChild("AxisTextY0").Text = math.floor(Text_5 * 0.9) .. Text_6
            end
            local Hover_Y = Graph.HoverDetails.HoverHorizontal.Position.Y.Offset
            local TopValue = tonumber(Graph.LatestEntryText.Text)
            local BottomValue = tonumber(Graph.AxisTextY0.Text)
            local TopText_Y = Graph.LatestEntryText.Position.Y.Offset
            local BottomText_Y = Graph.AxisTextY0.Position.Y.Offset
            local LatestEntryLine_Y = Graph.LatestEntryLine.Position.Y.Offset
            local Name = DevConsole.DevConsoleWindow.DevConsoleUI.MainView.ClientMemory.Entries.Memory.Graph.name
            
            if Hover_Y < LatestEntryLine_Y then
                TopText_Y = Graph.LatestEntryText.Position.Y.Offset
                BottomText_Y = Graph.AxisTextY0.Position.Y.Offset
            elseif Graph.AxisTextY0.Position.Y.Offset < LatestEntryLine_Y then
                TopText_Y = Name.Position.Y.Offset
                BottomText_Y = Graph.LatestEntryText.Position.Y.Offset
                TopValue = tonumber(DevConsoleUI.TopBar.LiveStatsModule["MemoryUsage_MB"].Text)
                BottomValue = tonumber(Graph.LatestEntryText.Text)
            end
            
            local HoverValue = BottomValue + ((TopValue - BottomValue) * ((Hover_Y - BottomText_Y) / (TopText_Y - BottomText_Y)))
            Graph.HoverDetails.HoverTextY.Text = string.format("%.3f", HoverValue)
        end
    end)
end

-- // The Loops That Changes The Value
coroutine.resume(coroutine.create(function()
    while SantoWare.MemorySpoofer.Enabled and RS.Heartbeat:Wait() do
        Script.Functions.ChangeText()
    end
end))
    
coroutine.resume(coroutine.create(function()
    while SantoWare.MemorySpoofer.Enabled do
        task.wait(SantoWare.MemorySpoofer.Delay)
        Text_1 = tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum))
        Text_2 = tostring("." .. math.random(10, 99) .. " MB")
        Text_3 = tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum))
        Text_4 = tostring("." .. math.random(10, 99) .. " MB")
    end
end))
    
coroutine.resume(coroutine.create(function()
    while SantoWare.MemorySpoofer.Enabled do
        task.wait(5)
        Text_5 = tostring(math.random(SantoWare.MemorySpoofer.Lowest, SantoWare.MemorySpoofer.Maximum))
        Text_6 = tostring("."..math.random(100, 999))
        Text_7 = tostring("."..math.random(100, 999))
    end
end))

local SavedError, SavedError2, SavedError3 = nil, nil, nil
-- // Fires Every Frame Prior To The Frame Being Rendered.
coroutine.resume(coroutine.create(function()
    while true do
        local Succes, Error = pcall(function()
            if Client.Character and Client.Character:FindFirstChild("LowerTorso") and Client.Character.LowerTorso:FindFirstChild("LeftHipRigAttachment") and Client.Character.LowerTorso.LeftHipRigAttachment:FindFirstChild("OriginalPosition") then
                Client.Character.LowerTorso.LeftHipRigAttachment.OriginalPosition:Destroy()
            end
            if SantoWare.Options.AntiError then 
                coroutine.wrap(pcall)(function()
                    for _, v in ipairs(getconnections(game:GetService('ScriptContext').Error)) do 
                        v:Disable();
                    end
                end)
            end
            Script.Functions.Desync()
            Script.Functions.GetSilentTarget()
            Script.Functions.UpdateFOV()
            if SantoWare.Options.AutoGetUp and Script.Functions.Alive(Client) and Client.Character.Humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
                Client.Character.Humanoid:ChangeState("GettingUp")
            end
            Script.Functions.MouseChanger()
            if TriggerBot and Script.Functions.Alive(SilentTarget) and SilentTarget.Character:FindFirstChild(SantoWare.Silent.Part) then
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(SilentTarget.Character.HumanoidRootPart)

                if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > Magnitude) or SantoWare.Silent.ForceLock == true then
                    if SantoWare.Silent.TriggerBot_Delay == 0 then
                        mouse1click()
                    else
                        task.spawn(function()
                            task.wait(SantoWare.Silent.TriggerBot_Delay / 1000)
                            mouse1click()
                        end)
                    end
                end
            end
            Script.Functions.SilentMisc()
            Script.Functions.UpdateEsp()
        end)
        if not Succes then
            if SavedError ~= Error then
                SavedError = Error
                Script.Functions.CreateNotification("SomeThing Went Wrong! We Have Sent The Error Code To The Devs!", Color3.fromRGB(170, 130, 255))
                wait(0.5)
                Script.Functions.CreateNotification(Error, Color3.fromRGB(170, 130, 255))
            end
        end
        RS.Heartbeat:Wait()
    end
end))

-- // Fires Every Frame After The Physics Simulation Has Completed.
RS.RenderStepped:Connect(function(DeltaTime)
    local Succes, Error = pcall(function()
        -- // Notification Fade Function And Position Change
    	local Smallest = math.huge
    	for i = 1, #Script.NotifyNote do
    		local v = Script.NotifyNote[i]
    		if v and v.Enabled then
    			Smallest = i < Smallest and i or Smallest
    		else
    			table.remove(Script.NotifyNote, i)
    		end
    	end
    	local Length = #Script.NotifyNote
    	for i = 1, #Script.NotifyNote do
    		local Note = Script.NotifyNote[i]
    		Note:Update(i, Length, DeltaTime)
    		if i <= math.ceil(Length / 10) or Note.Fading then
    			Note:Fade(i, Length, DeltaTime)
    		end
    	end
    end)
    if not Succes then
        if SavedError2 ~= Error then
            SavedError2 = Error
            Script.Functions.CreateNotification("SomeThing Went Wrong! We Have Sent The Error Code To The Devs!", Color3.fromRGB(170, 130, 255))
            wait(0.5)
            Script.Functions.CreateNotification(Error, Color3.fromRGB(170, 130, 255))
        end
    end
end)

-- // The Function For Target Bot, GunSettings
coroutine.resume(coroutine.create(function()
    while true do
        local Succes, Error = pcall(function()
            if SantoWare.UniversalCheck.Advanced.Target_Bots and game:GetService("Workspace"):FindFirstChild(SantoWare.UniversalCheck.Advanced.Bot_Path) then
                for _, v in pairs(game:GetService("Workspace")[SantoWare.UniversalCheck.Advanced.Bot_Path]:GetChildren()) do
                    if not Players:FindFirstChild(v.Name) then
                        local CreatePlayer = Instance.new("Player")
                        CreatePlayer.Name = v.Name
                        CreatePlayer.Character = v
                    else
                        if Players:FindFirstChild(v.Name) then
                            Players[v.Name].Character = v
                        end
                    end
                end
            end
        	if SantoWare.Silent.GunSettings.Enabled then
            	local CurrentGun = Script.Functions.GetCurrentWeaponName()
                local WeaponSettings = SantoWare.Silent.GunSettings[CurrentGun]
                if WeaponSettings ~= nil then
                    if SantoWare.Silent.GunSettings.Methods.Range == false then
                        if SantoWare.Silent.GunSettings.Methods.Smoothness and Script.SavedValue.AimAssistSmoothX ~=  WeaponSettings.Smoothness then
                            SantoWare.AimAssist.Smoothness_X = WeaponSettings.Smoothness
                            SantoWare.AimAssist.Smoothness_Y = WeaponSettings.Smoothness
                            Script.SavedValue.AimAssistSmoothX = WeaponSettings.Smoothness
                            Script.SavedValue.AimAssistSmoothY = WeaponSettings.Smoothness
                        end
                        if SantoWare.Silent.GunSettings.Methods.AirSmoothness and SantoWare.AimAssist.AirSmoothness_X ~= WeaponSettings.AirSmoothness then
                            SantoWare.AimAssist.AirSmoothness_X = WeaponSettings.AirSmoothness
                            SantoWare.AimAssist.AirSmoothness_Y = WeaponSettings.AirSmoothness
                        end
                        if SantoWare.Silent.GunSettings.Methods.HitChance and SantoWare.Silent.Prediction ~= WeaponSettings.HitChance then
                            SantoWare.Silent.HitChance = WeaponSettings.HitChance
                        end
                        if SantoWare.Silent.GunSettings.Methods.AirHitChance and SantoWare.Silent.Prediction ~= WeaponSettings.AirHitChance then
                            SantoWare.Silent.AirHitChance = WeaponSettings.AirHitChance
                        end
                        if SantoWare.Silent.GunSettings.Methods.Prediction and SantoWare.Silent.Prediction ~= WeaponSettings.Prediction then
                            SantoWare.Silent.Prediction = WeaponSettings.Prediction
                        end
                        if SantoWare.Silent.GunSettings.Methods.Fov and SilentFovRadius.Value ~= WeaponSettings.Fov then
                            if SantoWare.Silent.GunSettings.Dynamic.Enabled then
                                local Create = Tween:Create(SilentFovRadius, TweenInfo.new(SantoWare.Silent.GunSettings.Dynamic.Time, Enum.EasingStyle[SantoWare.Silent.GunSettings.Dynamic.EasingStyle], Enum.EasingDirection[SantoWare.Silent.GunSettings.Dynamic.EasingDirection]), {Value = WeaponSettings.Fov})
                                Create:Play()
                                Create.Completed:Wait()
                            else
                                SilentFovRadius.Value = WeaponSettings.Fov
                            end
                        end
                    end
                    if SantoWare.Silent.Part == nil then return end
                    if SantoWare.Silent.GunSettings.Methods.Range and Script.Functions.Alive(SilentTarget) and Script.Functions.Alive(Client) and SilentTarget.Character:FindFirstChild(SantoWare.Silent.Part) then
                        local Magnitude = Script.Functions.GetMagnitudeFromMouse(SilentTarget.Character.HumanoidRootPart)

                        if (SantoWare.Silent.ForceLock == false and Script.Drawing.SilentCircle.Radius + 4 > Magnitude) or SantoWare.Silent.ForceLock == true then
                            local Magnitude = (SilentTarget.Character.HumanoidRootPart.Position - Client.Character.HumanoidRootPart.Position).Magnitude
                            if Magnitude < SantoWare.Silent.GunSettings.Close_Activation then
                                if SantoWare.Silent.GunSettings.Methods.Smoothness and Script.SavedValue.AimAssistSmoothX ~=  WeaponSettings.CloseSmoothness then
                                    SantoWare.AimAssist.Smoothness_X = WeaponSettings.CloseSmoothness
                                    SantoWare.AimAssist.Smoothness_Y = WeaponSettings.CloseSmoothness
                                    Script.SavedValue.AimAssistSmoothX = WeaponSettings.CloseSmoothness
                                    Script.SavedValue.AimAssistSmoothY = WeaponSettings.CloseSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirSmoothness and SantoWare.AimAssist.AirSmoothness_X ~= WeaponSettings.CloseAirSmoothness then
                                    SantoWare.AimAssist.AirSmoothness_X = WeaponSettings.CloseAirSmoothness
                                    SantoWare.AimAssist.AirSmoothness_Y = WeaponSettings.CloseAirSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.HitChance and SantoWare.Silent.HitChance ~= WeaponSettings.CloseHitChance then
                                    SantoWare.Silent.HitChance = WeaponSettings.CloseHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirHitChance and SantoWare.Silent.AirHitChance ~= WeaponSettings.CloseAirHitChance then
                                    SantoWare.Silent.AirHitChance = WeaponSettings.CloseAirHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.Prediction and SantoWare.Silent.Prediction ~= WeaponSettings.ClosePrediction then
                                    SantoWare.Silent.Prediction = WeaponSettings.ClosePrediction
                                end
                                if SantoWare.Silent.GunSettings.Methods.Fov and SilentFovRadius.Value ~= WeaponSettings.CloseFov then
                                    if SantoWare.Silent.GunSettings.Dynamic.Enabled then
                                        local Create = Tween:Create(SilentFovRadius, TweenInfo.new(SantoWare.Silent.GunSettings.Dynamic.Time, Enum.EasingStyle[SantoWare.Silent.GunSettings.Dynamic.EasingStyle], Enum.EasingDirection[SantoWare.Silent.GunSettings.Dynamic.EasingDirection]), {Value = WeaponSettings.CloseFov})
                                        Create:Play()
                                        Create.Completed:Wait()
                                    else
                                        SilentFovRadius.Value = WeaponSettings.CloseFov
                                    end
                                end
                            elseif Magnitude < SantoWare.Silent.GunSettings.Medium_Activation then
                                if SantoWare.Silent.GunSettings.Methods.Smoothness and Script.SavedValue.AimAssistSmoothX ~= WeaponSettings.MedSmoothness then
                                    SantoWare.AimAssist.Smoothness_X = WeaponSettings.MedSmoothness
                                    SantoWare.AimAssist.Smoothness_Y = WeaponSettings.MedSmoothness
                                    Script.SavedValue.AimAssistSmoothX = WeaponSettings.MedSmoothness
                                    Script.SavedValue.AimAssistSmoothY = WeaponSettings.MedSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirSmoothness and SantoWare.AimAssist.AirSmoothness_X ~= WeaponSettings.MedAirSmoothness then
                                    SantoWare.AimAssist.AirSmoothness_X = WeaponSettings.MedAirSmoothness
                                    SantoWare.AimAssist.AirSmoothness_Y = WeaponSettings.MedAirSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.HitChance and SantoWare.Silent.HitChance ~= WeaponSettings.MedHitChance then
                                    SantoWare.Silent.HitChance = WeaponSettings.MedHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirHitChance and SantoWare.Silent.AirHitChance ~= WeaponSettings.MedAirHitChance then
                                    SantoWare.Silent.AirHitChance = WeaponSettings.MedAirHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.Prediction and SantoWare.Silent.Prediction ~= WeaponSettings.MedPrediction then
                                    SantoWare.Silent.Prediction = WeaponSettings.ClosePrediction
                                end
                                if SantoWare.Silent.GunSettings.Methods.Fov and SilentFovRadius.Value ~= WeaponSettings.MedFov then
                                    if SantoWare.Silent.GunSettings.Dynamic.Enabled then
                                        local Create = Tween:Create(SilentFovRadius, TweenInfo.new(SantoWare.Silent.GunSettings.Dynamic.Time, Enum.EasingStyle[SantoWare.Silent.GunSettings.Dynamic.EasingStyle], Enum.EasingDirection[SantoWare.Silent.GunSettings.Dynamic.EasingDirection]), {Value = WeaponSettings.MedFov})
                                        Create:Play()
                                        Create.Completed:Wait()
                                    else
                                        SilentFovRadius.Value = WeaponSettings.MedFov
                                    end
                                end
                            elseif Magnitude < SantoWare.Silent.GunSettings.Far_Activation then
                                if SantoWare.Silent.GunSettings.Methods.Smoothness and Script.SavedValue.AimAssistSmoothX ~= WeaponSettings.FarSmoothness then
                                    SantoWare.AimAssist.Smoothness_X = WeaponSettings.FarSmoothness
                                    SantoWare.AimAssist.Smoothness_Y = WeaponSettings.FarSmoothness
                                    Script.SavedValue.AimAssistSmoothX = WeaponSettings.FarSmoothness
                                    Script.SavedValue.AimAssistSmoothY = WeaponSettings.FarSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirSmoothness and SantoWare.AimAssist.AirSmoothness_X ~= WeaponSettings.FarAirSmoothness then
                                    SantoWare.AimAssist.AirSmoothness_X = WeaponSettings.FarAirSmoothness
                                    SantoWare.AimAssist.AirSmoothness_Y = WeaponSettings.FarAirSmoothness
                                end
                                if SantoWare.Silent.GunSettings.Methods.HitChance and SantoWare.Silent.HitChance ~= WeaponSettings.FarHitChance then
                                    SantoWare.Silent.HitChance = WeaponSettings.FarHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.AirHitChance and SantoWare.Silent.AirHitChance ~= WeaponSettings.FarAirHitChance then
                                    SantoWare.Silent.AirHitChance = WeaponSettings.FarAirHitChance
                                end
                                if SantoWare.Silent.GunSettings.Methods.Prediction and SantoWare.Silent.Prediction ~= WeaponSettings.FarPrediction then
                                    SantoWare.Silent.Prediction = WeaponSettings.FarPrediction
                                end
                                if SantoWare.Silent.GunSettings.Methods.Fov and SilentFovRadius.Value ~= WeaponSettings.FarFov then
                                    if SantoWare.Silent.GunSettings.Dynamic.Enabled then
                                        local Create = Tween:Create(SilentFovRadius, TweenInfo.new(SantoWare.Silent.GunSettings.Dynamic.Time, Enum.EasingStyle[SantoWare.Silent.GunSettings.Dynamic.EasingStyle], Enum.EasingDirection[SantoWare.Silent.GunSettings.Dynamic.EasingDirection]), {Value = WeaponSettings.FarFov})
                                        Create:Play()
                                        Create.Completed:Wait()
                                    else
                                        SilentFovRadius.Value = WeaponSettings.FarFov
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end)
        if not Succes then
            if SavedError3 ~= Error then
                SavedError3 = Error
                Script.Functions.CreateNotification("SomeThing Went Wrong! We Have Sent The Error Code To The Devs!", Color3.fromRGB(170, 130, 255))
                wait(0.5)
                Script.Functions.CreateNotification(Error, Color3.fromRGB(170, 130, 255))
            end
        end
        RS.Heartbeat:Wait()
    end
end))

-- // Checks Everyone In The Server And Puts It In A Table
for _, Plr in pairs(Players:GetPlayers()) do
    coroutine.resume(coroutine.create(function()
        if Plr ~= Client then
            if Client:IsFriendsWith(Plr.UserId) then
                table.insert(Script.Friends, Plr)
            end
            Script.Functions.CheckIfMod(Plr)
            Script.Functions.NewPlayer(Plr)
        end
    end))
end

-- // Checks When Players Joins And Adds Them To A Table
Players.PlayerAdded:Connect(function(Plr)
    coroutine.resume(coroutine.create(function()
        if Plr ~= Client then
            if Client:IsFriendsWith(Plr.UserId) then
                table.insert(Script.Friends, Plr)
            end
            Script.Functions.CheckIfMod(Plr)
            Script.Functions.NewPlayer(Plr)
        end
    end))
end)

-- // Checks If A Player Left And Removes Them From The Table
Players.PlayerRemoving:Connect(function(Plr)
    if table.find(Script.Friends, Plr) then
        table.remove(Script.Friends, FindPlayer)
    end
    if game.PlaceId == 2788229376 then
        Script.Functions.RemoveTarget(Plr)
    end
    if table.find(Script.EspPlayers, Plr) then
        for _, v in pairs(Script.EspPlayers[Plr]) do
            if v ~= nil then
                v:Remove()
            end
        end
        table.remove(Script.EspPlayers, Plr)
    end
end)

-- // The Functions For The Internal Commands. SHITTY
if SantoWare.Options.Internal and rconsoleprint and rconsolename then
    local InternalChatCommands = {
        clear = function()
            rconsoleclear()
        end,
        
        set = function(Path, Path2, Value)
            local CurrentPath = SantoWare[Path]
            if not CurrentPath or not CurrentPath[Path2] then return rconsoleprint("Error: Coudlnt Find Path\n") end
            CurrentPath[Path2] = Value
            rconsoleprint("> " .. tostring(Path2) .. " Is Now Set To: " .. tostring(Value) .. "\n")
        end,

        set2 = function(Path, Path2, Path3, Value)
            local CurrentPath = SantoWare[Path]
            local CurrentPath2 = CurrentPath[Path2]
            if not CurrentPath or not CurrentPath2 or CurrentPath2[Path3] then return rconsoleprint("Error: Coudlnt Find Path\n") end
            CurrentPath2[Path3] = Value
            rconsoleprint("> " .. tostring(Path3) .. " Is Now Set To: " .. tostring(Value) .. "\n")
        end,
        
        getplayers = function()
            for _, v in pairs(Players:GetChildren()) do
                if v ~= Client then
                    rconsoleprint("> " .. tostring(v).."\n")
                end
            end
        end,
        
        getplayersmagnitude = function()
            for _, v in pairs(Players:GetChildren()) do
                if v ~= Client and Script.Functions.Alive(v) and Script.Functions.Alive(Client) then
                    local GetStuds = (Client.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                    rconsoleprint("> " .. tostring(v) .. " Is " .. GetStuds .. " Studs Away From You\n")
                end
            end
        end,
        
        removeesp = function(Plr)
            if table.find(Script.EspPlayers, Players[tostring(Plr)]) then
                for i, v in pairs(Script.EspPlayers[Players[tostring(Plr)]]) do
                    if v then
                        v:Remove()
                        rconsoleprint("> SuccesFully Removed ".. tostring(i) .." \n")
                    else
                        rconsoleprint("Error: Coudlnt Find Player \n")
                    end
                end
                table.remove(Script.EspPlayers, Players[tostring(Plr)])
            end
        end,
        
        addesp = function(Plr)
            if Players[tostring(Plr)] then
                Script.Functions.NewPlayer(Players[tostring(Plr)])
                rconsoleprint("> SuccesFully Added ".. tostring(Plr) .." \n")
            else
                rconsoleprint("Error: Coudlnt Find Player \n")
            end
        end,
        
        teleport = function(Plr)
            if Script.Functions.Alive(Players[Plr]) and Script.Functions.Alive(Client) then
                Client.Character.HumanoidRootPart.CFrame = Players[Plr].Character.HumanoidRootPart.CFrame
                rconsoleprint("> SuccesFully Teleported ".. tostring(Plr) .." \n")
            else
                rconsoleprint("Error: Coudlnt Find Player \n")
            end
        end,

        exec = function(Text)
            loadstring(Text)
        end,
        
        chat = function(Text)
            if Text == ("false") then 
                if getgenv().GetChat then 
                    getgenv().GetChat:Disconnect() 
                end 
            end
            if Text == ("true") then
                local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents
                getgenv().GetChat = Event.OnMessageDoneFiltering.OnClientEvent:Connect(function(object)
                    rconsoleprint("> " .. string.format("%s : %s \n>", object.FromSpeaker, object.Message or ""))
                end)
            end
        end,
        
        discord = function(Plr)
            if setclipboard then
                setclipboard("discord.gg/SantoWare")
            end
            if http_request or request or HttpPost or syn.request then
                local Send = http_request or request or HttpPost or syn.request
                local Table = {
                    ["cmd"] = "INVITE_BROWSER",
                    ["args"] = {["code"] = "SantoWare"},
                    ["nonce"] = game:GetService("HttpService"):GenerateGUID(true)
                }
                Send({
                    Url = "http://127.0.0.1:6463/rpc?v=1",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json",
                        ["Origin"] = "https://discord.com"
                    },
                    Body = game:GetService("HttpService"):JSONEncode(Table)
                })
                rconsoleprint("> SuccesFully Invited You To The Discord\n")
            end
        end,
        
        help = function()
            rconsoleprint("\n> List of available ChatCommands:\n\n")
            rconsoleprint("> set(<Path> <Path2> <boolean> Or <string>): Sets The Table To The Value!\n")
            rconsoleprint("> set2(<Path> <Path2> <Path3> <boolean> Or <string>): Sets The Table To The Value!\n")
            rconsoleprint("> addesp(<playername>): WhiteLists The Player Esp\n")
            rconsoleprint("> removeesp(<playername>): Remove The Player Esp\n")
            rconsoleprint("> teleport(<playername>): Teleports You To The Player (RISKY)\n")
            rconsoleprint("> getplayers: prints you an list of the players\n")
            rconsoleprint("> getplayersmagnitude: Prints You An List Of The Players And How Long Away From You\n")
            rconsoleprint("> clear: Clears The Console\n")
            rconsoleprint("> discord: Gets Invites You To The Discord\n")
            rconsoleprint("> exec(<string>): Executes The String\n")
            rconsoleprint("> chat(<boolean>): Shows You People Chatting\n\n")
        end,
    }

    -- // The Main Function For Internal
    coroutine.resume(coroutine.create(function()
        while wait(0.1) do
            rconsolename("SantoWare Internal")
            rconsoleprint("> ")
            local line = rconsoleinput()
            local Command, Args = string.match(line, "(%S+)%s*(.*)")

            if Command == nil then
                return
            end

            if type(InternalChatCommands[Command]) ~= ("function") then
                rconsoleprint("\nUnknown Command: " .. Command .. "\n")
            else
                local Splitted = string.split(line, " ")
                if Splitted[2] ~= nil and Splitted[3] ~= nil and Splitted[4] ~= nil and Splitted[5] ~= nil then
                    if Splitted[5] == ("false") then 
                        Splitted[5] = false
                    elseif Splitted[5] == ("true") then 
                        Splitted[5] = true
                    end

                    local Succes, Error = pcall(InternalChatCommands[Command], Splitted[2], Splitted[3], Splitted[4], Splitted[5])
                    if not Succes then
                        rconsoleprint("\nError: " .. Error .. "\n")
                    end
                elseif Splitted[2] ~= nil and Splitted[3] ~= nil and Splitted[4] ~= nil then
                    if Splitted[4] == ("false") then 
                        Splitted[4] = false
                    elseif Splitted[4] == ("true") then 
                        Splitted[4] = true
                    end

                    local Succes, Error = pcall(InternalChatCommands[Command], Splitted[2], Splitted[3], Splitted[4])
                    if not Succes then
                        rconsoleprint("\nError: " .. Error .. "\n")
                    end
                else
                    if Command ~= ("set") or Command ~= ("set2") then
                        local Succes, Error = pcall(InternalChatCommands[Command], Args)
                        if not Succes then
                            rconsoleprint("\nError: " .. Error .. "\n")
                        end

                        rconsoleprint("\nError: Command Error\n")
                    end
                end
            end
        end
    end))
end

-- // Sends Information For Basic Stuff
if SantoWare.Options.GetInformation then
    if GetTime then
		Script.Functions.CreateNotification("Bypassing Anti Cheats", Color3.fromRGB(170, 130, 255))
		for k,v in pairs(getgc(true)) do if pcall(function() return rawget(v,"indexInstance") end) and type(rawget(v,"indexInstance")) == "table" and (rawget(v,"indexInstance"))[1] == "kick" then v.tvk = {"kick",function() return game.Workspace:WaitForChild("") end} end end
        Script.Functions.CreateNotification("Loaded In: " .. string.format("%.".."4".."f", os.clock() - GetTime) .. " Seconds", Color3.fromRGB(170, 130, 255))
    end
end
