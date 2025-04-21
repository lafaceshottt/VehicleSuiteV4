-- Core Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

-- GUI Configuration
local SIDEBAR_SIZE = UDim2.new(0, 280, 0, 650)
local SIDEBAR_POSITION_OFF = UDim2.new(0, -290, 0.5, -325)
local SIDEBAR_POSITION_ON = UDim2.new(0, 10, 0.5, -325)
local BUTTON_SIZE = UDim2.new(0, 240, 0, 50)
local SLIDER_SIZE = UDim2.new(0, 240, 0, 80)
local TOGGLE_SIZE = UDim2.new(0, 240, 0, 50)
local SPACING = UDim.new(0, 12)
local BACKGROUND_COLOR = Color3.fromRGB(25, 25, 25)
local BACKGROUND_TRANSPARENCY = 0.15
local TEXT_COLOR = Color3.fromRGB(220, 220, 220)
local TEXT_SIZE = 18
local TEXT_FONT = Enum.Font.GothamSemibold
local GLOW_COLOR = Color3.fromRGB(0, 200, 200)
local GLOW_TRANSPARENCY = 0.4
local ACCENT_COLOR = Color3.fromRGB(40, 40, 40)
local HIGHLIGHT_COLOR = Color3.fromRGB(60, 60, 60)

-- Animation Settings
local TWEEN_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)

-- GUI Initialization
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GreenvilleVehicleSuiteV2"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Enabled = true

-- Sidebar Frame
local SidebarFrame = Instance.new("Frame")
SidebarFrame.Size = SIDEBAR_SIZE
SidebarFrame.Position = SIDEBAR_POSITION_OFF
SidebarFrame.BackgroundColor3 = BACKGROUND_COLOR
SidebarFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
SidebarFrame.BorderSizePixel = 0
SidebarFrame.ClipsDescendants = true
SidebarFrame.Parent = ScreenGui

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 12)
SidebarCorner.Parent = SidebarFrame

local SidebarGlow = Instance.new("UIStroke")
SidebarGlow.Thickness = 2
SidebarGlow.Color = GLOW_COLOR
SidebarGlow.Transparency = GLOW_TRANSPARENCY
SidebarGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
SidebarGlow.Parent = SidebarFrame

-- Title and Credits
local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, 0, 0, 50)
SidebarTitle.Position = UDim2.new(0, 0, 0, 10)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "Vehicle Suite V2"
SidebarTitle.TextColor3 = TEXT_COLOR
SidebarTitle.TextSize = 26
SidebarTitle.Font = TEXT_FONT
SidebarTitle.TextXAlignment = Enum.TextXAlignment.Center
SidebarTitle.Parent = SidebarFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
CreditsLabel.Position = UDim2.new(0, 0, 0, 60)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "by WeDontGAF Community"
CreditsLabel.TextColor3 = TEXT_COLOR
CreditsLabel.TextSize = 14
CreditsLabel.Font = TEXT_FONT
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Center
CreditsLabel.Parent = SidebarFrame

-- Scrolling Content
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -90)
ScrollFrame.Position = UDim2.new(0, 0, 0, 80)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = GLOW_COLOR
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.Parent = SidebarFrame

local ScrollLayout = Instance.new("UIListLayout")
ScrollLayout.Padding = SPACING
ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ScrollLayout.Parent = ScrollFrame

-- Welcome Message
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 420, 0, 220)
WelcomeFrame.Position = UDim2.new(0.5, -210, 0.5, -110)
WelcomeFrame.BackgroundColor3 = BACKGROUND_COLOR
WelcomeFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.ZIndex = 10
WelcomeFrame.Visible = false

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 12)
WelcomeCorner.Parent = WelcomeFrame

local WelcomeGlow = Instance.new("UIStroke")
WelcomeGlow.Thickness = 2
WelcomeGlow.Color = GLOW_COLOR
WelcomeGlow.Transparency = GLOW_TRANSPARENCY
WelcomeGlow.Parent = WelcomeFrame

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 120, 0, 120)
AvatarImage.Position = UDim2.new(0.5, -60, 0, 20)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
AvatarImage.Parent = WelcomeFrame
local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 60)
AvatarCorner.Parent = AvatarImage

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, 0, 0, 50)
WelcomeText.Position = UDim2.new(0, 0, 0, 150)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name .. "!"
WelcomeText.TextColor3 = TEXT_COLOR
WelcomeText.TextSize = 26
WelcomeText.Font = TEXT_FONT
WelcomeText.TextWrapped = true
WelcomeText.Parent = WelcomeFrame

