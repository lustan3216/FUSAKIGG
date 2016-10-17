# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Product.delete_all
Order.delete_all
LineItem.delete_all

# 1T系列 7
Product.create( name:'輕觸型單開關' ,item_name:'1t-7s', v110_price:350 ,v220_price:400 )
Product.create( name:'輕觸型雙開關' ,item_name:'1t-2s', v110_price:680 ,v220_price:780 )
Product.create( name:'輕觸型三開關' ,item_name:'1t-3s', v110_price:1010 ,v220_price:1160 )
Product.create( name:'輕觸型一開關一插座' ,item_name:'1t-1s1r', v110_price:435 ,v220_price:485 )
Product.create( name:'輕觸型一開關一接地插座' ,item_name:'1t-1s3r', v110_price:460 ,v220_price:510 )

# 1T插座系列 21
Product.create( name:'三插座' ,item_name:'1t-1503', v110_price:190 )
Product.create( name:'T型冷氣專插座5.5絞線' ,item_name:'1t-5rt', v220_price:150 )
Product.create( name:'H型冷氣專插座5.5絞線' ,item_name:'1t-5rh', v110_price:150 )
Product.create( name:'接地單插座' ,item_name:'1t-3r', v110_price:110 )
Product.create( name:'接地雙插座' ,item_name:'1t-6r', v110_price:165 )
Product.create( name:'接地雙插座5.5絞線' ,item_name:'1t-8r', v110_price:185 )
Product.create( name:'輕觸型電捲門開關' ,item_name:'1t-7669', v110_price:230, v220_price:230 )
Product.create( name:'電話單插座' ,item_name:'1t-41', v000_price:105 )
Product.create( name:'電話雙插座' ,item_name:'1t-42', v000_price:170 )
Product.create( name:'電話三插座' ,item_name:'1t-43', v000_price:275 )
Product.create( name:'網路單插座Cat.5e' ,item_name:'1t-815', v000_price:360 )
Product.create( name:'網路/電話組合插座Cat.5e' ,item_name:'1t-81415', v000_price:465 )
Product.create( name:'網路單插座Cat.6' ,item_name:'1t-816', v000_price:360 )
Product.create( name:'網路Cat.6/電話組合插座' ,item_name:'1t-81641', v000_price:465 )
Product.create( name:'電視單插座' ,item_name:'1t-tv1', v000_price:170 )
Product.create( name:'電視雙插座' ,item_name:'1t-tv2', v000_price:310 )
Product.create( name:'復歸回彈式緊急押扣' ,item_name:'1t-88s', v110_price:250, v220_price:250 )
Product.create( name:'強押固定式緊急押扣' ,item_name:'1t-99s', v110_price:250, v220_price:250 )
Product.create( name:'紅色緊急接地單插座' ,item_name:'1t-3rr', v110_price:150 )
Product.create( name:'紅色緊急接地雙插座' ,item_name:'1t-6rr', v110_price:215 )

# QT開關系列 13
Product.create( name:'流線型單開關' ,item_name:'qt-7s', v110_price:200 ,v220_price:225 )
Product.create( name:'流線型四路單開關' ,item_name:'qt-7s04', v110_price:450 ,v220_price:475 )
Product.create( name:'流線型雙開關' ,item_name:'qt-2s', v110_price:340 ,v220_price:390 )
Product.create( name:'流線型三開關' ,item_name:'qt-3s', v110_price:495 ,v220_price:570 )
Product.create( name:'流線型夜光電鈴押扣' ,item_name:'qt-00', v110_price:200 ,v220_price:225 )
Product.create( name:'流線型電鈴押扣' ,item_name:'qt-01', v110_price:200 , v220_price:200 )
Product.create( name:'流線型一開關一夜光電鈴' ,item_name:'qt-1s1b00', v110_price:400 ,v220_price:450 )
Product.create( name:'流線型一開關一電鈴' ,item_name:'qt-1s1b01', v110_price:400 ,v220_price:425)
Product.create( name:'流線型電捲門開關' ,item_name:'qt-7669', v110_price:230, v220_price:230 )
Product.create( name:'流線型一開關一插座' ,item_name:'qt-1s1r', v110_price:270 ,v220_price:295 )
Product.create( name:'流線型一開關一接地插座' ,item_name:'qt-1s3r', v110_price:300 ,v220_price:325 )
Product.create( name:'流線型一開關二插座' ,item_name:'qt-1s2ra', v110_price:315 ,v220_price:340 )
Product.create( name:'流線型二開關一插座' ,item_name:'qt-2s1ra', v110_price:425 ,v220_price:475 )
Product.create( name:'流線型二開關一接地插座' ,item_name:'qt-2s3ra', v110_price:450 ,v220_price:500 )


