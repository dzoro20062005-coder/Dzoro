local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TRẦN ANH PHÚ HUZ - v1", "DarkTheme")

-- 1. BẬT SẴN CHỐNG BAN (ANTI-BAN)
getgenv().AntiBan = true

-- 2. TAB DUNGEON (CÀY BẠC & TRINKETS)
local Tab1 = Window:NewTab("Dungeon Pro")
local Section1 = Tab1:NewSection("Cày Bạc Trắng & Trinkets")

Section1:NewToggle("Auto Dungeon", "Tự động đi Dungeon cày bạc", function(state)
    _G.AutoDungeon = state
    while _G.AutoDungeon do wait()
        pcall(function()
            -- Lệnh Tween (Bay) đến các phòng trong Dungeon
            -- Lệnh Auto Attack để diệt quái lấy Trinkets
        end)
    end
end)

Section1:NewToggle("Auto Farm Bạc Trắng", "Tự động gom bạc khi xong ải", function(state)
    _G.FarmSilver = state
end)

-- 3. TAB MAIN FARM (CÀY CẤP NHƯ CŨ)
local Tab2 = Window:NewTab("Main Farm")
local Section2 = Tab2:NewSection("Quest & Attack")

Section2:NewToggle("Auto Farm Level (Tween/Quest)", "Tự nhận nhiệm vụ + Bay + Đánh", function(state)
    _G.AutoFarm = state
    -- Code xử lý bay và đánh quái của Phú
end)

-- 4. NÚT DẤU TRỪ THU NHỎ (SÁT NÚT X)
Section2:NewKeybind("Thu nhỏ bảng (-)", "Nhấn để ẩn sát nút X", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)
