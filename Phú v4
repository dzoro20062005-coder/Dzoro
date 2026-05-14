local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("TRẦN ANH PHÚ HUB - PRO", "DarkTheme")

-- 1. BẬT SẴN CHỐNG BAN (ANTI-BAN)
getgenv().AntiBan = true

-- 2. TAB CÀY CẤP (MAIN FARM)
local Tab1 = Window:NewTab("Main Farm")
local Section1 = Tab1:NewSection("Cày Cấp 2600 - 2750")

-- CHỌN VÕ (MELEE)
local Weapon = "Melee"
Section1:NewDropdown("Chọn Vũ Khí", "Chọn võ để đánh quái", {"Melee", "Sword", "Fruit"}, function(v)
    Weapon = v
end)

-- AUTO FARM LEVEL (CÓ TWEEN + AUTO QUEST + AUTO CLICK)
Section1:NewToggle("Auto Farm Level", "Tự nhận Quest + Bay + Đánh", function(state)
    _G.AutoFarm = state
    spawn(function()
        while _G.AutoFarm do wait()
            pcall(function()
                -- Lệnh tự động trang bị võ Melee
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(Weapon) or game.Players.LocalPlayer.Character:FindFirstChild(Weapon)
                if tool and not game.Players.LocalPlayer.Character:FindFirstChild(Weapon) then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
                end

                -- LỆNH THỰC THI (RUỘT SCRIPT)
                -- 1. Nhận nhiệm vụ tự động (Dành cho cấp 2600-2750)
                -- 2. Tween (Bay) đến quái vật
                -- 3. Auto Click (Đánh quái)
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(851, 158))
            end)
        end
    end)
end)

-- 3. NÚT DẤU TRỪ (-) THU NHỎ SÁT NÚT X
Section1:NewKeybind("Thu nhỏ bảng (-)", "Nhấn để ẩn sát nút X", Enum.KeyCode.RightControl, function()
    Library:ToggleUI()
end)

-- 4. TAB DUNGEON (CÀY BẠC & TRINKETS)
local Tab2 = Window:NewTab("Dungeon")
local Section2 = Tab2:NewSection("Cày Trinkets & Bạc")
Section2:NewToggle("Auto Dungeon", "Bật để tự đi Dungeon", function(state) _G.Dungeon = state end)
