
  -----------------------------
  -- INIT
  -----------------------------

  --get the addon namespace
  local addon, ns = ...
  local gcfg = ns.cfg
  --get some values from the namespace
  local cfg = {
      enable          = true, --enable module
      show            = true, --true/false
      scale           = 0.7,
      padding         = 0, --frame padding
      pos             = { a1 = "BOTTOM", a2 = "BOTTOM", af = "UIParent", x = 210, y =-5 },
      userplaced      = {
        enable          = true,
      }
	  }
  local dragFrameList = ns.dragFrameList

  -----------------------------
  -- FUNCTIONS
  -----------------------------

  if not cfg.enable then return end

  --micro menu button objects
  local buttonList = {
    CharacterMicroButton,
    SpellbookMicroButton,
    TalentMicroButton,
    AchievementMicroButton,
    QuestLogMicroButton,
    GuildMicroButton,
    PVPMicroButton,
    LFDMicroButton,
    CompanionsMicroButton,
    EJMicroButton,
    MainMenuMicroButton,
    HelpMicroButton,
	CollectionsMicroButton,
	StoreMicroButton
  }

  local NUM_MICROBUTTONS = # buttonList
  local buttonWidth = CharacterMicroButton:GetWidth()
  local buttonHeight = CharacterMicroButton:GetHeight()
  local gap = -3

  --create the frame to hold the buttons
  local frame = CreateFrame("Frame", "rABS_MicroMenu", UIParent, "SecureHandlerStateTemplate")
  frame:SetWidth(NUM_MICROBUTTONS*buttonWidth + (NUM_MICROBUTTONS-1)*gap + 2*cfg.padding)
  frame:SetHeight(buttonHeight + 2*cfg.padding)
  frame:SetPoint(cfg.pos.a1,cfg.pos.af,cfg.pos.a2,cfg.pos.x,cfg.pos.y)
  frame:SetScale(cfg.scale)
  frame:SetAlpha(0.3)

  --move the buttons into position and reparent them
  for _, button in pairs(buttonList) do
    button:SetParent(frame)
  end
  CharacterMicroButton:ClearAllPoints();
  CharacterMicroButton:SetPoint("LEFT", cfg.padding, 0)
  
  --disable reanchoring of the micro menu by the petbattle ui
  PetBattleFrame.BottomFrame.MicroButtonFrame:SetScript("OnShow", nil) --remove the onshow script

  if not cfg.show then --wait...you no see me? :(
    frame:SetParent(rABS_BizzardHider)
    return
  end

  --show/hide the frame on a given state driver
  RegisterStateDriver(frame, "visibility", "[petbattle] hide; show")

  --create drag frame and drag functionality
