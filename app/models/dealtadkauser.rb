class Dealtadkauser
    include MongoMapper::Document
   #"birthday": "08\/29\/1989",
#   "created":             1305009504      ,
#   "created_detail": {
#     "seconds": 24,
#     "minutes": 8,
#     "hours": 12,
#     "mday": 10,
#     "wday": 2,
#     "mon": 5,
#     "year": 2011,
#     "yday": 129,
#     "weekday": "Tuesday",
#     "month": "May",
#     "0":             1305009504
#  },
#   "deal_id": "4dc7df1625c3a15653000000",
#   "email": {
#     "id": "pranayagarwal29081989@gmail.com",
#     "code": "ce7c471c1ba05b7bc95a80e6ffa84d93",
#     "verified": 0
#  },
#   "facebook": {
#     "access_token": "186490868052811|2.a1Sy5Qnzaon3rlFYsdhrog__.3600.1305014400.1-535299395|3MvA8iOMTzfFyaehtJ2z6mzrYrE",
#     "uid": "535299395",
#     "permissions": "user_birthday,email"
#  },
#   "fbid": "535299395",
#   "first_name": "Pranay",
#   "gender": "male",
#   "last_name": "Agarwal",
#   "link": "http: \/\/www.facebook.com\/agarwalpranay",
#   "locale": "en_US",
#   "modified":             1305009504      ,
#   "name": "Pranay Agarwal",
#   "ref": "628842285,123245771051583",
#   "referrerScore": 10,
#   "referrerStat": {
#     "latestReferrenceTime": "6 days ago",
#     "directReference": 1,
#     "indirectdirectReference": 0,
#     "referrerScore": 10
#  },
#   "status": 1,
#   "store_id": "4dc1093a25c3a1bb46000000",
#   "timezone": 5.5,
#   "type": 2,
#   "updated_time": "2011-05-10T06: 38: 22+0000"
  def self.create(dealtadkauser_hash)
    dealtadkauser = Dealtadkauser.new(dealtadkauser_hash)
    dealtadkauser.save!
  end
  def self.find_by_uid(uid)
    if Dealtadkauser.where(:fbid => uid).to_a != nil
      return true
    end
    return false
  end
end