Mesh 공유기 장비 구성 시 공통 고려사항

mesh agent 공유기는 wan port가 아닌, 모두 lan port에 연결해야 함
(사례: 2021.08.10 25hotel 통신사를 skb에서 kt로 변경 시, kt작업자의 실수로 mesh agent 공유기를 lan port가 아닌 wan port에 연결하여 IoT망 불능 현상 발생)

계획 및 설정된 network 장비 외에 다른 장비를 추가할 경우, 이력과 근거를 남겨두어야 하며, 작업내용(할당IP, 장비설치위치, 장비MAC-ADDRESS 등)을 기록
(사례1: 2021.08.12 사전 망 구성에 존재하지 않은 wifi extender가 혼용되어 mesh network가 연결 불량하였음)
(사례2: 2021.08.12 음영지역 해소용으로 설치한 mesh agent 공유기가, 실제로는 과거 mesh controller 역할을 수행하던 기기로 초기화되지 않은채 IoT망에 혼용되어 mesh network 불량, 원인식별 및 조치까지 4시간으로 상당한 시간이 소요되었음)

기존 설치된 유선랜을 사용할 경우, 정상동작하지 않는 회선(단선)이 존재할 수 있으므로, 반드시 랜선테스터기를 이용하여 network 테스트


Mesh 공유기 장비 추가 설치 시 고려사항

신품 장비를 설치하지 않고 기존 장비를 재활용하는 경우, 초기화 또는 설정값 저장 상태 반드시 확인


Mesh 공유기 장비 철거 시 고려사항

사용하지 않는 모든 장비는 reset 버튼이나 관리자페이지의 초기화 기능을 이용하여 항상 공장초기화된 상태로 유지