# QT插座系列  19
Product.create( name:'流線型三插座' ,item_name:'qt-1503', v110_price:190 )
Product.create( name:'流線型T型冷氣專插座5.5絞線' ,item_name:'qt-5rt', v220_price:150 )
Product.create( name:'流線型H型冷氣專插座5.5絞線' ,item_name:'qt-5rh', v110_price:150 )
Product.create( name:'流線型接地單插座' ,item_name:'qt-3r', v110_price:110 )
Product.create( name:'流線型接地雙插座' ,item_name:'qt-6r', v110_price:165 )
Product.create( name:'流線型接地雙插座5.5絞線' ,item_name:'qt-8r', v110_price:185 )
Product.create( name:'流線型復歸回彈式緊急押扣' ,item_name:'qt-88s', v110_price:250, v220_price:250 )
Product.create( name:'流線型強押固定式緊急押扣' ,item_name:'qt-99s', v110_price:250, v220_price:250 )
Product.create( name:'流線型電話單插座' ,item_name:'qt-41', v000_price:105 )
Product.create( name:'流線型電話雙插座' ,item_name:'qt-42', v000_price:170 )
Product.create( name:'流線型電話三插座' ,item_name:'qt-43', v000_price:170 )
Product.create( name:'流線型網路單插座Cat.5e' ,item_name:'qt-815', v000_price:360 )
Product.create( name:'流線型網路/電話組合插座Cat.5e' ,item_name:'qt-81415', v000_price:465 )
Product.create( name:'流線型網路單插座Cat.6' ,item_name:'qt-816', v000_price:360 )
Product.create( name:'流線型網路Cat.6/電話組合插座' ,item_name:'qt-81641', v000_price:465 )
Product.create( name:'流線型電視單插座' ,item_name:'qt-tv1', v000_price:170 )
Product.create( name:'流線型電視雙插座' ,item_name:'qt-tv2', v000_price:310 )
Product.create( name:'流線型紅色緊急接地單插座' ,item_name:'qt-3rr', v110_price:150 )
Product.create( name:'流線型紅色緊急接地雙插座' ,item_name:'qt-6rr', v110_price:215 )

# FK開關系列 13
Product.create( name:'典雅型單開關' ,item_name:'fk-7s', v110_price:200 ,v220_price:225 )
Product.create( name:'典雅型四路單開關' ,item_name:'fk-7s04', v110_price:450 ,v220_price:475 )
Product.create( name:'典雅型雙開關' ,item_name:'fk-2s', v110_price:340 ,v220_price:390 )
Product.create( name:'典雅型三開關' ,item_name:'fk-3s', v110_price:495 ,v220_price:570 )
Product.create( name:'典雅型夜光電鈴押扣' ,item_name:'fk-00', v110_price:200 ,v220_price:225 )
Product.create( name:'典雅型電鈴押扣' ,item_name:'fk-01', v110_price:200 , v220_price:200 )
Product.create( name:'典雅型一開關一夜光電鈴' ,item_name:'fk-1s1b00', v110_price:400 ,v220_price:450 )
Product.create( name:'典雅型一開關一電鈴' ,item_name:'fk-1s1b01', v110_price:400 ,v220_price:425 )
Product.create( name:'典雅型電捲門開關' ,item_name:'fk-7669', v110_price:230, v220_price:230 )
Product.create( name:'典雅型一開關一插座' ,item_name:'fk-1s1r', v110_price:270 ,v220_price:295 )
Product.create( name:'典雅型一開關一接地插座' ,item_name:'fk-1s3r', v110_price:300 ,v220_price:325 )
Product.create( name:'典雅型一開關二插座' ,item_name:'fk-1s2ra', v110_price:315 ,v220_price:340 )
Product.create( name:'典雅型二開關一插座' ,item_name:'fk-2s1ra', v110_price:425 ,v220_price:475 )
Product.create( name:'典雅型二開關一接地插座' ,item_name:'fk-2s3ra', v110_price:450 ,v220_price:500 )

