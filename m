Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151EC18E2A
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397291; cv=fail; b=h/doxHsE1aMObNZxHePtFp+U0kJfZEl6o5WvSGvQHBMf+4ElsPFzCk9RHo119MgXmubFZz4iRPq7aIf1X6Ij7uT8xfOhkkYM9N4h+PPbknj/EbaASwrnBA6aaTyZ1sLC906fvxuuOEuVbaMKvhz3udqPWMsaFYU6follo4RMQdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397291; c=relaxed/simple;
	bh=q1FTFC05qxhE3FIhMlR8ZgjjpX+LQ65g/OqgqSYLUbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jpv7pPZVTEZjLuQXd9UxvMn6QK8MOWMxUw3F62TR4YEoJ2QIGaakmZf7uUeyV6HBItl2jJbod53856gqaYLGLL6RdCtF45iHo/PZazhyg/5q4SUwcXHi5vXh3xmEoeDBp0BuCwDiWHbMY2jfPIG1cE2ZfcHLaa2WRRyrOCUCaKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=iZKqBA47; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="iZKqBA47"
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.10.52])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 573A61004B113
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:21 +0000 (UTC)
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 6ADBC10001756;
	Wed, 22 May 2024 17:01:14 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397273.041000
X-TM-MAIL-UUID: 625b6ba0-675f-4662-95fa-b9e69b59b9f0
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 0A55B10000E26;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c402tXrkY4Wqfa8wGYkoV45+oa6evAiCqnrmBz1LirR1ePGC24j2Lau/YwyF9SKXvgeMfMs5tPFcOLBYU1TVE1o05hUFeMyNaYYFu+8GCHstMJpo/3LlCfyD4U98Xjf+AFr2/Y5m8Wz8mr2S1zPRDSxyvgelwdD2auSOjRUbwcnzXcV1vDKmQOHYs+QPMGi7xAq16ymHpdqM4ZkWUWjuMA3CKVYVuFBF47jM7DOxDzt/HKTygpF8ier+m30/N72p6kyR40rt3MkNiUfdE+CIZO0cY9X3vtF6W5TZMT1HlZsX1h2DvAOSL9F4Miwugnpb0H7HHDoH/95OkSiC8yGNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xgENfWS3xVhYNLioZoUpblm3lrwxRun9ClkZQUROZ84=;
 b=R4lAr+R4LM5z7MZn+x7CbuSMoWHUB69VdP57tQAFPJy/1GRnnPoBjjwrUZ6aoRq+Z6z7JRciAsG9YmISSVR+GfR9SK3Cwv3vaZid2Er3BGI1osJ8kr616AAjoeCA/B3n8C3SkEj2Okku/fdpIhGD754W0vAnqY5Jgzg4pyvrOanGEP1uW2SNvPx2GvcSraTqFYtGktCxHV780hnqj3kKmVch675SzkMmP1ynS2be7iwd1WPdx67Ev/Ew6HFMzj/LSxbCHefU4lNioS3ad67SvcxLGzoxPfh1rPdFFeziQhZcR0CLTULUy5r+euwvEhms0qAQ28AB4GkwvV6Sqhg86Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 213.61.166.92) smtp.rcpttodomain=amazon.com smtp.mailfrom=opensynergy.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensynergy.com; dkim=none (message not signed); arc=none (0)
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 213.61.166.92)
 smtp.mailfrom=opensynergy.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensynergy.com;
Received-SPF: Fail (protection.outlook.com: domain of opensynergy.com does not
 designate 213.61.166.92 as permitted sender) receiver=protection.outlook.com;
 client-ip=213.61.166.92; helo=SR-MAIL-03.open-synergy.com;
From: Peter Hilber <peter.hilber@opensynergy.com>
To: virtio-comment@lists.linux.dev
Cc: Peter Hilber <peter.hilber@opensynergy.com>,
	Cornelia Huck <cohuck@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Jason Wang <jasowang@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>
