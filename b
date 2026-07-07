<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>ONDO 온도 — 데일리 베이직 편집샵</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Marcellus&family=Noto+Sans+KR:wght@300;400;500;700&family=Noto+Serif+KR:wght@400;600&display=swap" rel="stylesheet">
<style>
/* =========================================================
   ONDO 온도 — 클린 쇼핑몰 (다크패턴 없음 · 연구 대조군)
   ※ 실제 결제·수집 없음. 결제하기 → 구글폼 이동.
   ========================================================= */
:root{
  --bg:#faf8f4; --card:#ffffff; --line:#e9e4db; --line-2:#f1ede6;
  --txt:#23211d; --dim:#8d877c; --faint:#c6bfb2;
  --accent:#2e5e46; --accent-soft:#eef3ee; --maxw:430px;
}
*{margin:0;padding:0;box-sizing:border-box;-webkit-tap-highlight-color:transparent;}
html,body{height:100%;}
body{background:#eceae4;font-family:'Noto Sans KR',sans-serif;color:var(--txt);
  display:flex;justify-content:center;overflow:hidden;}
#app{width:100%;max-width:var(--maxw);height:100vh;background:var(--bg);
  position:relative;overflow:hidden;box-shadow:0 0 60px rgba(60,50,30,.12);}
#scroll{position:absolute;top:104px;bottom:60px;left:0;right:0;
  overflow-y:auto;overflow-x:hidden;-webkit-overflow-scrolling:touch;scroll-behavior:smooth;}
#scroll::-webkit-scrollbar{width:0;}

/* 상단바 */
#topbar{position:absolute;top:0;left:0;right:0;z-index:40;background:rgba(250,248,244,.96);
  backdrop-filter:blur(8px);border-bottom:1px solid var(--line);}
.tb-row{height:56px;display:flex;align-items:center;gap:13px;padding:0 14px;}
.tb-icon{font-size:20px;color:var(--txt);cursor:pointer;width:26px;text-align:center;
  line-height:1;background:none;border:none;position:relative;}
.logo{font-family:'Marcellus',serif;font-size:23px;letter-spacing:3px;color:var(--txt);
  flex:1;cursor:pointer;}
.logo small{font-size:11px;letter-spacing:1px;color:var(--dim);margin-left:6px;font-family:'Noto Sans KR';}
.cart-wrap{position:relative;}
.cart-badge{position:absolute;top:-6px;right:-8px;background:var(--accent);color:#fff;
  font-size:10px;font-weight:700;min-width:16px;height:16px;border-radius:9px;
  display:none;align-items:center;justify-content:center;padding:0 4px;}
.cart-badge.on{display:flex;}
.tb-search{height:48px;padding:0 14px 10px;}
.tb-search form{height:38px;background:#fff;border:1px solid var(--line);border-radius:10px;
  display:flex;align-items:center;padding:0 6px 0 14px;}
.tb-search input{flex:1;background:none;border:none;outline:none;color:var(--txt);
  font-size:13px;font-family:inherit;}
.tb-search input::placeholder{color:var(--faint);}
.tb-search button{background:none;border:none;color:var(--dim);font-size:17px;cursor:pointer;padding:6px 8px;}

/* 배너 */
.banner{position:relative;height:210px;overflow:hidden;}
.banner-track{display:flex;height:100%;transition:transform .5s cubic-bezier(.4,0,.2,1);}
.slide{min-width:100%;height:100%;display:flex;flex-direction:column;justify-content:center;
  padding:0 28px;position:relative;cursor:pointer;}