# FK插座系列  19
Product.create( name:'典雅型三插座' ,item_name:'fk-1503', v110_price:190 )
Product.create( name:'典雅型T型冷氣專插座5.5絞線' ,item_name:'fk-5rt', v220_price:150 )
Product.create( name:'典雅型H型冷氣專插座5.5絞線' ,item_name:'fk-5rh', v110_price:150 )
Product.create( name:'典雅型接地單插座' ,item_name:'fk-3r', v110_price:110 )
Product.create( name:'典雅型接地雙插座' ,item_name:'fk-6r', v110_price:165 )
Product.create( name:'典雅型接地雙插座5.5絞線' ,item_name:'fk-8r', v110_price:185 )
Product.create( name:'典雅型復歸回彈式緊急押扣' ,item_name:'fk-88s', v110_price:250, v220_price:250 )
Product.create( name:'典雅型強押固定式緊急押扣' ,item_name:'fk-99s', v110_price:250, v220_price:250 )
Product.create( name:'典雅型電話單插座' ,item_name:'fk-41', v000_price:105 )
Product.create( name:'典雅型電話雙插座' ,item_name:'fk-42', v000_price:170 )
Product.create( name:'典雅型電話三插座' ,item_name:'fk-43', v000_price:170 )
Product.create( name:'典雅型網路單插座Cat.5e' ,item_name:'fk-815', v000_price:360 )
Product.create( name:'典雅型網路/電話組合插座Cat.5e' ,item_name:'fk-81541', v000_price:465 )
Product.create( name:'典雅型網路單插座Cat.6' ,item_name:'fk-816', v000_price:360 )
Product.create( name:'典雅型網路Cat.6/電話組合插座' ,item_name:'fk-81641', v000_price:465 )
Product.create( name:'典雅型電視單插座' ,item_name:'fk-tv1', v000_price:170 )
Product.create( name:'典雅型電視雙插座' ,item_name:'fk-tv2', v000_price:310 )
Product.create( name:'典雅型紅色緊急接地單插座' ,item_name:'fk-3rr', v110_price:150 )
Product.create( name:'典雅型紅色緊急接地雙插座' ,item_name:'fk-6rr', v110_price:215 )

# FK蓋片 3
Product.create( name:'典雅型單連盲蓋片' ,item_name:'fk-4d', v000_price:30 )
Product.create( name:'典雅型雙連盲蓋片' ,item_name:'fk-5d', v000_price:60 )
# Product.create( name:'單連立體冷氣出水口蓋片' ,item_name:'fk-6d', v000_price:60 )

# 1T蓋片 3
# Product.create( name:'單連立體冷氣出水口蓋片' ,item_name:'1t-6d', v000_price:60 )

# QT蓋片 3
Product.create( name:'流線型單連盲蓋片' ,item_name:'qt-4d', v000_price:30 )
Product.create( name:'流線型雙連盲蓋片' ,item_name:'qt-5d', v000_price:60 )
# Product.create( name:'冷氣出水口蓋片' ,item_name:'qt-6d', v110_price:60 )

# 其他 7
Product.create( name:'彈跳地板接地雙插座' ,item_name:'okman-15123', v110_price:130 )
Product.create( name:'防水蓋板' ,item_name:'6808', v000_price:410 )
Product.create( name:'防水蓋板(咖啡色)' ,item_name:'6808b', v000_price:410 )



