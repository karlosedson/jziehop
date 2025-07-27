-- Serviços
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local PlaceId = 15502339000

local searching = false
local currentHop = 0

-- Lista de NPCs alvo
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

-- ESP para NPC
local function createESP(part, name)
    if part:FindFirstChild("BrainESP") then return end

    local bill = Instance.new("BillboardGui", part)
    bill.Name = "BrainESP"
    bill.Size = UDim2.new(0, 100, 0, 40)
    bill.AlwaysOnTop = true
    bill.StudsOffset = Vector3.new(0, 3, 0)

    local text = Instance.new("TextLabel", bill)
    text.Size = UDim2.new(1, 0, 1, 0)
    text.BackgroundTransparency = 1
    text.Text = "🧠 " .. name
    text.TextColor3 = Color3.fromRGB(255, 100, 100)
    text.Font = Enum.Font.GothamBold
    text.TextScaled = true
end

-- Detecta e marca NPCs alvo
local function findAndMark()
    for _, obj in ipairs(Workspace:GetDescendants()) do
        for _, name in ipairs(targets) do
            if string.lower(obj.Name) == string.lower(name) then
                createESP(obj, name)
                return true
            end
        end
    end
    return false
end

-- GUI
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

local serverhopBtn = Instance.new("TextButton", main)
serverhopBtn.Text = "RESUME Hopping"
serverhopBtn.Size = UDim2.new(1, 0, 0, 40)
serverhopBtn.Position = UDim2.new(0, 0, 0, 180)
serverhopBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
serverhopBtn.TextColor3 = Color3.new(1, 1, 1)
serverhopBtn.Font = Enum.Font.GothamBold
serverhopBtn.TextSize = 20

-- HOPPING System (usando seu código)
local function serverHop()
    local originalText = serverhopBtn.Text
    serverhopBtn.Text = "🔄 SEARCHING..."
    serverhopBtn.BackgroundColor3 = Color3.fromRGB(255, 165, 0)

    local function getServers()
        local servers = {}
        local success, result = pcall(function()
            return HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        end)
        if success and result and result.data then
            for _, server in ipairs(result.data) do
                if server.playing and type(server.playing) == "number" and server.id ~= game.JobId then
                    table.insert(servers, server.id)
                end
            end
        end
        return servers
    end

    local function tryTeleport(servers)
        if #servers > 0 then
            serverhopBtn.Text = "🔄 JOINING..."
            serverhopBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)])
        else
            task.wait(1)
            servers = getServers()
            tryTeleport(servers)
        end
    end

    local servers = getServers()
    tryTeleport(servers)

    task.delay(5, function()
        if serverhopBtn then
            serverhopBtn.Text = originalText
            serverhopBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
    end)
end

-- Ao clicar em "RESUME Hopping"
serverhopBtn.MouseButton1Click:Connect(function()
    if searching then return end
    searching = true
    statusText.Text = "Scanning for NPCs..."
    
    task.spawn(function()
        task.wait(6)
        if findAndMark() then
            statusText.Text = "✅ Placeholder encontrado!"
            serverhopBtn.Text = "FOUND!"
            serverhopBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 127)
            searching = false
        else
            statusText.Text = "🔄 NPC não encontrado, trocando..."
            serverHop()
        end
    end)
end)
