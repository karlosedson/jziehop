-- Serviços
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local PlaceId = 15502339000 -- Roube um Brainrot

local searching = false
local currentHop = 0

-- Lista de placeholders
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

-- Função: verifica se algum dos placeholders está no servidor
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

-- Função: faz o server hop
local function hopServer(statusLabel)
    local success, result = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(
            "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        ))
    end)

    if success and result and result.data then
        for _, server in ipairs(result.data) do
            if server.playing < server.maxPlayers and server.id ~= game.JobId then
                currentHop += 1
                statusLabel.Text = "Joining server "..currentHop.."/100 (ID: "..string.sub(server.id, 1, 5).."...)"
                TeleportService:TeleportToPlaceInstance(PlaceId, server.id, player)
                return
            end
        end
        statusLabel.Text = "No more servers available."
    else
        statusLabel.Text = "Failed to get servers."
    end
end

-- Criação da GUI
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "NPC_Hunter_GUI"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 220)
main.Position = UDim2.new(0.5, -200, 0.5, -110)
main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
main.BorderSizePixel = 0

local titleBar = Instance.new("TextLabel", main)
titleBar.Text = "ADAM'S NPC HUNTER"
titleBar.Size = UDim2.new(1, 0, 0, 40)
titleBar.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleBar.TextColor3 = Color3.new(1, 1, 1)
titleBar.Font = Enum.Font.GothamBold
titleBar.TextSize = 20

local subTitle = Instance.new("TextLabel", main)
subTitle.Text = "Made by ofcadam"
subTitle.Position = UDim2.new(0, 0, 0, 40)
subTitle.Size = UDim2.new(1, 0, 0, 20)
subTitle.BackgroundTransparency = 1
subTitle.TextColor3 = Color3.fromRGB(180, 180, 180)
subTitle.Font = Enum.Font.Gotham
subTitle.TextSize = 14

local statusText = Instance.new("TextLabel", main)
statusText.Text = "Paused hopping"
statusText.Position = UDim2.new(0, 10, 0, 70)
statusText.Size = UDim2.new(1, -20, 0, 60)
statusText.BackgroundTransparency = 1
statusText.TextColor3 = Color3.fromRGB(255, 255, 255)
statusText.Font = Enum.Font.Code
statusText.TextSize = 18
statusText.TextXAlignment = Enum.TextXAlignment.Left
statusText.TextYAlignment = Enum.TextYAlignment.Top

local boostBtn = Instance.new("TextButton", main)
boostBtn.Text = "BOOST: OFF"
boostBtn.Size = UDim2.new(1, 0, 0, 40)
boostBtn.Position = UDim2.new(0, 0, 0, 140)
boostBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
boostBtn.TextColor3 = Color3.new(1, 1, 1)
boostBtn.Font = Enum.Font.GothamBold
boostBtn.TextSize = 20
boostBtn.AutoButtonColor = false

local resumeBtn = Instance.new("TextButton", main)
resumeBtn.Text = "RESUME Hopping"
resumeBtn.Size = UDim2.new(1, 0, 0, 40)
resumeBtn.Position = UDim2.new(0, 0, 0, 180)
resumeBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
resumeBtn.TextColor3 = Color3.new(1, 1, 1)
resumeBtn.Font = Enum.Font.GothamBold
resumeBtn.TextSize = 20

-- Clique no botão "RESUME"
resumeBtn.MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    currentHop = 0

    task.spawn(function()
        while searching do
            task.wait(6)
            statusText.Text = "Scanning for NPCs..."
            if foundTarget() then
                statusText.Text = "✅ Placeholder encontrado!"
                searching = false
                break
            else
                hopServer(statusText)
                break -- deixa o próximo servidor continuar
            end
        end
    end)
end)
