local TestRifle = {}
local Data = {
    MagazineSize = 30,
    FireRate = 600, -- Rounds per minute
    ReloadTime = 2.5, -- Seconds
    DamagePerShot = 25,
    AimSpeed = 2, --Seconds to aim down sights
}

function TestRifle:Shoot()
    --Fastcast fork for projectile collisions
    
    print("Bang! Damage dealt: " .. Data.DamagePerShot)
end

function TestRifle:Reload()
    print("Reloading... (" .. Data.ReloadTime .. " seconds)")
end

function TestRifle:Setup(player)
    print("TestRifle equipped by " .. player.Name)
    local data = Data
    
end



return TestRifle