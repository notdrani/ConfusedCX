local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "ZS Paid V0.9", HidePremium = true, SaveConfig = true, ConfigFolder = "OrionTest"})
OrionLib:MakeNotification({
	Name = "Made By Semaj",
	Content = "ZS Paid V0.9",
	Image = "rbxassetid://4483345998",
	Time = 20
})

OrionLib:MakeNotification({
	Name = "Kuromi Sucks Dicc",
	Content = "Did u join my discord???",
	Image = "rbxassetid://4483345998",
	Time = 25
})




--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



local Section = Tab:AddSection({
	Name = "Auto Parry's"
})

Tab:AddButton({
	Name = "Auto Parry",
	Callback = function()
      		print("button pressed")
      getgenv().config = getgenv().config or {
	hit_time = 0.38, -- // recommended 0.25 to 0.75 \ --
	
	mode = 'Always', -- // Hold , Toggle , Always \ --
	deflect_type = 'Remote', -- // Key Press , Remote \ --
	notifications = true,
	keybind = Enum.KeyCode.V
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
  	end    
})

Tab:AddButton({
	Name = "Auto Parry OP",
	Callback = function()
      		print("button pressed")
       loadstring(game:HttpGet(("https://raw.githubusercontent.com/UltraStuff/scripts2/main/bladered")))()  
  	end    
})

Tab:AddButton({
	Name = "Parry V2",
	Callback = function()
      		print("button pressed")
          local services = setmetatable({}, { __index = function(self, key)
    local service = game:GetService(key)
    self[key] = service
    return service
end })

local Players = services.Players
local Workspace = services.Workspace

local client = Players.LocalPlayer

local ballsFolder = Workspace.Balls

local Util = {}
do
    shared.Util = Util

    function Util.getBalls()
        local realBall, otherBall

        for i = 1, #ballsFolder:GetChildren() do
            local ball = ballsFolder:GetChildren()[i]
            if not ball:IsA("BasePart") then  end

            local isRealBall = ball:GetAttribute("realBall")
            if isRealBall == nil then end

            if isRealBall then
                realBall = ball
            else
                otherBall = ball
            end

            if realBall and otherBall then break end
        end

        return realBall, otherBall
    end

    function Util.isHunting()
        local realBall = Util.getBalls()
        if not realBall then return false end

        local target = realBall:GetAttribute("target")
        if not target then return false end

        return target == client.Name
    end
end

ballsFolder.ChildAdded:Connect(function()
    print('------------------- Ball Spawned -------------------')

    task.wait(1.5)

    local realBall, fakeBall

    for i = 1, #ballsFolder:GetChildren() do
        local ball = ballsFolder:GetChildren()[i]
        if not ball:IsA("BasePart") then  end

        local currentSpeed = ball.Velocity.Magnitude
        if currentSpeed == 0 then
            realBall = ball
        else
            fakeBall = ball
        end

        if realBall and fakeBall then break end
    end

    if realBall then
        local usedRemote = false
        local lastPosition = realBall.Position
        local lastVelocity = fakeBall.Velocity

        realBall:GetPropertyChangedSignal("Position"):Connect(function()
            if not Util.isHunting() then return end

            local playerPosition = client.Character and client.Character.PrimaryPart and client.Character.PrimaryPart.Position
            if not playerPosition then return end

            local currentSpeed = fakeBall and fakeBall.Velocity.Magnitude or 0

            local predictedPosition = lastPosition + lastVelocity
            local predictedDistance = (predictedPosition - playerPosition).Magnitude

            lastPosition = realBall.Position
            lastVelocity = realBall.Velocity

            local timeToReachPlayer = predictedDistance / (currentSpeed == 0 and 1 or currentSpeed)
            print(timeToReachPlayer)

            if timeToReachPlayer <= 0.3 and not usedRemote then
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ParryButtonPress"):Fire()
                task.wait(0.1)
                usedRemote = true
            elseif timeToReachPlayer > 0.4 then
                usedRemote = false
            end
        end)
    end
end)
  	end    
})

Tab:AddButton({
	Name = "Parry V3",
	Callback = function()
      		print("button pressed")
      getgenv().config = getgenv().config or {
	hit_time = 0.59, -- // recommended 0.25 to 0.75 \ --
	
	mode = 'Always', -- // Hold , Toggle , Always \ --
	deflect_type = 'Remote', -- // Key Press , Remote \ --
	notifications = true,
	keybind = Enum.KeyCode.V
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3ABlade%20Ball%20Parry%20V4.0.0",true))()
  	end    
})


local Section = Tab:AddSection({
	Name = "Manual Spam"
})

Tab:AddButton({
	Name = "Manual Spam Button",
	Callback = function()
      		print("button pressed")
      loadstring(game:HttpGet('https://raw.githubusercontent.com/marmfjjwjw223/DownGroud/main/DOWNGROUND'))()
  	end    
})

local Section = Tab:AddSection({
	Name = "Others"
})


Tab:AddButton({
	Name = "ESP",
	Callback = function()
      		print("button pressed")
      local FillColor = Color3.fromRGB(175,25,255)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(255,255,255)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}

local Storage = Instance.new("Folder")
Storage.Parent = CoreGui
Storage.Name = "Highlight_Storage"

local function Highlight(plr)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = plr.Name
    Highlight.FillColor = FillColor
    Highlight.DepthMode = DepthMode
    Highlight.FillTransparency = FillTransparency
    Highlight.OutlineColor = OutlineColor
    Highlight.OutlineTransparency = 0
    Highlight.Parent = Storage
    
    local plrchar = plr.Character
    if plrchar then
        Highlight.Adornee = plrchar
    end

    connections[plr] = plr.CharacterAdded:Connect(function(char)
        Highlight.Adornee = char
    end)
end

Players.PlayerAdded:Connect(Highlight)
for i,v in next, Players:GetPlayers() do
    Highlight(v)
end

Players.PlayerRemoving:Connect(function(plr)
    local plrname = plr.Name
    if Storage[plrname] then
        Storage[plrname]:Destroy()
    end
    if connections[plr] then
        connections[plr]:Disconnect()
    end
end)
  	end    
})



Tab:AddButton({
	Name = "Fly",
	Callback = function()
      		print("button pressed")
OrionLib:MakeNotification({
	Name = "WARNING",
	Content = "U COULD GET BANNED BY USING THIS SCRIPT.",
	Image = "rbxassetid://4483345998",
	Time = 10
})      loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
  	end    
})


local Section = Tab:AddSection({
	Name = "Misc"
})



local Tab = Window:MakeTab({
	Name = "Credits😊",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Creator - Semaj",
	Callback = function()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "Helper - PeterPogi",
	Callback = function()
      		print("button pressed")
  	end    
})

Tab:AddButton({
	Name = "THANKS FOR USING OUR SCRIPT!",
	Callback = function()
      		print("button pressed")
  	end    
})






OrionLib:Init()
