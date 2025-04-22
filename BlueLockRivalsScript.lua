-- Load Rayfield UI Library
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()
local Window = Rayfield:CreateWindow({
    Name = "Blue Lock: Rivals",
    LoadingTitle = "กำลังโหลด...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "BLRScript",
        FileName = "Config"
    }
})

-- กำหนดค่าต่าง ๆ
getgenv().Configuration = {
    ['Kaitan Mode'] = { Enabled = true, AutoFarm = true },
    ['SeverHop'] = { Enabled = true, Lower = 4 },
    ['Join Team'] = { Enabled = true, Join_CF_First = true, Team = 'Home_RW' },
    ['FPS Limit'] = { Enabled = false, FPS = 15 },
    ['Redeem Code'] = true,
}

-- เมนู AutoFarm
Window:Toggle("เปิด AutoFarm", getgenv().Configuration['Kaitan Mode'].AutoFarm, function(state)
    getgenv().Configuration['Kaitan Mode'].AutoFarm = state
    print("AutoFarm: ", state and "เปิด" or "ปิด")
end)

-- เมนู ServerHop
Window:Toggle("เปิด ServerHop", getgenv().Configuration['SeverHop'].Enabled, function(state)
    getgenv().Configuration['SeverHop'].Enabled = state
    print("ServerHop: ", state and "เปิด" or "ปิด")
end)

-- เมนูเลือกทีม
Window:Dropdown("เลือกทีม", {
    "Home_CF", "Home_LW", "Home_RW", "Home_CM", "Home_GK",
    "Away_CF", "Away_LW", "Away_RW", "Away_CM", "Away_DM", "Away_CB", "Away_GK"
}, function(selected)
    getgenv().Configuration['Join Team'].Team = selected
    print("เลือกทีม:", selected)
end)

-- เมนูจำกัด FPS
Window:Slider("จำกัด FPS", {min = 15, max = 240, default = getgenv().Configuration['FPS Limit'].FPS}, function(value)
    getgenv().Configuration['FPS Limit'].FPS = value
    if getgenv().Configuration['FPS Limit'].Enabled then
        setfpscap(value)
    end
end)

Window:Toggle("เปิดจำกัด FPS", getgenv().Configuration['FPS Limit'].Enabled, function(state)
    getgenv().Configuration['FPS Limit'].Enabled = state
    if state then
        setfpscap(getgenv().Configuration['FPS Limit'].FPS)
    else
        setfpscap(999)
    end
    print("FPS Limit:", state and "เปิด" or "ปิด")
end)

-- เมนู Redeem Code
Window:Button("แลกรับโค้ด", function()
    print("กำลังแลกรับโค้ด...")
    -- ใส่โค้ดแลกรับจริงตรงนี้
end)

print("เมนู Blue Lock: Rivals Loaded!")