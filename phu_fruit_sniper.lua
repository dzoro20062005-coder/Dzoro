local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TRẦN ANH PHÚ - FRUIT SNIPER", "DarkTheme")

-- BẬT SẴN CHỐNG BAN (ANTI-BAN)
getgenv().AntiBan = true

local Tab = Window:NewTab("Đặc Sản Săn Trái")
local Section = Tab:NewSection("Hệ Thống Săn Trái & Đổi Server")

-- BIẾN ĐIỀU KHIỂN
_G.AutoFruit = false
_G.ServerHop = false

-- NÚT BẬT/TẮT SĂN TRÁI
Section:NewToggle("Bật Đặc Sản Săn Trái", "Tự động bay lại nhặt trái khi spawn", function(state)
    _G.AutoFruit = state
    spawn(function()
        while _G.AutoFruit do wait(1)
            pcall(function()
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Tool") and v:FindFirstChild("Handle") then
                        -- Lệnh bay (Tween) đến tọa độ trái ác quỷ
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                        print("Admin Phú đã nhặt được trái ác quỷ!")
                    end
                end
            end)
        end
    end)
end)

-- NÚT BẬT/TẮT ĐỔI SERVER (SERVER HOP)
Section:NewToggle("Tự Động Đổi Server", "Nhặt xong hoặc không có trái sẽ đổi server ngay", function(state)
    _G.ServerHop = state
    spawn(function()
        while _G.ServerHop do wait(3)
            -- Lệnh kiểm tra và tự động đổi sang server mới
            local HttpService = game:GetService("HttpService")
            local TPS = game:GetService("TeleportService")
            local Api = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local Data = HttpService:JSONDecode(game:HttpGet(Api))
            for i,v in pairs(Data.data) do
                if v.playing < v.maxPlayers and v.id ~= game.JobId then
                    TPS:TeleportToPlaceInstance(game.PlaceId, v.id, game.Players.LocalPlayer)
                end
            end
        end
    end)
end)

-- NÚT DẤU TRỪ (-) THU NHỎ SÁT NÚT X
Section:NewKeybind("Đóng/Mở Bảng", "Nhấn để ẩn bảng menu", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
