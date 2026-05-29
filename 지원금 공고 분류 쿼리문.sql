show tables;

select * from raw_announcements
order by start_date DESC;

select * from announcements;

# announcements 테이블 전체 행 개수 확인 -> 380개 + 33개 (pdf 중앙부처 지원금 추출)
SELECT COUNT(*)
FROM announcements;

# 업력 3년 미만 & 개인 창업자 대상
# SELECT COUNT(*) AS total_count
SELECT *
FROM announcements
WHERE status = 'ongoing'
  AND biz_enyy NOT IN (
    '3년미만,5년미만,7년미만,10년미만',
    '5년미만',
    '5년미만,7년미만',
    '5년미만,7년미만,10년미만',
    '7년미만',
    '7년미만,10년미만',
    '10년미만'
)
  AND target NOT IN (
  '일반기업', 
  '대학생,대학', 
  '대학,연구기관,일반기업', 
  '청소년,대학생'
  )
  
  AND support_field NOT IN (
    '판로ㆍ해외진출',
    '글로벌',
    '기술개발(R&amp;D)'
)
  
  AND title NOT REGEXP CONCAT(
    '이론|수요조사|Forbes|International Students|투자사|전문가 양성 교육|인증 지원 패키지|바이오허브|바이오헬스케어|바이오 스타트업|',
    'Investment|에트리홀딩스|비대면 교육|바이브코딩|Korea Investment|멘탈관리|PoC|화요IR|인디게임|전문교육|OpenData|벤처확인|',
    '기술 고도화|크리에이터|(Pre-)Startups|홍보|의료협력 포럼|중소기업|글로벌|공공데이터·AI 활용 창업경진대회|KSGC|',
    '제품개발|중견기업|벤처기업|IR|제대군인|여성CEO|IP나래프로그램|디캠프|MVP 개발|NextONE'
)
  
ORDER BY target DESC;