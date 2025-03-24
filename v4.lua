-- Core Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local LocalPlayer = Players.LocalPlayer

-- GUI Configuration
local BACKGROUND_COLOR = Color3.fromRGB(30, 30, 30)
local BACKGROUND_TRANSPARENCY = 0.2
local TEXT_COLOR = Color3.fromRGB(200, 200, 200)
local TEXT_SIZE = 18
local TEXT_FONT = Enum.Font.GothamBold
local GLOW_COLOR = Color3.fromRGB(100, 100, 100)
local GLOW_TRANSPARENCY = 0.5
local ACCENT_COLOR = Color3.fromRGB(50, 50, 50)
local HIGHLIGHT_COLOR = Color3.fromRGB(70, 70, 70)
local TWEEN_INFO = TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

-- Sidebar Configuration
local SIDEBAR_SIZE = UDim2.new(0, 250, 0, 600)
local SIDEBAR_POSITION_OFF = UDim2.new(0, -260, 0.5, -300)
local SIDEBAR_POSITION_ON = UDim2.new(0, 10, 0.5, -300)
local BUTTON_SIZE = UDim2.new(0, 200, 0, 50)
local SLIDER_SIZE = UDim2.new(0, 200, 0, 80)
local TOGGLE_SIZE = UDim2.new(0, 200, 0, 50)
local SPACING = UDim.new(0, 15)

-- GUI Initialization
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GreenvilleVehicleSuiteV4"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Enabled = true
print("ScreenGui initialized")

-- Welcome Frame
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 400, 0, 200)
WelcomeFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
WelcomeFrame.BackgroundColor3 = BACKGROUND_COLOR
WelcomeFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.ZIndex = 10

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 15)
WelcomeCorner.Parent = WelcomeFrame

local WelcomeGlow = Instance.new("UIStroke")
WelcomeGlow.Thickness = 2
WelcomeGlow.Color = GLOW_COLOR
WelcomeGlow.Transparency = GLOW_TRANSPARENCY
WelcomeGlow.Parent = WelcomeFrame

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 100, 0, 100)
AvatarImage.Position = UDim2.new(0.5, -50, 0, 20)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
AvatarImage.Parent = WelcomeFrame
local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 50)
AvatarCorner.Parent = AvatarImage

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, 0, 0, 40)
WelcomeText.Position = UDim2.new(0, 0, 0, 130)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name .. "!"
WelcomeText.TextColor3 = TEXT_COLOR
WelcomeText.TextSize = 24
WelcomeText.Font = TEXT_FONT
WelcomeText.TextWrapped = true
WelcomeText.Parent = WelcomeFrame
print("WelcomeFrame setup complete")

-- Version Selection Menu
local VersionMenu = Instance.new("Frame")
VersionMenu.Size = UDim2.new(0, 300, 0, 400)
VersionMenu.Position = UDim2.new(0.5, -150, 0.5, -200)
VersionMenu.BackgroundColor3 = BACKGROUND_COLOR
VersionMenu.BackgroundTransparency = BACKGROUND_TRANSPARENCY
VersionMenu.Parent = ScreenGui
VersionMenu.ZIndex = 15
VersionMenu.Visible = false

local VersionCorner = Instance.new("UICorner")
VersionCorner.CornerRadius = UDim.new(0, 15)
VersionCorner.Parent = VersionMenu

local VersionGlow = Instance.new("UIStroke")
VersionGlow.Thickness = 2
VersionGlow.Color = GLOW_COLOR
VersionGlow.Transparency = GLOW_TRANSPARENCY
VersionGlow.Parent = VersionMenu

local VersionTitle = Instance.new("TextLabel")
VersionTitle.Size = UDim2.new(1, 0, 0, 50)
VersionTitle.Position = UDim2.new(0, 0, 0, 20)
VersionTitle.BackgroundTransparency = 1
VersionTitle.Text = "Select Version"
VersionTitle.TextColor3 = TEXT_COLOR
VersionTitle.TextSize = 28
VersionTitle.Font = TEXT_FONT
VersionTitle.TextXAlignment = Enum.TextXAlignment.Center
VersionTitle.Parent = VersionMenu

