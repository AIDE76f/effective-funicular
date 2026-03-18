-- [[ Hyper Speed Runner - Pro UI Script ]] --
-- ملاحظة: تأكد من تشغيل هذا السكربت في الـ Executor الخاص بك

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local TweenService = game:GetService("TweenService")

-- 1. إنشاء الواجهة (GUI)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProTeleportGUI"
ScreenGui.Parent = game.CoreGui -- ليظهر فوق واجهات اللعبة الأصلية

-- 2. الإطار الرئيسي (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 250, 0, 150)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -75)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = MainFrame

-- 3. العنوان (Title)
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "Hyper Speed Runner PRO"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Title.Parent = MainFrame

-- 4. زر الانتقال (Teleport Button)
local TeleportBtn = Instance.new("TextButton")
TeleportBtn.Size = UDim2.new(0, 200, 0, 50)
TeleportBtn.Position = UDim2.new(0.5, -100, 0.6, -25)
TeleportBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
TeleportBtn.Text = "Teleport to End 🚀"
TeleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
TeleportBtn.Font = Enum.Font.GothamSemibold
TeleportBtn.TextSize = 18
TeleportBtn.AutoButtonColor = false
TeleportBtn.Parent = MainFrame

local BtnCorner = Instance.new("UICorner")
BtnCorner.CornerRadius = UDim.new(0, 10)
BtnCorner.Parent = TeleportBtn

-- 5. إضافة تدرج لوني (Gradient) للزر ليصبح أجمل
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 90, 180))
}
UIGradient.Parent = TeleportBtn

-- 6. وظيفة الانتقال (Teleport Logic)
TeleportBtn.MouseButton1Click:Connect(function()
    -- سنقوم بالبحث عن الجزء الذي يمثل النهاية. في أغلب مابات السرعة يسمى "End" أو "Finish"
    -- إذا لم نجد جزءاً بهذا الاسم، سننتقل لإحداثيات بعيدة (نهاية المسار الافتراضية)
    local destination = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("End") or workspace:FindFirstChild("WinPart")

    if destination then
        character.HumanoidRootPart.CFrame = destination.CFrame + Vector3.new(0, 5, 0)
    else
        -- إحداثيات افتراضية إذا لم يتم العثور على جزء النهاية تلقائياً
        -- يمكنك تعديل هذه الأرقام بناءً على الماب
        character.HumanoidRootPart.CFrame = CFrame.new(0, 100, -5000) 
    end
end)

-- 7. تأثيرات بصرية (Animations)
TeleportBtn.MouseEnter:Connect(function()
    TweenService:Create(TeleportBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 150, 255)}):Play()
end)

TeleportBtn.MouseLeave:Connect(function()
    TweenService:Create(TeleportBtn, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}):Play()
end)

-- جعل النافذة قابلة للسحب (Draggable)
MainFrame.Active = true
MainFrame.Draggable = true
