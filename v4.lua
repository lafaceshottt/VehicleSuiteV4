-- Core Roblox Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- GUI Configuration (Inspired by zerzv)
local SIDEBAR_SIZE = UDim2.new(0, 300, 0, 500)
local SIDEBAR_POSITION_OFF = UDim2.new(0, -310, 0.5, -250)
local SIDEBAR_POSITION_ON = UDim2.new(0, 10, 0.5, -250)
local BUTTON_SIZE = UDim2.new(0, 250, 0, 50)
local SLIDER_SIZE = UDim2.new(0, 250, 0, 80)
local TOGGLE_SIZE = UDim2.new(0, 250, 0, 50)
local SPACING = UDim.new(0, 10)
local BACKGROUND_COLOR = Color3.fromRGB(20, 20, 20)
local BACKGROUND_TRANSPARENCY = 0.1
local TEXT_COLOR = Color3.fromRGB(220, 220, 220)
local TEXT_SIZE = 16
local TEXT_FONT = Enum.Font.GothamBold
local GLOW_COLOR = Color3.fromRGB(0, 200, 255)
local GLOW_TRANSPARENCY = 0.4
local ACCENT_COLOR = Color3.fromRGB(40, 40, 40)
local HIGHLIGHT_COLOR = Color3.fromRGB(60, 60, 60)

-- Animation Settings
local TWEEN_INFO = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local WELCOME_TWEEN_INFO = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

-- GUI Initialization
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TrackAndFieldExploit"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
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
SidebarCorner.CornerRadius = UDim.new(0, 15)
SidebarCorner.Parent = SidebarFrame

local SidebarGlow = Instance.new("UIStroke")
SidebarGlow.Thickness = 2
SidebarGlow.Color = GLOW_COLOR
SidebarGlow.Transparency = GLOW_TRANSPARENCY
SidebarGlow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
SidebarGlow.Parent = SidebarFrame

-- Title and Credits
local SidebarTitle = Instance.new("TextLabel")
SidebarTitle.Size = UDim2.new(1, 0, 0, 40)
SidebarTitle.Position = UDim2.new(0, 0, 0, 10)
SidebarTitle.BackgroundTransparency = 1
SidebarTitle.Text = "Track & Field Exploit"
SidebarTitle.TextColor3 = TEXT_COLOR
SidebarTitle.TextSize = 22
SidebarTitle.Font = TEXT_FONT
SidebarTitle.TextXAlignment = Enum.TextXAlignment.Center
SidebarTitle.Parent = SidebarFrame

local CreditsLabel = Instance.new("TextLabel")
CreditsLabel.Size = UDim2.new(1, 0, 0, 20)
CreditsLabel.Position = UDim2.new(0, 0, 0, 40)
CreditsLabel.BackgroundTransparency = 1
CreditsLabel.Text = "Made by zerzll"
CreditsLabel.TextColor3 = TEXT_COLOR
CreditsLabel.TextSize = 14
CreditsLabel.Font = TEXT_FONT
CreditsLabel.TextXAlignment = Enum.TextXAlignment.Center
CreditsLabel.Parent = SidebarFrame

-- Scrolling Content
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -70)
ScrollFrame.Position = UDim2.new(0, 0, 0, 60)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = GLOW_COLOR
ScrollFrame.Parent = SidebarFrame

local ScrollLayout = Instance.new("UIListLayout")
ScrollLayout.Padding = SPACING
ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScrollLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
ScrollLayout.Parent = ScrollFrame

-- Welcome Message
local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 350, 0, 180)
WelcomeFrame.Position = UDim2.new(0.5, -175, 0.5, -90)
WelcomeFrame.BackgroundColor3 = BACKGROUND_COLOR
WelcomeFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
WelcomeFrame.Parent = ScreenGui
WelcomeFrame.ZIndex = 10
WelcomeFrame.Visible = false

local WelcomeCorner = Instance.new("UICorner")
WelcomeCorner.CornerRadius = UDim.new(0, 15)
WelcomeCorner.Parent = WelcomeFrame

local WelcomeGlow = Instance.new("UIStroke")
WelcomeGlow.Thickness = 2
WelcomeGlow.Color = GLOW_COLOR
WelcomeGlow.Transparency = GLOW_TRANSPARENCY
WelcomeGlow.Parent = WelcomeFrame

