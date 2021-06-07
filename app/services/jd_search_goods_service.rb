class JdSearchGoodsService
  URL = ''
  APP_KEY = 'e4209eac5db9f8e27a769877f48204ec5a88f47da16ef7417c25f2c07dea47abf19b04afa373a931'

  def send
    params = {
      goodsReq: {
        eliteId: 1,
        pageIndex: 1,
        pageSize: 50,
        sortName: 'price',
        sort: 'asc' # asc desc        
      }
    }
  end

  def request(data)
    system_data = {
      method: 'jd.union.open.order.query'

      app_key: APP_KEY,
      timestamp: Time.now.strftime('%y-%m-%d %H:%M:%S'),
      format: 'json',
      v: '1.0',
      sign_method: 'md5',
      sign: ''
    }
    Rails.logger.info("send data #{data}")
    res = RestClient.post(URL, data.to_json, { content_type: :json, accept: :json })
    body = JSON.load(res.body)
    Rails.logger.info("send answer body #{body}")
    body.deep_symbolize_keys
  end

  # 排序字段(
  def sort_name_list
    {
      price: '单价'
      commissionShare: '佣金比例'
      commission: '佣金'
      inOrderCount30DaysSku: 'sku维度30天引单量'
      comments: '评论数'
      goodComments: '好评数'
    }
  end

  def channel_list
    {

      1 => '好券商品',
      2 => '精选卖场',
      10 => '9.9包邮',
      15 => '京东配送',
      22 => '实时热销榜',
      23 => '为你推荐',
      24 => '数码家电',
      25 => '超市',
      26 => '母婴玩具',
      27 => '家具日用',
      28 => '美妆穿搭',
      30 => '图书文具',
      31 => '今日必推',
      32 => '京东好物',
      33 => '京东秒杀',
      34 => '拼购商品',
      40 => '高收益榜',
      41 => '自营热卖榜',
      108 => '秒杀进行中',
      109 => '新品首发',
      110 => '自营',
      112 => '京东爆品',
      125 => '首购商品',
      129 => '高佣榜单',
      130 => '视频商品',
      153 => '历史最低价商品榜，',
      210 => '极速版商品，',
      238 => '新人价商品，',
      247 => '京喜9.9，',
      249 => '京喜秒杀，',
      1001 => '选品库',
    }
  end

end

