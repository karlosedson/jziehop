local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "JZIE HOP"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame (tamanho reduzido)
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 240, 0, 280) -- menor que antes para GUI mais compacta
mainFrame.Position = UDim2.new(0, 20, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

local purpleBorder = Instance.new("Frame", mainFrame)
purpleBorder.Position = UDim2.new(0, -2, 0, -2)
purpleBorder.Size = UDim2.new(1, 4, 1, 4)
purpleBorder.BackgroundColor3 = Color3.fromRGB(138, 43, 226)
purpleBorder.ZIndex = -1
Instance.new("UICorner", purpleBorder).CornerRadius = UDim.new(0, 18)

-- Title Bar with RGB Effect
local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundTransparency = 1

local titleLabel = Instance.new("TextLabel", titleBar)
titleLabel.Size = UDim2.new(0.6, 0, 1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "🌈 JZIE HOP"
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Tab Buttons Holder at right side of titleBar
local tabFrame = Instance.new("Frame", titleBar)
tabFrame.Size = UDim2.new(0.4, -20, 1, 0)
tabFrame.Position = UDim2.new(0.6, 10, 0, 0)
tabFrame.BackgroundTransparency = 1
tabFrame.ClipsDescendants = false

local function createTab(parent, text, position)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.48, 0, 1, 0)
    btn.Position = position
    btn.BackgroundColor3 = Color3.new(0, 0, 0)
    btn.BackgroundTransparency = 0.5
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    btn.AutoButtonColor = false
    return btn
end

local mainTab = createTab(tabFrame, "MAIN", UDim2.new(0, 0, 0, 0))
local espTab = createTab(tabFrame, "ESP", UDim2.new(0.52, 0, 0, 0))

-- Contents for MAIN and ESP tabs
local mainContent = Instance.new("Frame", mainFrame)
mainContent.Size = UDim2.new(1, -20, 1, -100)
mainContent.Position = UDim2.new(0, 10, 0, 95)
mainContent.BackgroundTransparency = 1
mainContent.Visible = true

local espContent = Instance.new("Frame", mainFrame)
espContent.Size = UDim2.new(1, -20, 1, -100)
espContent.Position = UDim2.new(0, 10, 0, 95)
espContent.BackgroundTransparency = 1
espContent.Visible = false

local function switchTab(tab)
    mainContent.Visible = (tab == "Main")
    espContent.Visible = (tab == "ESP")

    if tab == "Main" then
        mainTab.BackgroundTransparency = 0
        espTab.BackgroundTransparency = 0.5
    else
        mainTab.BackgroundTransparency = 0.5
        espTab.BackgroundTransparency = 0
    end
end

mainTab.MouseButton1Click:Connect(function()
    switchTab("Main")
end)
espTab.MouseButton1Click:Connect(function()
    switchTab("ESP")
end)

-- BUTTON CREATION FUNCTION
local function createButton(parent, text, pos, color, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0.95, 0, 0, 45)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)

    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- SECRET and GOD buttons on MAIN tab
createButton(mainContent, "Procurar SECRET", UDim2.new(0.025, 0, 0, 10), Color3.fromRGB(30, 30, 30), function()
    getgenv().BrainrotConfig = {
        ["Garama And Madundung"] = true, ["Nuclearo Dinossauro"] = true, ["La Grande Combinasion"] = true,
        ["Secret Lucky Block"] = true, ["Pot Hotspot"] = true, ["Graipuss Medussi"] = true,
        ["Sammyni Spyderini"] = true, ["Los Tralaleritos"] = true, ["Las Tralaleritas"] = true,
        ["Torrtuginni Dragonfrutini"] = true, ["La Vacca Saturno Saturnita"] = true,
        ["Ballerino Lololo"] = false, ["Trenostruzzo Turbo 3000"] = false, ["Brainrot God Lucky Block"] = false,
        ["Orcalero Orcala"] = false, ["Odin Din Din Dun"] = false, ["Espresso Signora"] = false,
        ["Unclito Samito"] = false, ["Tigroligre Frutonni"] = false, ["Tralalero Tralala"] = false,
        ["Matteo"] = false, ["Girafa Celestre"] = false, ["Cocofanto Elefanto"] = false
    }
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iw929wiwiw/Protector-/refs/heads/main/Secret%20Finder"))()
end)

