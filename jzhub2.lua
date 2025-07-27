-- Serviços
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local PlaceId = 15502339000 -- ID do jogo

-- Lista de alvos
local targets = {
    "Garama And Madundung",
    "Nuclearo Dinossauro",
    "La Grande Combinasion",
    "Secret Lucky Block",
    "Pot Hotspot",
    "Graipuss Medussi",
    "Sammyni Spyderini",
    "Los Tralaleritos",
    "Las Tralaleritas",
    "Torrtuginni Dragonfrutini",
    "La Vacca Saturno Saturnita"
}

-- Variável de controle
local searching = false

-- Função de busca por placeholders
local function foundTarget()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        for _, name in ipairs(targets) do
            if string.lower(obj.Name) == string.lower(name) then
                return true
            end
        end
    end
    return false
end

-- Função para fazer server hop
local function hopServer()
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    end)

    if success and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
                return
            end
        end
    end
end

-- GUI
local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "HopGui"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 140)
frame.Position = UDim2.new(0.5, -150, 0.5, -70)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)

local uiCorner = Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Text = "🔍 Procura de Placeholders"
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 18

local searchBtn = Instance.new("TextButton", frame)
searchBtn.Text = "🔍 Procurar"
searchBtn.Size = UDim2.new(1, -20, 0, 40)
searchBtn.Position = UDim2.new(0, 10, 0, 50)
searchBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
searchBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
searchBtn.Font = Enum.Font.Gotham
searchBtn.TextSize = 16

local cancelBtn = Instance.new("TextButton", frame)
cancelBtn.Text = "❌ Cancelar"
cancelBtn.Size = UDim2.new(1, -20, 0, 30)
cancelBtn.Position = UDim2.new(0, 10, 0, 95)
cancelBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
cancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
cancelBtn.Font = Enum.Font.Gotham
cancelBtn.TextSize = 16

-- Lógica ao clicar em procurar
searchBtn.MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    searchBtn.Text = "⏳ Procurando..."
    searchBtn.BackgroundColor3 = Color3.fromRGB(255, 170, 0)

    -- Loop de busca
    task.spawn(function()
        while searching do
            task.wait(6)
            if foundTarget() then
                searchBtn.Text = "✅ Encontrado!"
                searchBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
                searching = false
                break
            else
                hopServer()
                break -- deixa o próximo servidor cuidar do resto
            end
        end
    end)
end)

-- Lógica ao cancelar
cancelBtn.MouseButton1Click:Connect(function()
    searching = false
    searchBtn.Text = "🔍 Procurar"
    searchBtn.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
end)