local AvatarImage = Instance.new("ImageLabel")
AvatarImage.Size = UDim2.new(0, 80, 0, 80)
AvatarImage.Position = UDim2.new(0.5, -40, 0, 20)
AvatarImage.BackgroundTransparency = 1
AvatarImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
AvatarImage.Parent = WelcomeFrame
local AvatarCorner = Instance.new("UICorner")
AvatarCorner.CornerRadius = UDim.new(0, 40)
AvatarCorner.Parent = AvatarImage

local WelcomeText = Instance.new("TextLabel")
WelcomeText.Size = UDim2.new(1, 0, 0, 40)
WelcomeText.Position = UDim2.new(0, 0, 0, 110)
WelcomeText.BackgroundTransparency = 1
WelcomeText.Text = "Welcome, " .. LocalPlayer.Name .. "!"
WelcomeText.TextColor3 = TEXT_COLOR
WelcomeText.TextSize = 20
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
    ButtonCorner.CornerRadius = UDim.new(0, 10)
    ButtonCorner.Parent = Button
    
    local ButtonGlow = Instance.new("UIStroke")
    ButtonGlow.Thickness = 1
    ButtonGlow.Color = GLOW_COLOR
    ButtonGlow.Transparency = GLOW_TRANSPARENCY
    ButtonGlow.Parent = Button
    
    Button.MouseEnter:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = HIGHLIGHT_COLOR, Size = UDim2.new(0, 260, 0, 55)}):Play()
    end)
    Button.MouseLeave:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {BackgroundColor3 = ACCENT_COLOR, Size = BUTTON_SIZE}):Play()
    end)
    Button.MouseButton1Click:Connect(function()
        TweenService:Create(Button, TWEEN_INFO, {Size = UDim2.new(0, 240, 0, 45)}):Play()
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
    ValueLabel.TextSize = 14
    ValueLabel.Font = TEXT_FONT
    ValueLabel.Text = tostring(default)
    ValueLabel.Parent = Container
    
    local dragging = false
    SliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            TweenService:Create(SliderKnob, TWEEN_INFO, {Size = UDim2.new(0, 25, 0, 25)}):Play()
        end
    end)
    SliderKnob.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
            TweenService:Create(SliderKnob, TWEEN_INFO, {Size = UDim2.new(0, 20, 0, 20)}):Play()
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local relativeX = math.clamp((input.Position.X - SliderFrame.AbsolutePosition.X) / SliderFrame.AbsoluteSize.X, 0, 1)
            local value = min + (max - min) * relativeX
            SliderKnob.Position = UDim2.new(relativeX, -10, 0, 27.5)
            ValueLabel.Text = math.floor(value)
            callback(math.floor(value))
        end
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
    NotifyText.Size = UDim2.new(1, 0, 1, 0)
    NotifyText.BackgroundTransparency = 1
    NotifyText.Text = message
    NotifyText.TextColor3 = TEXT_COLOR
    NotifyText.TextSize = 14
    NotifyText.Font = TEXT_FONT
    NotifyText.TextWrapped = true
    NotifyText.Parent = Notification
    
    TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -125, 0, 10)}):Play()
    delay(duration or 3, function()
        TweenService:Create(Notification, TWEEN_INFO, {Position = UDim2.new(0.5, -125, 0, -70)}):Play()
        wait(0.3)
        Notification:Destroy()
    end)
end

-- Sound Effects
local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://6895079853"
ClickSound.Volume = 0.5
ClickSound.Parent = SoundService

-- Exploit Variables
local finishLineExtendEnabled = false
local finishLineExtendDistance = 10
local infStaminaEnabled = false
local infStaminaSpeed = 2
local autoSprintEnabled = false
local teleportToFinishEnabled = false

-- Finish Line Extender Logic
local function ExtendFinishLine()
    if not finishLineExtendEnabled then return end
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    
    local finishLine = Workspace:FindFirstChild("FinishLine") -- Adjust based on actual game structure
    if finishLine then
        local originalPos = finishLine.Position
        finishLine.Position = originalPos + Vector3.new(0, 0, -finishLineExtendDistance)
    end
end

-- Infinite Stamina Logic
local function InfiniteStamina()
    if not infStaminaEnabled then return end
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not hrp then return end
    
    local isCrouching = humanoid.WalkSpeed < 10 or humanoid.Sit or humanoid:GetState() == Enum.HumanoidStateType.Seated
    if not isCrouching and humanoid.MoveDirection.Magnitude > 0 then
        local moveStep = infStaminaSpeed / 60
        hrp.CFrame = hrp.CFrame * CFrame.new(0, 0, -moveStep)
        humanoid.WalkSpeed = humanoid.WalkSpeed + (infStaminaSpeed * 0.1)
    end
end

