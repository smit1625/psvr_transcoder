module Config where

import           Options.Applicative

data Config = Config
  { quiet   :: Bool
  , monitor :: Bool
  , files   :: [String] }

parseConfig :: IO Config
parseConfig = execParser opts
  where
    opts = info ( config <**> helper)
      ( fullDesc
     <> progDesc "Encode video files for usage with the PlayStation VR through LittlStar."
     <> header "psvr_transcode - a simple FFmpeg-based utility to encode video for PSVR" )

config :: Parser Config
config = Config
    <$> switch
        ( long "quiet"
       <> short 'q'
       <> help "Whether to be quiet" )
    <*> switch
        ( long "monitor"
       <> short 'm'
       <> help "Monitor for changes to a directory" )
    <*> some ( argument str $ metavar "FILES OR DIRECTORIES..." )