# 說明
Product.where( 'name LIKE ?','%網路%').update( description:'
<ul>
<li>寬頻網路專用資訊插座 Cat.5e，非一般電話插座，內建電路板傳輸速率達125bps(UL認證合格)</li>
<li>寬頻網路專用資訊插座 Cat.6，非一般電話插座，內建電路板傳輸速率達250ps(UL認證合格)</li>
</ul>
')
Product.where( 'name LIKE ? and item_name LIKE ?','%開關%','%s%').update( description:'<ul>
<li>開關皆有螢光單指示燈讓您不再摸黑找開關，一目瞭然</li>
<li>本開關皆為螢光單切、3路兩用，銀接點設計</li>
<li>請勿超過安全負載規定</li>
<li>安裝時不需要拆卸開關上面板，節省工時成本</li>
</ul>')
Product.where( 'name LIKE ?','%冷氣專插%').update( description:'
<ul>
<li>110V電壓請選用: H型冷氣專用插座僅限於在5.5平方絞線</li>
<li>220V電壓請選用: T型冷氣專用插座僅限於在5.5平方絞線</li>
<li>如不知道您的冷氣電壓，可用冷氣插頭辨別，110V電壓則選擇H型，220V電壓則選擇T型</li>
</ul>
')
Product.where( 'name LIKE ?','%電話%').update( description:'
<ul>
<li>適用於所有一線電話和兩線電話</li>
<li>一線: 指最普通一般家庭用只有一個電話號碼的電話機</li>
<li>二線: 指兩隻電話號碼可同時用同個電話機接聽的機台</li>
</ul>')
Product.where( 'name LIKE ?','%盲蓋%').update( description:'水電拉線配置與裝潢後差異所產生多餘的出線口，可使用此盲蓋板暫時遮蔽')
Product.where( 'name LIKE ? and name LIKE ?','%電話%','%網路%' ).update( description:'
<ul>
<li>寬頻網路專用資訊插座 Cat.5e，非一般電話插座，內建電路板傳輸速率達125bps(UL認證合格)</li>
<li>寬頻網路專用資訊插座 Cat.6，非一般電話插座，內建電路板傳輸速率達250ps(UL認證合格)</li>
<li>適用於所有一線電話和兩線電話</li>
<li>一線: 指最普通一般家庭用只有一個電話號碼的電話機</li>
<li>二線: 指兩隻電話號碼可同時用同個電話機接聽的機台</li>
</ul>
')
Product.where( 'name LIKE ? and item_name LIKE ?','%插座%','%r%').update( description:'
插座皆有無接地和有接地之分，請依您家裡原有要更換的情況做選擇，如該插座是無接地就選擇無接地插座，有接地則選擇有接地<br>原因是原配線和中
')
Product.where( 'name LIKE ? and name LIKE ?','%開關%','%插座%' ).update( description:'
<ul>
<li>插座皆有無接地和有接地之分，建議選擇有接地插座較安全，也較符合大部分市面有接地插座，無需再煩惱插座上多出的接地極</li>
<li>開關皆有螢光單指示燈讓您不再摸黑找開關，一目瞭然</li>
<li>本開關皆為螢光單切、3路兩用，銀接點設計</li>
<li>請勿超過安全負載規定</li>
<li>安裝時不需要拆卸開關上面板，節省工時成本</li>
</ul>')
Product.where( 'name LIKE ? and item_name LIKE ?','%電鈴%','%00%').update( description:'
<ul>
<li>只適用於交流電的蜂鳴器，如已無法辨識或無從得知請購買本公司無夜光指示電鈴押釦</li>
<li>因有夜光指示燈電阻問題故無法使用直流電或乾電池式的蜂鳴器，會造成蜂鳴器一直鳴叫的狀況</li>
</ul>
')
Product.where( 'name LIKE ? and item_name LIKE ?','%電鈴%','%01%').update( description:'
此電鈴押扣可適用於直流電或交流電的蜂鳴器')
Product.where( 'name LIKE ? and name LIKE ? and item_name LIKE ?','%開關%','%電鈴%','%00%' ).update( description:'
<ul>
<li>只適用於交流電的蜂鳴器，如已無法辨識或無從得知請購買本公司無夜光指示電鈴押釦</li>
<li>因有夜光指示燈電阻問題故無法使用直流電或乾電池式的蜂鳴器，會造成蜂鳴器一直鳴叫的狀況</li>
<li>選擇110V電壓則電鈴押扣與開關皆為110V</li>
<li>選擇220V電壓則電鈴押扣與開關皆為220V</li>
</ul>')
Product.where( 'name LIKE ? and name LIKE ? and item_name LIKE ?','%開關%','%電鈴%','%01%' ).update( description:'
<ul>
<li>此電鈴押扣可適用於直流電或交流電的蜂鳴器</li>
<li>選擇110V電壓則電鈴押扣與開關皆為110V</li>
<li>選擇220V電壓則電鈴押扣與開關皆為220V</li>
</ul>')
Product.where( 'name LIKE ?','%緊急押扣%').update( description:'供您在緊急或特殊情況下之連續呼叫使用，建議使用於浴室、廁所、孝親房')
Product.where( 'name LIKE ?','%紅色緊急%').update( description:'建議您安裝在緊急電源處而和一般插座區分，以備緊急或特殊狀況使用')
Product.where( 'name LIKE ?','%電捲門%').update( description:'')
Product.where( 'name LIKE ?','%防水%').update( description:'建議裝設在室外或會被水淋到的地方，在水/雨水容易侵入的地方裝設普通的插座是非常危險的，利用防水蓋板可避免觸電的危險，增加美觀及安全性')
Product.where( 'name LIKE ?','%彈跳%').update( description:'
<h5>施工前專用預埋盒</h5>
<ul>
<li>混凝土灌漿前，將接線盒安裝於測定應埋入深度，從地面到接線盒之適當深度為18mm，寬度為98mm</li>
<li>彈跳式地面插座方向調整，依接線盒的方向固定</li>
<li>配線施工時請使用OKMAN專用接線盒埋入</li>
<li>電源線插入線孔時務必檢查是否牢固，若有插入不足時會產生發熱現象導致危險</li>
<li>請勿安裝於妨礙通行的地方，否則容易引起傷害或事故</li>
<li>地板插座組合預留三只插座，方便依不同區域設計所需之配電器材：完成適合的配置組裝</li>
</ul>')
Product.create( name:'吸頂式自動感應開關' ,item_name:'fk-360', v110_price:2500, v220_price:2600 ,description:'
<h5>產品適用於：</h5>
<ul>
<li>．走廊、樓梯間、電梯口、室內停車場、玄關.......等</li>
<li>．超薄外型，亦可崁入式裝法或非崁入式裝法</li>
<li>．快速的安裝結構設計，節省施工時間</li>
<li>．使用先進SMT表面黏著設計生產</li>
<li>．超強抗RFI / EMI 干擾設計，使產品更加穩定</li>
<li>．可避免忘記隨手關燈習慣，亦有人到即亮的自動點燈功能，不並用手開/關燈，充分發揮省電優點</li>
<li>．感知範圍高2.4公尺為直徑距離6公尺</li>
<li>．感知範圍高3公尺為直徑距離8公尺</li>
<li>．感知範圍高3.6公尺為直徑距離10公尺</li>
</ul>')

# Product.all.each do |x|
#   if x.v000_price.present?
#     price = (x.v000_price*0.6).to_i.to_s
#     if price.last.to_i.between?(1,4)
#       price = ((price.to_i/10).to_i)*10+5
#     elsif price.last.to_i.between?(6,9)
#       price = ((price.to_i/10).to_i)*10+10
#     end
#     x.update(v000_price: price.to_i )
#   end
#   if x.v110_price.present?
#     price = (x.v110_price*0.6).to_i.to_s
#     if price.last.to_i.between?(1,4)
#       price = ((price.to_i/10).to_i)*10+5
#     elsif price.last.to_i.between?(6,9)
#       price = ((price.to_i/10).to_i)*10+10
#     end
#     x.update(v110_price: price.to_i )
#   end
#   if x.v220_price.present?
#     price = (x.v220_price*0.6).to_i.to_s
#     if price.last.to_i.between?(1,4)
#       price = ((price.to_i/10).to_i)*10+5
#     elsif price.last.to_i.between?(6,9)
#       price = ((price.to_i/10).to_i)*10+10
#     end
#     x.update(v220_price: price.to_i )
#   end
# end
p "done"