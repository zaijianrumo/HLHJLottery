


Pod::Spec.new do |s|


  s.name         = "HLHJLotterySDK"
  s.version      = "1.0.5"
  s.summary      = "抽奖抽奖"
  s.description  = <<-DESC
                   抽奖抽抽奖抽奖抽奖
                   DESC
  s.homepage     = "https://github.com/zaijianrumo/HLHJLottery"
  s.license      = { :type => "MIT"}

  s.author       = {"zaijianrumo" => "2245190733@qq.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/zaijianrumo/HLHJLottery.git", :tag => "#{s.version}" }

   s.xcconfig= {
          'VALID_ARCHS'  => 'arm64 x86_64',
    }

  s.source_files            = "HLHJLottery/HLHJLotterySDK.framework/Headers/*.{h,m}" 
  s.ios.vendored_frameworks = "HLHJLottery/HLHJLotterySDK.framework"
  s.resources               = "HLHJLottery/HLHJLottery.bundle"

  s.dependency      'TMUserCenter'

end
