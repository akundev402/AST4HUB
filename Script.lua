-- ==========================================
-- CONFIGURATION & CUSTOMIZATION
-- ==========================================
local KEY_PANEL_NAME = "🔑 AST4 HUB"          -- Nama untuk panel isi key
local MAIN_PANEL_NAME = "🚀 AST4 HUB PANEL"   -- Nama untuk panel utama setelah isi key

local CORRECT_KEY = "AST4HUBKEY" 
local GET_KEY_LINK = "https://discord.gg/https://discord.gg/RqkEWAUMkB" -- Link Discord/Key System kamu

-- ID Gambar baru yang kamu berikan untuk tombol melayang
local TOGGLE_IMAGE_ID = "rbxassetid://113107870270493" 

-- ==========================================
-- SYSTEM SERVICES & SETUP
-- ==========================================
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AST4HubCyber"
ScreenGui.ResetOnSpawn = false
pcall(function() ScreenGui.Parent = CoreGui end)
if not ScreenGui.Parent then ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") end

-- Fungsi bantuan untuk membuat UI Corner (Sudut Melengkung)
local function addCorner(parent, radius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, radius)
    corner.Parent = parent
end

-- Fungsi bantuan untuk membuat Efek Gradasi Cyber (Cyan ke Ungu)
local function applyCyberGradient(parent)
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 240, 255)),  -- Neon Cyan
        ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 0, 255))  -- Neon Purple
    })
    Gradient.Rotation = 45 -- Memiringkan efek gradasi agar lebih estetik
    Gradient.Parent = parent
    return Gradient
end

-- Fungsi bantuan untuk membuat Garis Border Neon Glowing
local function addCyberBorder(parent)
    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 1.5
    Stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    applyCyberGradient(Stroke)
    Stroke.Parent = parent
end

-- ==========================================
-- PANEL 1: SYSTEM KEY (AST4 HUB - Cyber Theme)
-- ==========================================
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0.4, 300, 0.4, 180)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 22) -- Background sangat gelap agar neon menyala
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = ScreenGui
addCorner(KeyFrame, 12)
addCyberBorder(KeyFrame) -- Border Gradasi Cyan-Ungu

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0.25, 0)
KeyTitle.Text = KEY_PANEL_NAME
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.TextSize = 16
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.BackgroundTransparency = 1
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0.22, 0)
KeyInput.Position = UDim2.new(0.075, 0, 0.32, 0)
KeyInput.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderText = "Enter your key here..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(100, 100, 115)
KeyInput.Text = ""
KeyInput.TextSize = 14
KeyInput.Font = Enum.Font.Gotham
KeyInput.Parent = KeyFrame
addCorner(KeyInput, 8)
local InputStroke = Instance.new("UIStroke")
InputStroke.Thickness = 1
InputStroke.Color = Color3.fromRGB(50, 50, 70)
InputStroke.Parent = KeyInput

-- Tombol Verify dengan Background Gradasi Full
local VerifyBtn = Instance.new("TextButton")
VerifyBtn.Size = UDim2.new(0.4, 0, 0.22, 0)
VerifyBtn.Position = UDim2.new(0.075, 0, 0.65, 0)
VerifyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- Putih agar warna gradasi keluar maksimal
VerifyBtn.Text = "Verify Key"
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
VerifyBtn.TextSize = 13
VerifyBtn.Font = Enum.Font.GothamBold
VerifyBtn.Parent = KeyFrame
addCorner(VerifyBtn, 8)
applyCyberGradient(VerifyBtn) -- Mengubah tombol menjadi gradasi cyan-ungu

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.4, 0, 0.22, 0)
GetKeyBtn.Position = UDim2.new(0.525, 0, 0.65, 0)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
GetKeyBtn.Text = "Get Key (Link)"
GetKeyBtn.TextColor3 = Color3.fromRGB(0, 240, 255) -- Teks warna Cyan Neon
GetKeyBtn.TextSize = 13
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.Parent = KeyFrame
addCorner(GetKeyBtn, 8)
local GetKeyStroke = Instance.new("UIStroke")
GetKeyStroke.Thickness = 1
GetKeyStroke.Color = Color3.fromRGB(170, 0, 255) -- Border warna Ungu Neon
GetKeyStroke.Parent = GetKeyBtn

local CloseKeyBtn = Instance.new("TextButton")
CloseKeyBtn.Size = UDim2.new(0, 30, 0, 30)
CloseKeyBtn.Position = UDim2.new(1, -35, 0, 5)
CloseKeyBtn.BackgroundTransparency = 1
CloseKeyBtn.Text = "✕"
CloseKeyBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
CloseKeyBtn.TextSize = 16
CloseKeyBtn.Font = Enum.Font.GothamBold
CloseKeyBtn.Parent = KeyFrame

-- ==========================================
-- PANEL 3: MAIN PANEL (AST4 HUB PANEL - Cyber Theme)
-- ==========================================
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.5, 300, 0.5, 180)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -90)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false 
MainFrame.Parent = ScreenGui
addCorner(MainFrame, 14)
addCyberBorder(MainFrame) -- Border Gradasi Cyan-Ungu Utama

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local MainTitle = Instance.new("TextLabel")
MainTitle.Size = UDim2.new(0.7, 0, 1, 0)
MainTitle.Position = UDim2.new(0, 15, 0, 0)
MainTitle.Text = MAIN_PANEL_NAME
MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTitle.TextSize = 16
MainTitle.TextXAlignment = Enum.TextXAlignment.Left
MainTitle.Font = Enum.Font.GothamBold
MainTitle.BackgroundTransparency = 1
MainTitle.Parent = Header
applyCyberGradient(MainTitle) -- Membuat teks judul ikut bergradasi warna neon

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 5)
MinimizeBtn.BackgroundTransparency = 1
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(0, 240, 255) -- Cyan
MinimizeBtn.TextSize = 14
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Parent = Header