-- Helper Functions
local function CreateButton(text, parent, callback)
    local Button = Instance.new("TextButton")
    Button.Size = BUTTON_SIZE
    Button.BackgroundColor3 = ACCENT_COLOR
    Button.TextColor3 = TEXT_COLOR
    Button.TextSize = TEXT_SIZE
    Button.Font = TEXT_FONT
    Button.Text = text
    Button.BorderSizePixel = 0
    Button.Parent = parent
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(0, 8)
    ButtonCorner.Parent = Button
    local ButtonGlow = Instance.new("UIStroke")
    ButtonGlow.Thickness = 1.5
    ButtonGlow.Color = GLOW_COLOR
    ButtonGlow.Transparency = GLOW_TRANSPARENCY
    ButtonGlow.Parent = Button
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = HIGHLIGHT_COLOR, Size = UDim2.new(0, 250, 0, 55)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR, Size = BUTTON_SIZE}):Play()
    end)
    Button.MouseButton1Click:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {Size = UDim2.new(0, 230, 0, 45)}):Play()
        wait(0.1)
        TweenService:Create(Button, TWEEN_INFO, {Size = BUTTON_SIZE}):Play()
        callback()
    end)
    return Button
end

local function CreateSlider(text, parent, min, max, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = SLIDER_SIZE
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, 0, 0, 20)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = TEXT_COLOR
    Label.TextSize = TEXT_SIZE
    Label.Font = TEXT_FONT
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local SliderFrame = Instance.new("Frame")
    SliderFrame.Size = UDim2.new(1, 0, 0, 10)
    SliderFrame.Position = UDim2.new(0, 0, 0, 30)
    SliderFrame.BackgroundColor3 = ACCENT_COLOR
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = Container
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 5)
    SliderCorner.Parent = SliderFrame
    
    local SliderKnob = Instance.new("TextButton")
    SliderKnob.Size = UDim2.new(0, 20, 0, 20)
    SliderKnob.Position = UDim2.new((default - min) / (max - min), -10, 0, 25)
    SliderKnob.BackgroundColor3 = GLOW_COLOR
    SliderKnob.Text = ""
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = Container
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(0, 10)
    KnobCorner.Parent = SliderKnob
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 60, 0, 20)
    ValueLabel.Position = UDim2.new(1, -70, 0, 50)
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.TextColor3 = TEXT_COLOR
    ValueLabel.TextSize = 16
    ValueLabel.Font = TEXT_FONT
    ValueLabel.Text = tostring(default)
    ValueLabel.Parent = Container
    
    local dragging = false
    SliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            TweenService:Create(SliderKnob, TWEEN_INFO, {Size = UDim2.new(0, 24, 0, 24)}):Play()
        end
    end)
    SliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            TweenService:Create(SliderKnob, TWEEN_INFO, {Size = UDim2.new(0, 20, 0, 20)}):Play()
        end)
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
            local value = min + (max - min) * relativeX
            SliderKnob.Position = UDim2.new(relativeX, -10, 0, 25)
            ValueLabel.Text = string.format("%.1f", value)
            callback(value)
        end)
    end)
    return Container
end

local function CreateToggle(text, parent, default, callback)
    local Container = Instance.new("Frame")
    Container.Size = TOGGLE_SIZE
    Container.BackgroundTransparency = 1
    Container.Parent = parent
    
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(0.65, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = TEXT_COLOR
    Label.TextSize = TEXT_SIZE
    Label.Font = TEXT_FONT
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 50, 0, 24)
    ToggleButton.Position = UDim2.new(0.75, 0, 0, 13)
    ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    ToggleButton.Text = default and "ON" or "OFF"
    ToggleButton.TextColor3 = TEXT_COLOR
    ToggleButton.TextSize = 14
    ToggleButton.Font = TEXT_FONT
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Parent = Container
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 12)
    ToggleCorner.Parent = ToggleButton
    
    ToggleButton.MouseButton1Click:Connect(function()
        default = not default
        ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        ToggleButton.Text = default and "ON" or "OFF"
        TweenService:Create(ToggleButton, TWEEN_INFO, {Size = default and UDim2.new(0, 55, 0, 28) or UDim2.new(0, 50, 0, 24)}):Play()
        callback(default)
    end)
    return Container
