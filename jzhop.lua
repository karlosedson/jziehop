-- Serviços
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Criando ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JzieHopGui"
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

-- Criando Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.BackgroundTransparency = 0.5 -- meio transparente
frame.BorderSizePixel = 2 -- borda mais grossa
frame.BorderColor3 = Color3.fromRGB(100, 100, 100) -- cor da borda
frame.Parent = screenGui
frame.Active = true -- necessário para receber input de drag
frame.Draggable = true -- permite mover o frame

-- Criando Label para o título com RGB animado
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Position = UDim2.new(0, 0, 0, 10)
title.Font = Enum.Font.GothamBold
title.TextSize = 36
title.Text = "jzie hop"
title.Parent = frame

-- Função para animar o texto RGB
spawn(function()
    local hue = 0
    while true do
        hue = (hue + 1) % 360
        local color = Color3.fromHSV(hue / 360, 1, 1)
        title.TextColor3 = color
        wait(0.03)
    end
end)

-- Criando botão
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0, 50)
button.Position = UDim2.new(0.2, 0, 0, 80)
button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
button.BackgroundTransparency = 0.4 -- meio transparente
button.BorderSizePixel = 2 -- borda mais grossa pro botão
button.BorderColor3 = Color3.fromRGB(120, 120, 120)
button.Font = Enum.Font.GothamBold
button.TextSize = 24
button.TextColor3 = Color3.new(1, 1, 1)
button.Text = "Executar"
button.Parent = frame

local running = false

button.MouseButton1Click:Connect(function()
    if not running then
        running = true

        -- Configuração global
        getgenv().BrainrotConfig = {
            ["Garama And Madundung"] = true,
            ["Nuclearo Dinossauro"] = true,
            ["La Grande Combinasion"] = true,
            ["Secret Lucky Block"] = true,
            ["Pot Hotspot"] = true,
            ["Graipuss Medussi"] = true,
            ["Sammyni Spyderini"] = true,
            ["Los Tralaleritos"] = true,
            ["Las Tralaleritas"] = true,
            ["Torrtuginni Dragonfrutini"] = true,
            ["La Vacca Saturno Saturnita"] = true,
            ["Ballerino Lololo"] = false,
            ["Trenostruzzo Turbo 3000"] = false,
            ["Brainrot God Lucky Block"] = false,
            ["Orcalero Orcala"] = false,
            ["Odin Din Din Dun"] = false,
            ["Espresso Signora"] = false,
            ["Unclito Samito"] = false,
            ["Tigroligre Frutonni"] = false,
            ["Tralalero Tralala"] = false,
            ["Matteo"] = false,
            ["Girafa Celestre"] = false,
            ["Cocofanto Elefanto"] = false
        }

        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/iw929wiwiw/Protector-/refs/heads/main/Secret%20Finder"))()
        end)

        if not success then
            warn("Erro ao carregar o script: ", err)
        end

        button.Text = "Cancelar"
    else
        -- Ao cancelar, fazer rejoin no servidor atual
        local placeId = game.PlaceId
        local jobId = game.JobId
        TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
    end
end)