local FreeButton = Instance.new("TextButton")
FreeButton.Size = UDim2.new(0, 200, 0, 60)
FreeButton.Position = UDim2.new(0.5, -100, 0, 100)
FreeButton.BackgroundColor3 = ACCENT_COLOR
FreeButton.TextColor3 = TEXT_COLOR
FreeButton.TextSize = 20
FreeButton.Font = TEXT_FONT
FreeButton.Text = "Free Version"
FreeButton.BorderSizePixel = 0
FreeButton.Parent = VersionMenu
local FreeCorner = Instance.new("UICorner")
FreeCorner.CornerRadius = UDim.new(0, 10)
FreeCorner.Parent = FreeButton
local FreeGlow = Instance.new("UIStroke")
FreeGlow.Thickness = 1
FreeGlow.Color = GLOW_COLOR
FreeGlow.Transparency = GLOW_TRANSPARENCY
FreeGlow.Parent = FreeButton

local PaidButton = Instance.new("TextButton")
PaidButton.Size = UDim2.new(0, 200, 0, 60)
PaidButton.Position = UDim2.new(0.5, -100, 0, 180)
PaidButton.BackgroundColor3 = ACCENT_COLOR
PaidButton.TextColor3 = TEXT_COLOR
PaidButton.TextSize = 20
PaidButton.Font = TEXT_FONT
PaidButton.Text = "Paid Version"
PaidButton.BorderSizePixel = 0
PaidButton.Parent = VersionMenu
local PaidCorner = Instance.new("UICorner")
PaidCorner.CornerRadius = UDim.new(0, 10)
PaidCorner.Parent = PaidButton
local PaidGlow = Instance.new("UIStroke")
PaidGlow.Thickness = 1
PaidGlow.Color = GLOW_COLOR
PaidGlow.Transparency = GLOW_TRANSPARENCY
PaidGlow.Parent = PaidButton

-- Paid Version Not Available Screen
local PaidScreen = Instance.new("Frame")
PaidScreen.Size = UDim2.new(0, 300, 0, 400)
PaidScreen.Position = UDim2.new(0.5, -150, 0.5, -200)
PaidScreen.BackgroundColor3 = BACKGROUND_COLOR
PaidScreen.BackgroundTransparency = BACKGROUND_TRANSPARENCY
PaidScreen.Parent = ScreenGui
PaidScreen.ZIndex = 20
PaidScreen.Visible = false

local PaidCorner = Instance.new("UICorner")
PaidCorner.CornerRadius = UDim.new(0, 15)
PaidCorner.Parent = PaidScreen

local PaidGlow = Instance.new("UIStroke")
PaidGlow.Thickness = 2
PaidGlow.Color = GLOW_COLOR
PaidGlow.Transparency = GLOW_TRANSPARENCY
PaidGlow.Parent = PaidScreen

local PaidText = Instance.new("TextLabel")
PaidText.Size = UDim2.new(1, 0, 0, 100)
PaidText.Position = UDim2.new(0, 0, 0, 100)
PaidText.BackgroundTransparency = 1
PaidText.Text = "Not Available\nWork in Progress"
PaidText.TextColor3 = TEXT_COLOR
PaidText.TextSize = 24
PaidText.Font = TEXT_FONT
PaidText.TextWrapped = true
PaidText.TextXAlignment = Enum.TextXAlignment.Center
PaidText.Parent = PaidScreen

local BackButton = Instance.new("TextButton")
BackButton.Size = UDim2.new(0, 200, 0, 60)
BackButton.Position = UDim2.new(0.5, -100, 0, 250)
BackButton.BackgroundColor3 = ACCENT_COLOR
BackButton.TextColor3 = TEXT_COLOR
BackButton.TextSize = 20
BackButton.Font = TEXT_FONT
BackButton.Text = "Back"
BackButton.BorderSizePixel = 0
BackButton.Parent = PaidScreen
local BackCorner = Instance.new("UICorner")
BackCorner.CornerRadius = UDim.new(0, 10)
BackCorner.Parent = BackButton
local BackGlow = Instance.new("UIStroke")
BackGlow.Thickness = 1
BackGlow.Color = GLOW_COLOR
BackGlow.Transparency = GLOW_TRANSPARENCY
BackGlow.Parent = BackButton

