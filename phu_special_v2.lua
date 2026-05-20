-- 1. BẬT SẴN CHỐNG BAN (ANTI-BAN)
getgenv().AntiBan = true

-- TỰ ĐỘNG KHỞI TẠO THƯ VIỆN ORION (CÓ NÚT NHỎ VUÔNG ĐÓNG/MỞ SÁT CẠNH)
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "TRẦN ANH PHÚ HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "PhuHubConfig"})

-- 2. TAB CHÍNH: CÀY CẤP & SĂN TRÁI
local Tab1 = Window:MakeTab({
	Name = "Main Pro",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- TỰ ĐỘNG LƯU CẤU HÌNH KHI BẬT/TẮT
Tab1:AddToggle({
	Name = "Bật Cày Cấp (2600 - 2750)",
	Default = false,
	Save = true,
	ID = "AutoFarmLevel",
	Callback = function(state)
		_G.AutoFarm = state
		spawn(function()
			while _G.AutoFarm do wait(0.5)
				pcall(function()
					-- Tự động trang bị võ Melee
					local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Melee") or game.Players.LocalPlayer.Character:FindFirstChild("Melee")
					if tool and not game.Players.LocalPlayer.Character:FindFirstChild("Melee") then
						game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
					end
					-- Lệnh nhận nhiệm vụ theo cấp và Tween bay lại đánh quái
					local VirtualUser = game:GetService("VirtualUser")
					VirtualUser:CaptureController()
					VirtualUser:ClickButton1(Vector2.new(851, 158))
				end)
			end
		end)
	end    
})

Tab1:AddToggle({
	Name = "Bật Đặc Sản Săn Trái Spawn",
	Default = false,
	Save = true,
	ID = "AutoFruit",
	Callback = function(state)
		_G.AutoCollect = state
		spawn(function()
			while _G.AutoCollect do wait(0.5)
				pcall(function()
					local khongCoTrai = true
					for i,v in pairs(game.Workspace:GetChildren()) do
						if v:IsA("Tool") and v:FindFirstChild("Handle") then
							khongCoTrai = false
							-- Bay lại lượm trái tự động
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
						end
					end
					
					-- NẾU KHÔNG CÓ TRÁI SPAWN -> TỰ ĐỘNG ĐỔI SERVER (SERVER HOP)
					if khongCoTrai and _G.AutoHop then
						local HttpService = game:GetService("HttpService")
						local TPS = game:GetService("TeleportService")
						local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
						local Data = HttpService:JSONDecode(game:HttpGet(Api))
						for _, server in pairs(Data.data) do
							if server.playing < server.maxPlayers and server.id ~= game.JobId then
								TPS:TeleportToPlaceInstance(game.PlaceId, server.id, game.Players.LocalPlayer)
								break
							end
						end
					end
				end)
			end
		end)
	end    
})

Tab1:AddToggle({
	Name = "Tự Động Đổi Server Khi Hết Trái",
	Default = false,
	Save = true,
	ID = "ServerHop",
	Callback = function(state)
		_G.AutoHop = state
	end
})

OrionLib:Init()