createButton(mainContent, "Procurar GOD", UDim2.new(0.025, 0, 0, 65), Color3.fromRGB(140, 0, 200), function()
    getgenv().BrainrotConfig = {
        ["Garama And Madundung"] = false, ["Nuclearo Dinossauro"] = false, ["La Grande Combinasion"] = false,
        ["Secret Lucky Block"] = false, ["Pot Hotspot"] = false, ["Graipuss Medussi"] = false,
        ["Sammyni Spyderini"] = false, ["Los Tralaleritos"] = false, ["Las Tralaleritas"] = false,
        ["Torrtuginni Dragonfrutini"] = false, ["La Vacca Saturno Saturnita"] = false,
        ["Ballerino Lololo"] = true, ["Trenostruzzo Turbo 3000"] = true, ["Brainrot God Lucky Block"] = true,
        ["Orcalero Orcala"] = true, ["Odin Din Din Dun"] = true, ["Espresso Signora"] = true,
        ["Unclito Samito"] = true, ["Tigroligre Frutonni"] = true, ["Tralalero Tralala"] = true,
        ["Matteo"] = true, ["Girafa Celestre"] = true, ["Cocofanto Elefanto"] = true
    }
    loadstring(game:HttpGet("https://raw.githubusercontent.com/iw929wiwiw/Protector-/refs/heads/main/Secret%20Finder"))()
end)

-- ESP management variables
local espInstances = {}

local function clearAllESP()
    for _, espTable in pairs(espInstances) do
        if espTable.updateConnection then
            espTable.updateConnection:Disconnect()
        end
        if espTable.box then espTable.box:Destroy() end
        if espTable.label then espTable.label:Destroy() end
        if espTable.adorneePart then espTable.adorneePart:Destroy() end
    end
    espInstances = {}
end

-- Function to get the most valuable Brainrot
local function getMostValuableBrainrot()
    local brainrotsFolder = workspace:FindFirstChild("Brainrots")
    if not brainrotsFolder then return nil end

    local highestValue = 0
    local mostValuable = nil

    for _, brainrot in pairs(brainrotsFolder:GetChildren()) do
        local valObj = brainrot:FindFirstChild("Value")
        if valObj and valObj:IsA("NumberValue") then
            if valObj.Value > highestValue then
                highestValue = valObj.Value
                mostValuable = brainrot
            end
        end
    end

    return mostValuable, highestValue
end

-- ESP for players with full character hitbox (bounding box of all parts) and name label, moves with player
local espBtn
local espOn = false