-- Sidebar Frame (Loaded Later)
local SidebarFrame
local function InitializeSidebar()
    SidebarFrame = Instance.new("Frame")
    SidebarFrame.Size = SIDEBAR_SIZE
    SidebarFrame.Position = SIDEBAR_POSITION_OFF
    SidebarFrame.BackgroundColor3 = BACKGROUND_COLOR
    SidebarFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
    SidebarFrame.BorderSizePixel = 0
    SidebarFrame.ClipsDescendants = true
    SidebarFrame.Parent = ScreenGui
    print("SidebarFrame created")

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 15)
    SidebarCorner.Parent = SidebarFrame

    local SidebarGlow = Instance.new("UIStroke")
    SidebarGlow.Thickness = 2
    SidebarGlow.Color = GLOW_COLOR
    SidebarGlow.Transparency = GLOW_TRANSPARENCY
    SidebarGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    SidebarGlow.Parent = SidebarFrame

    local SidebarTitle = Instance.new("TextLabel")
    SidebarTitle.Size = UDim2.new(1, 0, 0, 40)
    SidebarTitle.Position = UDim2.new(0, 0, 0, 10)
    SidebarTitle.BackgroundTransparency = 1
    SidebarTitle.Text = "Vehicle Suite V4"
    SidebarTitle.TextColor3 = TEXT_COLOR
    SidebarTitle.TextSize = 24
    SidebarTitle.Font = TEXT_FONT
    SidebarTitle.TextXAlignment = Enum.TextXAlignment.Center
    SidebarTitle.Parent = SidebarFrame

    local CreditsLabel = Instance.new("TextLabel")
    CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
    CreditsLabel.Position = UDim2.new(0, 0, 0, 40)
    CreditsLabel.BackgroundTransparency = 1
    CreditsLabel.Text = "by WeDontGAF Community"
    CreditsLabel.TextColor3 = TEXT_COLOR
    CreditsLabel.TextSize = 14
    CreditsLabel.Font = TEXT_FONT
    CreditsLabel.TextXAlignment = Enum.TextXAlignment.Center
    CreditsLabel.Parent = SidebarFrame

    local ScrollFrame = Instance.new("ScrollingFrame")
    ScrollFrame.Size = UDim2.new(1, 0, 1, -70)
    ScrollFrame.Position = UDim2.new(0, 0, 0, 60)
    ScrollFrame.BackgroundTransparency = 1
    ScrollFrame.ScrollBarThickness = 5
    ScrollFrame.ScrollBarImageColor3 = GLOW_COLOR
    ScrollFrame.Parent = SidebarFrame

    local ScrollLayout = Instance.new("UIListLayout")
    ScrollLayout.Padding = SPACING
    ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ScrollLayout.Parent = ScrollFrame

    return ScrollFrame
end

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
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button
    local ButtonGlow = Instance.new("UIStroke")
    ButtonGlow.Thickness = 1
    ButtonGlow.Color = GLOW_COLOR
    ButtonGlow.Transparency = GLOW_TRANSPARENCY
    ButtonGlow.Parent = Button
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = HIGHLIGHT_COLOR, Size = UDim2.new(0, 210, 0, 55)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR, Size = BUTTON_SIZE}):Play()
    end)
    Button.MouseButton1Click:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {Size = UDim2.new(0, 190, 0, 45)}):Play()
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
    SliderFrame.Size = UDim2.new(1, 0, 0, 15)
    SliderFrame.Position = UDim2.new(0, 0, 0, 30)
    SliderFrame.BackgroundColor3 = ACCENT_COLOR
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Parent = Container
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 7)
    SliderCorner.Parent = SliderFrame
    
    local SliderKnob = Instance.new("TextButton")
    SliderKnob.Size = UDim2.new(0, 20, 0, 20)
    SliderKnob.Position = UDim2.new((default - min) / (max - min), -10, 0, 27.5)
    SliderKnob.BackgroundColor3 = TEXT_COLOR
    SliderKnob.Text = ""
    SliderKnob.BorderSizePixel = 0
    SliderKnob.Parent = Container
    local KnobCorner = Instance.new("UICorner")
    KnobCorner.CornerRadius = UDim.new(0, 10)
    KnobCorner.Parent = SliderKnob
    
    local ValueLabel = Instance.new("TextLabel")
    ValueLabel.Size = UDim2.new(0, 50, 0, 20)
    ValueLabel.Position = UDim2.new(1, -60, 0, 55)
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
            TweenService:Create(SliderKnob, TWEEN_INFO, {Size = UDim2.new(0, 25, 0, 25)}):Play()
        end)
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
            SliderKnob.Position = UDim2.new(relativeX, -10, 0, 27.5)
            ValueLabel.Text = math.floor(value)
            callback(math.floor(value))
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
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.TextColor3 = TEXT_COLOR
    Label.TextSize = TEXT_SIZE
    Label.Font = TEXT_FONT
    Label.Text = text
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Container
    
    local ToggleButton = Instance.new("TextButton")
    ToggleButton.Size = UDim2.new(0, 40, 0, 20)
    ToggleButton.Position = UDim2.new(0.8, 0, 0, 15)
    ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    ToggleButton.Text = default and "ON" or "OFF"
    ToggleButton.TextColor3 = TEXT_COLOR
    ToggleButton.TextSize = 14
    ToggleButton.Font = TEXT_FONT
    ToggleButton.BorderSizePixel = 0
    ToggleButton.Parent = Container
    local ToggleCorner = Instance.new("UICorner")
    ToggleCorner.CornerRadius = UDim.new(0, 10)
    ToggleCorner.Parent = ToggleButton
    
    ToggleButton.MouseButton1Click:Connect(function()
        default = not default
        ToggleButton.BackgroundColor3 = default and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
        ToggleButton.Text = default and "ON" or "OFF"
        TweenService:Create(ToggleButton, TWEEN_INFO, {Size = default and UDim2.new(0, 45, 0, 25) or UDim2.new(0, 40, 0, 20)}):Play()
        callback(default)
    end)
    return Container
