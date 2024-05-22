Received: from refb02.tmes.trendmicro.eu (refb02.tmes.trendmicro.eu [18.185.115.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1E81CA89
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397290; cv=fail; b=ie3lhpmrlF7hWJMotQTMM214aRHgZqBECfx9BeDOs1INbxYuUDBauc9lwkl3ECaR0QFoRNMJ0GcbSCbxA8fr/son5AvP7TbR5mVuLiJWIzMZZ6qnaoc5an2han16vB7ZsFl1fM+Kh87OJZpWjWBjFnFSRx21KFlSZjqo6hfOGa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397290; c=relaxed/simple;
	bh=/Eoxn1vK8nPKcMiroTutgL7w3IFDIifoRMMsflzJtg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=X6zV6kxYhE5xljz9JMYGFsj1m9+ZuAVQ+E7NT8g4Ut2B1lOitFz1e1odSYzBh9vdCD5vwkYVqsxg+Gg22EPYFvbK2qhZcwJkJLFBoKcG4DrKlH2lso+pkQdHw0w3QrrdLyj5RJxSVg3/9/H0PKyqsvQnIJ1+9M91CNnjCcOARiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=ZRKll47m; arc=fail smtp.client-ip=18.185.115.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="ZRKll47m"
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.19.58])
	by refb02.tmes.trendmicro.eu (Postfix) with ESMTPS id 793331004738B
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:20 +0000 (UTC)
Received: from 104.47.7.168_.trendmicro.com (unknown [172.21.191.80])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 6888C10000644;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397272.828000
X-TM-MAIL-UUID: 52778a80-ec18-4535-aabb-f3646010a6ca
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.168])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id CA80910001536;
	Wed, 22 May 2024 17:01:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ag4go+3K+m8PcHjSw1FcDt6/Pvqn4WNnTh0kt1IclabNqfiC6pp8uKyO8LhZOdy0ucRTchDh37CVONykAhvIX9EAOUxQVTQswQoSqvjMsG2LP9zn/5ubhm2X8339+BsdHulO1FO7vL23K1YBD+9Ni0+g4bH0HvBazNKo0y5Zk0sIFYk/j1VnhQhVKtffTlvB27aMx/JttJOHtaiyY8GpBtPckPK0CjLtH3kI8w7vzs0yB1v5b3Hr5Q2bGbSgwZNBHR+dpRMJexp8xRNiXtBV75djoUiLxuc0XNqpBKDeRbFeoLvH2+EOy6IPJTFt6dI6EMwpAETT5mBwzinbH/aqbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jog7Tkypp3HjAwhfhcx19VP5UmFTHbMdmIoSwMF39dI=;
 b=X5mxgthsroFi/DBqJu9DNzVZEnkr2TUAfwaoF4FbtJlSAXBgGenecS5q0+BTfAhHdV/SJZoNVOdJnx3Eua9SGz39ST8kVXND8dBjWsHKOeJ5cyooNAXO87he59n6LnnMHnZEnVy6qyogAEWYRcHnjavTxMF0eeYdxehuI4rOMOqGmQMMqeTF38poUtJMc7P80bvbA9SE4l43tpenF1xqGwzUyPYcJrkiWqFmyfhucYChzdc2Gfo5U47i2EhwccatqIUMaBli3XQpiYgQUut2XR59UlRCa5K8pvJ8OPk61uG6WwhSBUnBMSmfbvEsxTPB8+EPUWgl1FND6uxG0BbdnA==
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
Subject: [RFC PATCH v4 0/5] virtio-rtc: Add device specification
Date: Wed, 22 May 2024 18:59:58 +0200
Message-ID: <20240522170003.52565-1-peter.hilber@opensynergy.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|FR2P281MB1818:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e333b391-b85b-45e8-2b6b-08dc7a80c834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jv+Wh0VVxtpkf51fPmC1ashmnCBxBwuGHJBDzGsLB7rM3pcucGWQhnYMBmA5?=
 =?us-ascii?Q?pA+O61/i2Vv7ae4w6h3PJJhUhv8myyn3YvCR36tDK+gfvH2/ZOnfNwC5vkH6?=
 =?us-ascii?Q?V1Q8BtHvoWy7DM9QqTqAeqWM4qsLX1DnU5p4ab++7FtlA6W//mHnzbY/7OwL?=
 =?us-ascii?Q?nLMI8a9ScYdRrumLqGeKOEEbSPIHwJ/1dgt32drRf0SJ7xgiv8HmPviP3QbG?=
 =?us-ascii?Q?itVzHiMT7u/lrQBNyVdlkly8Xepsv3Ixjz1kyPKnjNAr1JeoyMu4lKjmxiV4?=
 =?us-ascii?Q?e5dlGvBJQUnOwDq8YT606zbucj7A6eDA/pMXQOMHSjiHtRqrtL0EhRi5kcdW?=
 =?us-ascii?Q?x7pP5kK3Nnp9sgwbamau5BzrRZ/lTXewSI6Z1FPYrnwxKJVxIWjXRn2jt//y?=
 =?us-ascii?Q?71seDkE4Dgvv7KzisopUXwJcKr2MU3drZr+dNJLf5dGIOOBgrDcrKuNM3kNK?=
 =?us-ascii?Q?ehzbUPHwWTYeI9BQ3nuUeJ8HwkUz+yFZ9g/QkEHSzie6xIucmFB9OrkDcGO0?=
 =?us-ascii?Q?ATMBC0wiUI0Jz1EGXQabdzyxPk346YO6R2qbMRuFyCv0d9XMcsd0iz9qcYfM?=
 =?us-ascii?Q?qk+FrDpVLVpgaHyjEIgRp3Z1d7OLBetXsuwgvnRqldjbzYoDaaHPOmegQRYe?=
 =?us-ascii?Q?Q28sFU8ulW2XBb+hDRo+CkrQeieyZoqxbBvUDnuJWP6TInemGFojlwTqs3mw?=
 =?us-ascii?Q?lK+B0fOSUlIIyMCVs0qFZ0gLOJBNFg4dqJV6Z0SB64IRL2a4XlnBB+hkBY18?=
 =?us-ascii?Q?Y3RTqGegm5aAhAvGMRDFHTaSVOO3ZAeBcXcUpjWhLPtVM6fbqR0xxnhJqnhc?=
 =?us-ascii?Q?U0xorDSDVeNLl3IWQJic4OhKMg9NOBoOzXK5qhKcs8KmLffTyJHszFaKYARI?=
 =?us-ascii?Q?rn2o4j3uhf/lA3scs42IyqSj+lz28LEk3bEQnxI8qWNolTPcMBvQpIpn68vN?=
 =?us-ascii?Q?RblWo2c6cFwtEBjMMJ8bqdyvcn+9epsgBSBE4UWQ0+GNljEMriuyd4Q8k5Az?=
 =?us-ascii?Q?D3W2NSqn1MlvjfRC56YTOPbHbRI6TkUjHZHh3VQ1JUppCvc0s2OV4Kx6eDJV?=
 =?us-ascii?Q?u0d71Na72eacTxNdN1wZ6oX9DqDvIxWTpxsouteRx27du0ZUXi5I0W3TEmuN?=
 =?us-ascii?Q?zSEpWsDw4Jm5MRXLlFq64lV5uXH/VYrWPpBgS1Tv7UrTKWiJsLJq1z/UgkG0?=
 =?us-ascii?Q?rty1GjV8cx/PoINTdUhJbNg8WXMZOMTBoGp7sP1pKuFX4ePP+d6jGCJ8VMoP?=
 =?us-ascii?Q?+PsE1bBEl7AXon8SS5Met6M8R+y+W+DUiQZcgH4rcg2Oic5KFtcm8oCIjkYD?=
 =?us-ascii?Q?MjmI/6qWitET/pVhpT6fVnA2?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.1938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e333b391-b85b-45e8-2b6b-08dc7a80c834
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB1818
X-TM-AS-ERS: 104.47.7.168-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--9.569200-4.000000
X-TMASE-MatchedRID: iCFo82lRN+mUP+0hdpOx0u3qPLdU3cUZrutCeVh17xkoU8p4AZ0By0YV
	/vlA7lOd2UUusbhoAyHcr3VE2llb7tFt5Ts1+uT6eJchdZcr1K2n2i3kZizDsSimJVj5dukrr2U
	ZR/HJv/hBPzSMgZ5XbQVZzWfKZshCnmZMoXhMtq1COt+tQjulafbQGpL1CGquKV3d1JXuYf12kZ
	bqmJ/a5pqFu7OJI/tOYsRtQSiXxwcL1F5m6SEsrjucaiNwou8iZNsIhOcaMtBEtmqrlcnvHviS3
	FmB7WTR+D80gMj3j3QlUqV97CJh+lGySNoYMxCekh0LRDkkMBzKICKMKO5WPeSxnfO8XDh3t432
	DndJiNlsx3VqczrMn6d3N2oqc0nDx10k8QqyoAyqiWyHuX1y0KODSWu0oxbKTrZFTk02rib1aGt
	RFSuVUrC66pzjxPrrJU0nG3tpe+CEbaqKQSlAZYzsXhjTbyZM4CtRCKX5b/QctR6z2SQU10imXF
	fFHSsDpeNVPeL5BOo=