-- Auto-Sprint Logic
local function AutoSprint()
    if not autoSprintEnabled then return end
    local character = LocalPlayer.Character
    local humanoid = character and character:FindFirstChild("Humanoid")
    if not humanoid then return end
    humanoid:ChangeState(Enum.HumanoidStateType.Running)
end

-- Teleport to Finish Logic
local function TeleportToFinish()
    if not teleportToFinishEnabled then return end
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local finishLine = Workspace:FindFirstChild("FinishLine")
    if finishLine then
        hrp.CFrame = CFrame.new(finishLine.Position + Vector3.new(0, 3, 0))
        teleportToFinishEnabled = false -- One-time use per toggle
        Notify("Teleported to Finish Line!")
    else
        Notify("Finish Line not found!")
    end
end

-- Sidebar Options
CreateToggle("Finish Line Extender", ScrollFrame, false, function(value)
    finishLineExtendEnabled = value
    Notify("Finish Line Extender " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Extend Distance", ScrollFrame, 5, 50, 10, function(value)
    finishLineExtendDistance = value
    Notify("Finish Line Extend Distance set to " .. value)
end)

CreateToggle("Infinite Stamina", ScrollFrame, false, function(value)
    infStaminaEnabled = value
    Notify("Infinite Stamina " .. (value and "Enabled" or "Disabled"))
end)

CreateSlider("Stamina Speed Boost", ScrollFrame, 1, 5, 2, function(value)
    infStaminaSpeed = value
    Notify("Stamina Speed Boost set to " .. value)
end)

CreateToggle("Auto-Sprint", ScrollFrame, false, function(value)
    autoSprintEnabled = value
    Notify("Auto-Sprint " .. (value and "Enabled" or "Disabled"))
end)

CreateButton("Teleport to Finish", ScrollFrame, function()
    teleportToFinishEnabled = true
    TeleportToFinish()
end)

CreateButton("Reset All", ScrollFrame, function()
    finishLineExtendEnabled = false
    finishLineExtendDistance = 10
    infStaminaEnabled = false
    infStaminaSpeed = 2
    autoSprintEnabled = false
    teleportToFinishEnabled = false
    local finishLine = Workspace:FindFirstChild("FinishLine")
    if finishLine then
        finishLine.Position = finishLine.Position + Vector3.new(0, 0, finishLineExtendDistance) -- Reset position
    end
    Notify("All settings reset")
end)

-- Update Scroll Canvas Size
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ScrollLayout.AbsoluteContentSize.Y + 20)

-- Main Exploit Loop
RunService.Heartbeat:Connect(function()
    ExtendFinishLine()
    InfiniteStamina()
    AutoSprint()
end)

-- GUI Toggle Logic
local isSidebarOpen = false
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.RightShift then
        if not isSidebarOpen then
            TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_ON}):Play()
            isSidebarOpen = true
            Notify("Track & Field Exploit by zerzll - Menu Opened!", 3)
        else
            TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_OFF}):Play()
            isSidebarOpen = false
            Notify("Menu Closed", 2)
        end
        ClickSound:Play()
    end
end)

-- Automatic Menu Opening on Injection
local function OpenMenuAutomatically()
    WelcomeFrame.Visible = true
    TweenService:Create(WelcomeFrame, WELCOME_TWEEN_INFO, {Size = UDim2.new(0, 370, 0, 200)}):Play()
    delay(2, function()
        TweenService:Create(WelcomeFrame, WELCOME_TWEEN_INFO, {Size = UDim2.new(0, 350, 0, 180), BackgroundTransparency = 1}):Play()
        TweenService:Create(AvatarImage, WELCOME_TWEEN_INFO, {ImageTransparency = 1}):Play()
        TweenService:Create(WelcomeText, WELCOME_TWEEN_INFO, {TextTransparency = 1}):Play()
        wait(0.5)
        WelcomeFrame.Visible = false
        WelcomeFrame.BackgroundTransparency = BACKGROUND_TRANSPARENCY
        AvatarImage.ImageTransparency = 0
        WelcomeText.TextTransparency = 0
        TweenService:Create(SidebarFrame, TWEEN_INFO, {Position = SIDEBAR_POSITION_ON}):Play()
        isSidebarOpen = true
        Notify("Track & Field Exploit by zerzll - Use responsibly!", 5)
        ClickSound:Play()
    end)
end

-- Initial Checks and Setup
if game.PlaceId ~= 16426795556 then
    Notify("This script is for Track and Field (ID: 16426795556) only!", 5)
else
    OpenMenuAutomatically()
end
