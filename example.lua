function httpget(url)
    local d,ise,Body=false,false,""
    game:GetService("HttpService"):RequestInternal({Url = url,Method = "GET"}):Start(function(suc, res) if not suc then Body = res.StatusCode ise = true d=true return end Body=res.Body d=true end)
    repeat task.wait() until d
    if ise then error(Body, 0) end return Body
end


local yLoad = loadstring(httpget("https://raw.githubusercontent.com/CatGuyMoment/yLoader/main/lua"))()



local text = yLoad(workspace)


local maxLen = 199990
local newgui = Instance.new("ScreenGui")
for i=0,(#text//maxLen) do
	
	local newobj = Instance.new("TextBox")
	newobj.ClearTextOnFocus = false
	newobj.TextEditable = false
	newgui.Parent = game.Players.LocalPlayer.PlayerGui
	newobj.Parent = newgui
	newobj.Text = text:sub(i*maxLen, ((i+1)*maxLen) -1)
	newobj.MaxVisibleGraphemes = 0
	newobj.Position = UDim2.new( (i%20)*0.05,0,(i//20)*0.05,0 )
	newobj.Size = UDim2.new(0.05,0,.05,00)
	newobj.Focused:Connect(function()
		newobj.BackgroundColor3 = Color3.new(1,0,0)
	end)
	newobj.FocusLost:Connect(function()
		newobj.BackgroundColor3 = Color3.new(1,1,1)
	end)
	wait()
end
