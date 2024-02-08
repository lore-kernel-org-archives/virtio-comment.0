Return-Path: <virtio-comment-return-9091-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0A2C4828F
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 2860E2B065
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:15 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 041DA9868EF
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Feb 2024 11:56:15 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id DC6ED9841A5; Thu,  8 Feb 2024 11:56:14 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CBD929868E6
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Feb 2024 11:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1707393370.544000
X-TM-MAIL-UUID: 1288676d-1052-485e-a2a0-ad15247a37d8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V5B4So3BT9krLMY8VChqDkNqd7wxMcEBumJASPZotJ/2Q1moTsbMetGmfhE11nO5+2dbToiUxA7QiTfecg6+I/iVTLToNqrcTq0Oa7koIGOPDfCOEwFxNTC3NE3oScTwy7SOphDtgtpmuvFrMsopqEzcB6ok1V6R2oenSNIV11bIo4y8G54bl8gDfZBJHHADu9pSHhlidT2YVt20Uf0kTzHdE2vErRrHhywxrvov6VyUBlMTixcmUjntrNek54k6taxXhIHjFshApIrzWLUs+FazD/qp64NWzPc6wZBHqkUg72PMVfLavG7kpbD/fSOBo1VL+ocNdIdxc64FmK8EXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCwDqcjdNdc+j3UUA1/gCNRl+iI0t0eLQVWBr1xNiiE=;
 b=JovlnhQqzWXdGYUU/HUnyf/O3HFs2wcdQIqj9jiiLaAA8B2HWdhMO2xhZpE7LkZJsidyEG7LVNnnq4ghOPLCBto3fMnFoBEyDN3BD4G24HyhCTYrGizAfjpdxDHg4hfwVrCkumZBuXDv198J0HNneGu45JmgzP+f0TelXdiFQEWWWehnDy7n5j36vTlWWmqFQtBCLw277V92iCQofsPL8sMQI34FQXfLT3JaiypUmeOLfG2kiACgmHDnrC+2uJmJ/qMt+cfWOXcXlvhhSlAbGcEMNKwBhhFVpBoKcpCW5fCkuQUNFw5K7ygITFibMybcITuFs2EZXQAbhlAtgB3Blw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.66.60.4) smtp.rcpttodomain=lists.oasis-open.org
 smtp.mailfrom=opensynergy.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=opensynergy.com; dkim=none (message not signed);
 arc=none (0)
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.66.60.4)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=opensynergy.com;
Received-SPF: Pass (protection.outlook.com: domain of opensynergy.com
 designates 217.66.60.4 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.66.60.4; helo=SR-MAIL-03.open-synergy.com; pr=C
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.oasis-open.org
Cc: Peter Hilber <peter.hilber@opensynergy.com>
Date: Thu,  8 Feb 2024 12:55:43 +0100
Message-Id: <20240208115545.30102-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|BEXP281MB0246:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4934921e-d5ba-455a-d3fb-08dc289cf040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Tdl8KaO8cSun/xTrRH4eIEsRlAEfwaKqWu5MAo81aprVDESyahuTn75ZvxzemWl6NFLkf+ZjTViMDRzPckuvWXxgV+Z96A6p3Sp+9BIxlWuYSwlJfeW59SkA85RpMwzbdnHbRe3oJ4WpP3+Jjk0lhZhMXAgjQM7Qmp1f6PC0Z8nmGofHBZ0Ch2hfG7tu2IbNRSEIDtEej7DzKKa4xcQP+NVE1qV74eTzxedyV095LuiFLrUYwYWs8YVz6NQi6XL6WIeV0+DCqtsDUBao48+TWVvDAi0fAZPLEd7LGK2aRiq7WdohdoUBq3k8Wns4RY1cRLzcEBehNqmJ+pTOOpcbT+2da1tg66iIEUFit6Si5lZ9LD+P8mMQCGWYTTxEUQKgeqPq+17zMEgjAxuW6eYjpyt8heWFoKPjt7MAR/vBL9QZpW79AKo9U2ZDqgEDJeP9ktoLujVzT7lASAu6XhKDXQY5isD1LNsWsnSFkrFUjvsatjZyPCYq1UQuB85vKeM94kxidNdTRMphM6Gtm86Hf3BvGFgQXDrpM33vKpgghVS4lcjk3FegurmIo/X1KbGKdRi9qpPPBU7P37ObVh0o3qbKX6JtrVJOVtAipj/gHwU=
X-Forefront-Antispam-Report:
	CIP:217.66.60.4;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(39840400004)(346002)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(36840700001)(46966006)(83380400001)(81166007)(86362001)(6916009)(478600001)(26005)(1076003)(316002)(42186006)(2616005)(70206006)(107886003)(336012)(70586007)(36756003)(8936002)(8676002)(4326008)(41300700001)(44832011)(5660300002)(2906002)(4744005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 11:56:08.9776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4934921e-d5ba-455a-d3fb-08dc289cf040
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[217.66.60.4];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEXP281MB0246
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28178.004
X-TMASE-Result: 11-5.958800-4.000000
X-TMASE-MatchedRID: BLb+Xlu1owXMuRev46IJiJtnlFv6A7oh7gd5SqHIhjLGhmdxjnivFovU
	oD2P70hFAS8NdsxaVhArHRr0GU9z9sddJPEKsqAMqolsh7l9ctCjg0lrtKMWyuoHyrQO2IZa7Zs
	hL8cAuWRScSv/IJHGc40dfLxtv7TUSJBI9n9la6FaOxpgjiWHdQ9dk+6tnSFL3bW12Y3cOXPfyf
	2EECL1+repPr4EL4thBzauqpQvm0g=
X-TMASE-XGENCLOUD: 9ebbb65f-aff5-454d-9309-a96ea1418ae4-0-0-200-0
X-TM-Deliver-Signature: F033465290F32A3DC5DAFD13C592ADF2
X-TM-Addin-Auth: FIntve/bXcHHNcoMlo2kbPuRUEpyWjq8449OZktm9RcBe9poYn+TgnccrIL
	6MwUFMax7BzburjGPg44ysA1+4qi0PIVzsJQ+z9oHdQDD4a4Wz22565A0qduh2bebduTSVOc+rU
	ztyfvNFAzYEZfXnrzpRtRhQSjoFjdEzHItbIgLyfGshhTlisB3DQ6RBbSVFB3dbZ1L8MjOKLOex
	UcpgRuij4pt2G1ulLomVD4430RER5bVCtIKAOf4KOcYbv0Af3MScdrQqpzUV6k55kvrFhkt+1Zx
	ISJ+uS68XU9FJ14=.j3qWVZEhNZnRm24LU+5aEq1chRFn0rlRQ6DCpk5j8TaBFM/5jGDA9X+P+V
	YfwSGfuej/yzIIDQVppMe3QnbP38W+D7ikAL2C1lnMh/W4RchBQjxOU4A6OU1WA/45uq/fTMXAd
	HVQ6BycSbIQSqy/5wjRI11O7/Er2QnKCl2OL29ljIdoXTDhkU/gipJZvRYt3oygxe71T+02FhI1
	gy/Ndv/rvoYmwcvr+O2mBmqWUoJTdmsDs0115CbHVUPDE8LX5krMpYLqmo1mIA2uEibzwZ4GU2w
	LgtO8mtbozOxq9zu7/X+09M6wooKHKh6MT8TEFgTMS5UbfXvf9rPYYq81AA==
X-TM-Addin-ProductCode: EMS
Subject: [virtio-comment] [PATCH 0/2] admin: Fix requirements wording inconsistencies

I stumbled over some inconsistencies in the administration virtqueue
requirements wording. These patches should fix them.

I think they could be considered editorial fixes.

Peter Hilber (2):
  admin: Refer to processing order as "limited" rather than none
  admin: Fix driver requirement subject

 admin.tex | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.40.1


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