end

-- Notification System
local function Notify(message, duration)
    local Notification = Instance.new("Frame")
    Notification.Size = UDim2.new(0, 250, 0, 60)
    Notification.Position = UDim2.new(0.5, -125, 0, -70)
    Notification.BackgroundColor3 = BACKGROUND_COLOR
    Notification.BackgroundTransparency = BACKGROUND_TRANSPARENCY
    Notification.Parent = ScreenGui
    Notification.ZIndex = 25
    local NotifyCorner = Instance.new("UICorner")
    NotifyCorner.CornerRadius = UDim.new(0, 10)
    NotifyCorner.Parent = Notification
    local NotifyGlow = Instance.new("UIStroke")
    NotifyGlow.Thickness = 2
    NotifyGlow.Color = GLOW_COLOR
    NotifyGlow.Transparency = GLOW_TRANSPARENCY
    NotifyGlow.Parent = Notification
    
    local NotifyText = Instance.new("TextLabel")
    NotifyText.Size = UDim2.new(1, 0, 1, 0)
    NotifyText.BackgroundTransparency = 1
    NotifyText.Text = message
    NotifyText.TextColor3 = TEXT_COLOR
    NotifyText.TextSize = 16
    NotifyText.Font = TEXT_FONT
    NotifyText.TextWrapped = true
    NotifyText.Parent = Notification
    
    TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -125, 0, 10)}):Play()
    delay(duration or 3, function()
        TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -125, 0, -70)}):Play()
        wait(0.4)
        Notification:Destroy()
    end)
end

-- Sound Effects
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://6895079853"
ClickSound.Volume = 0.5
ClickSound.Parent = SoundService

-- Vehicle Detection
local function GetVehicle()
    local Character = LocalPlayer.Character
    if not Character then return nil end
    local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
    if not Humanoid then return nil end
    local SeatPart = Humanoid.SeatPart
    if SeatPart and SeatPart:IsA("VehicleSeat") then
        return SeatPart:FindFirstAncestorOfClass("Model")
    end
    return nil
end

-- Vehicle Modification Variables
local torqueMultiplier = 1
local boostEnabled = false
local boostStrength = 10
local suspensionHeight = 0
local driftMode = false
local wheelSizeMultiplier = 1
local topSpeedCap = 0
local flightEnabled = false
local underglowEnabled = false

