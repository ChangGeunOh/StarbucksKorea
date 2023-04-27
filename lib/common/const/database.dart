import 'package:starbucks/domain/model/food_data.dart';
import 'package:starbucks/domain/model/item_data.dart';
import 'package:starbucks/domain/model/pair_data.dart';

const kDatabaseName = 'starbucks.db';
const kDatabaseVersion = 1;
const kTableStarbucks = 'starbucks';

final kProgram = [
  ItemData(
      image: 'assets/images/img_news1.png',
      site:
          'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2164'),
  ItemData(
      image: 'assets/images/img_news2.png',
      site: 'https://www.starbucks.co.kr/whats_new/newsView.do?cate=&seq=4920'),
  ItemData(
      image: 'assets/images/img_news3.png',
      site:
          'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147'),
  ItemData(
      type: ItemType.title,
      title: 'What\'s New',
      description: 'See all',
      image: '',
      site: ''),
  [
    ItemData(
        image: 'assets/images/img_news4.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '4월 24~30일, 콜드 브루 이벤트',
        description: '기간 내 콜드 브루 카테고리 음료 구매 시, 품목 당 별 2개를 추가로 적립해 드립니다.'),
    ItemData(
        image: 'assets/images/img_news5.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '스타벅스와 환경재단이 함께하는 The More, The Better 다다익선 캠페인 페이스북 공유하기 새창',
        description: '다회용컵을 많이 쓸수록 지구에 좋은 일이 생기는 스타벅스 환경 캠페인에 참여하세요!'),
    ItemData(
        image: 'assets/images/img_news6.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '4월 20일, 여주자유CC점 MD 1종 출시 페이스북 공유하기 새창',
        description: '스타벅스와 함게 특별한 라운딩을 즐겨보세요.'),
    ItemData(
        image: 'assets/images/img_news7.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '스타벅스 이버닝 혜택 안내',
        description: '저녁에 방문하면 더 좋은 이유! 스타벅스의 다양한 이브닝 혜택을 만나 보세요.'),
    ItemData(
        image: 'assets/images/img_news8.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '4월 14일, 로맨틱 뱅쇼 피지오 출시',
        description: '오후 5시 이후에만 만날 수 있는 특별한 음료를 매장에서 즐겨보세요.'),
    ItemData(
        image: 'assets/images/img_news9.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '4월 스타벅스 일회용컵 없는 날 캠페인',
        description: '매월 10일은 일회용컶 없는 날!'),
    ItemData(
        image: 'assets/images/img_news10.png',
        site:
            'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147',
        title: '4월 11일, 커티스 쿨릭 글라스 출시 안내',
        description: '사랑을 가득 담은 커티스 쿨릭 글라스를 소개합니다.'),
  ],
  ItemData(
      type: ItemType.store,
      image: 'assets/images/img_store1.png',
      site:
          'https://starbucks.mfamily.ssg.com/page/brandStore/starbucks/template02/_v26.ssg'),
  ItemData(type: ItemType.title, title: '저녁 식사 하셨나요?', image: '', site: ''),
  [
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_01.png',
        site: 'food_01',
        title: '포테이토 어니언 크림 치즈 베이클'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_02.png',
        site: 'food_02',
        title: '베이컨 치즈 토스트'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_03.png',
        site: 'food_03',
        title: '치킨 토마토 치즈 샌드위치'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_04.png',
        site: 'food_04',
        title: '바비쿠 치킨 치아 치아바타'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_05.png',
        site: 'food_05',
        title: '치즈 포크 커틀릿 샌드위치'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_06.png',
        site: 'food_06',
        title: '바질 토마토 크림치즈 베이글'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_07.png',
        site: 'food_07',
        title: '햄&루꼴라 올리브 샌드위치'),
    ItemData(
        type: ItemType.food,
        image: 'assets/images/img_food_08.png',
        site: 'food_08',
        title: '콥 & 화이트 샐르디 밀 박스'),
  ],
  ItemData(
      image: 'assets/images/img_news11.png',
      site:
          'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147'),
  ItemData(
      image: 'assets/images/img_news12.png',
      site:
          'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147'),
  ItemData(
      image: 'assets/images/img_news13.png',
      site:
          'https://www.starbucks.co.kr/whats_new/campaign_view.do?pro_seq=2147'),
  ItemData(
      type: ItemType.story,
      image: 'assets/images/img_story1.png',
      site: 'https://www.starbucks.co.kr/store/store_coldbrew.do'),
];

final tempFoodItemData = ItemData(
    type: ItemType.food,
    image: 'assets/images/img_food_01.png',
    site: 'food_01',
    title: '포테이토 어니언 크림 치즈 베이클');

final foods = [
  FoodData(
    id: '1',
    title: '바질 토마토 크림치즈 베이글',
    titleEng: 'Basil Tomato Cream Cheese Bagel',
    price: 5300,
    description: '쫄깃한 탕종 베이글 사이에 어니언 칩으로 맛을 낸 크림치즈와 메쉬드 포테이토를 샌드한 베이글입니다.',
    image: 'assets/images/img_food_06.png',
    site:
        'https://www.starbucks.co.kr/menu/food_view.do?product_cd=9300000004487',
    isBest: true,
    isNew: false,
    nutrition: [
      PairData('칼로리', '528kcal'),
      PairData('탄수화물', '64g'),
      PairData('당류', '14g'),
    ],
    allergy: ['우유', '밀', '토마토'],
  ),
];
