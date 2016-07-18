namespace :dev do
  task :product => :environment do
    Product.delete_all

    Product.create(name:"特大單開關",item_name:"QT-7S",v110_price:200 ,v220_price:225)
    Product.create(name:"四路特大單開關",item_name:"QT-7S04",v110_price:450 ,v220_price:475)
    Product.create(name:"雙開關",item_name:"QT-2S",v110_price:340 ,v220_price:390)
    Product.create(name:"三開關",item_name:"QT-3S",v110_price:495 ,v220_price:570)
    Product.create(name:"雙插座",item_name:"QT-2R",v110_price:200 ,v220_price:225)
    Product.create(name:"三插座",item_name:"QT-3R",v110_price:300 ,v220_price:325)

    Product.create(name:"雙插緊急插座",item_name:"QT-6RR",v110_price:400 ,v220_price:455)

    Product.create(name:"特大夜光電鈴押扣",item_name:"QT-00",v110_price:200 ,v220_price:225)
    Product.create(name:"輕觸型特大單開關",item_name:"1T-7S",v110_price:355 ,v220_price:400)
    Product.create(name:"輕觸型雙開關",item_name:"1T-2S",v110_price:680 ,v220_price:780)
    Product.create(name:"輕觸型四開關",item_name:"1T-4S",v110_price:1350 ,v220_price:1650)
  end
end
