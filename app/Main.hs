module Main where
import Common
import Control.Lens
import Control.Monad.Takahashi
import Control.Monad.State

main :: IO ()
main = do
  let fileName = "../slide.html"
  writeSlide fileName presentation
  putStrLn $ "Sucess : Output to '" ++ fileName ++ "'"

presentation :: Taka ()
presentation = do
  setOptions
  title "[発表タイトル]" 
    $  "20XX/X/XX ちゅーん(@its_out_of_tune)\n"
    ++ "for [勉強会タイル]"

  header "自己紹介" profile

  slideTitle .= ""
  taka "ありがとうございました\n(๑•﹏•)"


profile :: Taka ()
profile = do
  slideTitle .= "自己紹介"
  stateSandbox $ do
    contentsOption2.blockFontSize .= Just 40
    twinLeft
      ( listCont
        [ "野生のHaskller(29♂)"
        , "2016年春よりなごやか"
        , "OTR 基盤チームの道化枠\n\n"
        , "雑なゲーム実況"
        , "イカ、ゼルダ、ぷよぷよ"
        , "最近ラット飼いたい"
        ]
      )
      ( verticalCont
        [ imgCont WStretch "../img/my_icon2.gif"
        , parCont2
          $  "HN:　ちゅーん\n\n"
          ++ "Twitter:\n"
          ++ "　@its_out_of_tune\n"
          ++ "Github:\n"
          ++ "　tokiwoousaka\n"
        ]
      )