X-TMASE-XGENCLOUD: 10f7e109-ce30-452b-bfd8-4730d38bd47b-0-0-200-0
X-TM-Deliver-Signature: 6C14D1C9C31A24CA8F7785683927191C
X-TM-Addin-Auth: uQCW9sRWuOcx5+aCQansqv6vaO/NTcwgNsEywy6Xkr0hAK8f+x2cQwSdXmC
	3elpjE5VVl9HsZ+w5ZwRD8nTVDaRO8fdFLfnFKyDevvMS3Shr3Q9TkY1zMHM/C5JqTI3J8d3ju2
	nyJMcF9h7yq/BNyRW4AG2Eux2UlVhqcsVAyfNDBxd+6osCdnpeu7xqWdndqnXif+wCnUrDFWy3j
	+/OW2YvmwNMTWCmPvVr+gyCS/QU/R0viUMIbBDrNUjH9TrvwpyQOSHI2TXlEB3ajyKtvgkL2nab
	hjj6kj+rWe9k6gM=.ucf/Snub1dUD9HkiWbhYkiOVtDfhsIexLJRNNmqXtuZxAba7XYnFLiVOpo
	qBLqc5R4id8/oaHRIYFsx4w5GS555oQPOlyh65zksUrDd+OLmaJViIv4RouRe/u5wZOcRlwguWt
	4P64UjAOOygzOdBW76fq+BIZ/K6PiVCtq/ceMnWGTsAo5DW8nGmCho9TTdIDPlt3sIBuY8iwkoe
	gGTT974BoTibRZKp9awShzDgM4nKiAUj44XT2c0srhuU4VOoB4qTBMoLGHImJ6QOXk0fqf8Dcad
	wc3IaQ4y46UymU3O8ngaH/vmjpV4YpyiXy9F+PhGNkq5hqMvv3pHY0nnkYw==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397273;
	bh=/Eoxn1vK8nPKcMiroTutgL7w3IFDIifoRMMsflzJtg4=; l=2790;
	h=From:To:Date;
	b=ZRKll47mMfAVMWm5cMr8GdDk/ogIXYH2K1Wy7lw8vCa+W34pOJQIgkyoxjW4Cfkl0
	 9yUduve7qa+yb0EeNRAuxAROUMHJF2g0hV+uKHsNiMjU9sifJN2ZhIG85SW3Cnamiw
	 SRYe87/FBlvY/0JNDb6g0gZ/Qr5DUtbh3wdUH9U1SDpj63q0B9bkK+3RZ14yhrRqkN
	 abLh143g+703kOdAo8cTr9MX/LEBzoSaG8K1J8q6zEOnqafuVoOO2khuuz9izMIVs6
	 rDkL9oy4oNwNvulhsJwdVb15FwPQhp6gBxsg8K5kyj8l2tdAmMDItpjckySJYRvgJB
	 ptgrEjaZJ8X4w==

