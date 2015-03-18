ChatTypeInfo["WHISPER"].sticky=0
function ChatEdit_CustomTabPressed(self)

end
for i = 1, NUM_CHAT_WINDOWS do
chat = _G[format("ChatFrame%s", i)]:GetName()
for j = 1, #CHAT_FRAME_TEXTURES do 
_G[chat..CHAT_FRAME_TEXTURES[j]]:SetTexture(nil) 
end
_G[format("ChatFrame%sTabLeft", i)]:SetTexture(nil)
_G[format("ChatFrame%sTabMiddle", i)]:SetTexture(nil)
_G[format("ChatFrame%sTabRight", i)]:SetTexture(nil)
_G[format("ChatFrame%sTabSelectedLeft", i)]:SetTexture(nil)
_G[format("ChatFrame%sTabSelectedMiddle", i)]:SetTexture(nil)
_G[format("ChatFrame%sTabSelectedRight", i)]:SetTexture(nil) 
 end