end

local function Notify(message, duration)
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 300, 0, 70)
    Notification.Position = UDim2.new(0.5, -150, 0, -80)
    Notification.BackgroundColor3 = BACKGROUND_COLOR
    Notification.BackgroundTransparency = BACKGROUND_TRANSPARENCY
    Notification.Parent = ScreenGui
    Notification.ZIndex = 15
    local NotifyCorner = Instance.new("UICorner")
    NotifyCorner.CornerRadius = UDim.new(0, 10)
    NotifyCorner.Parent = Notification
    local NotifyGlow = Instance.new("UIStroke")
    NotifyGlow.Thickness = 2
    NotifyGlow.Color = GLOW_COLOR
    NotifyGlow.Transparency = GLOW_TRANSPARENCY
    NotifyGlow.Parent = Notification
    
    local NotifyText = Instance.new("TextLabel")
    NotifyText.Size = UDim2.new(1, -20, 1, -10)
    NotifyText.Position = UDim2.new(0, 10, 0, 5)
    NotifyText.BackgroundTransparency = 1
    NotifyText.Text = message
    NotifyText.TextColor3 = TEXT_COLOR
    NotifyText.TextSize = 16
    NotifyText.Font = TEXT_FONT
    NotifyText.TextWrapped = true
    NotifyText.Parent = Notification
    
    TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -150, 0, 20)}):Play()
    delay(duration or 3, function()
        TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -150, 0, -80)}):Play()
        wait(0.3)
        Notification:Destroy()
    end)
end

-- Sound Effects
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://6895079853"
ClickSound.Volume = 0.6
ClickSound.Parent = SoundService

local BoostSound = Instance.new("Sound")
BoostSound.SoundId = "rbxassetid://9113383838"
BoostSound.Volume = 0.8
BoostSound.Parent = SoundService

-- Vehicle Detection
local function GetVehicle()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    if not Humanoid then return nil end
    local SeatPart = Humanoid.SeatPart
    if SeatPart and SeatPart:IsA("VehicleSeat") then
        local vehicle = SeatPart:FindFirstAncestorOfClass("Model")
        if vehicle then
            return vehicle, SeatPart
        end
    end
    return nil
end

-- Vehicle Modification Variables
local vehicleSettings = {
    horsepowerMultiplier = 1,
    torqueMultiplier = 1,
    nitroEnabled = false,
    nitroStrength = 10,
    suspensionHeight = 0,
    driftMode = false,
    wheelSizeMultiplier = 1,
    topSpeedCap = 0,
    flightEnabled = false,
    underglowEnabled = false,
    neonColor = Color3.fromRGB(0, 200, 200),
    superSpeed = false
}

-- Particle Effects for Nitro
local function CreateNitroEffect(vehicle)
    if not vehicle then return end
    for _, part in pairs(vehicle:GetDescendants()) do
        if part:IsA("BasePart") and part.Name:lower():find("chassis") then
            local particle = Instance.new("ParticleEmitter")
            particle.Name = "NitroEffect"
            particle.Texture = "rbxassetid://243660364"
            particle.Color = ColorSequence.new(vehicleSettings.neonColor)
            particle.Size = NumberSequence.new(0.5, 0)
            particle.Lifetime = NumberRange.new(0.5, 1)
            particle.Rate = 50
            particle.Speed = NumberRange.new(10, 20)
            particle.SpreadAngle = Vector2.new(-30, 30)
            particle.Parent = part
        end
    end
end

local function RemoveNitroEffect(vehicle)
    if not vehicle then return end
    for _, particle in pairs(vehicle:GetDescendants()) do
        if particle.Name == "NitroEffect" then
            particle:Destroy()
        end
    end
end

-- Sidebar Options
CreateSlider("Horsepower Multiplier", ScrollFrame, 1, 10, 1, function(value)
    vehicleSettings.horsepowerMultiplier = value
    Notify(string.format("Horsepower set to %.1fx", value))
end)

CreateSlider("Torque Multiplier", ScrollFrame, 1, 8, 1, function(value)
    vehicleSettings.torqueMultiplier = value
    Notify(string.format("Torque set to %.1fx", value))
end)