.slide-1{background:linear-gradient(135deg,#ece5d8,#ddd2c0);}
.slide-2{background:linear-gradient(135deg,#e2e9e2,#cfdccf);}
.slide-3{background:linear-gradient(135deg,#efe6da,#e2d3c2);}
.slide .kicker{font-size:10px;letter-spacing:3px;color:var(--dim);margin-bottom:10px;font-weight:700;}
.slide h2{font-family:'Noto Serif KR',serif;font-size:24px;line-height:1.35;font-weight:600;color:var(--txt);}
.slide .sub{margin-top:10px;font-size:12px;color:var(--dim);}
.dots{position:absolute;bottom:12px;left:50%;transform:translateX(-50%);display:flex;gap:6px;}
.dot{width:6px;height:6px;border-radius:50%;background:rgba(35,33,29,.18);transition:.3s;}
.dot.on{background:var(--txt);width:18px;border-radius:3px;}

/* 카테고리 아이콘 */
.cat-icons{display:flex;justify-content:space-between;padding:20px 20px 4px;}
.cat-ic{display:flex;flex-direction:column;align-items:center;gap:8px;cursor:pointer;}
.cat-ic .cir{width:54px;height:54px;border-radius:50%;background:#fff;border:1px solid var(--line);
  display:flex;align-items:center;justify-content:center;font-size:22px;box-shadow:0 2px 8px rgba(60,50,30,.05);}
.cat-ic span{font-size:10.5px;color:var(--dim);}

/* 섹션 */
.section{padding:26px 16px 6px;}
.sec-head{display:flex;align-items:baseline;justify-content:space-between;margin-bottom:14px;}
.sec-title{font-family:'Noto Serif KR',serif;font-size:17px;font-weight:600;}
.sec-more{font-size:11px;color:var(--dim);cursor:pointer;}
.h-scroll{display:flex;gap:12px;overflow-x:auto;padding:0 16px 8px;margin:0 -16px;}
.h-scroll::-webkit-scrollbar{height:0;}

/* 상품 카드 */
.pcard{cursor:pointer;flex-shrink:0;position:relative;}
.h-scroll .pcard{width:146px;}
.pcard .thumb{width:100%;aspect-ratio:1;border-radius:10px;position:relative;overflow:hidden;
  display:flex;align-items:center;justify-content:center;background:#efece6;
  box-shadow:0 2px 10px rgba(60,50,30,.06);}
.pcard .thumb .ph{font-family:'Marcellus',serif;font-size:26px;color:rgba(35,33,29,.12);letter-spacing:2px;}
.thumb-img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;z-index:1;}
.tag-new{position:absolute;top:8px;left:8px;z-index:2;background:var(--txt);color:#fff;
  font-size:9px;font-weight:700;padding:3px 7px;border-radius:3px;letter-spacing:.5px;}
.soldout-cover{position:absolute;inset:0;z-index:3;background:rgba(250,248,244,.72);
  display:flex;align-items:center;justify-content:center;border-radius:10px;}
.soldout-cover span{border:1px solid var(--txt);color:var(--txt);font-size:11px;font-weight:700;
  padding:5px 12px;border-radius:4px;background:rgba(255,255,255,.7);}
.pcard .pname{font-size:12px;margin-top:9px;color:var(--txt);white-space:nowrap;
  overflow:hidden;text-overflow:ellipsis;}
.pcard .pprice{margin-top:4px;font-weight:700;font-size:13.5px;}
.pcard .stars{font-size:10px;color:#c9a24a;margin-top:3px;}
.pcard .stars span{color:var(--faint);}
.card-add{width:100%;margin-top:8px;padding:7px 0;background:#fff;border:1px solid var(--line);
  border-radius:7px;color:var(--txt);font-size:11px;font-weight:500;cursor:pointer;font-family:inherit;}
.card-add:active{background:var(--accent-soft);border-color:var(--accent);color:var(--accent);}
.card-add.dis{color:var(--faint);}
.grid{display:grid;grid-template-columns:1fr 1fr;gap:18px 12px;}
.grid .pcard{width:100%;}

/* 브랜드 스토리 */
.brand-story{margin:30px 16px 6px;padding:26px 22px;background:#fff;border:1px solid var(--line);
  border-radius:14px;text-align:center;}
.brand-story .bs-logo{font-family:'Marcellus',serif;font-size:20px;letter-spacing:3px;}
.brand-story p{font-size:12px;color:var(--dim);line-height:1.9;margin-top:12px;}

/* 푸터 정보 */
.foot{margin-top:28px;padding:24px 20px 30px;background:#f2efe8;border-top:1px solid var(--line);}
.foot .f-row{display:flex;justify-content:space-between;padding:11px 0;font-size:12px;
  color:var(--txt);border-bottom:1px solid var(--line-2);cursor:pointer;}
.foot .f-row .arr{color:var(--faint);}
.foot .f-info{margin-top:16px;font-size:10px;color:var(--dim);line-height:1.8;}

/* 탭바 */
#tabbar{position:absolute;bottom:0;left:0;right:0;z-index:40;height:60px;
  background:rgba(250,248,244,.98);backdrop-filter:blur(8px);border-top:1px solid var(--line);display:flex;}
.tab{flex:1;display:flex;flex-direction:column;align-items:center;justify-content:center;
  gap:3px;color:var(--faint);font-size:10px;cursor:pointer;background:none;border:none;}
.tab .ic{font-size:17px;}
.tab.on{color:var(--accent);}

/* 사이드 메뉴 */
#sideMenu{position:absolute;inset:0;z-index:80;pointer-events:none;}
#sideMenu .dim{position:absolute;inset:0;background:rgba(35,33,29,.35);opacity:0;transition:.3s;}
#sideMenu .panel{position:absolute;top:0;bottom:0;left:0;width:78%;background:var(--bg);
  border-right:1px solid var(--line);transform:translateX(-100%);
  transition:transform .32s cubic-bezier(.4,0,.2,1);overflow-y:auto;}
#sideMenu.open{pointer-events:auto;}
#sideMenu.open .dim{opacity:1;}
#sideMenu.open .panel{transform:translateX(0);}
.sm-head{padding:22px 18px 16px;border-bottom:1px solid var(--line);
  display:flex;justify-content:space-between;align-items:center;}
.sm-head .logo{font-size:20px;flex:none;}
.sm-close{background:none;border:none;color:var(--dim);font-size:20px;cursor:pointer;}
.cat-group{border-bottom:1px solid var(--line-2);}
.cat-main{padding:15px 18px;font-size:14px;font-weight:500;cursor:pointer;
  display:flex;justify-content:space-between;align-items:center;}
.cat-main .arr{color:var(--faint);font-size:12px;transition:.25s;}
.cat-group.open .cat-main .arr{transform:rotate(90deg);}
.cat-sub{max-height:0;overflow:hidden;transition:max-height .3s ease;background:#f4f1ea;}
.cat-group.open .cat-sub{max-height:340px;}
.cat-sub a{display:block;padding:11px 18px 11px 32px;font-size:13px;color:var(--dim);cursor:pointer;}

/* 페이지 */
.page{display:none;}
.page.active{display:block;}

/* 목록 */
.list-head{padding:20px 16px 10px;}
.list-head h2{font-family:'Noto Serif KR',serif;font-size:20px;font-weight:600;}
.list-head .cnt{font-size:11px;color:var(--dim);margin-top:5px;}
.filter-row{display:flex;gap:8px;padding:10px 16px 4px;overflow-x:auto;}
.filter-row::-webkit-scrollbar{height:0;}
.chip{flex-shrink:0;font-size:11px;padding:6px 13px;border-radius:14px;background:#fff;
  border:1px solid var(--line);color:var(--dim);cursor:pointer;}
.chip.on{background:var(--txt);border-color:var(--txt);color:#fff;font-weight:500;}

/* 베스트 */
.best-item{display:flex;gap:14px;align-items:center;padding:13px 16px;border-bottom:1px solid var(--line-2);cursor:pointer;}
.best-num{width:26px;text-align:center;font-family:'Marcellus',serif;font-size:19px;color:var(--dim);flex-shrink:0;}
.best-num.top{color:var(--accent);font-weight:700;}
.best-thumb{width:64px;height:64px;border-radius:9px;flex-shrink:0;position:relative;overflow:hidden;
  display:flex;align-items:center;justify-content:center;background:#efece6;}
.best-thumb .ph{font-family:'Marcellus',serif;font-size:15px;color:rgba(35,33,29,.12);}
.best-info{flex:1;min-width:0;}
.best-info .bn{font-size:13px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;}
.best-info .bp{margin-top:5px;font-size:13px;font-weight:700;}
.best-info .meta{font-size:10px;color:var(--dim);margin-top:3px;}

/* 검색결과 */
.sr-head{padding:18px 16px 8px;}
.sr-head h2{font-family:'Noto Serif KR',serif;font-size:18px;font-weight:600;}
.sr-head h2 em{color:var(--accent);font-style:normal;}
.sr-head .cnt{font-size:11px;color:var(--dim);margin-top:5px;}
.sr-empty{text-align:center;padding:70px 20px;color:var(--dim);}
.sr-empty .ic{font-size:38px;}

/* 상세 */
#detailScroll{padding-bottom:30px;}
.detail-imgwrap{width:100%;aspect-ratio:1;position:relative;overflow:hidden;background:#efece6;
  display:flex;align-items:center;justify-content:center;}
.detail-imgwrap .ph{font-family:'Marcellus',serif;font-size:46px;color:rgba(35,33,29,.1);letter-spacing:4px;}
.detail-imgtrack{position:absolute;inset:0;display:flex;transition:transform .4s;z-index:1;}
.detail-imgtrack img{min-width:100%;height:100%;object-fit:cover;}
.detail-dots{position:absolute;bottom:12px;left:50%;transform:translateX(-50%);display:flex;gap:6px;z-index:2;}
.detail-dots .dot{background:rgba(35,33,29,.25);}
.detail-dots .dot.on{background:var(--txt);}
.wish-fab{position:absolute;top:12px;right:12px;z-index:2;width:38px;height:38px;border-radius:50%;
  background:rgba(255,255,255,.85);border:1px solid var(--line);color:var(--txt);font-size:17px;cursor:pointer;}
.wish-fab.on{color:#c0392b;}
.detail-body{padding:20px 18px;}
.d-brand{font-size:10.5px;color:var(--dim);letter-spacing:1.5px;}
.d-name{font-family:'Noto Serif KR',serif;font-size:19px;font-weight:600;margin-top:6px;line-height:1.4;}
.d-stars{font-size:12px;color:#c9a24a;margin-top:9px;cursor:pointer;}
.d-stars span{color:var(--dim);}
.d-price{margin-top:14px;font-size:22px;font-weight:700;}
.d-ship-card{margin-top:16px;padding:14px 16px;background:#fff;border:1px solid var(--line);border-radius:10px;
  font-size:12px;color:var(--dim);line-height:1.8;}
.d-ship-card b{color:var(--txt);font-weight:500;}
.d-section-t{font-family:'Noto Serif KR',serif;font-size:14.5px;font-weight:600;margin:26px 0 12px;
  display:flex;justify-content:space-between;align-items:baseline;}
.d-section-t .sub{font-family:'Noto Sans KR';font-size:11px;color:var(--dim);font-weight:400;}
.opt-row{display:flex;gap:8px;flex-wrap:wrap;}
.opt{font-size:12px;padding:8px 15px;border-radius:7px;background:#fff;
  border:1px solid var(--line);color:var(--dim);cursor:pointer;}
.opt.on{border-color:var(--txt);color:var(--txt);font-weight:500;}
.opt.dis{opacity:.4;text-decoration:line-through;cursor:not-allowed;}
.d-info-tbl{font-size:12px;color:var(--dim);line-height:2;}
.d-info-tbl b{color:var(--txt);font-weight:500;display:inline-block;width:64px;}

/* 리뷰 */
.rev-summary{display:flex;gap:16px;align-items:center;padding:16px;background:#fff;
  border:1px solid var(--line);border-radius:10px;}
.rev-score{text-align:center;flex-shrink:0;}
.rev-score .big{font-size:32px;font-weight:700;line-height:1;}
.rev-score .st{color:#c9a24a;font-size:12px;margin-top:5px;}
.rev-score .cnt{font-size:10px;color:var(--dim);margin-top:3px;}
.rev-bars{flex:1;}
.rev-bar{display:flex;align-items:center;gap:8px;font-size:10px;color:var(--dim);margin:2px 0;}
.rev-bar .lbl{width:24px;}
.rev-bar .track{flex:1;height:6px;background:var(--line-2);border-radius:3px;overflow:hidden;}
.rev-bar .track i{display:block;height:100%;background:#c9a24a;}
.rev-bar .pct{width:30px;text-align:right;}
.rev-sort{display:flex;gap:10px;margin:14px 0 4px;}
.rev-sort .rs{font-size:11px;color:var(--dim);cursor:pointer;padding:4px 0;}
.rev-sort .rs.on{color:var(--txt);font-weight:700;border-bottom:1.5px solid var(--txt);}
.review{padding:15px 0;border-bottom:1px solid var(--line-2);}
.review .r-top{display:flex;justify-content:space-between;align-items:center;}
.review .r-name{font-size:12px;color:var(--txt);}
.review .r-meta{font-size:10px;color:var(--faint);}
.review .r-star{color:#c9a24a;font-size:11px;margin-top:5px;}
.review .r-opt{font-size:10px;color:var(--faint);margin-top:4px;}
.review .r-text{font-size:12.5px;color:var(--txt);margin-top:7px;line-height:1.65;}
.review .r-photos{display:flex;gap:6px;margin-top:9px;}
.review .r-photos .rp{width:58px;height:58px;border-radius:6px;overflow:hidden;position:relative;
  background:#efece6;display:flex;align-items:center;justify-content:center;}
.review .r-photos .rp img{position:absolute;inset:0;width:100%;height:100%;object-fit:cover;}
.review .r-help{margin-top:9px;font-size:10px;color:var(--dim);}
.review .r-help b{color:var(--txt);font-weight:500;}
.rev-more{width:100%;margin-top:14px;padding:13px;background:#fff;border:1px solid var(--line);
  border-radius:8px;color:var(--txt);font-size:12px;cursor:pointer;font-family:inherit;}

/* 구매바 */
#buyBar{position:absolute;bottom:0;left:0;right:0;z-index:45;background:rgba(250,248,244,.98);
  border-top:1px solid var(--line);padding:10px 14px;display:none;gap:10px;}
.bb-like{width:50px;border:1px solid var(--line);border-radius:9px;background:#fff;
  color:var(--dim);font-size:19px;cursor:pointer;}
.bb-like.on{color:#c0392b;}
.bb-cart{flex:1;border:1px solid var(--txt);border-radius:9px;background:#fff;
  color:var(--txt);font-size:13px;font-weight:500;cursor:pointer;font-family:inherit;}
.bb-buy{flex:1.4;border:none;border-radius:9px;background:var(--accent);color:#fff;font-size:14px;
  font-weight:700;cursor:pointer;font-family:inherit;}
.bb-buy.soldout{background:#fff;color:var(--faint);border:1px solid var(--line);}

/* 장바구니 */
.cart-page{padding:16px;}
.cart-count-line{font-size:13px;color:var(--dim);padding:6px 0 4px;}
.cart-count-line b{color:var(--txt);}
.cart-item{display:flex;gap:12px;padding:15px 0;border-bottom:1px solid var(--line-2);}
.cart-item .ci-thumb{width:74px;height:74px;border-radius:9px;flex-shrink:0;position:relative;
  overflow:hidden;background:#efece6;display:flex;align-items:center;justify-content:center;cursor:pointer;}
.cart-item .ci-thumb .ph{font-family:'Marcellus',serif;font-size:16px;color:rgba(35,33,29,.12);}
.ci-info{flex:1;min-width:0;}
.ci-name{font-size:13px;}
.ci-opt{font-size:11px;color:var(--dim);margin-top:3px;}
.ci-price{font-size:14px;font-weight:700;margin-top:8px;}
.qty{display:flex;align-items:center;margin-top:8px;width:fit-content;
  border:1px solid var(--line);border-radius:7px;overflow:hidden;background:#fff;}
.qty button{width:28px;height:26px;background:#fff;border:none;color:var(--txt);font-size:14px;cursor:pointer;}
.qty span{width:34px;text-align:center;font-size:12px;}
.ci-del{align-self:flex-start;background:none;border:none;color:var(--faint);font-size:15px;cursor:pointer;padding:2px 4px;}
.consent-box{margin-top:18px;background:#fff;border:1px solid var(--line);border-radius:10px;}
.consent-row{display:flex;align-items:flex-start;gap:10px;padding:13px 14px;cursor:pointer;}
.cbox{width:18px;height:18px;border-radius:4px;flex-shrink:0;margin-top:1px;
  border:1.5px solid var(--faint);display:flex;align-items:center;justify-content:center;
  font-size:11px;color:#fff;background:#fff;}
.cbox.checked{background:var(--accent);border-color:var(--accent);}
.consent-row .c-txt{font-size:11.5px;color:var(--dim);line-height:1.5;}
.consent-row .c-txt b{color:var(--txt);font-weight:500;}
.consent-row .c-sub{font-size:10px;color:var(--faint);margin-top:2px;}
.pay-sum{margin-top:16px;padding:15px;background:#fff;border:1px solid var(--line);border-radius:10px;}
.pay-line{display:flex;justify-content:space-between;font-size:12px;color:var(--dim);padding:5px 0;}
.pay-line.total{border-top:1px solid var(--line-2);margin-top:6px;padding-top:12px;
  font-size:15px;color:var(--txt);font-weight:700;}
.pay-coupon{margin-top:14px;}
.pay-coupon select{width:100%;background:#fff;border:1px solid var(--line);color:var(--txt);
  font-size:12px;padding:11px;border-radius:9px;font-family:inherit;}
.pay-btn{width:100%;margin-top:14px;padding:15px;border:none;border-radius:10px;background:var(--accent);
  color:#fff;font-size:15px;font-weight:700;cursor:pointer;font-family:inherit;}
.pay-note{margin-top:9px;text-align:center;font-size:10px;color:var(--dim);line-height:1.5;}
.pay-cancel{display:block;width:100%;margin-top:10px;text-align:center;background:none;border:none;
  color:var(--dim);font-size:11px;text-decoration:underline;cursor:pointer;font-family:inherit;}

/* 마이페이지 */
.my-page{padding:16px;}
.my-profile{display:flex;align-items:center;gap:14px;padding:18px 16px;background:#fff;
  border:1px solid var(--line);border-radius:12px;}
.my-av{width:52px;height:52px;border-radius:50%;background:var(--accent-soft);border:1px solid var(--line);
  display:flex;align-items:center;justify-content:center;font-size:19px;color:var(--accent);font-weight:700;}
.my-name{font-size:15px;font-weight:700;}
.my-grade{font-size:11px;color:var(--dim);margin-top:3px;}
.my-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:8px;margin-top:14px;}
.my-cell{background:#fff;border:1px solid var(--line);border-radius:10px;padding:14px 4px;text-align:center;cursor:pointer;}
.my-cell .num{font-size:17px;font-weight:700;}
.my-cell .lbl{font-size:10px;color:var(--dim);margin-top:4px;}
.my-list{margin-top:14px;}
.my-row{padding:15px 4px;border-bottom:1px solid var(--line-2);font-size:13px;display:flex;
  justify-content:space-between;color:var(--txt);cursor:pointer;}
.my-row .arr{color:var(--faint);}

/* 쿠폰 */
.coupon-page{padding:16px;}
.cp-head{padding:6px 2px 14px;}
.cp-head h2{font-family:'Noto Serif KR',serif;font-size:19px;font-weight:600;}
.cp-head p{font-size:11px;color:var(--dim);margin-top:5px;}
.cp-sec-t{font-size:13px;font-weight:700;margin:16px 0 10px;display:flex;justify-content:space-between;align-items:baseline;}
.cp-sec-t .sub{font-size:10px;color:var(--dim);font-weight:400;}
.coupon{display:flex;align-items:stretch;background:#fff;border:1px solid var(--line);
  border-radius:10px;overflow:hidden;margin-bottom:10px;}
.coupon .cv{flex-shrink:0;width:92px;background:var(--accent-soft);
  display:flex;flex-direction:column;align-items:center;justify-content:center;border-right:1px dashed var(--line);}
.coupon .cv .amt{font-family:'Marcellus',serif;font-size:24px;color:var(--accent);line-height:1;}
.coupon .cv .lbl{font-size:9px;color:var(--dim);margin-top:4px;}
.coupon .cb{flex:1;padding:13px 14px;}
.coupon .cb .ct{font-size:13px;font-weight:700;}
.coupon .cb .cc{font-size:10.5px;color:var(--dim);margin-top:5px;line-height:1.5;}
.coupon .cb .ce{font-size:10px;color:var(--dim);margin-top:6px;}
.coupon .cget{align-self:center;margin-right:12px;background:var(--accent);border:none;color:#fff;
  font-size:12px;font-weight:700;padding:9px 14px;border-radius:8px;cursor:pointer;font-family:inherit;flex-shrink:0;}
.coupon .cget.done{background:#fff;color:var(--faint);border:1px solid var(--line);}

/* 인트로 안내 */
.overlay{position:absolute;inset:0;z-index:100;background:rgba(35,33,29,.45);display:none;
  align-items:center;justify-content:center;padding:24px;}
.overlay.show{display:flex;animation:fade .25s;}
@keyframes fade{from{opacity:0;}to{opacity:1;}}
.intro-modal{width:100%;background:#fff;border:1px solid var(--line);border-radius:14px;overflow:hidden;}
.intro-bar{height:36px;display:flex;align-items:center;justify-content:space-between;
  padding:0 14px;border-bottom:1px solid var(--line-2);}
.intro-bar span{font-size:10px;color:var(--dim);letter-spacing:1px;border:1px solid var(--line);padding:2px 7px;border-radius:3px;}
.intro-bar button{background:none;border:none;color:var(--dim);font-size:15px;cursor:pointer;}
.intro-body{padding:24px 22px;}
.intro-ic{font-size:32px;}
.intro-body h3{font-family:'Noto Serif KR',serif;font-size:17px;font-weight:600;margin-top:10px;line-height:1.4;}
.intro-body h3 em{color:var(--accent);font-style:normal;}
.intro-body p{font-size:12.5px;color:var(--dim);line-height:1.75;margin-top:12px;}
.intro-body p b{color:var(--txt);font-weight:500;}
.intro-check{display:flex;align-items:center;gap:8px;margin-top:18px;font-size:12px;color:var(--dim);cursor:pointer;}
.cbox2{width:18px;height:18px;border-radius:4px;border:1.5px solid var(--faint);
  display:flex;align-items:center;justify-content:center;font-size:11px;color:#fff;}
.cbox2.on{background:var(--accent);border-color:var(--accent);}
.intro-cta{width:100%;margin-top:18px;padding:14px;border:none;border-radius:9px;background:var(--accent);
  color:#fff;font-size:14px;font-weight:700;cursor:pointer;font-family:inherit;}

/* 쿠키 배너 (하단, 대등한 버튼) */
#cookieBanner{position:absolute;left:12px;right:12px;bottom:70px;z-index:60;background:#fff;
  border:1px solid var(--line);border-radius:12px;padding:14px;box-shadow:0 6px 24px rgba(60,50,30,.12);
  display:none;}
#cookieBanner.show{display:block;}
#cookieBanner p{font-size:11.5px;color:var(--dim);line-height:1.6;}
#cookieBanner .cb-btns{display:flex;gap:8px;margin-top:12px;}
#cookieBanner .cb-btns button{flex:1;padding:11px;border-radius:8px;font-size:12.5px;font-weight:700;
  cursor:pointer;font-family:inherit;}
.cb-accept{background:var(--accent);border:none;color:#fff;}
.cb-decline{background:#fff;border:1px solid var(--line);color:var(--txt);}

/* 토스트 */
#toast{position:absolute;bottom:78px;left:50%;transform:translateX(-50%) translateY(20px);
  background:rgba(35,33,29,.94);color:#fff;font-size:12px;padding:11px 18px;border-radius:8px;
  z-index:130;opacity:0;transition:.3s;white-space:nowrap;pointer-events:none;max-width:90%;}
#toast.show{opacity:1;transform:translateX(-50%) translateY(0);}

.detail-imgtrack svg{min-width:100%;height:100%;display:block;}
.review .r-photos .rp svg{position:absolute;inset:0;width:100%;height:100%;}
</style>
</head>
<body>
<div id="app">

  <!-- 상단바 -->
  <div id="topbar">
    <div class="tb-row">
      <button class="tb-icon" onclick="openMenu()">☰</button>
      <div class="logo" onclick="goHome()">ONDO<small>온도</small></div>
      <div class="cart-wrap">
        <button class="tb-icon" onclick="goPage('cartPage')">🛍</button>
        <span class="cart-badge" id="cartBadge">0</span>
      </div>
      <button class="tb-icon" onclick="goPage('myPage')">☺</button>
    </div>
    <div class="tb-search">
      <form onsubmit="return doSearch(event)">
        <input id="searchInput" type="text" placeholder="티셔츠, 슬랙스, 스니커즈 검색" autocomplete="off">
        <button type="submit">⌕</button>
      </form>
    </div>
  </div>

  <!-- 본문 -->
  <div id="scroll">

    <!-- 홈 -->
    <div class="page active" id="homePage">
      <div class="banner">
        <div class="banner-track" id="bannerTrack">
          <div class="slide slide-1" onclick="openList('신상품')">
            <div class="kicker">26 S/S COLLECTION</div>
            <h2>매일 입는 옷의<br>기준을 만듭니다</h2>
            <div class="sub">새 시즌 베이직 컬렉션이 입고되었어요</div>
          </div>
          <div class="slide slide-2" onclick="goPage('bestPage')">
            <div class="kicker">WEEKLY BEST</div>
            <h2>이번 주 가장<br>사랑받은 아이템</h2>
            <div class="sub">지난 7일 판매량 기준</div>
          </div>
          <div class="slide slide-3" onclick="goPage('couponPage')">
            <div class="kicker">WELCOME</div>
            <h2>처음 오셨나요?<br>웰컴 쿠폰을 드려요</h2>
            <div class="sub">조건과 유효기간은 쿠폰함에서 확인하세요</div>
          </div>
        </div>
        <div class="dots" id="bannerDots"></div>
      </div>

      <div class="cat-icons">
        <div class="cat-ic" onclick="openList('상의')"><div class="cir">👕</div><span>상의</span></div>
        <div class="cat-ic" onclick="openList('하의')"><div class="cir">👖</div><span>하의</span></div>
        <div class="cat-ic" onclick="openList('아우터')"><div class="cir">🧥</div><span>아우터</span></div>
        <div class="cat-ic" onclick="openList('신발')"><div class="cir">👟</div><span>신발</span></div>
        <div class="cat-ic" onclick="openList('가방/잡화')"><div class="cir">👜</div><span>가방/잡화</span></div>
      </div>

      <div class="section">
        <div class="sec-head"><div class="sec-title">신상품</div>
          <div class="sec-more" onclick="openList('신상품')">전체보기 ›</div></div>
        <div class="h-scroll" id="newScroll"></div>
      </div>

      <div class="section">
        <div class="sec-head"><div class="sec-title">이번 주 베스트</div>
          <div class="sec-more" onclick="goPage('bestPage')">더보기 ›</div></div>
        <div class="h-scroll" id="bestScroll"></div>
      </div>

      <div class="section">
        <div class="sec-head"><div class="sec-title">MD's PICK</div>
          <div class="sec-more" onclick="openList('MD 추천')">전체보기 ›</div></div>
        <div class="grid" id="mdGrid"></div>
      </div>

      <div class="brand-story">
        <div class="bs-logo">ONDO</div>
        <p>온도는 유행보다 오래 입는 옷을 만듭니다.<br>
        좋은 소재, 정직한 가격, 과장 없는 설명.<br>
        오늘의 온도에 맞는 한 벌을 골라 보세요.</p>
      </div>

      <div class="foot">
        <div class="f-row" onclick="toast('고객센터 1544-0000 · 평일 10:00~17:00')"><span>고객센터</span><span class="arr">›</span></div>
        <div class="f-row" onclick="toast('수령 후 14일 이내 무료 교환·반품이 가능해요')"><span>교환/반품 안내</span><span class="arr">›</span></div>
        <div class="f-row" onclick="toast('오후 3시 이전 주문은 당일 출고돼요')"><span>배송 안내</span><span class="arr">›</span></div>
        <div class="f-info">(주)온도 · 대표 김온도 · 서울시 어딘가구 어딘가로 12<br>
        사업자등록번호 000-00-00000 · 통신판매업 제0000-서울-0000호<br>
        본 페이지는 연구용 모의 사이트로, 실제 판매·결제·개인정보 수집이 없습니다.</div>
      </div>
    </div>

    <!-- 목록 -->
    <div class="page" id="listPage">
      <div class="list-head"><h2 id="listTitle"></h2><div class="cnt" id="listCnt"></div></div>
      <div class="filter-row" id="filterRow">
        <div class="chip on" onclick="sortList(this,'popular')">인기순</div>
        <div class="chip" onclick="sortList(this,'new')">신상품순</div>
        <div class="chip" onclick="sortList(this,'low')">낮은 가격순</div>
        <div class="chip" onclick="sortList(this,'high')">높은 가격순</div>
        <div class="chip" onclick="sortList(this,'review')">리뷰 많은순</div>
      </div>
      <div class="section" style="padding-top:14px"><div class="grid" id="listGrid"></div></div>
      <div style="height:24px"></div>
    </div>

    <!-- 검색결과 -->
    <div class="page" id="searchResultPage">
      <div class="sr-head"><h2><em id="srKeyword"></em> 검색 결과</h2><div class="cnt" id="srCnt"></div></div>
      <div class="section" style="padding-top:8px"><div class="grid" id="srGrid"></div></div>
      <div style="height:24px"></div>
    </div>

    <!-- 베스트 -->
    <div class="page" id="bestPage">
      <div class="list-head"><h2>베스트</h2><div class="cnt">지난 7일 판매량 기준 TOP 30</div></div>
      <div class="filter-row" id="bestFilter">
        <div class="chip on" onclick="paintBest(this,'전체')">전체</div>
        <div class="chip" onclick="paintBest(this,'상의')">상의</div>
        <div class="chip" onclick="paintBest(this,'하의')">하의</div>
        <div class="chip" onclick="paintBest(this,'아우터')">아우터</div>
        <div class="chip" onclick="paintBest(this,'신발')">신발</div>
        <div class="chip" onclick="paintBest(this,'가방/잡화')">가방/잡화</div>
      </div>
      <div id="bestList"></div>
      <div style="height:24px"></div>
    </div>

    <!-- 상세 -->
    <div class="page" id="detailPage"><div id="detailScroll"></div></div>

    <!-- 장바구니 -->
    <div class="page" id="cartPage"><div class="cart-page" id="cartBody"></div></div>

    <!-- 쿠폰 -->
    <div class="page" id="couponPage"><div class="coupon-page" id="couponBody"></div></div>

    <!-- 마이페이지 -->
    <div class="page" id="myPage">
      <div class="my-page">
        <div class="my-profile">
          <div class="my-av">토</div>
          <div><div class="my-name">팔달린토끼3574 님</div>
            <div class="my-grade">일반 회원 · 적립금 0P</div></div>
        </div>
        <div class="my-grid">
          <div class="my-cell" onclick="toast('아직 주문 내역이 없어요')"><div class="num">0</div><div class="lbl">주문내역</div></div>
          <div class="my-cell" onclick="showWishInfo()"><div class="num" id="myWishNum">0</div><div class="lbl">찜한상품</div></div>
          <div class="my-cell" onclick="goPage('couponPage')"><div class="num" id="myCouponNum">1</div><div class="lbl">쿠폰함</div></div>
          <div class="my-cell" onclick="toast('적립금은 구매 확정 시 지급돼요')"><div class="num">0P</div><div class="lbl">적립금</div></div>
        </div>
        <div class="my-list">
          <div class="my-row" onclick="toast('아직 주문 내역이 없어요')"><span>주문 / 배송 조회</span><span class="arr">›</span></div>
          <div class="my-row" onclick="showWishInfo()"><span>찜한 상품</span><span class="arr">›</span></div>
          <div class="my-row" onclick="goPage('couponPage')"><span>쿠폰함</span><span class="arr">›</span></div>
          <div class="my-row" onclick="toast('회원정보 수정은 준비 중이에요')"><span>회원정보 수정</span><span class="arr">›</span></div>
          <div class="my-row" onclick="toast('고객센터 1544-0000 · 평일 10:00~17:00')"><span>고객센터</span><span class="arr">›</span></div>
        </div>
      </div>
      <div style="height:24px"></div>
    </div>

  </div><!-- /scroll -->

  <!-- 탭바 -->
  <div id="tabbar">
    <button class="tab on" id="tabHome" onclick="goHome()"><span class="ic">⌂</span>홈</button>
    <button class="tab" id="tabBest" onclick="goPage('bestPage')"><span class="ic">◎</span>베스트</button>
    <button class="tab" id="tabCat" onclick="openMenu()"><span class="ic">▦</span>카테고리</button>
    <button class="tab" id="tabCoupon" onclick="goPage('couponPage')"><span class="ic">▤</span>쿠폰</button>
  </div>

  <!-- 구매바 -->
  <div id="buyBar"></div>

  <!-- 사이드 메뉴 -->
  <div id="sideMenu">
    <div class="dim" onclick="closeMenu()"></div>
    <div class="panel">
      <div class="sm-head"><div class="logo">ONDO</div>
        <button class="sm-close" onclick="closeMenu()">✕</button></div>
      <div id="catList"></div>
    </div>
  </div>

  <!-- 쿠키 배너 (선택지 대등) -->
  <div id="cookieBanner">
    <p>🍪 온도는 사이트 개선을 위한 최소한의 쿠키를 사용해요. 거부해도 모든 기능을 똑같이 이용할 수 있어요.</p>
    <div class="cb-btns">
      <button class="cb-decline" onclick="cookieChoice(false)">거부하기</button>
      <button class="cb-accept" onclick="cookieChoice(true)">허용하기</button>
    </div>
  </div>

  <div id="toast"></div>
</div>

<script>
/* =========================================================
   0. 유틸 — 결정론적 의사난수
   ========================================================= */
function hashStr(s){let h=2166136261;for(let i=0;i<s.length;i++){h^=s.charCodeAt(i);h=Math.imul(h,16777619);}return h>>>0;}
function mulberry32(a){return function(){a|=0;a=a+0x6D2B79F5|0;let t=Math.imul(a^a>>>15,1|a);t=t+Math.imul(t^t>>>7,61|t)^t;return((t^t>>>14)>>>0)/4294967296;};}
function rng(seed){return mulberry32(typeof seed==='string'?hashStr(seed):seed);}
function pick(r,arr){return arr[Math.floor(r()*arr.length)];}
function won(n){return n.toLocaleString('ko-KR')+'원';}

/* =========================================================
   1. 상품 이미지 — 내장 일러스트(기본) / Picsum / 키워드 실사
   IMG_MODE:
   'illust'  : 내장 SVG 일러스트 (안전·오프라인·기본값)
   'picsum'  : 실사 사진 (안전하지만 옷과 무관한 풍경/사물)
   'keyword' : 옷 키워드 실사 (무료 공개사진 풀이라 무관하거나
               부적절한 사진이 섞일 수 있어 권장하지 않음)
   ========================================================= */
const IMG_MODE='illust';
const ART_PAL=['#cfc4b2','#b9c0ae','#a7b4c0','#d9c9b2','#8f8b80','#5b6157','#c2a98f','#9aa5b1','#6e6a61','#4a5568'];
const ART_LN='rgba(35,33,29,.3)';
const ART_SHADOW='rgba(35,33,29,.10)';
function shade(hex,f){
  const n=parseInt(hex.slice(1),16);let r=(n>>16)&255,g=(n>>8)&255,b=n&255;
  if(f<=1){r=Math.round(r*f);g=Math.round(g*f);b=Math.round(b*f);}
  else{r=Math.round(r+(255-r)*(f-1));g=Math.round(g+(255-g)*(f-1));b=Math.round(b+(255-b)*(f-1));}
  const c=x=>Math.max(0,Math.min(255,x));
  return '#'+((1<<24)+(c(r)<<16)+(c(g)<<8)+c(b)).toString(16).slice(1);
}
const KIND={'반팔':'tee','티셔츠':'tee','긴팔':'long','셔츠':'shirt','니트':'knit','후드티':'hoodie','후드':'hoodie',
 '맨투맨':'sweat','집업':'zip','가디건':'cardigan','바람막이':'wind','블루종':'bomber','점퍼':'bomber','패딩':'puffer',
 '자켓':'jacket','코트':'coat','와이드팬츠':'wide','카고팬츠':'cargo','데님':'denim','청바지':'denim',
 '트레이닝팬츠':'track','조거팬츠':'jogger','슬랙스':'slacks','반바지':'shorts','스커트':'skirt',
 '스니커즈':'sneaker','러닝화':'runner','부츠':'boot','로퍼':'loafer','슬리퍼':'slide','샌들':'sandal',
 '볼캡':'cap','모자':'cap','비니':'beanie','목걸이':'necklace','반지':'ring','가방':'backpack','백팩':'backpack',
 '크로스백':'crossbody','토트백':'tote','양말':'socks'};
const K_SHOES=['sneaker','runner','boot','loafer','slide','sandal'];
const K_ACC=['cap','beanie','necklace','ring','backpack','crossbody','tote','socks'];
const ART_PRINT_P=0.3;
function hslToHex(h,s,l){
  s/=100;l/=100;
  const k=n=>(n+h/30)%12, a=s*Math.min(l,1-l);
  const f=n=>l-a*Math.max(-1,Math.min(k(n)-3,Math.min(9-k(n),1)));
  const to=x=>Math.round(255*x).toString(16).padStart(2,'0');
  return '#'+to(f(0))+to(f(8))+to(f(4));
}
function makeFill(uid,r,c1,c2,acc){
  const roll=r();
  const lineC=r()<.4?acc:c2;
  if(roll<0.42)return{defs:'',fill:c1};
  if(roll<0.58){ // 컬러블록 (배색)
    const t=(0.3+r()*0.35).toFixed(2);
    const dir=r()<.6?'x1="0" y1="0" x2="0" y2="1"':(r()<.5?'x1="0" y1="0" x2="1" y2="0"':'x1="0" y1="0" x2="1" y2="1"');
    return{defs:`<linearGradient id="f${uid}" ${dir}><stop offset="${t}" stop-color="${acc}"/><stop offset="${t}" stop-color="${c1}"/></linearGradient>`,fill:`url(#f${uid})`};
  }
  if(roll<0.72){ // 가로 스트라이프
    const hgt=(7+Math.floor(r()*7));const th=(1.4+r()*2.2).toFixed(1);
    return{defs:`<pattern id="f${uid}" patternUnits="userSpaceOnUse" width="12" height="${hgt}"><rect width="12" height="${hgt}" fill="${c1}"/><rect width="12" height="${th}" fill="${lineC}"/></pattern>`,fill:`url(#f${uid})`};
  }
  if(roll<0.82){ // 세로 스트라이프
    const w=(7+Math.floor(r()*6));const th=(1.3+r()*1.8).toFixed(1);
    return{defs:`<pattern id="f${uid}" patternUnits="userSpaceOnUse" width="${w}" height="12"><rect width="${w}" height="12" fill="${c1}"/><rect width="${th}" height="12" fill="${lineC}"/></pattern>`,fill:`url(#f${uid})`};
  }
  if(roll<0.91){ // 도트
    const g=(8+Math.floor(r()*5));const rad=(1.1+r()*1.1).toFixed(1);
    return{defs:`<pattern id="f${uid}" patternUnits="userSpaceOnUse" width="${g}" height="${g}"><rect width="${g}" height="${g}" fill="${c1}"/><circle cx="${g/2}" cy="${g/2}" r="${rad}" fill="${lineC}"/></pattern>`,fill:`url(#f${uid})`};
  }
  // 체크/그리드
  const g=(9+Math.floor(r()*6));const th=(1.2+r()*1.4).toFixed(1);
  return{defs:`<pattern id="f${uid}" patternUnits="userSpaceOnUse" width="${g}" height="${g}"><rect width="${g}" height="${g}" fill="${c1}"/><rect width="${g}" height="${th}" fill="${lineC}" opacity=".8"/><rect width="${th}" height="${g}" fill="${lineC}" opacity=".8"/></pattern>`,fill:`url(#f${uid})`};
}
function printFor(kind,r,c3,acc){
  if(!['tee','sweat','hoodie'].includes(kind))return '';
  if(r()>=ART_PRINT_P)return '';
  const v=Math.floor(r()*6);
  const dx=(r()*8-4).toFixed(1),dy=(r()*5-2.5).toFixed(1);
  const col=r()<.5?c3:acc;
  let s='';
  if(v===0)s=`<rect x="51" y="52" width="18" height="12" rx="2" fill="${col}"/>`;
  else if(v===1)s=`<circle cx="60" cy="58" r="6.5" fill="${col}"/>`;
  else if(v===2)s=`<rect x="51" y="53" width="18" height="3.2" rx="1.4" fill="${col}"/><rect x="54" y="59" width="12" height="3.2" rx="1.4" fill="${col}"/>`;
  else if(v===3)s=`<path d="M60 50 L67 58 L60 66 L53 58Z" fill="${col}"/>`;
  else if(v===4)s=`<path d="M51 55 Q60 65 69 55" stroke="${col}" stroke-width="2.6" fill="none" stroke-linecap="round"/>`;
  else s=`<path d="M62 48 L54 60 L59 60 L57 69 L66 56 L61 56Z" fill="${col}"/>`;
  return `<g transform="translate(${dx} ${dy})" opacity=".92">${s}</g>`;
}

function topBase(c1,long){
  return long
   ? `<path d="M40 32 L52 26 Q60 33 68 26 L80 32 L92 41 L89 79 L79 76 L79 94 L41 94 L41 76 L31 79 L28 41 Z" fill="${c1}"/>`
   : `<path d="M40 32 L52 26 Q60 33 68 26 L80 32 L93 45 L83 55 L78 49 L78 94 L42 94 L42 49 L37 55 L27 45 Z" fill="${c1}"/>`;
}
function neck(c2){return `<path d="M52 26 Q60 35 68 26 Q60 31 52 26Z" fill="${c2}"/>`;}
function seams(ln){return `<path d="M41 36 L41 76 M79 36 L79 76" stroke="${ln}" stroke-width="1" fill="none" opacity=".6"/>`;}
function pantsBase(c1,c2){return `<path d="M42 30 H78 L83 98 H64 L60 56 L56 98 H37Z" fill="${c1}"/><rect x="42" y="26" width="36" height="7" rx="2" fill="${c2}"/>`;}

function drawKind(kind,c1,c2,c3,ln,detail,prn){
  const D=detail;
  switch(kind){
    case 'tee': return topBase(c1,false)+neck(c2)+(D&&prn?prn:``);
    case 'long': return topBase(c1,true)+neck(c2)+seams(ln);
    case 'shirt': return topBase(c1,true)+seams(ln)
      +(D?`<path d="M52 26 L60 37 L49 33Z" fill="${c2}"/><path d="M68 26 L60 37 L71 33Z" fill="${c2}"/><path d="M60 37 L60 94" stroke="${ln}" stroke-width="1"/><g fill="${c2}"><circle cx="60" cy="46" r="1.4"/><circle cx="60" cy="58" r="1.4"/><circle cx="60" cy="70" r="1.4"/><circle cx="60" cy="82" r="1.4"/></g>`:neck(c2));
    case 'knit': return topBase(c1,true)+neck(c2)
      +`<g stroke="${ln}" stroke-width="1" opacity=".5"><path d="M43 44 H77 M43 52 H77 M43 60 H77 M43 68 H77 M43 76 H77 M43 84 H77"/></g>`
      +`<rect x="42" y="88" width="36" height="6" fill="${c2}"/>`;
    case 'sweat': return topBase(c1,true)+`<path d="M50 25 Q60 36 70 25 L67 23 Q60 31 53 23Z" fill="${c2}"/>`
      +`<rect x="42" y="88" width="36" height="6" fill="${c2}"/><rect x="31" y="73" width="10" height="6" fill="${c2}"/><rect x="79" y="73" width="10" height="6" fill="${c2}"/>`
      +(D&&prn?prn:``);
    case 'hoodie': return topBase(c1,true)+`<path d="M45 29 Q60 12 75 29 Q60 38 45 29Z" fill="${c2}"/>`
      +(D?`<path d="M56 34 L55 47 M64 34 L65 47" stroke="${ln}" stroke-width="1.4"/><path d="M49 68 L71 68 L67 86 L53 86Z" fill="${c2}"/>`:``)+(D&&prn?prn:``);
    case 'zip': return topBase(c1,true)+`<path d="M50 26 L52 20 L68 20 L70 26 Q60 32 50 26Z" fill="${c2}"/>`
      +`<path d="M60 30 L60 94" stroke="${ln}" stroke-width="2"/>`+(D?`<rect x="58.6" y="40" width="2.8" height="6" rx="1" fill="${c3}"/><rect x="31" y="73" width="10" height="6" fill="${c2}"/><rect x="79" y="73" width="10" height="6" fill="${c2}"/>`:``);
    case 'cardigan': return topBase(c1,true)
      +`<path d="M52 26 L60 46 L57 48 L50 30Z" fill="${c2}"/><path d="M68 26 L60 46 L63 48 L70 30Z" fill="${c2}"/><path d="M60 46 L60 94" stroke="${ln}" stroke-width="1"/>`
      +(D?`<g fill="${c2}"><circle cx="60" cy="54" r="1.6"/><circle cx="60" cy="66" r="1.6"/><circle cx="60" cy="78" r="1.6"/></g>`:``)
      +`<rect x="42" y="89" width="36" height="5" fill="${c2}" opacity=".7"/>`;
    case 'wind': return topBase(c1,true)+`<path d="M50 26 L51 19 L69 19 L70 26 Q60 32 50 26Z" fill="${c2}"/>`
      +`<path d="M60 28 L60 94" stroke="${ln}" stroke-width="1.8"/>`
      +(D?`<path d="M45 58 L55 62 M65 62 L75 58" stroke="${ln}" stroke-width="1.6"/><path d="M28 41 L45 50 M92 41 L75 50" stroke="${c3}" stroke-width="2" opacity=".7"/>`:``);
    case 'bomber': return topBase(c1,true)+`<rect x="50" y="21" width="20" height="7" rx="3.5" fill="${c2}"/>`
      +`<path d="M60 30 L60 88" stroke="${ln}" stroke-width="1.8"/>`
      +`<rect x="42" y="88" width="36" height="6" fill="${c2}"/><rect x="31" y="73" width="10" height="6" fill="${c2}"/><rect x="79" y="73" width="10" height="6" fill="${c2}"/>`
      +(D?`<path d="M46 60 L54 64 M66 64 L74 60" stroke="${ln}" stroke-width="1.4"/>`:``);
    case 'puffer': return `<path d="M36 32 L52 24 Q60 31 68 24 L84 32 L92 44 L90 92 Q60 101 30 92 L28 44Z" fill="${c1}"/>`
      +`<rect x="47" y="19" width="26" height="9" rx="4.5" fill="${c2}"/>`
      +`<g stroke="${c2}" stroke-width="2.6" fill="none" opacity=".9"><path d="M31 48 Q60 54 89 48 M30 60 Q60 66 90 60 M30 72 Q60 78 90 72 M31 84 Q60 90 89 84"/></g>`
      +(D?`<path d="M60 28 L60 96" stroke="${ln}" stroke-width="1.6"/>`:``);
    case 'jacket': return topBase(c1,true)
      +`<path d="M52 26 L60 42 L47 36Z" fill="${c2}"/><path d="M68 26 L60 42 L73 36Z" fill="${c2}"/>`
      +(D?`<g fill="${c2}"><circle cx="60" cy="52" r="1.7"/><circle cx="60" cy="64" r="1.7"/></g><rect x="45" y="74" width="11" height="4" rx="1" fill="${c2}"/><rect x="64" y="74" width="11" height="4" rx="1" fill="${c2}"/>`:``);
    case 'coat': return `<path d="M40 32 L52 26 Q60 33 68 26 L80 32 L92 41 L89 82 L80 79 L80 106 L40 106 L40 79 L31 82 L28 41Z" fill="${c1}"/>`
      +`<path d="M52 26 L60 44 L46 37Z" fill="${c2}"/><path d="M68 26 L60 44 L74 37Z" fill="${c2}"/>`
      +(D?`<rect x="42" y="64" width="36" height="6" rx="2" fill="${c2}"/><path d="M60 44 L60 104" stroke="${ln}" stroke-width="1"/>`:``);
    case 'wide': return `<path d="M40 30 H80 L86 98 H62 L60 60 L58 98 H34Z" fill="${c1}"/><rect x="40" y="26" width="40" height="7" rx="2" fill="${c2}"/>`+(D?`<path d="M60 33 L60 44" stroke="${ln}"/>`:``);
    case 'cargo': return pantsBase(c1,c2)
      +`<rect x="36.5" y="58" width="12.5" height="15" rx="2" fill="${c2}"/><rect x="71" y="58" width="12.5" height="15" rx="2" fill="${c2}"/>`
      +(D?`<path d="M36.5 63 H49 M71 63 H83.5" stroke="${ln}" stroke-width="1"/>`:``);
    case 'denim': return pantsBase(c1,c2)
      +`<path d="M46 36 L44 96 M74 36 L76 96" stroke="${ln}" stroke-width="1" stroke-dasharray="2 2" opacity=".8"/>`
      +(D?`<path d="M44 40 Q52 44 46 51 M76 40 Q68 44 74 51 M60 33 L60 44" stroke="${ln}" stroke-width="1" fill="none"/>`:``);
    case 'track': return pantsBase(c1,c2)
      +`<path d="M45 34 L41 96 M75 34 L79 96" stroke="${c3}" stroke-width="3"/>`;
    case 'jogger': return `<path d="M42 30 H78 L80 90 H66 L61 58 L56 90 H40Z" fill="${c1}"/><rect x="42" y="26" width="36" height="7" rx="2" fill="${c2}"/>`
      +`<rect x="64" y="88" width="15" height="7" rx="2" fill="${c2}"/><rect x="40" y="88" width="15" height="7" rx="2" fill="${c2}"/>`
      +(D?`<path d="M48 40 Q50 46 47 50 M72 40 Q70 46 73 50" stroke="${ln}" fill="none"/>`:``);
    case 'slacks': return pantsBase(c1,c2)+`<path d="M49 37 L47 96 M71 37 L73 96" stroke="${ln}" stroke-width="1" opacity=".7"/>`;
    case 'shorts': return `<path d="M42 30 H78 L82 66 H63 L60 48 L57 66 H38Z" fill="${c1}"/><rect x="42" y="26" width="36" height="7" rx="2" fill="${c2}"/>`+(D?`<path d="M60 33 L60 44" stroke="${ln}"/>`:``);
    case 'skirt': return `<path d="M45 30 H75 L86 78 H34Z" fill="${c1}"/><rect x="45" y="26" width="30" height="7" rx="2" fill="${c2}"/>`
      +(D?`<path d="M60 33 L60 76" stroke="${ln}" opacity=".6"/><path d="M36 72 L84 72" stroke="${ln}" opacity=".4"/>`:``);
    case 'sneaker': return `<path d="M22 84 Q60 94 98 82 L98 90 Q60 100 22 92Z" fill="${c2}"/>`
      +`<path d="M25 84 Q28 62 50 58 Q78 54 96 76 L96 84 Q60 92 25 84Z" fill="${c1}"/>`
      +`<path d="M25 84 Q26 72 36 67 Q34 80 25 84Z" fill="${c3}"/>`
      +`<g stroke="${ln}" stroke-width="1.6"><path d="M48 66 L60 62 M50 71 L62 67 M52 76 L64 72"/></g>`;
    case 'runner': return `<path d="M22 84 Q60 96 98 82 L98 91 Q60 102 22 93Z" fill="${c2}"/>`
      +`<path d="M25 84 Q28 62 50 58 Q78 54 96 76 L96 84 Q60 92 25 84Z" fill="${c1}"/>`
      +`<path d="M38 80 L70 64 L75 70 L44 86Z" fill="${c3}" opacity=".9"/>`
      +`<g stroke="${ln}" stroke-width="1.5"><path d="M50 66 L61 62 M52 71 L63 67"/></g>`;
    case 'boot': return `<path d="M40 32 H66 L66 72 Q84 74 92 83 L92 90 H36Z" fill="${c1}"/>`
      +`<rect x="34" y="88" width="60" height="8" rx="3" fill="${c2}"/>`
      +`<g stroke="${ln}" stroke-width="1.4"><path d="M44 42 H62 M44 50 H62 M44 58 H62"/></g>`;
    case 'loafer': return `<path d="M26 80 Q40 64 62 64 Q86 64 96 79 L96 86 Q60 94 26 88Z" fill="${c1}"/>`
      +`<rect x="52" y="64" width="18" height="6" rx="2" fill="${c2}"/>`
      +`<path d="M24 86 Q60 96 98 84 L98 89 Q60 99 24 91Z" fill="${c2}"/>`;
    case 'slide': return `<path d="M26 82 H94 Q99 88 92 92 H28 Q21 88 26 82Z" fill="${c2}"/>`
      +`<path d="M34 82 Q60 56 86 82Z" fill="${c1}"/>`+(D?`<path d="M42 76 Q60 62 78 76" stroke="${ln}" fill="none"/>`:``);
    case 'sandal': return `<path d="M26 82 H94 Q99 88 92 92 H28 Q21 88 26 82Z" fill="${c2}"/>`
      +`<path d="M38 82 Q60 64 82 82 M48 82 Q60 73 72 82" stroke="${c1}" stroke-width="4.5" fill="none"/>`;
    case 'cap': return `<path d="M32 64 Q60 32 88 64Z" fill="${c1}"/>`
      +`<path d="M28 64 H92 Q95 74 80 71 L33 69 Q25 68 28 64Z" fill="${c2}"/>`
      +`<circle cx="60" cy="40" r="2.4" fill="${c2}"/>`+(D?`<path d="M60 34 L60 63 M45 42 L50 63 M75 42 L70 63" stroke="${ln}" stroke-width="1" opacity=".6"/>`:``);
    case 'beanie': return `<path d="M36 70 Q36 34 60 32 Q84 34 84 70Z" fill="${c1}"/>`
      +`<rect x="34" y="66" width="52" height="13" rx="5" fill="${c2}"/>`
      +`<g stroke="${ln}" stroke-width="1" opacity=".6"><path d="M40 68 V78 M48 67 V79 M56 66 V79 M64 66 V79 M72 67 V79 M80 68 V78"/></g>`
      +(D?`<circle cx="60" cy="30" r="4" fill="${c2}"/>`:``);
    case 'necklace': return `<circle cx="60" cy="50" r="26" fill="none" stroke="${c1}" stroke-width="2.6" stroke-dasharray="1.6 3"/>`
      +`<circle cx="60" cy="76" r="3" fill="${c2}"/><path d="M60 79 L53 87 L60 97 L67 87Z" fill="${c3}"/>`;
    case 'ring': return `<circle cx="60" cy="68" r="17" fill="none" stroke="${c1}" stroke-width="7"/>`
      +`<path d="M51 44 L69 44 L74 52 L60 63 L46 52Z" fill="${c3}"/>`+(D?`<path d="M54 48 L58 48" stroke="#fff" stroke-width="1.6" opacity=".8"/>`:``);
    case 'backpack': return `<path d="M40 44 Q34 60 40 80 M80 44 Q86 60 80 80" stroke="${c2}" stroke-width="5" fill="none"/>`
      +`<rect x="38" y="32" width="44" height="54" rx="13" fill="${c1}"/>`
      +`<path d="M52 32 Q60 22 68 32" stroke="${c2}" stroke-width="4" fill="none"/>`
      +`<rect x="46" y="58" width="28" height="22" rx="7" fill="${c2}"/>`
      +(D?`<path d="M42 48 H78" stroke="${ln}" stroke-width="1.4" stroke-dasharray="3 2"/>`:``);
    case 'crossbody': return `<path d="M48 52 L88 16" stroke="${c2}" stroke-width="3.4"/>`
      +`<rect x="40" y="50" width="40" height="28" rx="7" fill="${c1}"/>`
      +`<path d="M40 50 H80 L75 64 H45Z" fill="${c2}"/>`+(D?`<circle cx="60" cy="64" r="2.4" fill="${c3}"/>`:``);
    case 'tote': return `<path d="M46 46 Q46 28 58 28 M74 46 Q74 28 62 28" stroke="${c2}" stroke-width="4.5" fill="none"/>`
      +`<path d="M36 44 H84 L78 96 H42Z" fill="${c1}"/>`
      +(D?`<path d="M38 52 H82" stroke="${ln}" stroke-width="1.2" opacity=".6"/>`:``);
    case 'socks': return `<g transform="translate(12 4)" opacity=".75"><path d="M46 28 H62 V58 Q62 78 46 80 Q32 80 32 68 Q32 58 42 56 L46 54Z" fill="${c2}"/></g>`
      +`<path d="M46 26 H62 V56 Q62 78 46 80 Q31 80 31 67 Q31 57 42 55 L46 52Z" fill="${c1}"/>`
      +`<rect x="45" y="24" width="18" height="8" rx="2" fill="${c2}"/>`
      +(D?`<path d="M48 38 H60 M48 44 H60" stroke="${ln}" stroke-width="1.2"/>`:``);
    default: return topBase(c1,false)+neck(c2);
  }
}
function swatch(kind,c1,c2,ln){
  let pat;
  if(['knit','beanie','socks','cardigan','sweat'].includes(kind))
    pat=`<g stroke="${ln}" stroke-width="1.4" opacity=".55"><path d="M28 36 H92 M28 46 H92 M28 56 H92 M28 66 H92 M28 76 H92 M28 86 H92"/></g>`;
  else if(kind==='denim')
    pat=`<g stroke="${ln}" stroke-width="1" opacity=".5"><path d="M28 40 L44 24 M28 56 L60 24 M28 72 L76 24 M28 88 L92 24 M40 92 L92 40 M56 92 L92 56 M72 92 L92 72"/></g>`;
  else if(kind==='puffer')
    pat=`<g stroke="${c2}" stroke-width="2" opacity=".8"><path d="M28 44 H92 M28 62 H92 M28 80 H92 M46 26 V94 M64 26 V94 M82 26 V94"/></g>`;
  else
    pat=`<g stroke="${ln}" stroke-width="1" opacity=".35"><path d="M28 48 L52 24 M28 72 L76 24 M36 92 L92 36 M60 92 L92 60"/></g>`;
  return `<rect x="24" y="24" width="72" height="72" rx="14" fill="${c1}" stroke="${c2}" stroke-width="2"/>`+pat
    +`<circle cx="84" cy="84" r="5" fill="${c2}"/>`;
}
function svgArt(p,idx,cls,extra){
  idx=idx||0;cls=cls||'';
  const r=rng(p.id+'-art-'+(extra||''));
  const h0=Math.floor(r()*360);
  const c1=hslToHex(h0,8+Math.floor(r()*18),56+Math.floor(r()*20));
  const c2=shade(c1,.66+r()*.14);
  const c3=shade(c1,1.28+r()*.3);
  const acc=hslToHex((h0+120+Math.floor(r()*140))%360,8+Math.floor(r()*18),56+Math.floor(r()*20));
  const hb=hashStr(p.id+'-'+(extra||''));
  const bgA=`hsl(${hb%360} 16% 91%)`;const bgB=`hsl(${(hb+30)%360} 14% 83%)`;
  const kind=KIND[p.sub]||'tee';
  const uid='u'+(hashStr(p.id+'|'+idx+'|'+(extra||''))%1e8);
  const bgDir=['x2="1" y2="1"','x2="0" y2="1"','x2="1" y2="0"','x2="1" y2=".4"'][Math.floor(r()*4)];
  let art,extraDefs='';
  if(idx===2){art=swatch(kind,c1,r()<.5?c2:acc,ART_LN);}
  else{
    const fl=makeFill(uid,r,c1,c2,acc);extraDefs=fl.defs;
    const prn=printFor(kind,r,c3,acc);
    const zoomKind=K_SHOES.includes(kind)||K_ACC.includes(kind);
    const body=drawKind(kind,fl.fill,c2,c3,ART_LN,idx===0,prn);
    const tag=(idx===1&&!zoomKind)?`<rect x="55" y="28" width="10" height="4" rx="1.5" fill="${c2}"/>`:``;
    const sx=(0.94+r()*0.12).toFixed(3),sy=(0.94+r()*0.12).toFixed(3);
    const inner=`<ellipse cx="60" cy="101" rx="${(28+r()*10).toFixed(0)}" ry="5.5" fill="${ART_SHADOW}"/>`+body+tag;
    const jit=`<g transform="translate(60 62) scale(${sx} ${sy}) translate(-60 -62)">${inner}</g>`;
    art=(idx===1&&zoomKind)?`<g transform="translate(60 62) scale(1.22) translate(-60 -62)">${jit}</g>`:jit;
  }
  return `<svg class="thumb-img ${cls}" viewBox="0 0 120 120" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice">
<defs><linearGradient id="${uid}" x1="0" y1="0" ${bgDir}>
<stop offset="0" stop-color="${bgA}"/><stop offset="1" stop-color="${bgB}"/></linearGradient>${extraDefs}</defs>
<rect width="120" height="120" fill="url(#${uid})"/>${art}</svg>`;
}
function imgTag(p,idx,cls){
  idx=idx||0;cls=cls||'';
  if(IMG_MODE==='illust')return svgArt(p,idx,cls);
  const seed=(hashStr(p.id)+idx*131)%100000;
  const url=IMG_MODE==='keyword'
    ? `https://loremflickr.com/600/600/${p.kw}?lock=${seed}`
    : `https://picsum.photos/seed/${p.id}-${idx}/600/600`;
  return `<img class="thumb-img ${cls}" src="${url}" data-seed="${p.id}-${idx}" data-t="0"
    onerror="imgErr(this)" loading="lazy" alt="">`;
}
function imgErr(img){
  const t=img.dataset.t;
  if(t==='0'){img.dataset.t='1';img.src=`https://picsum.photos/seed/${img.dataset.seed}/600/600`;}
  else{img.style.display='none';}
}
function revShot(rv,k){
  const p=ALL[revState.pid];
  if(IMG_MODE==='illust')return svgArt(p,0,'',rv.seed+'-'+k);
  const url=IMG_MODE==='keyword'
    ? `https://loremflickr.com/200/200/clothing?lock=${(hashStr(rv.seed)+k*7)%9999}`
    : `https://picsum.photos/seed/${rv.seed}-${k}/200/200`;
  return `<img src="${url}" data-seed="${rv.seed}-${k}" data-t="0" onerror="imgErr(this)" loading="lazy">`;
}

/* =========================================================
   2. 카테고리 / 키워드 / 이름 풀
   ========================================================= */
const CATS=[
  ['상의',['티셔츠','셔츠','니트','맨투맨','후드']],
  ['하의',['데님','슬랙스','와이드팬츠','조거팬츠','스커트']],
  ['아우터',['가디건','자켓','코트','점퍼']],
  ['신발',['스니커즈','로퍼','부츠','샌들']],
  ['가방/잡화',['백팩','크로스백','토트백','모자','양말']]
];
const KW={'티셔츠':'tshirt','셔츠':'shirt','니트':'knit-sweater','맨투맨':'sweatshirt','후드':'hoodie',
  '데님':'denim-jeans','슬랙스':'dress-pants','와이드팬츠':'wide-pants','조거팬츠':'jogger-pants','스커트':'skirt',
  '가디건':'cardigan','자켓':'jacket','코트':'coat','점퍼':'bomber-jacket',
  '스니커즈':'sneakers','로퍼':'loafers','부츠':'boots','샌들':'sandals',
  '백팩':'backpack','크로스백':'crossbody-bag','토트백':'tote-bag','모자':'cap','양말':'socks'};
const SUBCAT_TO_TOP={};
CATS.forEach(([top,subs])=>subs.forEach(s=>SUBCAT_TO_TOP[s]=top));
const MAT=['코튼','린넨','오가닉 코튼','울 블렌드','텐셀','헤비 코튼','수피마 코튼','캐시미어 터치'];
const FIT=['릴랙스','스탠다드','세미오버','와이드','테이퍼드','크롭'];
const COLOR=['아이보리','오트밀','차콜','세이지','네이비','브라운'];

/* =========================================================
   3. 상품 생성 (정직한 가격 · 허수 없음)
   ========================================================= */
const ALL={};
const PRODUCTS=[];
let pidx=0;
function buildProducts(){
  Object.keys(KW).forEach(sub=>{
    const kw=KW[sub];const top=SUBCAT_TO_TOP[sub];
    const n=3+Math.floor(rng('cnt-'+sub)()*3); // 3~5개
    for(let i=0;i<n;i++){
      const id='o'+(pidx++);
      const r=rng(id);
      const name=pick(r,MAT)+' '+pick(r,FIT)+' '+sub;
      const price=(15+Math.floor(r()*95))*1000; // 15,000~109,000 정가
      const reviewCount=Math.floor(Math.pow(r(),2.0)*2400)+(3+Math.floor(r()*50));
      const rate=(3.9+r()*1.0).toFixed(1);
      const soldOut=r()<0.08;
      const sales=Math.floor(Math.pow(r(),1.4)*4000)+30;
      PRODUCTS.push({id,name,cat:top,sub,kw,price,reviewCount,rate,soldOut,sales});
    }
  });
  PRODUCTS.forEach(p=>ALL[p.id]=p);
}
buildProducts();
const NEW_IDS=new Set(PRODUCTS.slice(-12).map(p=>p.id));
const NEWLIST=[...PRODUCTS].slice(-14).reverse();
const BEST=[...PRODUCTS].sort((a,b)=>b.sales-a.sales);
const MD=[...PRODUCTS].filter(p=>hashStr(p.id+'md')%6===0).slice(0,8);

/* =========================================================
   4. 상품 카드
   ========================================================= */
function cardHTML(p){
  return `<div class="pcard" onclick="openDetail('${p.id}')">
    <div class="thumb">
      <div class="ph">ONDO</div>
      ${imgTag(p,0)}
      ${NEW_IDS.has(p.id)?'<div class="tag-new">NEW</div>':''}
      ${p.soldOut?'<div class="soldout-cover"><span>일시 품절</span></div>':''}
    </div>
    <div class="pname">${p.name}</div>
    <div class="pprice">${won(p.price)}</div>
    <div class="stars">★ ${p.rate} <span>(${p.reviewCount.toLocaleString()})</span></div>
    <button class="card-add ${p.soldOut?'dis':''}" onclick="${p.soldOut?`event.stopPropagation();toast('일시 품절된 상품이에요')`:`quickAdd(event,'${p.id}')`}">${p.soldOut?'품절':'담기'}</button>
  </div>`;
}
function renderHome(){
  document.getElementById('newScroll').innerHTML=NEWLIST.map(p=>cardHTML(p)).join('');
  document.getElementById('bestScroll').innerHTML=BEST.slice(0,10).map(p=>cardHTML(p)).join('');
  document.getElementById('mdGrid').innerHTML=MD.map(p=>cardHTML(p)).join('');
}

/* =========================================================
   5. 카테고리 메뉴
   ========================================================= */
function renderCats(){
  document.getElementById('catList').innerHTML=CATS.map((c,i)=>`
    <div class="cat-group" id="cg${i}">
      <div class="cat-main" onclick="toggleCat(${i})"><span>${c[0]}</span><span class="arr">›</span></div>
      <div class="cat-sub">
        <a onclick="openList('${c[0]}')">전체 보기</a>
        ${c[1].map(s=>`<a onclick="openList('${s}')">${s}</a>`).join('')}
      </div>
    </div>`).join('');
}
function toggleCat(i){document.getElementById('cg'+i).classList.toggle('open');}
function openMenu(){document.getElementById('sideMenu').classList.add('open');}
function closeMenu(){document.getElementById('sideMenu').classList.remove('open');}

/* =========================================================
   6. 페이지 전환
   ========================================================= */
function showPage(id){
  document.querySelectorAll('.page').forEach(p=>p.classList.remove('active'));
  document.getElementById(id).classList.add('active');
  document.getElementById('scroll').scrollTop=0;
  document.getElementById('buyBar').style.display=(id==='detailPage')?'flex':'none';
  ['tabHome','tabBest','tabCoupon'].forEach(t=>document.getElementById(t).classList.remove('on'));
  if(id==='homePage')document.getElementById('tabHome').classList.add('on');
  if(id==='bestPage'){document.getElementById('tabBest').classList.add('on');paintBestList('전체');}
  if(id==='couponPage'){document.getElementById('tabCoupon').classList.add('on');renderCoupons();}
  if(id==='cartPage')renderCart();
}
function goPage(id){showPage(id);closeMenu();}
function goHome(){showPage('homePage');closeMenu();}

/* =========================================================
   7. 목록 + 정렬
   ========================================================= */
let listSource=[];let currentListName='';let currentSort='popular';
const SORT_LABEL={popular:'인기순',new:'신상품순',low:'낮은 가격순',high:'높은 가격순',review:'리뷰 많은순'};
function resolveList(name){
  if(name==='신상품')return [...PRODUCTS].slice(-20).reverse();
  if(name==='MD 추천')return [...PRODUCTS].filter(p=>hashStr(p.id+'md')%6===0);
  const topCat=CATS.find(c=>c[0]===name);
  if(topCat)return PRODUCTS.filter(p=>p.cat===name);
  const inSub=PRODUCTS.filter(p=>p.sub===name);
  if(inSub.length)return inSub;
  return PRODUCTS.filter(p=>p.name.includes(name)||p.sub.includes(name));
}
function sortedList(){
  const arr=[...listSource];
  if(currentSort==='low')arr.sort((a,b)=>a.price-b.price);
  else if(currentSort==='high')arr.sort((a,b)=>b.price-a.price);
  else if(currentSort==='review')arr.sort((a,b)=>b.reviewCount-a.reviewCount);
  else if(currentSort==='new')arr.reverse();
  else arr.sort((a,b)=>b.sales-a.sales);
  return arr;
}
function paintList(){
  document.getElementById('listTitle').textContent=currentListName;
  document.getElementById('listCnt').textContent='총 '+listSource.length+'개 · '+SORT_LABEL[currentSort];
  document.getElementById('listGrid').innerHTML=sortedList().map(p=>cardHTML(p)).join('');
}
function openList(name){
  currentListName=name;currentSort='popular';listSource=resolveList(name);
  document.querySelectorAll('#filterRow .chip').forEach((c,i)=>c.classList.toggle('on',i===0));
  paintList();showPage('listPage');closeMenu();
}
function sortList(el,key){
  document.querySelectorAll('#filterRow .chip').forEach(c=>c.classList.remove('on'));
  el.classList.add('on');currentSort=key;paintList();document.getElementById('scroll').scrollTop=0;
}

/* =========================================================
   8. 검색
   ========================================================= */
function doSearch(e){
  if(e&&e.preventDefault)e.preventDefault();
  const q=document.getElementById('searchInput').value.trim();
  if(!q){toast('검색어를 입력해 주세요');return false;}
  const res=PRODUCTS.filter(p=>p.name.includes(q)||p.sub.includes(q)||p.cat.includes(q)||(KW[p.sub]||'').includes(q.toLowerCase()));
  document.getElementById('srKeyword').textContent='"'+q+'"';
  if(res.length===0){
    document.getElementById('srCnt').textContent='';
    const g=document.getElementById('srGrid');
    if(g)g.outerHTML='<div class="sr-empty" id="srGridEmpty"><div class="ic">🔍</div><div style="margin-top:12px;font-size:14px">검색 결과가 없어요</div><div style="margin-top:6px;font-size:11px">다른 키워드로 검색해 보세요</div></div>';
  }else{
    const ge=document.getElementById('srGridEmpty');if(ge)ge.outerHTML='<div class="grid" id="srGrid"></div>';
    document.getElementById('srCnt').textContent='총 '+res.length+'개';
    document.getElementById('srGrid').innerHTML=res.map(p=>cardHTML(p)).join('');
  }
  showPage('searchResultPage');closeMenu();
  return false;
}

/* =========================================================
   9. 베스트
   ========================================================= */
function paintBest(el,cat){
  document.querySelectorAll('#bestFilter .chip').forEach(c=>c.classList.remove('on'));
  el.classList.add('on');paintBestList(cat);document.getElementById('scroll').scrollTop=0;
}
function paintBestList(cat){
  let arr=cat==='전체'?BEST:BEST.filter(p=>p.cat===cat);
  arr=arr.slice(0,30);
  document.getElementById('bestList').innerHTML=arr.map((p,i)=>{
    const rank=i+1;
    return `<div class="best-item" onclick="openDetail('${p.id}')">
      <div class="best-num ${rank<=3?'top':''}">${rank}</div>
      <div class="best-thumb"><div class="ph">ONDO</div>${imgTag(p,0)}
        ${p.soldOut?'<div class="soldout-cover"><span style="font-size:9px;padding:3px 7px">품절</span></div>':''}</div>
      <div class="best-info">
        <div class="bn">${p.name}</div>
        <div class="bp">${won(p.price)}</div>
        <div class="meta">★ ${p.rate} · 리뷰 ${p.reviewCount.toLocaleString()}</div>
      </div>
    </div>`;
  }).join('');
}

/* =========================================================
   10. 리뷰 (결정론적 · 부정 리뷰도 그대로 노출)
   ========================================================= */
const REV_POS=['핏이 편하고 예뻐서 자주 입어요.','소재가 생각보다 좋아요. 만족합니다.','배송이 빨랐고 포장도 깔끔했어요.',
 '기본템으로 딱이에요. 재구매 의사 있어요.','사진과 색감이 거의 같아요.','두께감이 적당해서 지금 입기 좋아요.',
 '박음질이 꼼꼼하고 마감이 좋네요.','175에 M 입었는데 잘 맞아요.','세탁 후에도 형태가 잘 유지돼요.',
 '데일리로 입기 좋은 무난한 디자인이에요.','색상 추가로 하나 더 살까 고민 중이에요.','선물했는데 반응이 좋았어요.',
 '가격 대비 퀄리티가 좋다고 느꼈어요.','부드럽고 안 비쳐서 좋아요.','오래 입어도 목이 안 늘어나요.'];
const REV_NEU=['무난해요. 기본에 충실한 느낌.','사이즈가 살짝 커요. 참고하세요.','색이 모니터보다 조금 연해요.',
 '배송은 보통이었어요.','생각보다 얇은데 여름엔 오히려 좋을 듯해요.','핏은 좋은데 저한테 기장이 조금 길어요.',
 '가격 생각하면 적당한 것 같아요.'];
const REV_NEG=['제 기대보다는 원단이 얇았어요.','사이즈가 안 맞아 교환했어요. 교환은 빨랐습니다.','색이 사진보다 어두워요.',
 '배송이 이틀 정도 늦었어요.','실밥 정리가 조금 아쉬웠어요.'];
const NICKS=['on','do','mj','sh','yn','hj','sw','km','lee','ph','tobi','warm','maru','dal','haru'];
function revStars(n){return '★★★★★☆☆☆☆☆'.slice(5-n,10-n);}
function genReviews(p,start,count){
  const out=[];
  for(let i=start;i<start+count;i++){
    const r=rng(p.id+'-rev-'+i);
    const base=parseFloat(p.rate);
    let star;const roll=r();
    if(base>=4.6)star=roll<0.74?5:roll<0.9?4:roll<0.96?3:roll<0.99?2:1;
    else if(base>=4.2)star=roll<0.55?5:roll<0.82?4:roll<0.93?3:roll<0.98?2:1;
    else star=roll<0.4?5:roll<0.68?4:roll<0.86?3:roll<0.95?2:1;
    let text;
    if(star>=4)text=pick(r,REV_POS);
    else if(star===3)text=pick(r,REV_NEU);
    else text=pick(r,REV_NEG);
    const nick=pick(r,NICKS)+'**'+Math.floor(r()*90+10);
    const daysAgo=1+Math.floor(r()*300);
    const help=Math.floor(r()*r()*90);
    const sizes=['S','M','L','XL'];
    const hasPhoto=r()<0.28;
    out.push({star,text,nick,daysAgo,help,size:pick(r,sizes),color:pick(r,COLOR),hasPhoto,seed:p.id+'-rp-'+i});
  }
  return out;
}
function reviewItemHTML(rv){
  let photos='';
  if(rv.hasPhoto){
    const n=1+(hashStr(rv.seed)%2);
    photos='<div class="r-photos">';
    for(let k=0;k<n;k++)photos+=`<div class="rp">${revShot(rv,k)}</div>`;
    photos+='</div>';
  }
  const dateTxt=rv.daysAgo<30?rv.daysAgo+'일 전':Math.floor(rv.daysAgo/30)+'개월 전';
  return `<div class="review">
    <div class="r-top"><span class="r-name">${rv.nick}</span><span class="r-meta">${dateTxt}</span></div>
    <div class="r-star">${revStars(rv.star)}</div>
    <div class="r-opt">옵션: ${rv.size} / ${rv.color}</div>
    <div class="r-text">${rv.text}</div>${photos}
    <div class="r-help">도움돼요 <b>${rv.help}</b></div>
  </div>`;
}
function reviewSummaryHTML(p){
  const base=parseFloat(p.rate);
  let d5,d4,d3,d2,d1;
  if(base>=4.6){d5=70;d4=18;d3=7;d2=3;d1=2;}
  else if(base>=4.2){d5=52;d4=28;d3=12;d2=5;d1=3;}
  else{d5=38;d4=27;d3=19;d2=9;d1=7;}
  const bars=[[5,d5],[4,d4],[3,d3],[2,d2],[1,d1]].map(([s,pct])=>
    `<div class="rev-bar"><span class="lbl">${s}점</span><span class="track"><i style="width:${pct}%"></i></span><span class="pct">${pct}%</span></div>`).join('');
  return `<div class="rev-summary">
    <div class="rev-score"><div class="big">${p.rate}</div><div class="st">★★★★★</div>
      <div class="cnt">리뷰 ${p.reviewCount.toLocaleString()}개</div></div>
    <div class="rev-bars">${bars}</div>
  </div>`;
}
let revState={pid:null,shown:0,sort:'recent'};
function paintReviews(reset){
  if(reset){revState.shown=0;document.getElementById('reviewList').innerHTML='';}
  const p=ALL[revState.pid];
  let batch=genReviews(p,revState.shown,8);
  if(revState.sort==='star')batch=batch.slice().sort((a,b)=>b.star-a.star);
  else if(revState.sort==='low')batch=batch.slice().sort((a,b)=>a.star-b.star);
  document.getElementById('reviewList').insertAdjacentHTML('beforeend',batch.map(reviewItemHTML).join(''));
  revState.shown+=8;
  const moreBtn=document.getElementById('revMoreBtn');
  if(moreBtn)moreBtn.textContent=`리뷰 더보기 (${Math.min(revState.shown,p.reviewCount).toLocaleString()} / ${p.reviewCount.toLocaleString()})`;
}
function revSort(el,key){
  document.querySelectorAll('.rev-sort .rs').forEach(s=>s.classList.remove('on'));
  el.classList.add('on');revState.sort=key;paintReviews(true);
}

/* =========================================================
   11. 상품 상세
   ========================================================= */
let currentDetailId=null;let detailImgIdx=0;
function openDetail(id){
  const p=ALL[id];if(!p)return;
  currentDetailId=id;detailImgIdx=0;
  revState={pid:id,shown:0,sort:'recent'};
  const sizes=['S','M','L','XL'];
  const wished=wishlist.has(id);
  const imgs=[0,1,2].map(i=>imgTag(p,i)).join('');
  const rr=rng(p.id+'-info');
  const care=pick(rr,['단독 찬물 세탁을 권장해요','30도 이하 중성세제 세탁을 권장해요','드라이클리닝을 권장해요']);
  const madeIn=pick(rr,['한국','베트남','인도네시아']);
  document.getElementById('detailScroll').innerHTML=`
    <div class="detail-imgwrap">
      <div class="ph">ONDO</div>
      <div class="detail-imgtrack" id="detailImgTrack">${imgs}</div>
      <button class="wish-fab ${wished?'on':''}" id="wishFab" onclick="toggleWish('${id}')">${wished?'♥':'♡'}</button>
      <div class="detail-dots" id="detailImgDots"></div>
      ${p.soldOut?'<div class="soldout-cover"><span>일시 품절</span></div>':''}
    </div>
    <div class="detail-body">
      <div class="d-brand">ONDO BASIC · ${p.sub}</div>
      <div class="d-name">${p.name}</div>
      <div class="d-stars" onclick="scrollToReviews()">★ ${p.rate} <span>· 리뷰 ${p.reviewCount.toLocaleString()}개 보기 ›</span></div>
      <div class="d-price">${won(p.price)}</div>

      <div class="d-ship-card">
        🚚 <b>배송</b> · 오후 3시 이전 주문 시 당일 출고 (평균 1~2일 소요)<br>
        📦 <b>배송비</b> · 3만원 이상 무료 / 미만 3,000원<br>
        ↩️ <b>교환/반품</b> · 수령 후 14일 이내 무료
      </div>

      <div class="d-section-t">사이즈 선택 <span class="sub">상세 사이즈는 아래 표 참고</span></div>
      <div class="opt-row" id="sizeOpts">
        ${sizes.map((s,i)=>{const dis=p.soldOut||(rng(p.id+s)()<0.15);
          return `<div class="opt ${i===1&&!dis?'on':''} ${dis?'dis':''}" ${dis?'':`onclick="pickOpt(this,'sizeOpts')"`}>${s}${dis?' (품절)':''}</div>`;}).join('')}
      </div>

      <div class="d-section-t">상품 정보</div>
      <div class="d-info-tbl">
        <b>소재</b> ${p.name.split(' ')[0]} 혼방<br>
        <b>제조국</b> ${madeIn}<br>
        <b>세탁</b> ${care}<br>
        <b>모델</b> 175cm · M 사이즈 착용
      </div>

      <div class="d-section-t" id="reviewAnchor">리뷰 <span class="sub">${p.reviewCount.toLocaleString()}개 · 평점 ${p.rate}</span></div>
      ${reviewSummaryHTML(p)}
      <div class="rev-sort">
        <div class="rs on" onclick="revSort(this,'recent')">최신순</div>
        <div class="rs" onclick="revSort(this,'star')">별점 높은순</div>
        <div class="rs" onclick="revSort(this,'low')">별점 낮은순</div>
      </div>
      <div id="reviewList"></div>
      <button class="rev-more" id="revMoreBtn" onclick="paintReviews(false)">리뷰 더보기</button>

      <div class="d-section-t" style="margin-top:28px">함께 본 상품</div>
      <div class="h-scroll">${relatedProducts(p).map(x=>cardHTML(x)).join('')}</div>
      <div style="height:30px"></div>
    </div>`;
  document.getElementById('buyBar').innerHTML=`
    <button class="bb-like ${wished?'on':''}" id="bbLike" onclick="toggleWish('${id}')">${wished?'♥':'♡'}</button>
    <button class="bb-cart" onclick="${p.soldOut?`notifyRestock('${id}')`:'addToCart()'}">${p.soldOut?'재입고 알림':'장바구니'}</button>
    <button class="bb-buy ${p.soldOut?'soldout':''}" onclick="${p.soldOut?`notifyRestock('${id}')`:'buyNow()'}">${p.soldOut?'일시 품절':'구매하기'}</button>`;
  showPage('detailPage');closeMenu();
  buildImgDots();
  paintReviews(true);
}
function relatedProducts(p){return PRODUCTS.filter(x=>x.cat===p.cat&&x.id!==p.id).slice(0,6);}
function pickOpt(el,group){
  document.getElementById(group).querySelectorAll('.opt').forEach(o=>o.classList.remove('on'));
  el.classList.add('on');
}
function scrollToReviews(){document.getElementById('reviewAnchor').scrollIntoView({behavior:'smooth'});}
function notifyRestock(id){toast('재입고되면 알림을 보내드릴게요 🔔');}
function buildImgDots(){
  document.getElementById('detailImgDots').innerHTML=[0,1,2].map(i=>`<div class="dot ${i===0?'on':''}"></div>`).join('');
}
document.addEventListener('click',function(e){
  if(e.target&&e.target.closest&&e.target.closest('.detail-imgtrack')){
    detailImgIdx=(detailImgIdx+1)%3;
    document.getElementById('detailImgTrack').style.transform=`translateX(-${detailImgIdx*100}%)`;
    document.querySelectorAll('#detailImgDots .dot').forEach((d,k)=>d.classList.toggle('on',k===detailImgIdx));
  }
});

/* =========================================================
   12. 찜
   ========================================================= */
const wishlist=new Set();
function updateWishNum(){const el=document.getElementById('myWishNum');if(el)el.textContent=wishlist.size;}
function toggleWish(id){
  if(wishlist.has(id)){wishlist.delete(id);toast('찜을 해제했어요');}
  else{wishlist.add(id);toast('찜 목록에 담았어요 ♥');}
  const on=wishlist.has(id);
  const fab=document.getElementById('wishFab');if(fab){fab.classList.toggle('on',on);fab.textContent=on?'♥':'♡';}
  const bb=document.getElementById('bbLike');if(bb){bb.classList.toggle('on',on);bb.textContent=on?'♥':'♡';}
  updateWishNum();
}
function showWishInfo(){
  toast(wishlist.size===0?'아직 찜한 상품이 없어요':'찜한 상품이 '+wishlist.size+'개 있어요');
}

/* =========================================================
   13. 장바구니 (빈 상태로 시작 · 몰래 담기 없음)
   ========================================================= */
let cart=[];
function cartTotalQty(){return cart.reduce((a,c)=>a+c.qty,0);}
function updateBadge(){
  const b=document.getElementById('cartBadge');const q=cartTotalQty();
  b.textContent=q;b.classList.toggle('on',q>0);
}
function renderCart(){
  if(cart.length===0){
    document.getElementById('cartBody').innerHTML=`<div style="text-align:center;padding:80px 20px;color:var(--dim)">
      <div style="font-size:42px">🛍</div><div style="margin-top:14px;font-size:14px">장바구니가 비어 있어요</div>
      <button class="chip on" style="margin-top:18px;padding:10px 20px;border-radius:8px" onclick="goHome()">쇼핑하러 가기</button></div>`;
    return;
  }
  let sum=0;
  const rows=cart.map((it,idx)=>{
    const p=ALL[it.id];if(!p)return '';
    sum+=p.price*it.qty;
    return `<div class="cart-item">
      <div class="ci-thumb" onclick="openDetail('${p.id}')"><div class="ph">ONDO</div>${imgTag(p,0)}</div>
      <div class="ci-info">
        <div class="ci-name">${p.name}</div>
        <div class="ci-opt">옵션: ${it.size}</div>
        <div class="ci-price">${won(p.price*it.qty)}</div>
        <div class="qty"><button onclick="changeQty(${idx},-1)">−</button><span>${it.qty}</span><button onclick="changeQty(${idx},1)">+</button></div>
      </div>
      <button class="ci-del" onclick="removeFromCart(${idx})">✕</button>
    </div>`;
  }).join('');
  const ship=sum>=30000?0:3000;
  let discount=0,couponLabel='미적용';
  if(appliedCoupon){
    const c=COUPONS.find(x=>x.id===appliedCoupon);
    if(c){const calc=couponDiscount(c,sum,ship);discount=calc.amount;couponLabel=calc.label;}
  }
  document.getElementById('cartBody').innerHTML=`
    <div class="cart-count-line">담은 상품 <b>${cart.length}</b>개</div>
    ${rows}
    <div class="consent-box">
      <div class="consent-row" onclick="toggleConsent(this)"><div class="cbox"></div>
        <div class="c-txt"><b>[선택] 신상품·이벤트 소식 받기</b><div class="c-sub">이메일로 월 1~2회 · 언제든 해지 가능</div></div></div>
    </div>
    <div class="pay-coupon">
      <select id="couponSelect" onchange="applyCouponFromCart()">
        <option value="">쿠폰 선택 (보유 ${ownedCoupons.size}장)</option>
        ${[...ownedCoupons].map(cid=>{const c=COUPONS.find(x=>x.id===cid);return c?`<option value="${cid}" ${appliedCoupon===cid?'selected':''}>${c.title} — ${c.condText}</option>`:'';}).join('')}
      </select>
    </div>
    <div class="pay-sum">
      <div class="pay-line"><span>상품 금액</span><span>${won(sum)}</span></div>
      <div class="pay-line"><span>배송비 (3만원 이상 무료)</span><span>${ship===0?'무료':won(ship)}</span></div>
      <div class="pay-line"><span>쿠폰 할인 (${couponLabel})</span><span>−${won(discount)}</span></div>
      <div class="pay-line total"><span>총 결제금액</span><span>${won(Math.max(0,sum+ship-discount))}</span></div>
    </div>
    <button class="pay-btn" onclick="goSurvey()">${won(Math.max(0,sum+ship-discount))} 결제하기</button>
    <div class="pay-note">※ 실제 구매는 없으며, 결제하기를 누르면 구글폼 링크로 이동됩니다.</div>
    <button class="pay-cancel" onclick="goHome()">쇼핑 계속하기</button>
    <div style="height:24px"></div>`;
}
function changeQty(idx,delta){if(!cart[idx])return;cart[idx].qty+=delta;if(cart[idx].qty<1)cart[idx].qty=1;renderCart();updateBadge();}
function removeFromCart(idx){cart.splice(idx,1);renderCart();updateBadge();toast('상품을 삭제했어요');}
function addToCart(){
  if(!currentDetailId)return;const p=ALL[currentDetailId];
  if(p.soldOut){notifyRestock(p.id);return;}
  const size=document.querySelector('#sizeOpts .opt.on');const sz=size?size.textContent:'M';
  const ex=cart.find(c=>c.id===currentDetailId&&c.size===sz);
  if(ex){ex.qty++;toast('수량을 1개 추가했어요');}else{cart.push({id:currentDetailId,size:sz,qty:1});toast('장바구니에 담았어요');}
  updateBadge();
}
function buyNow(){addToCart();goPage('cartPage');}
function quickAdd(ev,id){
  ev.stopPropagation();const p=ALL[id];if(p.soldOut){toast('일시 품절된 상품이에요');return;}
  const ex=cart.find(c=>c.id===id&&c.size==='M');if(ex)ex.qty++;else cart.push({id:id,size:'M',qty:1});
  updateBadge();toast('장바구니에 담았어요');
}
function toggleConsent(row){
  const box=row.querySelector('.cbox');
  if(box.classList.contains('checked')){box.classList.remove('checked');box.textContent='';}
  else{box.classList.add('checked');box.textContent='✓';}
}
function applyCouponFromCart(){
  const v=document.getElementById('couponSelect').value;
  appliedCoupon=v||null;renderCart();
  if(v)toast('쿠폰을 적용했어요');
}
function cartSum(){return cart.reduce((a,it)=>{const p=ALL[it.id];return a+p.price*it.qty;},0);}
function goSurvey(){window.open('https://forms.gle/NBh5zM6a4UdHjxH87','_blank');}

/* =========================================================
   14. 쿠폰 (조건을 앞면에 그대로 표기 · 함정 없음)
   ========================================================= */
const COUPONS=[
  {id:'welcome2000',type:'won',amount:2000,title:'신규가입 2,000원 할인',cond:0,condText:'최소 주문금액 없음',exp:'발급일로부터 30일'},
  {id:'first5',type:'rate',amount:5,title:'첫 구매 5% 할인',cond:0,cap:5000,condText:'최대 5,000원 할인',exp:'발급일로부터 14일'},
  {id:'ship3000',type:'ship',amount:3000,title:'배송비 지원 쿠폰',cond:0,condText:'3만원 미만 주문의 배송비(3,000원)를 지원',exp:'발급일로부터 14일'}
];
const ownedCoupons=new Set(['welcome2000']);
let appliedCoupon=null;
function updateCouponNum(){const el=document.getElementById('myCouponNum');if(el)el.textContent=ownedCoupons.size;}
function couponDiscount(c,sum,ship){
  if(!c)return{amount:0,label:'미적용'};
  if(c.type==='ship'){
    if(ship>0)return{amount:ship,label:'배송비 지원'};
    return{amount:0,label:'배송비가 이미 무료예요'};
  }
  let amt=c.type==='won'?c.amount:Math.floor(sum*c.amount/100);
  if(c.cap)amt=Math.min(amt,c.cap);
  amt=Math.min(amt,sum);
  return{amount:amt,label:c.type==='won'?won(c.amount)+' 할인':c.amount+'% 할인'};
}
function couponCardHTML(c){
  const owned=ownedCoupons.has(c.id);
  const left=c.type==='won'?`<div class="amt">${(c.amount/1000)}K</div><div class="lbl">원 할인</div>`
    :c.type==='ship'?`<div class="amt">📦</div><div class="lbl">배송비</div>`
    :`<div class="amt">${c.amount}%</div><div class="lbl">할인</div>`;
  return `<div class="coupon">
    <div class="cv">${left}</div>
    <div class="cb"><div class="ct">${c.title}</div>
      <div class="cc">${c.condText}</div>
      <div class="ce">유효기간 · ${c.exp}</div></div>
    <button class="cget ${owned?'done':''}" onclick="getCoupon('${c.id}')">${owned?'보유중':'받기'}</button>
  </div>`;
}
function renderCoupons(){
  const owned=COUPONS.filter(c=>ownedCoupons.has(c.id));
  const avail=COUPONS.filter(c=>!ownedCoupons.has(c.id));
  document.getElementById('couponBody').innerHTML=`
    <div class="cp-head"><h2>쿠폰함</h2><p>보유 ${ownedCoupons.size}장 · 받을 수 있는 쿠폰 ${avail.length}장 · 모든 조건은 쿠폰에 그대로 적혀 있어요</p></div>
    <div class="cp-sec-t">보유 쿠폰 <span class="sub">결제 시 선택 적용</span></div>
    ${owned.map(couponCardHTML).join('')||'<div style="color:var(--dim);font-size:12px;padding:10px 0">보유 쿠폰이 없어요</div>'}
    <div class="cp-sec-t">받을 수 있는 쿠폰</div>
    ${avail.map(couponCardHTML).join('')||'<div style="color:var(--dim);font-size:12px;padding:10px 0">받을 수 있는 쿠폰을 모두 받았어요</div>'}
    <div style="height:24px"></div>`;
}
function getCoupon(id){
  if(ownedCoupons.has(id)){toast('이미 보유한 쿠폰이에요');return;}
  ownedCoupons.add(id);renderCoupons();updateCouponNum();toast('쿠폰이 발급되었어요');
}

/* =========================================================
   15. 토스트 / 배너 / 시작 흐름
   ========================================================= */
let toastTimer;
function toast(msg){const t=document.getElementById('toast');t.textContent=msg;t.classList.add('show');
  clearTimeout(toastTimer);toastTimer=setTimeout(()=>t.classList.remove('show'),2200);}

let bannerIdx=0;const BANNER_N=3;
function buildBannerDots(){document.getElementById('bannerDots').innerHTML=
  Array.from({length:BANNER_N},(_,i)=>`<div class="dot ${i===0?'on':''}"></div>`).join('');}
function moveBanner(i){bannerIdx=(i+BANNER_N)%BANNER_N;
  document.getElementById('bannerTrack').style.transform=`translateX(-${bannerIdx*100}%)`;
  document.querySelectorAll('#bannerDots .dot').forEach((d,k)=>d.classList.toggle('on',k===bannerIdx));}
setInterval(()=>moveBanner(bannerIdx+1),4200);

window.addEventListener('load',()=>{
  renderHome();renderCats();buildBannerDots();updateBadge();updateWishNum();updateCouponNum();
  setTimeout(()=>document.getElementById('cookieBanner').classList.add('show'),600);
});
function cookieChoice(accepted){
  document.getElementById('cookieBanner').classList.remove('show');
  toast(accepted?'쿠키 사용에 동의했어요':'쿠키를 사용하지 않아요 · 모든 기능은 그대로예요');
}
</script>
</body>
</html>