local function createESPForPlayer(p)
    if p == player then return end
    if not p.Character then return end
    if espInstances[p] then return end

    local character = p.Character

    local adorneePart = Instance.new("Part")
    adorneePart.Transparency = 1
    adorneePart.Anchored = true
    adorneePart.CanCollide = false
    adorneePart.Parent = CoreGui

    local hitbox = Instance.new("BoxHandleAdornment")
    hitbox.Name = "FullCharacterHitboxESP"
    hitbox.Adornee = adorneePart
    hitbox.AlwaysOnTop = true
    hitbox.ZIndex = 10
    hitbox.Transparency = 0.5
    hitbox.Color3 = Color3.fromRGB(0, 255, 255)
    hitbox.Parent = CoreGui

    local updateConnection
    updateConnection = RunService.Heartbeat:Connect(function()
        if not p.Character or not p.Character.Parent then
            updateConnection:Disconnect()
            if espInstances[p] then
                espInstances[p] = nil
            end
            if hitbox then hitbox:Destroy() end
            if adorneePart then adorneePart:Destroy() end
            return
        end

        -- Calcula bounding box dinâmico de todos os BaseParts do personagem
        local parts = {}
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                table.insert(parts, part)
            end
        end

        if #parts == 0 then
            adorneePart.Size = Vector3.new(1,1,1)
            adorneePart.CFrame = CFrame.new(0, -1000, 0)
            hitbox.Size = Vector3.new(1,1,1)
            return
        end

        local minVec, maxVec = nil, nil
        for _, part in pairs(parts) do
            local pos, sz = part.Position, part.Size
            local partMin = pos - (sz / 2)
            local partMax = pos + (sz / 2)

            if not minVec then
                minVec = partMin
                maxVec = partMax
            else
                minVec = Vector3.new(
                    math.min(minVec.X, partMin.X),
                    math.min(minVec.Y, partMin.Y),
                    math.min(minVec.Z, partMin.Z)
                )
                maxVec = Vector3.new(
                    math.max(maxVec.X, partMax.X),
                    math.max(maxVec.Y, partMax.Y),
                    math.max(maxVec.Z, partMax.Z)
                )
            end
        end

        local boxCenter = (minVec + maxVec) / 2
        local boxSize = maxVec - minVec

        adorneePart.Size = boxSize
        adorneePart.CFrame = CFrame.new(boxCenter)
        hitbox.Size = boxSize
    end)

    -- Label com nome acima da cabeça
    local head = character:FindFirstChild("Head")
    local label
    if head then
        local esp = Instance.new("BillboardGui")
        esp.Name = "PlayerESP"
        esp.Adornee = head
        esp.AlwaysOnTop = true
        esp.Size = UDim2.new(0, 100, 0, 25)
        esp.StudsOffset = Vector3.new(0, 2.5, 0)
        esp.Parent = CoreGui

        label = Instance.new("TextLabel")
        label.Text = p.Name
        label.TextColor3 = Color3.fromRGB(0, 255, 255)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Font = Enum.Font.GothamBold
        label.TextScaled = true
        label.Parent = esp
    end

    espInstances[p] = {
        box = hitbox,
        adorneePart = adorneePart,
        label = label,
        updateConnection = updateConnection
    }
end

espBtn = createButton(espContent, "🧠 ESP", UDim2.new(0.025, 0, 0, 65), Color3.fromRGB(25, 25, 25), function()
    espOn = not espOn
    if espOn then
        espBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
        espBtn.Text = "🧠 ESP ON"

        for _, p in pairs(Players:GetPlayers()) do
            createESPForPlayer(p)
        end

        Players.PlayerAdded:Connect(function(p)
            if espOn then
                p.CharacterAdded:Connect(function()
                    createESPForPlayer(p)
                end)
            end
        end)

        for _, p in pairs(Players:GetPlayers()) do
            p.CharacterAdded:Connect(function()
                if espOn then
                    if espInstances[p] then
                        if espInstances[p].updateConnection then
                            espInstances[p].updateConnection:Disconnect()
                        end
                        if espInstances[p].box then
                            espInstances[p].box:Destroy()
                        end
                        if espInstances[p].label then
                            espInstances[p].label:Destroy()
                        end
                        if espInstances[p].adorneePart then
                            espInstances[p].adorneePart:Destroy()
                        end
                        espInstances[p] = nil
                    end
                    createESPForPlayer(p)
                end
            end)
        end
    else
        espBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        espBtn.Text = "🧠 ESP"
        clearAllESP()
    end
end)