-- Sidebar Setup Function
local function SetupSidebar()
    local ScrollFrame = InitializeSidebar()
    
    CreateSlider("Torque Multiplier", ScrollFrame, 1, 5, 1, function(value)
        torqueMultiplier = value
        Notify("Torque set to " .. value .. "x")
    end)

    CreateToggle("Boost Enabled", ScrollFrame, false, function(value)
        boostEnabled = value
        Notify("Boost " .. (value and "Enabled" or "Disabled"))
    end)

    CreateSlider("Boost Strength", ScrollFrame, 0, 50, 10, function(value)
        boostStrength = value
        Notify("Boost strength set to " .. value)
    end)

    CreateToggle("Drift Mode", ScrollFrame, false, function(value)
        driftMode = value
        Notify("Drift Mode " .. (value and "Enabled" or "Disabled"))
    end)

    CreateSlider("Top Speed Cap", ScrollFrame, 0, 300, 0, function(value)
        topSpeedCap = value
        Notify("Top speed cap set to " .. (value == 0 and "Unlimited" or value .. " studs/sec"))
    end)

    CreateSlider("Suspension Height", ScrollFrame, -5, 5, 0, function(value)
        suspensionHeight = value
        local Vehicle = GetVehicle()
        if Vehicle then
            for _, spring in pairs(Vehicle:GetDescendants()) do
                if spring:IsA("SpringConstraint") then
                    spring.FreeLength = math.clamp(1 + value * 0.2, 0.1, 10)
                end
            end
        end
        Notify("Suspension height set to " .. value)
    end)

    CreateButton("Slam Suspension", ScrollFrame, function()
        local Vehicle = GetVehicle()
        if Vehicle then
            for _, spring in pairs(Vehicle:GetDescendants()) do
                if spring:IsA("SpringConstraint") then
                    spring.FreeLength = 0.1
                end
            end
            suspensionHeight = -5
            Notify("Suspension slammed")
        end
    end)

    CreateButton("Lift Suspension", ScrollFrame, function()
        local Vehicle = GetVehicle()
        if Vehicle then
            for _, spring in pairs(Vehicle:GetDescendants()) do
                if spring:IsA("SpringConstraint") then
                    spring.FreeLength = 10
                end
            end
            suspensionHeight = 5
            Notify("Suspension lifted")
        end
    end)

    CreateSlider("Wheel Size Multiplier", ScrollFrame, 0.5, 4, 1, function(value)
        wheelSizeMultiplier = value
        local Vehicle = GetVehicle()
        if Vehicle then
            for _, wheel in pairs(Vehicle:GetDescendants()) do
                if wheel:IsA("BasePart") and wheel.Name:lower():find("wheel") then
                    wheel.Size = Vector3.new(1, 1, 1) * value
                end
            end
        end
        Notify("Wheel size set to " .. value .. "x")
    end)

    CreateToggle("Flight Mode", ScrollFrame, false, function(value)
        flightEnabled = value
        Notify("Flight Mode " .. (value and "Enabled" or "Disabled"))
    end)

    CreateToggle("Car Underglow", ScrollFrame, false, function(value)
        underglowEnabled = value
        local Vehicle = GetVehicle()
        if Vehicle and value then
            for _, part in pairs(Vehicle:GetDescendants()) do
                if part:IsA("BasePart") and part.Name:lower():find("chassis") then
                    local Underglow = Instance.new("PointLight")
                    Underglow.Name = "UnderglowLight"
                    Underglow.Color = Color3.fromRGB(0, 200, 200)
                    Underglow.Brightness = 0.5
                    Underglow.Range = 8
                    Underglow.Parent = part
                end
            end
        elseif Vehicle then
            for _, part in pairs(Vehicle:GetDescendants()) do
                local glow = part:FindFirstChild("UnderglowLight")
                if glow then glow:Destroy() end
            end
        end
        Notify("Underglow " .. (value and "Enabled" or "Disabled"))
    end)

    CreateButton("Reset Vehicle", ScrollFrame, function()
        local Vehicle = GetVehicle()
        if Vehicle then
            torqueMultiplier = 1
            boostEnabled = false
            boostStrength = 10
            suspensionHeight = 0
            driftMode = false
            wheelSizeMultiplier = 1
            topSpeedCap = 0
            flightEnabled = false
            underglowEnabled = false
            for _, spring in pairs(Vehicle:GetDescendants()) do
                if spring:IsA("SpringConstraint") then
                    spring.FreeLength = 1
                end
            end
            for _, wheel in pairs(Vehicle:GetDescendants()) do
                if wheel:IsA("BasePart") and wheel.Name:lower():find("wheel") then
                    wheel.Size = Vector3.new(1, 1, 1)
                end
            end
            for _, part in pairs(Vehicle:GetDescendants()) do
                local glow = part:FindFirstChild("UnderglowLight")
                if glow then glow:Destroy() end
            end
            Notify("Vehicle reset to default")
        end
    end)

    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollLayout.AbsoluteContentSize.Y + 20)
    print("Sidebar options added")
