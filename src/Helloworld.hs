{-# LANGUAGE TypeFamilies, QuasiQuotes, MultiParamTypeClasses,
             TemplateHaskell, OverloadedStrings #-}
import Yesod

data HelloWorld = HelloWorld

mkYesod "HelloWorld" [parseRoutes|
/ HomeR GET
/hoge HogeR GET
|]

instance Yesod HelloWorld

getHomeR :: Handler RepHtml
getHomeR = defaultLayout [whamlet| Hello World !!! |]

getHogeR :: Handler RepHtml
getHogeR = defaultLayout[whamlet| Hoge Hoge |]

main :: IO ()
main = warpDebug 3000 HelloWorld