-- Button to find the most valuable Brainrot and teleport
local richBtn = createButton(espContent, "💸 PROCURAR MAIS VALIOSO", UDim2.new(0.025, 0, 0, 10), Color3.fromRGB(25, 25, 25), function()
    clearAllESP()

    local brainrot, val = getMostValuableBrainrot()

    if brainrot and brainrot:FindFirstChild("Head") then
        local head = brainrot.Head

        local esp = Instance.new("BillboardGui")
        esp.Name = "BrainrotESP"
        esp.Adornee = head
        esp.AlwaysOnTop = true
        esp.Size = UDim2.new(0, 150, 0, 40)
        esp.StudsOffset = Vector3.new(0, 3, 0)
        esp.Parent = CoreGui

        local label = Instance.new("TextLabel")
        label.Text = "💸 MAIS VALIOSO: " .. brainrot.Name .. " (Valor: " .. val .. ")"
        label.TextColor3 = Color3.fromRGB(255, 215, 0)
        label.TextStrokeTransparency = 0
        label.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        label.BackgroundTransparency = 1
        label.Size = UDim2.new(1, 0, 1, 0)
        label.Font = Enum.Font.GothamBold
        label.TextScaled = true
        label.Parent = esp

        espInstances[brainrot] = esp

        richBtn.Text = "💸 " .. brainrot.Name
        richBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)

        local character = player.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = head.CFrame + Vector3.new(0, 5, 0)
        end
    else
        richBtn.Text = "💸 NENHUM DETECTADO"
        richBtn.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
    end

    task.wait(3)
    richBtn.Text = "💸 PROCURAR MAIS VALIOSO"
    richBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
end)

-- Drag functionality for mainFrame
do
    local dragging = false
    local dragInput, dragStart, startPos

    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    RunService.RenderStepped:Connect(function()
        if dragging and dragInput then
            local delta = dragInput.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- RGB effect on title text
do
    local hue = 0
    RunService.Heartbeat:Connect(function(dt)
        hue = (hue + dt * 0.5) % 1
        titleLabel.TextColor3 = Color3.fromHSV(hue, 1, 1)
    end)
end

-- Initialize with MAIN tab selected
switchTab("Main")

-- =========================
-- Minimize Button (Circular draggable with image)
-- =========================

local minimizeButton = Instance.new("ImageButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 50, 0, 50) -- 50x50 circle
minimizeButton.Position = UDim2.new(1, -60, 0.5, -25)
minimizeButton.AnchorPoint = Vector2.new(0, 0.5)
minimizeButton.BackgroundTransparency = 0.5
minimizeButton.BackgroundColor3 = Color3.new(0, 0, 0)
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = screenGui
minimizeButton.AutoButtonColor = true
Instance.new("UICorner", minimizeButton).CornerRadius = UDim.new(0, 25)

-- Image URL (lembre de substituir por assetid se necessário)
minimizeButton.Image = "https://images.seeklogo.com/logo-png/43/1/neymar-jr-puma-logo-png_seeklogo-430750.png"

local isMinimized = false

local origMainFrameSize = mainFrame.Size
local origMainFramePosition = mainFrame.Position

local function toggleMinimize()
    if not isMinimized then
        mainFrame.Visible = false
        isMinimized = true
        minimizeButton.BackgroundTransparency = 0
    else
        mainFrame.Visible = true
        isMinimized = false
        minimizeButton.BackgroundTransparency = 0.5
    end
end

minimizeButton.MouseButton1Click:Connect(toggleMinimize)

-- Dragging logic for minimize button
local dragging = false
local dragInput = nil
local dragStartPos = nil
local startPos = nil

minimizeButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragInput = input
        dragStartPos = input.Position
        startPos = minimizeButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

minimizeButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then
        local delta = dragInput.Position - dragStartPos
        local newX = startPos.X.Offset + delta.X
        local newY = startPos.Y.Offset + delta.Y

        local viewport = workspace.CurrentCamera.ViewportSize
        newX = math.clamp(newX, 0, viewport.X - minimizeButton.AbsoluteSize.X)
        newY = math.clamp(newY, 0, viewport.Y - minimizeButton.AbsoluteSize.Y)

        minimizeButton.Position = UDim2.new(0, newX, 0, newY)
    end
end)