Subject: [RFC PATCH v4 1/5] virtio-rtc: Add initial device specification
Date: Wed, 22 May 2024 18:59:59 +0200
Message-ID: <20240522170003.52565-2-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522170003.52565-1-peter.hilber@opensynergy.com>
References: <20240522170003.52565-1-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|FRYP281MB1995:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5c133497-95bd-4c84-b31a-08dc7a80c818
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dovOECWMYWsC6nBgiE1P2lAi58Bcy9RGmuQoX/+PErhYI40rd4wG6QOx32j+?=
 =?us-ascii?Q?9jj0vhlsG5t5+RZ/NfzG1KFe8ehNEs1KcLxjmyETflaCbICvbVEQ7aIlj+si?=
 =?us-ascii?Q?C+LaoRTO22NTUUmcWfhqqOak2VtbMWAR+EglxTvM6rZUVD68Np6VbBiRbvii?=
 =?us-ascii?Q?C/ThS792FEj6xzXLPSbBCOcsqYptuSS+nrhWYTcPnlDyYxG1fbwXMjeK1q5G?=
 =?us-ascii?Q?Zmgfp8+X8Vnyu0aFTIGMRW4AMM3dRECYue5NOlfHky7DsHK3jOBtEfTroD2E?=
 =?us-ascii?Q?m2LoxzH+dNY6UjpBPz7gMTsjoOCbMu6M3PJtkYH028CH/sN6pX0nd43eifik?=
 =?us-ascii?Q?WkP0vxqGFsxFarE2cCn1QQNGVYa5pGlYojt71m8Wbb5Q6ntdfruSebgB3zhq?=
 =?us-ascii?Q?X0AKZ6RGSSbatDANPdiWXP7sD1r5G/+Ztk/mT5PpIw0/fxJLRbw4MaD+fbCb?=
 =?us-ascii?Q?df9MKi/PprVoeSrZ4+EJMPBGgs8UhNx6/VIcLIQA9tYa6sgNiYTUL0RHsnD7?=
 =?us-ascii?Q?AZ0CRHiGq/iB+HA7tqTUZJLoQktKDiVqEd2EoZ5v0FWbuYxl5P0+5ffDmyqY?=
 =?us-ascii?Q?oO2FKizkQdShxhGXYVuZzEZiOawvrGl7DhPgW86i2vd8iHSZlr9sbtTk0OXm?=
 =?us-ascii?Q?n3m5uztLskEQ3Xc1bKHLQ1qcdnECJ3tPE1iC2TKbPLri0zgt/UCyrlraMHGi?=
 =?us-ascii?Q?NYD73mYmZfDhjoHAxq34fCACxaMzQjMc/BrjFPkxWUri6z/+EbsNR9W3nf4h?=
 =?us-ascii?Q?4siyIZy6iEZdF7ltNe0XS07XdwiNGJt/mFJ/nHlbqOADBYg5GQyNWypxNZJD?=
 =?us-ascii?Q?NUIIryA+5VcXxrexLlTGy7hjede+L6gWVE2BnhypJa4rzD9GIjqckYKXaRGZ?=
 =?us-ascii?Q?LNq/VPI3LTurMbU2QMYdvNbDZDe4q8kntjfRUik42rkvKOLWixN/09XHevoy?=
 =?us-ascii?Q?IeRo737VApk7Xq5uHR8JP2NH/ekcQZT32h1W+ncGTcQEBWhN99uR3+8HZMTY?=
 =?us-ascii?Q?6EemoNyjUlyXenpaqzRU6gpHVTowREZbJpDtBIxxI3szxhb06jjyIcT1DAjT?=
 =?us-ascii?Q?CKlTmhSEDZwmqPHZvaF9L9sQ4775mfSi1ncyaFs1pRqld5c1UxbnSwfIcTcU?=
 =?us-ascii?Q?cZ8k/7lNAq77EeKrJ/Z1C3rF+TeSw9QDnguCMGoxWkOImJ1zG9wIBjuwvMTT?=
 =?us-ascii?Q?e6vl6EW093EPpriRH/aUt+DLkG2rM9Bg+RLLo9JnPa99QkrI8rEfqVNqU5Sb?=
 =?us-ascii?Q?PBlbbs4LMnmnSPRJFZi4tebrHLrn3F3dhfQfS+gIMpfXaf8DaHfHXSeBd9Nh?=
 =?us-ascii?Q?6L4OZdPZw4wAvEMfByOc7XQD?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.0450
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c133497-95bd-4c84-b31a-08dc7a80c818
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRYP281MB1995
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--26.717300-4.000000
X-TMASE-MatchedRID: CtIu++P39qeUP+0hdpOx0niXIXWXK9Stp9ot5GYsw7GeMzVLMVFcn5mg
	kd7c0mklpGka8rXGZVHnuNpAFn1JUhGEdmQyXwhD39nur6FlBV6VmuhG06IIbWoAqs9eawOAo2g
	J/wTTTH6MX4LEevtc2a4Zl3X6PuRRvqf0bJuvHMnSlRrVG2nKg+A4l73CwysLWd61rS7VIuYWSr
	9Uu531apwA+MSiL0bIC+FYpHLvZrwLewbqZQMkX1rnBGaGznk0N9OHqCW0zdEHCqrU0jFaDUgQy
	D+ZV6wvJEX5DypH1Pw4UJVV1Ve6PmoKvIUVkiAtTpEWRUqZYNvupNmDvOmeFddJXjU/xdoW6/rP
	RwScdR0MkbHh8hhHALHp+ukkV/8w09nYz+wyqA5Fg2HO5lmNENn8igpgGhRW4OwVuURzfheOGNV
	jxUE27ltzIOiRIwELISNWFzZ4YFNwEQZMh+GAACW3PYfrvJdYEdHOXagG0U94MCaOUDLFfR5jWX
	/FKM+tOO7IqeabGAJc5csOpEK3pz/yi555eQTWCI8Pr2jKCJsnfL6KqKSjb5rRt2Cq27mEk+Kg3
	fY1JmwroXQRo9D5gp97r0Q4MDE6T8Opv3u4UtqgbRFHRBZMHj8SRIU1doztLoBQUMvufAWrJjSb
	TE7N44l0bYZ+QcLL+92cx/5WG1FY7t9efcoDgNwy9mwTudtizmG9pmg8ncIj7HJJIdCJuUKThF7
	QWf6SJ6vk2al3M14EatastlcEJR2MGa6TNViMoXieF+7O0ppt7G/Wu0vqBP4cIQNpr2/5hes1L7
	EqVuqxA7pVyH8J9nJJGWCs395hn0BIsZ4CCBMnrD7DEABAHASXrcJGHda2cYO7LzLWqS4D/dHyT
	/Xh7Q==