This iteration of the virtio-rtc RFC spec adds leap second indication and
performance indication. It also incorporates the results of previous
discussions.

While the virtio-comment mailing list was unavailable, a discussion about
leap second indication and performance indication took place on the Linux
kernel mailing list [1]. As an outcome of this discussion [1], the RFC spec
v4 now adds leap second indication and performance indication. The
respective changes are for now gathered in patch 5.

Summary
-------

The RTC (Real Time Clock) device provides information about current time.
The device can provide different clocks, for the UTC or TAI time standards,
or for physical time elapsed since some past epoch. For UTC clocks, the
device also indicates when and how leap seconds are handled. The driver can
read the clocks with simple or more accurate methods. Optionally, the
driver can set an alarm.

Changelog
---------

v4:

- Distinguish UTC clocks with and without leap smearing (David Woodhouse).

- Add UTC leap second and TAI offset indication (David Woodhouse).

- Add clock performance information (David Woodhouse).

- Drop distinction of Arm Generic Timer virtual and physical counter.

- Change requirements so that driver can reset alarm to clean slate, and
  document how driver can achieve this (Cornelia Hell, Jason Wang).

- Device should assume that driver reads clock from first vCPU (David
  Woodhouse).

- Driver should read clock to confirm that alarm has expired.

- Require driver to set unused flags to zero.

- Require device to support all expressible alarm times.

- Formatting and wording improvements.

v3:

- Address comments from Parav Pandit.

- Add an optional alarm feature.

- Various other changes.

v2:

- Address comments from Cornelia Huck.

[1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/


Peter Hilber (5):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature
  virtio-rtc: Indicate leap seconds and clock performance

 conformance.tex                         |    2 +
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1236 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 5 files changed, 1264 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.43.0

