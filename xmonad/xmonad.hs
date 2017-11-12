import System.IO
import XMonad
import XMonad.Config.Desktop
import XMonad.Config.Mate
import XMonad.Layout
import XMonad.Layout.ResizableTile
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.EwmhDesktops
import XMonad.Util.Run
import XMonad.Util.EZConfig


-- Basic
-- myTerminal = "urxvt"
myTerminal = "alacritty"
myModMask = mod4Mask
myLauncher = "rofi -matching fuzzy -modi combi -show combi -combi-modi run,drun"
myBrowser = "firefox-developer"
-- myWorkspaces = ["Alice", "Beth", "Clare", "Dietrich" ]
myBorderWidth = 2

-- Color
colorBlue      = "#857da9"
colorRed       = "#f44242"
colorGreen     = "#88b986"
colorGray      = "#676767"
colorWhite     = "#d3d7cf"
colorGrayAlt   = "#313131"
colorNormalbg  = "#1a1e1b"
colorX         = "#7f00ff"

-- Window Layout
myLayout = tiled ||| Mirror tiled ||| Full
  where
    tiled = smartSpacing 2 $ Tall master delta ratio
    master = 1
    delta = 3/100
    ratio = 3/5

-- Floating, Ignore Applications
myManageHook = composeAll
  [ className =? "gmrun" --> doCenterFloat
  , resource =? "desktop_window" --> doIgnore
  , resource =? "kdesktop" --> doIgnore
  ]

-- Keybinding
addKeys = [ ("M-p", spawn myLauncher)
          ]

-- Configure
main = xmonad $ mateConfig
  { terminal = myTerminal
  , modMask = myModMask
  , borderWidth = myBorderWidth
  , normalBorderColor = colorNormalbg
  , focusedBorderColor = colorX
  , layoutHook = avoidStruts $ myLayout
  , manageHook = manageDocks <+> myManageHook
  }
  `additionalKeysP` addKeys