X-TMASE-XGENCLOUD: 1fca35ae-482a-481a-941a-87b7264bc236-0-0-200-0
X-TM-Deliver-Signature: F402DFD34BF0B74797AE929525C06188
X-TM-Addin-Auth: Sto0SyKuVFclG1QHdDcc0TiUowt9Da6tB5W6Biy5JwTsyoEAC5LhCdh+Fgw
	C5mHY5+0hSaVbw6Fqt2IOTm9mlCRE9kEzmIdxCeBh3vpiQjKFRxHcVedGdhdTgblHkYjv8IwhQV
	7aF0nTg6AjATsoSsQpyy2GFagCuqWtiW5eYg+OiWPiu3c4htjouDH8dU5xDWD2jL0NsxdaibKLo
	exurut9uFZIAw97SqeR+FkSMpp1LC2xbN6uyXNgr1ok4I7PAd1wCxhkTi8xgRhN0OZikE7imOeW
	ENkPB1dvLWaitYg=.F3Y9+JwwMwjfzrvoAjvpaJSigLM1PWXvZuuKJROHpDh3W8/KBGufR4mD1Y
	xFELIA6KRW/hccg6qBPxKO80d8eOqNM/Zq6w7kdbsR0WcKrDeI0mOZzkO1mOTv3LnI2tV/vJxBo
	4Q/kqySr+vDjaux0N+Hb6vyQD6dg19c5utUFw3eQxJoH5gxzQhStHgd8AqmBj3y9g3mgKPdUKE/
	/bTWq85h9UwXcj1srCFPhRDbrBmEkH2VZ9R/b1EC2IkFi6qgFF5MkEOr8qD3lR3Mly1eZ1rkGAA
	+0lVF4UxqpPSKSOSiN+WZmD76mZy4bH7FrIds1I7GdWCqAeOChtbyGbnmgw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397274;
	bh=q1FTFC05qxhE3FIhMlR8ZgjjpX+LQ65g/OqgqSYLUbw=; l=15393;
	h=From:To:Date;
	b=iZKqBA47bCcFIibJhtoGArfAmcejGLffBbgCsCypG3uFjPEIfrk8yhL2vjqhP6uCH
	 I1HxZ8ut9WTGkjwBUz3HzbGp057Rbjh+QxdQAqaS/z3tczUEXpSkgvYiCUYfqkBFNz
	 KUOewILtoK3dmVxtcxSxlnX2amH4739+Y4XauHWPO4Rfr+ip+y/BTgAAal9eqtiWyt
	 CfKkZ/+w1QE1XZYVSmHTqXpD3lLIYJkHVv9L67Vpm2VjrSqYGyfLlWfB/Mg2bzTrUb
	 VHECPpu8H1d9TLHWcBbSSREpRUAnLeX9a8KtBSQmBBFVJyldPwHydGtr4JmIMEDuLj
	 Tl1HqTHLMdVsA==