local CloseMainBtn = Instance.new("TextButton")
CloseMainBtn.Size = UDim2.new(0, 35, 0, 35)
CloseMainBtn.Position = UDim2.new(1, -40, 0, 5)
CloseMainBtn.BackgroundTransparency = 1
CloseMainBtn.Text = "✕"
CloseMainBtn.TextColor3 = Color3.fromRGB(255, 80, 80) -- Merah Neon untuk peringatan close
CloseMainBtn.TextSize = 16
CloseMainBtn.Font = Enum.Font.GothamBold
CloseMainBtn.Parent = Header

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size = UDim2.new(1, -20, 1, -60)
ContentScroll.Position = UDim2.new(0, 10, 0, 50)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel = 0
ContentScroll.ScrollBarThickness = 4
ContentScroll.CanvasSize = UDim2.new(0, 0, 0, 300) 
ContentScroll.Parent = MainFrame

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.CellSize = UDim2.new(0.46, 0, 0, 45) 
UIGridLayout.CellPadding = UDim2.new(0.04, 0, 0, 10)
UIGridLayout.Parent = ContentScroll

-- Tombol Fitur dengan Aksen Cyber Border
local SpeedBtn = Instance.new("TextButton")
SpeedBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
SpeedBtn.Text = "Speed Hack"
SpeedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBtn.Font = Enum.Font.Gotham
SpeedBtn.Parent = ContentScroll
addCorner(SpeedBtn, 8)
local SpeedStroke = Instance.new("UIStroke")
SpeedStroke.Thickness = 1
SpeedStroke.Color = Color3.fromRGB(0, 240, 255)
SpeedStroke.Parent = SpeedBtn

local JumpBtn = Instance.new("TextButton")
JumpBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
JumpBtn.Text = "Jump Hack"
JumpBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
JumpBtn.Font = Enum.Font.Gotham
JumpBtn.Parent = ContentScroll
addCorner(JumpBtn, 8)
local JumpStroke = Instance.new("UIStroke")
JumpStroke.Thickness = 1
JumpStroke.Color = Color3.fromRGB(170, 0, 255)
JumpStroke.Parent = JumpBtn

-- ==========================================
-- TOMBOL TOGGLE GAMBAL MELAYANG (Custom Image)
-- ==========================================
local OpenToggleBtn = Instance.new("ImageButton")
OpenToggleBtn.Size = UDim2.new(0, 50, 0, 50)
OpenToggleBtn.Position = UDim2.new(0, 10, 0.3, 0)
OpenToggleBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 22) 
OpenToggleBtn.Image = TOGGLE_IMAGE_ID -- Menggunakan ID Gambar kustom kamu
OpenToggleBtn.Visible = false 
OpenToggleBtn.Parent = ScreenGui
addCorner(OpenToggleBtn, 25) 
addCyberBorder(OpenToggleBtn) -- Tombol melayang ber-border gradasi cyber

-- Dragging System (Fungsi seret untuk mobile)
local function makeDraggable(gui)
    local UserInputService = game:GetService("UserInputService")
    local dragging, dragInput, dragStart, startPos
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = gui.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragging = false end end)
        end
    end)
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end
makeDraggable(OpenToggleBtn)
makeDraggable(Header)

-- ==========================================
-- LOGIC INTERACTION
-- ==========================================
GetKeyBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(GET_KEY_LINK)
        GetKeyBtn.Text = "Link Copied!"
        task.wait(2)
        GetKeyBtn.Text = "Get Key (Link)"
    else
        GetKeyBtn.Text = "Not Supported"
    end
end)

VerifyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        KeyFrame:Destroy()
        MainFrame.Visible = true
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "Wrong Key! Try Again."
        KeyInput.PlaceholderColor3 = Color3.fromRGB(255, 80, 80)
    end
end)

local function closeEverything()
    ScreenGui:Destroy()
end
CloseKeyBtn.MouseButton1Click:Connect(closeEverything)
CloseMainBtn.MouseButton1Click:Connect(closeEverything)

MinimizeBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    OpenToggleBtn.Visible = true
end)

OpenToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = true
    OpenToggleBtn.Visible = false
end)

-- ==========================================
-- FEATURES LOGIC (CONTOH)
-- ==========================================
local speedActive = false
SpeedBtn.MouseButton1Click:Connect(function()
    speedActive = not speedActive
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.WalkSpeed = speedActive and 100 or 16
        SpeedBtn.BackgroundColor3 = speedActive and Color3.fromRGB(0, 100, 100) or Color3.fromRGB(20, 20, 30)
    end
end)

local jumpActive = false
JumpBtn.MouseButton1Click:Connect(function()
    jumpActive = not jumpActive
    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum.JumpPower = jumpActive and 150 or 50
        JumpBtn.BackgroundColor3 = jumpActive and Color3.fromRGB(100, 0, 150) or Color3.fromRGB(20, 20, 30)
    end
end)