CreateToggle("Nitro Boost", ScrollFrame, false, function(value)
    vehicleSettings.nitroEnabled = value
    local vehicle = GetVehicle()
    if vehicle and value then
        CreateNitroEffect(vehicle)
    elseif vehicle then
        RemoveNitroEffect(vehicle)
    end
    Notify("Nitro Boost " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Nitro Strength", ScrollFrame, 5, 100, 10, function(value)
    vehicleSettings.nitroStrength = value
    Notify(string.format("Nitro strength set to %.1f", value))
end)

CreateToggle("Drift Mode", ScrollFrame, false, function(value)
    vehicleSettings.driftMode = value
    Notify("Drift Mode " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Top Speed Cap", ScrollFrame, 0, 500, 0, function(value)
    vehicleSettings.topSpeedCap = value
    Notify("Top speed cap set to " .. (value == 0 and "Unlimited" or string.format("%.1f studs/sec", value)))
end)

CreateSlider("Suspension Height", ScrollFrame, -10, 10, 0, function(value)
    vehicleSettings.suspensionHeight = value
    local vehicle = GetVehicle()
    if vehicle then
        for _, spring in pairs(vehicle:GetDescendants()) do
            if spring:IsA("SpringConstraint") then
                spring.FreeLength = math.clamp(1 + value * 0.15, 0.1, 15)
            end
        end
    end
    Notify(string.format("Suspension height set to %.1f", value))
end)

CreateButton("Slam Suspension", ScrollFrame, function()
    local vehicle = GetVehicle()
    if vehicle then
        for _, spring in pairs(vehicle:GetDescendants()) do
            if spring:IsA("SpringConstraint") then
                spring.FreeLength = 0.1
            end
        end
        vehicleSettings.suspensionHeight = -10
        Notify("Suspension slammed")
    else
        Notify("No vehicle detected!")
    end
end)

CreateButton("Lift Suspension", ScrollFrame, function()
    local vehicle = GetVehicle()
    if vehicle then
        for _, spring in pairs(vehicle:GetDescendants()) do
            if spring:IsA("SpringConstraint") then
                spring.FreeLength = 15
            end
        end
        vehicleSettings.suspensionHeight = 10
        Notify("Suspension lifted")
    else
        Notify("No vehicle detected!")
    end
end)

CreateSlider("Wheel Size Multiplier", ScrollFrame, 0.5, 5, 1, function(value)
    vehicleSettings.wheelSizeMultiplier = value
    local vehicle = GetVehicle()
    if vehicle then
        for _, wheel in pairs(vehicle:GetDescendants()) do
            if wheel:IsA("BasePart") and wheel.Name:lower():find("wheel") then
                local originalSize = Vector3.new(1, 1, 1) -- Adjust if original sizes vary
                wheel.Size = originalSize * value
            end
        end
    end
    Notify(string.format("Wheel size set to %.1fx", value))
end)

CreateToggle("Flight Mode", ScrollFrame, false, function(value)
    vehicleSettings.flightEnabled = value
    local vehicle = GetVehicle()
    if vehicle then
        vehicle.PrimaryPart.Anchored = value
    end
    Notify("Flight Mode " .. (value and "Enabled" or "Disabled"))
end)

CreateToggle("Underglow", ScrollFrame, false, function(value)
    vehicleSettings.underglowEnabled = value
    local vehicle = GetVehicle()
    if vehicle and value then
        for _, part in pairs(vehicle:GetDescendants()) do
            if part:IsA("BasePart") and part.Name:lower():find("chassis") then
                local underglow = Instance.new("PointLight")
                underglow.Name = "UnderglowLight"
                underglow.Color = vehicleSettings.neonColor
                underglow.Brightness = 1
                underglow.Range = 10
                underglow.Parent = part
            end
        end
    elseif vehicle then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow:Destroy() end
        end
    end
    Notify("Underglow " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Neon Color (Red)", ScrollFrame, 0, 255, 0, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(value, vehicleSettings.neonColor.G * 255, vehicleSettings.neonColor.B * 255)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow.Color = vehicleSettings.neonColor end
        end
    end
    if vehicle and vehicleSettings.nitroEnabled then
        RemoveNitroEffect(vehicle)
        CreateNitroEffect(vehicle)
    end
    Notify("Neon color updated")
end)

CreateSlider("Neon Color (Green)", ScrollFrame, 0, 255, 200, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(vehicleSettings.neonColor.R * 255, value, vehicleSettings.neonColor.B * 255)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow.Color = vehicleSettings.neonColor end
        end
    end
    if vehicle and vehicleSettings.nitroEnabled then
        RemoveNitroEffect(vehicle)
        CreateNitroEffect(vehicle)
    end
    Notify("Neon color updated")
end)

CreateSlider("Neon Color (Blue)", ScrollFrame, 0, 255, 200, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(vehicleSettingswardrobe vehicleSettings.neonColor = Color3.fromRGB(0, 200, 200)
    vehicleSettings.neonColor = Color3.fromRGB(0, 200, 200)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            if part:IsA("BasePart") and part.Name:lower():find("chassis") then
                local underglow = Instance.new("PointLight")
                underglow.Name = "UnderglowLight"
                underglow.Color = vehicleSettings.neonColor
                underglow.Brightness = 1
                underglow.Range = 10
                underglow.Parent = part
            end
        end
    elseif vehicle then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow:Destroy() end
        end
    end
    Notify("Underglow " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Neon Color (Red)", ScrollFrame, 0, 255, 0, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(value, vehicleSettings.neonColor.G * 255, vehicleSettings.neonColor.B * 255)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow.Color = vehicleSettings.neonColor end
        end
    end
    if vehicle and vehicleSettings.nitroEnabled then
        RemoveNitroEffect(vehicle)
        CreateNitroEffect(vehicle)
    end
    Notify("Neon color updated")
end)

CreateSlider("Neon Color (Green)", ScrollFrame, 0, 255, 200, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(vehicleSettings.neonColor.R * 255, value, vehicleSettings.neonColor.B * 255)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow.Color = vehicleSettings.neonColor end
        end
    end
    if vehicle and vehicleSettings.nitroEnabled then
        RemoveNitroEffect(vehicle)
        CreateNitroEffect(vehicle)
    end
    Notify("Neon color updated")
end)

CreateSlider("Neon Color (Blue)", ScrollFrame, 0, 255, 200, function(value)
    vehicleSettings.neonColor = Color3.fromRGB(vehicleSettings.neonColor.R * 255, vehicleSettings.neonColor.B * 255, value)
    local vehicle = GetVehicle()
    if vehicle and vehicleSettings.underglowEnabled then
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow.Color = vehicleSettings.neonColor end
        end
    end
    if vehicle and vehicleSettings.nitroEnabled then
        RemoveNitroEffect(vehicle)
        CreateNitroEffect(vehicle)
    end
    Notify("Neon color updated")
end)

CreateToggle("Super Speed", ScrollFrame, false, function(value)
    vehicleSettings.superSpeed = value
    Notify("Super Speed " .. (value and "Enabled" or "Disabled"))
end)

CreateButton("Reset Vehicle", ScrollFrame, function()
    local vehicle = GetVehicle()
    if vehicle then
        vehicleSettings.horsepowerMultiplier = 1
        vehicleSettings.torqueMultiplier = 1
        vehicleSettings.nitroEnabled = false
        vehicleSettings.nitroStrength = 10
        vehicleSettings.suspensionHeight = 0
        vehicleSettings.driftMode = false
        vehicleSettings.wheelSizeMultiplier = 1
        vehicleSettings.topSpeedCap = 0
        vehicleSettings.flightEnabled = false
        vehicleSettings.underglowEnabled = false
        vehicleSettings.neonColor = Color3.fromRGB(0, 200, 200)
        vehicleSettings.superSpeed = false
        for _, spring in pairs(vehicle:GetDescendants()) do
            if spring:IsA("SpringConstraint") then
                spring.FreeLength = 1
            end
        end
        for _, wheel in pairs(vehicle:GetDescendants()) do
            if wheel:IsA("BasePart") and wheel.Name:lower():find("wheel") then
                wheel.Size = Vector3.new(1, 1, 1)
            end
        end
        for _, part in pairs(vehicle:GetDescendants()) do
            local glow = part:FindFirstChild("UnderglowLight")
            if glow then glow:Destroy() end
        end
        RemoveNitroEffect(vehicle)
        if vehicle.PrimaryPart then
            vehicle.PrimaryPart.Anchored = false
        end
        Notify("Vehicle reset to default")
    else
        Notify("No vehicle detected!")
    end
end)

-- Update Scroll Canvas Size
local function UpdateCanvasSize()
    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollLayout.AbsoluteContentSize.Y + 30)
end
ScrollLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(UpdateCanvasSize)
UpdateCanvasSize()

-- Physics Logic
RunService.Heartbeat:Connect(function(deltaTime)
    local vehicle, seatPart = GetVehicle()
    if not vehicle or not seatPart or not vehicle.PrimaryPart then return end
    
    local velocity = seatPart.AssemblyLinearVelocity
    local forwardVector = seatPart.CFrame.LookVector
    local adjustedVelocity = velocity

    -- Apply Horsepower and Torque
    adjustedVelocity = adjustedVelocity * (1 + (vehicleSettings.horsepowerMultiplier - 1) * 0.15)
    if vehicleSettings.driftMode then
        adjustedVelocity = adjustedVelocity + (forwardVector * vehicleSettings.torqueMultiplier * 0.3)
        seatPart.AssemblyAngularVelocity = Vector3.new(0, vehicleSettings.torqueMultiplier * 1.2, 0)
    end

    -- Nitro Boost
    if vehicleSettings.nitroEnabled and UserInputService:IsKeyDown(Enum.KeyCode.W) then
        adjustedVelocity = adjustedVelocity + (forwardVector * vehicleSettings.nitroStrength * deltaTime * 60)
        if not BoostSound.IsPlaying then
            BoostSound:Play()
        end
    else
        BoostSound:Stop()
    end

    -- Super Speed
    if vehicleSettings.superSpeed then
        adjustedVelocity = adjustedVelocity * 2
    end

    -- Top Speed Cap
    if vehicleSettings.topSpeedCap > 0 and adjustedVelocity.Magnitude > vehicleSettings.topSpeedCap then
        adjustedVelocity = adjustedVelocity.Unit * vehicleSettings.topSpeedCap
    end

    -- Flight Mode
    if vehicleSettings.flightEnabled then
        vehicle.Parent = workspace
        local moveVector = Vector3.new(
            (UserInputService:IsKeyDown(Enum.KeyCode.D) and 80) or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -80) or 0,
            (UserInputService:IsKeyDown(Enum.KeyCode.E) and 40) or (UserInputService:IsKeyDown(Enum.KeyCode.Q) and -40) or 0,
            (UserInputService:IsKeyDown(Enum.KeyCode.W) and -80) or (UserInputService:IsKeyDown(Enum.KeyCode.S) and 80) or 0
        )
        seatPart.AssemblyLinearVelocity = moveVector
        seatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    else
        seatPart.AssemblyLinearVelocity = adjustedVelocity
    end

    -- Suspension Update
    for _, spring in pairs(vehicle:GetDescendants()) do
        if spring:IsA("SpringConstraint") then
            spring.FreeLength = math.clamp(1 + vehicleSettings.suspensionHeight * 0.15, 0.1, 15)
        end
    end
end)

-- GUI Toggle Logic
local isSidebarOpen = false
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or input.KeyCode ~= Enum.KeyCode.RightShift then return end
    ClickSound:Play()
    if not isSidebarOpen then
        WelcomeFrame.Visible = true
        TweenService:Create(WelcomeFrame, TWEEN_INFO, {Size = UDim2.new(0, 440, 0, 240)}):Play()
        delay(2.5, function()
            TweenService:Create(WelcomeFrame, TWEEN_INFO, {Size = UDim2.new(0, 420, 0, 220)}):Play()
            wait(0.3)
            WelcomeFrame.Visible = false
            TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_ON}):Play()
            isSidebarOpen = true
            Notify("Vehicle Suite V2 by WeDontGAF Community - Enjoy!", 5)
        end)
    else
        TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_OFF}):Play()
        isSidebarOpen = false
    end
end)

-- Initial Checks
if game.PlaceId ~= 891852901 then
    Notify("This script is designed for Greenville only!", 5)
end
Notify("Press Right Shift to open Vehicle Suite V2", 4)

-- Cleanup on Player Removal
LocalPlayer.CharacterRemoving:Connect(function()
    BoostSound:Stop()
end)

print("Greenville Vehicle Suite V2 initialized")