The virtio-rtc device provides information about current time through
one or more clocks. As such, it is a Real-Time Clock (RTC) device.

The normative statements for this device follow in the next patch.

For this device, there is an RFC Linux kernel driver which is being
upstreamed, and a proprietary device implementation.

Miscellaneous
-------------

The spec does not specify how a driver should interpret clock readings,
esp. also not how to perform clock synchronization.

The device uses the "Timer/Clock" device id which is already part of the
specification. This device id was registered a long time ago and should
be unused according to the author's information. The name "RTC" was
determined to be the best for a device which focuses on current time.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v4:
    
    - Drop distinction of Arm Generic Timer virtual and physical counter [7].
    
    - Add requirement that device should assume that driver reads clock from
      first vCPU (David Woodhouse) [6].
    
    - Formatting and wording improvements.
    
    v3:
    
    - Address comments from Parav Pandit.
    
    - Split off normative requirements into a second commit [2].
    
    - Merge readq and controlq into requestq [3].
    
    - Don't guard cross-timestamping with feature bit [3].
    
    - Pad request headers to 64 bit [2].
    
    - Rename Virtio status codes to match UNIX error names [2].
    
    - Avoid Virtio status code clashes with net controlq ack values.
    
    - Reword to refer more to "requests", rather than "messages" [2].
    
    - Rephrase some sentences [2].
    
    - Use integer data types without "__" prefixes [2].
    
    - Reduce clock id width to 16 bits [5].
    
    - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
    
    v2:
    
    - Address comments from Cornelia Huck.
    
    - Add VIRTIO_RTC_M_CROSS_CAP message [1].
    
    - Fix various minor issues and improve wording [1].
    
    - Add several clarifications regarding device error statuses.
    
    [1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html
    [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd6ff1c0f1e
    [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf64ebe791
    [4] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220215a9d6
    [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62
    [6] https://lore.kernel.org/lkml/d796d9a5-8eda-4528-a6d8-1c4eba24aa1e@opensynergy.com/
    [7] https://lore.kernel.org/all/20231218064253.9734-2-peter.hilber@opensynergy.com/

 content.tex                      |   3 +-
 device-types/rtc/description.tex | 328 +++++++++++++++++++++++++++++++
 2 files changed, 330 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex

diff --git a/content.tex b/content.tex
index d7d544eefa06..9e60f8f94c64 100644
--- a/content.tex
+++ b/content.tex
@@ -683,7 +683,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 16         &   GPU device       \\
 \hline
-17         &   Timer/Clock device \\
+17         &   RTC (Timer/Clock) device \\
 \hline
 18         &   Input device \\
 \hline
@@ -773,6 +773,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/pmem/description.tex}
 \input{device-types/can/description.tex}
 \input{device-types/spi/description.tex}
+\input{device-types/rtc/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
new file mode 100644
index 000000000000..0e4d68787012
--- /dev/null
+++ b/device-types/rtc/description.tex
@@ -0,0 +1,328 @@
+\section{RTC Device}\label{sec:Device Types / RTC Device}
+
+The RTC (Real Time Clock) device provides information about current
+time. The device can provide different clocks, e.g.\ for the UTC or TAI
+time standards, or for physical time elapsed since some past epoch. The
+driver can read the clocks with simple or more accurate methods.
+
+\subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
+
+17
+
+\subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
+
+\begin{description}
+\item[0] requestq
+\end{description}
+
+The driver enqueues requests to the requestq.
+
+\subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
+
+No device-specific feature bits are defined yet.
+
+\subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
+
+There is no configuration data for the device.
+
+\subsection{Device Initialization}\label{sec:Device Types / RTC Device / Device Initialization}
+
+The device determines the set of clocks. The device can provide zero or
+more clocks.
+
+\subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Operation}
+
+For the requestq, the driver sends a message with a request, and
+receives the response in the device-writable part of the message. The
+requestq uses common request and response headers.
+
+\begin{lstlisting}
+/* common request header */
+struct virtio_rtc_req_head {
+	le16 msg_type;
+	u8 reserved[6];
+};
+
+/* common response header */
+struct virtio_rtc_resp_head {
+	u8 status;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+The \field{msg_type} field identifies the message type.
+
+The \field{status} field indicates whether the device successfully
+executed the request. The device sets the \field{status} field to one of
+the following values:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_S_OK 0
+#define VIRTIO_RTC_S_EOPNOTSUPP 2
+#define VIRTIO_RTC_S_ENODEV 3
+#define VIRTIO_RTC_S_EINVAL 4
+#define VIRTIO_RTC_S_EIO 5
+\end{lstlisting}
+
+VIRTIO_RTC_S_OK indicates that the device successfully executed the
+request.
+
+If \field{status} is not VIRTIO_RTC_S_OK, the value of other response
+fields is undefined.
+
+VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
+specific request due to an implementation limitation. The device also
+returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
+in the fields \field{msg_type} or \field{hw_counter}.
+
+VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
+supplied with the request does not identify a clock.
+
+VIRTIO_RTC_S_EINVAL indicates that
+
+\begin{itemize}
+\item the driver request values are not allowed by the specification or
+\item the device read-only part of the message, or device write-only
+	part of the message, is too small.
+\end{itemize}
+
+VIRTIO_RTC_S_EIO indicates that the device did not execute the request
+due to an error which was not caused by invalid input from the driver.
+
+All \field{reserved} fields are written as zero, and their value is
+ignored.
+
+The set of clocks does not change after feature negotiation completion,
+until device reset. The set of clocks should not change on device reset
+either (similar to negotiated features). Clock identifiers are
+zero-based, dense indices. All fields named \field{clock_id} contain
+clock identifiers.
+
+\subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
+
+Through \emph{control requests}, the driver requests information about
+the device capabilities. The driver enqueues control requests in the
+requestq.
+
+\begin{description}
+
+\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
+
+struct virtio_rtc_req_cfg {
+	struct virtio_rtc_req_head head;
+	/* no request params */
+};
+
+struct virtio_rtc_resp_cfg {
+	struct virtio_rtc_resp_head head;
+	le16 num_clocks;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+Field \field{num_clocks} contains the number of clocks. A device
+provides zero or more clocks. Valid clock ids are those smaller than
+\field{num_clocks}.
+
+\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
+identified by the \field{clock_id} field.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
+
+struct virtio_rtc_req_clock_cap {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_clock_cap {
+	struct virtio_rtc_resp_head head;
+	le16 type;
+	u8 reserved[6];
+};
+\end{lstlisting}
+
+The \field{type} field identifies the clock type. A device provides
+zero or more clocks for a clock type. The following clock types are
+defined:
+
+\begin{lstlisting}
+#define VIRTIO_RTC_CLOCK_UTC 0
+#define VIRTIO_RTC_CLOCK_TAI 1
+#define VIRTIO_RTC_CLOCK_MONO 2
+\end{lstlisting}
+
+VIRTIO_RTC_CLOCK_UTC uses the UTC (Coordinated Universal Time) time
+standard. The device uses the time epoch of January 1, 1970, 00:00
+UTC. This is the same epoch as \emph{Unix time}.
+
+VIRTIO_RTC_CLOCK_TAI uses the TAI (International Atomic Time) time
+standard. The device uses the time epoch of January 1, 1970, 00:00
+TAI.
+
+VIRTIO_RTC_CLOCK_MONO uses monotonic physical time (SI seconds
+subdivisions) since some unspecified epoch. The VIRTIO_RTC_CLOCK_MONO
+epoch is before or during device reset.
+
+Additional clock types may be standardized in the future.
+Implementation-specific clock type definitions are not recommended and
+use a clock type id greater than or equal to 0xF000.
+
+\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
+cross-timestamping for a particular pair of clock and hardware counter.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
+
+struct virtio_rtc_req_cross_cap {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	le16 hw_counter;
+	u8 reserved[4];
+};
+
+#define VIRTIO_RTC_FLAG_CROSS_CAP (1 << 0)
+
+struct virtio_rtc_resp_cross_cap {
+	struct virtio_rtc_resp_head head;
+	u8 flags;
+	u8 reserved[7];
+};
+\end{lstlisting}
+
+The \field{clock_id} field identifies the clock, and the
+\field{hw_counter} field identifies the hardware counter, for which
+cross-timestamp support is probed. The device sets flag
+VIRTIO_RTC_FLAG_CROSS_CAP in the \field{flags} field if the clock
+supports cross-timestamping for the particular clock and hardware
+counter, and clears the flag otherwise.
+
+\end{description}
+
+\subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
+
+Through \emph{read requests}, the driver requests clock readings from
+the device. The driver enqueues read requests in the requestq. The
+device obtains device-side clock readings and forwards these clock
+readings to the driver. The driver may enhance and interpret the clock
+readings through methods which are beyond the scope of this
+specification.
+
+Once DRIVER_OK has been set, the device should support reading every
+clock, even when a clock may yet have to be aligned to reference time
+sources.
+
+In general,
+
+\begin{itemize}
+\item clocks may jump backwards or forward, and
+\item the clock frequency may change. Clocks may be \emph{slewed},
+	i.e.\ clocks may run at a frequency other than their current
+	best frequency estimate.
+\end{itemize}
+
+E.g., a clock of type VIRTIO_RTC_CLOCK_UTC can insert UTC leap seconds.
+
+As long as a clock does not jump backwards, the driver clock readings
+increase monotonically:
+
+\begin{itemize}
+\item As long as a clock does not jump backwards in-between device-side
+	clock readings, the driver-side readings for that clock increase
+	monotonically as well, in the order in which the driver
+	marks read requests as available.
+
+\item The device marks read requests for the same clock as used in
+	the order in which the messages were marked as available.
+\end{itemize}
+
+For a clock of type VIRTIO_RTC_CLOCK_MONO, the device always returns
+monotonically increasing clock readings.
+
+The unit of all \field{clock_reading} fields is 1
+nanosecond.\footnote{For time epochs in year 1970 or later, this means
+that time until at least year 2553 can be represented in the \field{le64
+clock_reading} fields.}
+
+\begin{description}
+
+\item[VIRTIO_RTC_REQ_READ] reads the clock identified by the
+\field{clock_id} field. The device supports this message for every
+clock.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ 0x0001 /* message type */
+
+struct virtio_rtc_req_read {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	u8 reserved[6];
+};
+
+struct virtio_rtc_resp_read {
+	struct virtio_rtc_resp_head head;
+	le64 clock_reading;
+};
+\end{lstlisting}
+
+\field{clock_reading} is a device-side clock reading obtained after the
+message was marked as available.
+
+\item[VIRTIO_RTC_REQ_READ_CROSS] returns a cross-timestamp for the clock
+identified by the \field{clock_id} field.\footnote{Cross-timestamping
+is similar to the ptp_kvm mechanism in the Linux kernel.} This message
+may yield better performance than using VIRTIO_RTC_REQ_READ.
+
+\begin{lstlisting}
+#define VIRTIO_RTC_REQ_READ_CROSS 0x0002 /* message type */
+
+struct virtio_rtc_req_read_cross {
+	struct virtio_rtc_req_head head;
+	le16 clock_id;
+	le16 hw_counter;
+	u8 reserved[4];
+};
+
+struct virtio_rtc_resp_read_cross {
+	struct virtio_rtc_resp_head head;
+	le64 clock_reading;
+	le64 counter_cycles;
+};
+\end{lstlisting}
+
+The \field{hw_counter} field specifies the hardware counter for which
+the driver requests a cross-timestamp.
+
+Cross-timestamping returns a \field{clock_reading}, and an associated
+hardware counter value, \field{counter_cycles}. The
+\field{counter_cycles} field is the approximate or precise value which
+the driver would have read at the \field{clock_reading} time instant
+from the hardware counter identified by \field{hw_counter}. How the
+device determines the value which the driver would have seen is beyond
+the scope of this specification. In case hardware counter reads differ
+among CPUs used by the driver, the device should assume that the driver
+reads the hardware counter from the CPU which the driver enumerates as
+the first.
+
+The following hardware counter identifiers are specified:
+
+\begin{lstlisting}
+/* Arm Generic Timer Count register (CNTVCT_EL0 or CNTPCT_EL0, as used by driver) */
+#define VIRTIO_RTC_COUNTER_ARM 0
+/* x86 Time-Stamp Counter */
+#define VIRTIO_RTC_COUNTER_X86_TSC 1
+\end{lstlisting}
+
+Additional hardware counter identifiers may be standardized in the
+future. Implementation-specific hardware counter identifiers are not
+recommended and are greater than or equal to 0xF000.
+
+The driver can determine whether the device supports
+VIRTIO_RTC_REQ_READ_CROSS for a specific clock and \field{hw_counter}
+through VIRTIO_RTC_REQ_CROSS_CAP.
+
+\end{description}
-- 
2.43.0

