--// Servizes :D

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ts = game:GetService("TweenService")
local hs = game:GetService("HttpService")
local uis = game:GetService("UserInputService")
local cg = game:GetService("CoreGui")
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()

local genname = "bruistgv1"

local drag = function(obj, latency)
    toggled = nil
    input = nil
    start = nil

    function updateInput(input)
        local Delta = input.Position - start
        local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale,
            startPos.Y.Offset + Delta.Y)
        ts:Create(obj, TweenInfo.new(latency), { Position = Position }):Play()
    end

    obj.InputBegan:Connect(function(inp)
        if (inp.UserInputType == Enum.UserInputType.MouseButton1) then
            toggled = true
            start = inp.Position
            startPos = obj.Position
            inp.Changed:Connect(function()
                if (inp.UserInputState == Enum.UserInputState.End) then
                    toggled = false
                end
            end)
        end
    end)

    obj.InputChanged:Connect(function(inp)
        if (inp.UserInputType == Enum.UserInputType.MouseMovement) then
            input = inp
        end
    end)

    uis.InputChanged:Connect(function(inp)
        if (inp == input and toggled) then
            updateInput(inp)
        end
    end)
end

local magic = {}

magic.__index = magic

function magic:CreateWindow(titly)
    for i, guis in pairs(cg:GetChildren()) do
        if guis.Name == genname then
            guis:Destroy()
        end
    end

    function magic:set_defaults(defaults, options)
        defaults = defaults or {}
        options = options or {}
        for option, value in next, options do
            defaults[option] = value
        end
        return defaults
    end

    local magic = Instance.new("ScreenGui", cg)
    magic.ResetOnSpawn = false
    magic.Name = genname
    magic.ZIndexBehavior = Enum.ZIndexBehavior.Global

    local Mainframe = Instance.new("Frame", magic)
    Mainframe.BorderSizePixel = 0
    Mainframe.Position = UDim2.new(0, 5, 0, 5)
    Mainframe.Size = UDim2.new(0, 520, 0, 620)
    Mainframe.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
    Mainframe.ClipsDescendants = true

    drag(Mainframe, 0.08)

    uis.InputBegan:Connect(function(Input, GameProcessed)
        if Input.KeyCode == Enum.KeyCode.LeftAlt and not GameProcessed then
            Mainframe.Visible = not Mainframe.Visible
        end
    end)

    local mfstroke = Instance.new("UIStroke", Mainframe)
    mfstroke.Color = Color3.fromRGB(86, 86, 86)
    mfstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local mfinnerholder = Instance.new("UIListLayout", Mainframe)
    mfinnerholder.VerticalAlignment = Enum.VerticalAlignment.Center
    mfinnerholder.HorizontalAlignment = Enum.HorizontalAlignment.Center

    local InnerMainFrame = Instance.new("Frame", Mainframe)
    InnerMainFrame.BorderSizePixel = 0
    InnerMainFrame.Size = UDim2.new(0, 505, 0, 605)
    InnerMainFrame.BackgroundColor3 = Color3.fromRGB(19, 19, 19)

    local title = Instance.new("TextLabel", InnerMainFrame)
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(0, 491, 0, 25)
    title.FontFace = Font.new("rbxassetid://11702779517")
    title.Position = UDim2.new(0.016, 0, 0, 0)
    title.Text = titly
    title.TextSize = 12.5
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextColor3 = Color3.fromRGB(211, 211, 211)

    local imfstroke = Instance.new("UIStroke", InnerMainFrame)
    imfstroke.Color = Color3.fromRGB(86, 86, 86)
    imfstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local TopAccent = Instance.new("Frame", InnerMainFrame)
    TopAccent.BorderSizePixel = 0
    TopAccent.Size = UDim2.new(0, 505, 0, 1)
    TopAccent.BackgroundColor3 = Color3.fromRGB(129, 104, 109)

    local InnerTabFrame = Instance.new("Frame", InnerMainFrame)
    InnerTabFrame.Size = UDim2.new(0, 491, 0, 25)
    InnerTabFrame.Position = UDim2.new(0.016, 0, 0.041, 0)
    InnerTabFrame.BorderSizePixel = 0
    InnerTabFrame.BackgroundColor3 = Color3.fromRGB(23, 23, 23)

    local itfstroke = Instance.new("UIStroke", InnerTabFrame)
    itfstroke.Color = Color3.fromRGB(86, 86, 86)
    itfstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local itflist = Instance.new("UIListLayout", InnerTabFrame)
    itflist.VerticalAlignment = Enum.VerticalAlignment.Center
    itflist.HorizontalAlignment = Enum.HorizontalAlignment.Center
    itflist.FillDirection = Enum.FillDirection.Horizontal

    local PageHolder = Instance.new("Frame", InnerMainFrame)
    PageHolder.BackgroundTransparency = 1
    PageHolder.Size = UDim2.new(0, 491, 0, 539)
    PageHolder.Position = UDim2.new(0.016, 0, 0.098, 0)

    local tabs = {}
    function tabs:Notify(text, description, time)
        --//omg got me working so hard ;D
        local Notification                = Instance.new("Frame", magic)
        Notification.BackgroundColor3     = Color3.fromRGB(39, 39, 39)
        Notification.Size                 = UDim2.new(0, 257, 0, 60)
        Notification.Position             = UDim2.new(0.5, 0, 1.5, 0)
        Notification.BorderSizePixel      = 0

        local nstroke                     = Instance.new("UIStroke", Notification)
        nstroke.Color                     = Color3.fromRGB(86, 86, 86)
        nstroke.ApplyStrokeMode           = Enum.ApplyStrokeMode.Border

        local InnerNotif                  = Instance.new("Frame", Notification)
        InnerNotif.BackgroundColor3       = Color3.fromRGB(27, 27, 27)
        InnerNotif.Size                   = UDim2.new(0, 242, 0, 45)
        InnerNotif.Position               = UDim2.new(0.027, 0, 0.117, 0)
        InnerNotif.BorderSizePixel        = 0

        local instroke                    = Instance.new("UIStroke", InnerNotif)
        instroke.Color                    = Color3.fromRGB(86, 86, 86)
        instroke.ApplyStrokeMode          = Enum.ApplyStrokeMode.Border

        local notiftitle                  = Instance.new("TextLabel", InnerNotif)
        notiftitle.BackgroundTransparency = 1
        notiftitle.Size                   = UDim2.new(0, 232, 0, 23)
        notiftitle.FontFace               = Font.new("rbxassetid://11702779517")
        notiftitle.Position               = UDim2.new(0.037, 0, -0.02, 0)
        notiftitle.Text                   = text
        notiftitle.TextSize               = 12.5
        notiftitle.TextXAlignment         = Enum.TextXAlignment.Left
        notiftitle.TextColor3             = Color3.fromRGB(211, 211, 211)

        local notifdesc                   = Instance.new("TextLabel", InnerNotif)
        notifdesc.BackgroundTransparency  = 1
        notifdesc.Size                    = UDim2.new(0, 232, 0, 30)
        notifdesc.FontFace                = Font.new("rbxassetid://11702779517")
        notifdesc.Position                = UDim2.new(0.037, 0, 0.333, 0)
        notifdesc.Text                    = description
        notifdesc.TextSize                = 12.5
        notifdesc.TextXAlignment          = Enum.TextXAlignment.Left
        notifdesc.TextColor3              = Color3.fromRGB(139, 139, 139)

        ts:Create(Notification, TweenInfo.new(0.30, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
            { Position = UDim2.new(0.5, 0, 0.90, 0) }):Play()
        wait(time + 0.60)
        ts:Create(Notification, TweenInfo.new(0.30, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
            { Position = UDim2.new(0.5, 0, 1.5, 0) }):Play()
    end

    function tabs:TitleBar(ver, text1, text2, text3, text4)
        local TitleBar = Instance.new("Frame", magic)
        TitleBar.BackgroundTransparency = 1
        TitleBar.Size = UDim2.new(0, 695, 0, 33)
        TitleBar.Position = UDim2.new(0, 15, 0.89, 0)
        TitleBar.BorderSizePixel = 0

        local InnerTitleBar = Instance.new("Frame", TitleBar)
        InnerTitleBar.BackgroundTransparency = 1
        InnerTitleBar.Size = UDim2.new(0, 689, 0, 28)
        InnerTitleBar.Position = UDim2.new(0.004, 0, 0.061, 0)
        InnerTitleBar.ClipsDescendants = true
        InnerTitleBar.BorderSizePixel = 0

        local dawnimg = Instance.new("ImageLabel", InnerTitleBar)
        dawnimg.BackgroundTransparency = 1
        dawnimg.Size = UDim2.new(0, 19, 0, 19)
        dawnimg.Position = UDim2.new(0.009, 0, 0.171, 0)
        dawnimg.Image = "rbxassetid://116000177073717"

        local titles = Instance.new("TextLabel", InnerTitleBar)
        titles.BackgroundTransparency = 1
        titles.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        titles.Size = UDim2.new(0.952, 0, 1, 0)
        titles.Position = UDim2.new(0.046, 0, 0, 0)
        titles.Text = ver ..
            " | " ..
            text1 ..
            " | " ..
            text2 ..
            " | " .. text3 .. " | " .. text4                   --// How many texts do u want love? REPLY NOW ->
        titles.TextSize = 12.5
        titles.FontFace = Font.new("rbxassetid://11702779517") --// put ur font here 💖
        titles.TextColor3 = Color3.fromRGB(214, 214, 214)
        titles.TextXAlignment = Enum.TextXAlignment.Left
    end

    function tabs:CreateTab(title)
        local TabButton = Instance.new("TextButton", InnerTabFrame)
        TabButton.BackgroundTransparency = 1
        TabButton.BorderSizePixel = 0
        TabButton.Size = UDim2.new(0, 91, 0, 27)
        TabButton.FontFace = Font.new("rbxassetid://11702779517")
        TabButton.Text = title
        TabButton.TextSize = 12.5
        TabButton.TextColor3 = Color3.fromRGB(184, 184, 184)

        local Tblist = Instance.new("UIListLayout", TabButton)
        Tblist.VerticalAlignment = Enum.VerticalAlignment.Top
        Tblist.HorizontalAlignment = Enum.HorizontalAlignment.Center
        Tblist.FillDirection = Enum.FillDirection.Horizontal

        local tbframe = Instance.new("Frame", TabButton)
        tbframe.BackgroundColor3 = Color3.fromRGB(129, 104, 109)
        tbframe.BorderSizePixel = 0
        tbframe.Size = UDim2.new(0, 0, 0, 1)
        tbframe.Name = "imafaggot"

        local Page = Instance.new("Frame", PageHolder)
        Page.BackgroundTransparency = 1
        Page.Size = UDim2.new(0, 491, 0, 539)
        Page.Position = UDim2.new(0, 0, 1.55, 0)
        Page.Name = "page"

        local PageLayouty = Instance.new("UIGridLayout", Page)
        PageLayouty.CellSize = UDim2.new(0, 241, 0, 539)
        PageLayouty.CellPadding = UDim2.new(0, 9, 0, 5)

        TabButton.MouseButton1Down:Connect(function()
            for i, pages in pairs(PageHolder:GetChildren()) do
                if pages.Name == "page" then
                    ts:Create(pages, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Position = UDim2.new(0, 0, 1.55, 0) }):Play()
                end
            end
            ts:Create(Page, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                { Position = UDim2.new(0, 0, 0, 0) }):Play()

            for i, btns in pairs(InnerTabFrame:GetChildren()) do
                if btns:IsA("TextButton") then
                    ts:Create(btns, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { TextColor3 = Color3.fromRGB(184, 184, 184) }):Play()
                    ts:Create(btns.imafaggot, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Size = UDim2.new(0, 0, 0, 1) }):Play()
                end
            end
            ts:Create(TabButton, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                { TextColor3 = Color3.fromRGB(129, 104, 109) }):Play()
            ts:Create(tbframe, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 40, 0, 1) }):Play()
        end)

        local sections = {}

        function sections:Section()
            local Sect = Instance.new("ScrollingFrame", Page)
            Sect.BorderSizePixel = 0
            Sect.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
            Sect.ScrollBarThickness = 0

            local sstroke = Instance.new("UIStroke", Sect)
            sstroke.Color = Color3.fromRGB(86, 86, 86)
            sstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local spadd = Instance.new("UIPadding", Sect)
            spadd.PaddingTop = UDim.new(0, 11)

            local slist = Instance.new("UIListLayout", Sect)
            slist.VerticalAlignment = Enum.VerticalAlignment.Top
            slist.HorizontalAlignment = Enum.HorizontalAlignment.Center
            slist.SortOrder = Enum.SortOrder.LayoutOrder

            RunService.RenderStepped:Connect(function()
                Sect.CanvasSize = UDim2.new(0, 0, 0, slist.AbsoluteContentSize.Y)
            end)

            slist.Padding = UDim.new(0, 6)

            local items = {}

            function items:Button(title, callback)
                local Btn = Instance.new("TextButton", Sect)
                Btn.Size = UDim2.new(0, 231, 0, 19)
                Btn.BorderSizePixel = 0
                Btn.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                Btn.FontFace = Font.new("rbxassetid://11702779517")
                Btn.Text = title
                Btn.TextSize = 12.5
                Btn.TextColor3 = Color3.fromRGB(165, 165, 165)

                local btnstroke = Instance.new("UIStroke", Btn)
                btnstroke.Color = Color3.fromRGB(66, 66, 66)
                btnstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                Btn.MouseEnter:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                Btn.MouseLeave:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                Btn.MouseButton1Down:Connect(function()
                    callback()
                end)
            end

            function items:Toggle(title, callback)
                local toggled = false

                local togglebtn = Instance.new("TextButton", Sect)
                togglebtn.Size = UDim2.new(0, 231, 0, 19)
                togglebtn.BorderSizePixel = 0
                togglebtn.BackgroundTransparency = 1
                togglebtn.FontFace = Font.new("rbxassetid://11702779517")
                togglebtn.Text = title
                togglebtn.TextSize = 12.5
                togglebtn.TextColor3 = Color3.fromRGB(203, 203, 203)
                togglebtn.TextXAlignment = Enum.TextXAlignment.Left

                local toggpadd = Instance.new("UIPadding", togglebtn)
                toggpadd.PaddingLeft = UDim.new(0, 20)

                local ToggleBox = Instance.new("Frame", togglebtn)
                ToggleBox.Position = UDim2.new(-0.089, 0, 0.158, 0)
                ToggleBox.Size = UDim2.new(0, 13, 0, 13)
                ToggleBox.BorderSizePixel = 0
                ToggleBox.BackgroundColor3 = Color3.fromRGB(23, 23, 23)

                local btnstroke = Instance.new("UIStroke", ToggleBox)
                btnstroke.Color = Color3.fromRGB(66, 66, 66)
                btnstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                togglebtn.MouseEnter:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                togglebtn.MouseLeave:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                local function toggel()
                    toggled = not toggled
                    if toggled then
                        ts:Create(ToggleBox, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                            { BackgroundColor3 = Color3.fromRGB(162, 119, 125) }):Play()
                    else
                        ts:Create(ToggleBox, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                            { BackgroundColor3 = Color3.fromRGB(31, 31, 31) }):Play()
                    end
                    callback(toggled)
                end

                togglebtn.MouseButton1Down:Connect(toggel)
            end

            function items:Seperator(text)
                local seperate = Instance.new("TextLabel", Sect)
                seperate.BackgroundTransparency = 1
                seperate.Size = UDim2.new(0, 236, 0, 23)
                seperate.FontFace = Font.new("rbxassetid://11702779517")
                seperate.Text = text
                seperate.TextSize = 12.5
                seperate.TextXAlignment = Enum.TextXAlignment.Left
                seperate.TextColor3 = Color3.fromRGB(165, 165, 165)

                seperate.MouseEnter:Connect(function()
                    ts:Create(seperate, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { TextColor3 = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                seperate.MouseLeave:Connect(function()
                    ts:Create(seperate, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { TextColor3 = Color3.fromRGB(165, 165, 165) }):Play()
                end)
            end

            function items:Slider(title, min, max, callback)
                local val
                local ms = game:GetService("Players").LocalPlayer:GetMouse()

                local SliderHolder = Instance.new("Frame", Sect)
                SliderHolder.BackgroundTransparency = 1
                SliderHolder.Size = UDim2.new(0, 231, 0, 39)

                local slname = Instance.new("TextLabel", SliderHolder)
                slname.BackgroundTransparency = 1
                slname.Position = UDim2.new(0.017, 0, 0.231, 0)
                slname.Size = UDim2.new(0, 231, 0, -14)
                slname.FontFace = Font.new("rbxassetid://11702779517")
                slname.Text = title
                slname.TextSize = 12.5
                slname.TextXAlignment = Enum.TextXAlignment.Left
                slname.TextColor3 = Color3.fromRGB(165, 165, 165)

                local SlButton = Instance.new("TextButton", SliderHolder)
                SlButton.Size = UDim2.new(0, 226, 0, 14)
                SlButton.Position = UDim2.new(0.021, 0, 0.249, 0)
                SlButton.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
                SlButton.BorderSizePixel = 0
                SlButton.Text = ""

                local slbstroke = Instance.new("UIStroke", SlButton)
                slbstroke.Color = Color3.fromRGB(66, 66, 66)
                slbstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local Slide = Instance.new("Frame", SlButton)
                Slide.Size = UDim2.new(0, 0, 0, 14)
                Slide.BackgroundColor3 = Color3.fromRGB(162, 119, 125)
                Slide.BorderSizePixel = 0

                local slval = Instance.new("TextLabel", SlButton)
                slval.BackgroundTransparency = 1
                slval.Size = UDim2.new(0, 226, 0, 14)
                slval.Position = UDim2.new(0, 0, 0, 0)
                slval.Text = tostring(min)
                slval.TextSize = 12.5
                slval.FontFace = Font.new("rbxassetid://11702779517") --// put ur font here 💖
                slval.TextColor3 = Color3.fromRGB(214, 214, 214)
                slval.TextXAlignment = Enum.TextXAlignment.Center

                SlButton.MouseEnter:Connect(function()
                    ts:Create(slbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                SlButton.MouseLeave:Connect(function()
                    ts:Create(slbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                SlButton.MouseButton1Down:Connect(function() --// Js testing with the tweening idk
                    val = math.floor(((tonumber(max) - tonumber(min)) / 226 * Slide.AbsoluteSize.X) + tonumber(min)) or 0
                    pcall(function()
                        callback(val)
                        slval.Text = val
                    end)
                    -- Slide.Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsoluteSize.X, 0, 203), 0, 9)
                    ts:Create(Slide, TweenInfo.new(.07, Enum.EasingStyle.Quint),
                        { Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsoluteSize.X, 0, 226), 0, 14) }):Play()
                    moveconnection = ms.Move:Connect(function()
                        val = math.floor((((tonumber(max) - tonumber(min)) / 226) * Slide.AbsoluteSize.X) + tonumber(min))
                        pcall(function()
                            callback(val)
                            slval.Text = val
                        end)
                        -- Slide.Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsolutePosition.X, 0, 203), 0, 9)
                        ts:Create(Slide, TweenInfo.new(.07, Enum.EasingStyle.Quint),
                            { Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsolutePosition.X, 0, 226), 0, 14) }):Play()
                    end)
                    releaseconnection = uis.InputEnded:Connect(function(Mouse)
                        if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                            val = math.floor((((tonumber(max) - tonumber(min)) / 226) * Slide.AbsoluteSize.X) +
                                tonumber(min))
                            pcall(function()
                                callback(val)
                            end)
                            -- Slide.Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsolutePosition.X, 0, 203), 0, 9)
                            ts:Create(Slide, TweenInfo.new(.07, Enum.EasingStyle.Quint),
                                { Size = UDim2.new(0, math.clamp(ms.X - Slide.AbsolutePosition.X, 0, 226), 0, 14) })
                                :Play()
                            moveconnection:Disconnect()
                            releaseconnection:Disconnect()
                        end
                    end)
                end)
            end

            function items:Keybind(options)
                options.bind = options.bind or Enum.KeyCode.G
                options.Callback = options.Callback or function() end

                local keybind = Instance.new("TextButton", Sect)
                keybind.Size = UDim2.new(0, 231, 0, 19)
                keybind.BorderSizePixel = 0
                keybind.BackgroundTransparency = 1
                keybind.FontFace = Font.new("rbxassetid://11702779517")
                keybind.Text = options.title
                keybind.TextSize = 12.5
                keybind.TextColor3 = Color3.fromRGB(203, 203, 203)
                keybind.TextXAlignment = Enum.TextXAlignment.Left

                local toggpadd = Instance.new("UIPadding", keybind)
                toggpadd.PaddingLeft = UDim.new(0, 3)

                local kbbox = Instance.new("TextBox", keybind)
                kbbox.Position = UDim2.new(0.87, 0, 0.158, 0)
                kbbox.Size = UDim2.new(0, 30, 0, 13)
                kbbox.BorderSizePixel = 0
                kbbox.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                kbbox.FontFace = Font.new("rbxassetid://11702779517")
                kbbox.Text = ". . ."
                kbbox.TextSize = 12.5
                kbbox.TextColor3 = Color3.fromRGB(203, 203, 203)
                kbbox.TextXAlignment = Enum.TextXAlignment.Center
                kbbox.TextEditable = false

                local btnstroke = Instance.new("UIStroke", kbbox)
                btnstroke.Color = Color3.fromRGB(66, 66, 66)
                btnstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                keybind.MouseEnter:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                keybind.MouseLeave:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                local listening = false

                --// local ChatTextBox = game:GetService("CoreGui").ExperienceChat.appLayout.chatInputBar.Background.Container.TextContainer.TextBoxContainer.TextBox
                uis.InputBegan:Connect(function(key, gameProcessed)
                    if listening and not uis:GetFocusedTextBox() then
                        if key.UserInputType == Enum.UserInputType.Keyboard then
                            if key.KeyCode ~= Enum.KeyCode.Escape then
                                options.bind = key.KeyCode
                            end
                            kbbox.Text = (options.bind and tostring(options.bind.Name):upper()) or "?"
                            listening = false
                        end
                    else
                        if key.KeyCode == options.bind then
                            options.Callback()
                        end
                    end
                end)

                keybind.MouseButton1Click:connect(function()
                    if not listening then
                        listening = true; kbbox.Text = "..."
                    end
                end)
            end

            function items:TextBox(title, phtext, callback)
                local TextBoxHolder = Instance.new("Frame", Sect)
                TextBoxHolder.BackgroundTransparency = 1
                TextBoxHolder.Size = UDim2.new(0, 231, 0, 39)

                local tbname = Instance.new("TextLabel", TextBoxHolder)
                tbname.BackgroundTransparency = 1
                tbname.Position = UDim2.new(0.017, 0, 0.231, 0)
                tbname.Size = UDim2.new(0, 231, 0, -14)
                tbname.FontFace = Font.new("rbxassetid://11702779517")
                tbname.Text = title
                tbname.TextSize = 12.5
                tbname.TextXAlignment = Enum.TextXAlignment.Left
                tbname.TextColor3 = Color3.fromRGB(165, 165, 165)

                local textbox = Instance.new("TextBox", TextBoxHolder)
                textbox.BackgroundTransparency = 1
                textbox.Position = UDim2.new(0.021, 0, 0.256, 0)
                textbox.Size = UDim2.new(0, 226, 0, 21)
                textbox.PlaceholderColor3 = Color3.fromRGB(136, 136, 136)
                textbox.FontFace = Font.new("rbxassetid://11702779517")
                textbox.PlaceholderText = phtext
                textbox.TextSize = 12.5
                textbox.TextXAlignment = Enum.TextXAlignment.Left
                textbox.TextColor3 = Color3.fromRGB(165, 165, 165)

                local tbpadding = Instance.new("UIPadding", textbox)
                tbpadding.PaddingLeft = UDim.new(0, 4)

                local txbstroke = Instance.new("UIStroke", textbox)
                txbstroke.Color = Color3.fromRGB(66, 66, 66)
                txbstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                textbox.MouseEnter:Connect(function()
                    ts:Create(txbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                textbox.MouseLeave:Connect(function()
                    ts:Create(txbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                textbox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        pcall(callback, textbox.Text)
                    else
                        pcall(callback, textbox.Text)
                    end
                end)
            end

            function items:ImageTB(options)
                local TextBoxHolder = Instance.new("Frame", Sect)
                TextBoxHolder.BackgroundTransparency = 1
                TextBoxHolder.Size = UDim2.new(0, 231, 0, 39)

                local tbname = Instance.new("TextLabel", TextBoxHolder)
                tbname.BackgroundTransparency = 1
                tbname.Position = UDim2.new(0.017, 0, 0.231, 0)
                tbname.Size = UDim2.new(0, 231, 0, -14)
                tbname.FontFace = Font.new("rbxassetid://11702779517")
                tbname.Text = options.Name
                tbname.TextSize = 12.5
                tbname.TextXAlignment = Enum.TextXAlignment.Left
                tbname.TextColor3 = Color3.fromRGB(165, 165, 165)

                local img = Instance.new("ImageLabel", TextBoxHolder)
                img.BackgroundTransparency = 1
                img.Position = UDim2.new(0.89, 0, 0.231, 0)
                img.Size = UDim2.new(0, 14, 0, -14)
                img.Image = options.Image
                img.ImageTransparency = 0.37

                local textbox = Instance.new("TextBox", TextBoxHolder)
                textbox.BackgroundTransparency = 1
                textbox.Position = UDim2.new(0.021, 0, 0.256, 0)
                textbox.Size = UDim2.new(0, 226, 0, 21)
                textbox.PlaceholderColor3 = Color3.fromRGB(136, 136, 136)
                textbox.FontFace = Font.new("rbxassetid://11702779517")
                textbox.PlaceholderText = options.Placeholder
                textbox.TextSize = 12.5
                textbox.TextXAlignment = Enum.TextXAlignment.Left
                textbox.TextColor3 = Color3.fromRGB(165, 165, 165)

                local tbpadding = Instance.new("UIPadding", textbox)
                tbpadding.PaddingLeft = UDim.new(0, 4)

                local txbstroke = Instance.new("UIStroke", textbox)
                txbstroke.Color = Color3.fromRGB(66, 66, 66)
                txbstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                textbox.MouseEnter:Connect(function()
                    ts:Create(txbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                textbox.MouseLeave:Connect(function()
                    ts:Create(txbstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                textbox.FocusLost:Connect(function(enterPressed)
                    if enterPressed then
                        pcall(options.Callback, textbox.Text)
                    else
                        pcall(options.Callback, textbox.Text)
                    end
                end)
            end

            return items
        end

        function sections:BigSection()
            PageLayouty.CellSize = UDim2.new(0, 491, 0, 539)

            local Sect = Instance.new("Frame", Page)
            Sect.BorderSizePixel = 0
            Sect.BackgroundColor3 = Color3.fromRGB(23, 23, 23)

            local sstroke = Instance.new("UIStroke", Sect)
            sstroke.Color = Color3.fromRGB(86, 86, 86)
            sstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local spadd = Instance.new("UIPadding", Sect)
            spadd.PaddingTop = UDim.new(0, 7)

            local PageLayout = Instance.new("UIGridLayout", Sect)
            PageLayout.CellSize = UDim2.new(0, 231, 0, 19)
            PageLayout.CellPadding = UDim2.new(0, 9, 0, 5)
            PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

            local itemz = {}
            function itemz:Button(title, callback)
                local Btn = Instance.new("TextButton", Sect)
                Btn.BorderSizePixel = 0
                Btn.BackgroundColor3 = Color3.fromRGB(23, 23, 23)
                Btn.FontFace = Font.new("rbxassetid://11702779517")
                Btn.Text = title
                Btn.TextSize = 12.5
                Btn.TextColor3 = Color3.fromRGB(165, 165, 165)

                local btnstroke = Instance.new("UIStroke", Btn)
                btnstroke.Color = Color3.fromRGB(66, 66, 66)
                btnstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                Btn.MouseEnter:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(162, 119, 125) }):Play()
                end)

                Btn.MouseLeave:Connect(function()
                    ts:Create(btnstroke, TweenInfo.new(0.35, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
                        { Color = Color3.fromRGB(66, 66, 66) }):Play()
                end)

                Btn.MouseButton1Down:Connect(function()
                    callback()
                end)
            end

            return itemz
        end

        return sections
    end

    return tabs
end

return magic