end

-- Physics Logic
RunService.Stepped:Connect(function()
    local Vehicle = GetVehicle()
    if not Vehicle or not Vehicle.PrimaryPart then return end
    local SeatPart = Vehicle:FindFirstChildWhichIsA("VehicleSeat")
    if not SeatPart then return end
    
    local velocity = SeatPart.AssemblyLinearVelocity
    local forwardVector = SeatPart.CFrame.LookVector
    local adjustedVelocity = velocity * (1 + (torqueMultiplier - 1) * 0.2)
    if driftMode then
        adjustedVelocity = adjustedVelocity + (forwardVector * torqueMultiplier * 0.2)
        SeatPart.AssemblyAngularVelocity = Vector3.new(0, torqueMultiplier * 0.8, 0)
    end
    if boostEnabled and UserInputService:IsKeyDown(Enum.KeyCode.W) then
        adjustedVelocity = adjustedVelocity + (forwardVector * boostStrength)
    end
    if topSpeedCap > 0 then
        adjustedVelocity = adjustedVelocity.Magnitude > topSpeedCap and adjustedVelocity.Unit * topSpeedCap or adjustedVelocity
    end
    
    if flightEnabled then
        Vehicle.Parent = workspace
        SeatPart.AssemblyLinearVelocity = Vector3.new(
            (UserInputService:IsKeyDown(Enum.KeyCode.D) and 50) or (UserInputService:IsKeyDown(Enum.KeyCode.A) and -50) or 0,
            (UserInputService:IsKeyDown(Enum.KeyCode.E) and 20) or (UserInputService:IsKeyDown(Enum.KeyCode.Q) and -20) or 0,
            (UserInputService:IsKeyDown(Enum.KeyCode.W) and -50) or (UserInputService:IsKeyDown(Enum.KeyCode.S) and 50) or 0
        )
        SeatPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    else
        SeatPart.AssemblyLinearVelocity = adjustedVelocity
    end
    
    for _, spring in pairs(Vehicle:GetDescendants()) do
        if spring:IsA("SpringConstraint") then
            spring.FreeLength = math.clamp(1 + suspensionHeight * 0.2, 0.1, 10)
        end
    end
end)

-- Menu Logic
WelcomeFrame.Visible = true
TweenService:Create(WelcomeFrame, TWEEN_INFO, {Size = UDim2.new(0, 420, 0, 220)}):Play()
delay(2, function()
    TweenService:Create(WelcomeFrame, TWEEN_INFO, {Size = UDim2.new(0, 400, 0, 200)}):Play()
    wait(0.4)
    WelcomeFrame.Visible = false
    VersionMenu.Visible = true
    print("VersionMenu shown")
end)

FreeButton.MouseButton1Click:Connect(function()
    ClickSound:Play()
    VersionMenu.Visible = false
    SetupSidebar()
    Notify("Free Version Loaded - Press Right Shift to toggle", 5)
    local isSidebarOpen = false
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
            print("Right Shift pressed")
            if not isSidebarOpen then
                TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_ON}):Play()
                isSidebarOpen = true
                Notify("Vehicle Suite V4 by WeDontGAF Community", 3)
                print("Sidebar opened")
            else
                TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_OFF}):Play()
                isSidebarOpen = false
                print("Sidebar closed")
            end
            ClickSound:Play()
        end
    end)
end)

PaidButton.MouseButton1Click:Connect(function()
    ClickSound:Play()
    VersionMenu.Visible = false
    PaidScreen.Visible = true
    print("PaidScreen shown")
end)

BackButton.MouseButton1Click:Connect(function()
    ClickSound:Play()
    PaidScreen.Visible = false
    VersionMenu.Visible = true
    print("Back to VersionMenu")
end)

-- Initial Checks
if game.PlaceId ~= 891852901 then
    Notify("This script is for Greenville only!", 5)
end
print("Script V4 initialized")
