Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5428B18E2A
	for <virtio-comment@lists.linux.dev>; Wed, 22 May 2024 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716397283; cv=fail; b=juhAFXvTeAtgWglftKQre833QgAIOgEgtv1kTrFE5V04LJtyHNapMeuK7sVgBQXVfdSv2sUI0V+IbXv74TRSJWeRXA/r4WgQQkLg9UoB5ALmQs8EAcdGCb/cvVUAeED3lBju7pn+P65blzHJmFbCVq43HX5JTbE3y1y/0mq9jZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716397283; c=relaxed/simple;
	bh=Nfmw21xZAgOaJ1n0F40cox+25NHAjgm861yufMw/HKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1hEI6G5Fg9uyU9GVTcggHi+INF7C9y1UxfMsfBNTvZ3EDN9m06U4xAuXVHBuIJpujG2uuH44JZCq+mCCL/qb2G69Gnwol0ScNIa0ayCCg72H0iLrYPfb3idFMzzfClfHkGzSfk0HySUJMvEhoniCIgy1x80HbESmg2fz5yiMfY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=atSx3LoJ; arc=fail smtp.client-ip=18.185.115.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="atSx3LoJ"
Received: from 104.47.11.169_.trendmicro.com (unknown [172.21.199.142])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id 8C45B10000C5A;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1716397273.059000
X-TM-MAIL-UUID: 9b03c7ed-808f-478b-b44d-453d2370e0f5
Received: from DEU01-FR2-obe.outbound.protection.outlook.com (unknown [104.47.11.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id 0EA47100724BB;
	Wed, 22 May 2024 17:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ajl/NuolGQfI3WVWGPOnEaemHe+0D4ftrRlBIpxViiISu1/UEaNMQlmwGQlh7qixAfCszmJFYN5j+nLo7CC2NqUqM0l5OOQf6wFGdmdfVU/lclvG4JXFOJXCJBl8jEIUQaJLLX0QoNXbWrrOpmFcBtJzQC8cnzzvgoB4DOT6yXoAyRzyvDxitGYnhucbvEilVeURCT9Ns7vj755agAH8NEi3XuFyTU1T/2aAMsPvHiQzsZQ3veFJwW47aRX31mr8UH6bf4WEblGhLsAZ0JU5WFECUMF0BYkgafycnpnF7p1tsUXUfWHeMMC2OB/bT8/jTh/VyOdl+xhR5Na2sVfUOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGeb9ba6UKkZenPJqq3zzQIVBSUxvL9JLQ20stiQMWw=;
 b=a1x4HSxMKw41cKwIxRbinQiUhMDAJ3aX2bawNBFnYBMC64SNg8JTw/7eXDybLXj8GER+YMXc9pvQW+BuVaKCKzkLESYQON5TtL1tLcPf9IJoGCpDw72LXpQ7MPxvhwtIJDyuNgmf1IwlB9VMSeapqtPFr4PL0qT0xnZGQO0I4VLmH5e6cXVtcilTjI1lTELwILU4mQNxiN8kMJDB2ROPyf2tv31uWmNXOkuxYXXe/uw8wZZttZWXjNjyFK9uGewT27/UzITm4hefey7QOpBpLVXmmax9adEiJtXTTOs38NjxzWtV4X7eE6olw5Mxi2+KTiHR6A5SA5a4PyJjs8RJzg==
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
Subject: [RFC PATCH v4 2/5] virtio-rtc: Add initial normative statements
Date: Wed, 22 May 2024 19:00:00 +0200
Message-ID: <20240522170003.52565-3-peter.hilber@opensynergy.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AA:EE_|FR3P281MB2974:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1f5c3177-3ebd-4e30-8bf0-08dc7a80c819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iRzcsl7Bmu3ptFu6ryn8MSueSRwmJsxa2f+yigjNbjaORJLWnY0HPtHqjW+k?=
 =?us-ascii?Q?RfifeNx8szSfgKE1CT/yHfUU0wKGksV+VqmIXJhwFvW5F9XHYXX7oVZAqweu?=
 =?us-ascii?Q?56OsPcn0pNucKaYmf3WQR2ytrGlICqDYu4XTN1TkZdARk/IK1fk+NLbqGCgz?=
 =?us-ascii?Q?05X7xbsJOt11Kqi2QmGbSeQ5tjIzpeC9BBthCL4RM7Y7z1Bw3DA5wK9DLQSg?=
 =?us-ascii?Q?g58N4CrECZ8dWcbt6HPM8FfN7m4Fu2Z0TvUfntC+Bg4B6DoO+4q34S9zjSVP?=
 =?us-ascii?Q?wupab9giZCoLN0DSwu+DsN07418NW0DHtU+sMrXAE1iSQPYfYAHTGYpp7EW0?=
 =?us-ascii?Q?mkjC82vCB/ZadspBNDQrkdOrey1G4/dPkCneBAPIhPV9mDzA1Wc9C42Az5Bo?=
 =?us-ascii?Q?8Rc+uiddP3XBGJCu5BJaDKR6dsYjEmVrN+Iz8MDHCW6JfabMviy6yCHPSrgJ?=
 =?us-ascii?Q?SbHysgOnw3QWOg8D1jKp1h38AZP12A57sFMYObbiainMYZjeBTQQ+WaUlayd?=
 =?us-ascii?Q?p153hguqjFbHt1UFstWYOVYGUfXUjh5ST+4Q2vKJT13gcx5SjLHGSLb/mNpl?=
 =?us-ascii?Q?3hZqsZ6FvqpANRukQZoB7cb0Ji3jUlcA//SXhkpFy6jqunxE/ELeYnqOzi01?=
 =?us-ascii?Q?747L63Jf0J/eKhXZINTlxkEbarMRT9tkQxZLgSfOcANgLMmFB8nu8M5pnbyV?=
 =?us-ascii?Q?VExzGoMl9lXy97JI/qH7m63PLZdTXytDsUYj5V9YVb+OY2tyrq7cxutHYUvr?=
 =?us-ascii?Q?N8tkebzz2qO7AFbzt+69vSa7oQTHCxCLVIqPrOsshbmaEhmIXfPbsJ3EM2/7?=
 =?us-ascii?Q?Ij181cQxH+oT5/EzNJ5KpnmaARmycW3Ppf6MCECimW2Arm+fjcyi7QKDXh1n?=
 =?us-ascii?Q?OIDZK3wa+gH7Sy1ad5Zu72QMdMhpauyppwQiPMNtD6Fio7Ld+cW9G4HLYBiS?=
 =?us-ascii?Q?MFVGkBjelZOvDIQNYps0H9ZcZyH7uiBn4XoLj8wxavOehSBobHiGxtFYl0Ps?=
 =?us-ascii?Q?iIN1uX659AmDBof02HSmPZU0+0vrWeDhfN5F7uASzeMhMkBewi7FdLO9vTWw?=
 =?us-ascii?Q?2v5HCZKFug1C+PWn09pk1LeA6du5CZNqC0PxChLEhQd1QbJXYHYG3s9wJvFz?=
 =?us-ascii?Q?1yH9jpdAunLX825P2FAE1jvCfVX4UUdUakHghbAZq+PMJJht+ZxHJwVYQppO?=
 =?us-ascii?Q?5MhsSiqZWQaT3R5JIeiXDz+tDmiCsINvh4fBUaF1L6t3M/DvixcKu1IKkM+Q?=
 =?us-ascii?Q?xu6Wmxf/8S/sFpjl0sWxRGCZK872Hw9gSDKNDBOoqIhPiFwg1uXw5CrCElyX?=
 =?us-ascii?Q?+TE6q1X2Nk5smIlpwWYuq6Zs4HXay0UFj18AxSHzGAPaKH8G32wA380fAUgb?=
 =?us-ascii?Q?byWjjNk+myIkT5CWHrSZT6hApQR5?=
X-Forefront-Antispam-Report:
	CIP:213.61.166.92;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SR-MAIL-03.open-synergy.com;PTR:exchangeconnector.opensynergy.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:11.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5c3177-3ebd-4e30-8bf0-08dc7a80c819
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=800fae25-9b1b-4edc-993d-c939c4e84a64;Ip=[213.61.166.92];Helo=[SR-MAIL-03.open-synergy.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AA.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2974
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28404.001
X-TMASE-Result: 10--13.562200-4.000000
X-TMASE-MatchedRID: lm12THZajvrJ+P2VFrJmrHiXIXWXK9StFST1Kl560HWQEjOZZEyhAvtw
	xgEZhOUQHhc64PsTbnq5gLdXNqwWPK3XYtsOH2/QRYNhzuZZjRAXWTat7jYiDfQOK2Gf/k+tM9l
	IYWY5TSWQumP3icjiQZXS8lhq0Fme3OSiTHudJOfWcxHsnT13T9Uusl/JVaRNYKYx8Hnn9hIPHo
	u+uv3A1sB8Rzyx4KAvX+LhRMVe3ysCTTypHzGIePtXnvRt8Io2znvaWcyS3tWmZ1XegV/KfHiTO
	mhDukuUNc6Sog21s8Ys0/JkFeiJKorPk06BAVBX1yM2vzRKo5XvzXgPRwNu0BERyafywvMolaL+
	kVCH3xSzMd5cl6nV7IEUMUc4vzc9DEwaB7lMeNgI1pqhes/vCePBqjds3Z7Jx38lKQe4nRdbyMD
	Cb1G2Iier5NmpdzNeanaacGJ1MHqMoy+mylJsXW0ZWzHyRJUFUCpvN72sC4SRnjfvXVSKt+er9D
	RWbrLNCDBAoOJHR4GV1h6ijsb1eK0AyU/iBF0W4hrQCwkjviLPglZ+aDq3fQSXrcJGHda2cYO7L
	zLWqS7+2MfnmxupmhYPMZ0OuXi/klbsQ09BggSeDkkBZYd2N/Hkx7UpEejm
X-TMASE-XGENCLOUD: 2dba9356-0848-47a2-8415-e1ef03e5068e-0-0-200-0
X-TM-Deliver-Signature: 942FE832A3FA0E28D056BF7CD495A448
X-TM-Addin-Auth: G33TVKPq7sR6gvmvXfPclVPm0/6JVl89sIPiDC+pK+lb1aF93zkkPtQlmD7
	Thlg3BfLtbyz5ehBeRJ7Y6B+qVei/41TH9VW4iitO/9HA/0et+M0Qi0JFFraCnf4keXt8ea8b3/
	JCARtXINh+nlNx4bi8yLkHwkcIGBrlCX2U2bz0fW0v0uzGu6910LgsL+zxYIvh031V0PDXNuZ+L
	wmzlnqgU4jAx8LeZYpRfpU6piz06446nkEQiNnGy1o85aud0eUr2FU0OoLDRWT0Q1SqPfOFoPQI
	Mfj1B+Bkv+8/5CY=.RVb6b93PUzfs/rudAEbvSWT5Z7zjfKhIiohwiOtXsKCX1SdB+2Q22wcq0e
	lLEuXEJVxvEos3t3hUYULcD3+BClUglfry1nuLjHuOJje5nMwRDt2OLsZLWxdXtVzxd56kjjE1T
	Rlilg2yJpouCXXaxEwOCPtwOqdIw+TpIl+Eblqks7ZgwxpUx4OWd0m2GqO6ydCCRk9oLXbYRZHP
	7VlQ911nvolbRqKX8ZYMccyA7nvbiaiKiY+K3BNjmnw7YuQIcmBxETu8oGD/wJn0HTTpRWU6uLY
	vgEoC+xPe3qG6n4/N52QFcOt3AQiEH5X8tkcERLSrMozJyt6gDKj+PREqcQ==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1716397273;
	bh=Nfmw21xZAgOaJ1n0F40cox+25NHAjgm861yufMw/HKo=; l=14152;
	h=From:To:Date;
	b=atSx3LoJC4lUAdweHG18D2u+NEQw1XQ24uzExQfU1cKEuXfmElIRISW/lRF40Bmzf
	 DEou7G7es+hTIFvUE7xKB3lqGj8YgD5Pc78dttFVmoYx9YDs3Tr6u1qmuIeMQctOZM
	 PTA3P/8b3AIgEQKHUPzCuS20b96cS3aBvVi/tEwUxzuB0VOqL9z5nPx/RC7abjq60u
	 rz5O4lchoYxZIpMSsMUiZyemsBQ5V66wTpVgiG2PbRjvN2s296xjbVlRT393BtRoMy
	 hXDcoUULUPUiwSiRthJrumWc65X/ow7ghAHKZWWB7th9NcaO6lAXf9R3oMRnN+5m7l
	 fOb1rnpRyJ7wA==

Add the normative statements for the initial device specification.

Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
---

Notes:
    v4:
    
    - Require driver to set unused flags to zero.
    
    - Update normative statements to match v4 changes to non-normative
      statements (patch 1).
    
    - Improve formatting.

 conformance.tex                         |   2 +
 device-types/rtc/description.tex        | 214 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   9 +
 device-types/rtc/driver-conformance.tex |   9 +
 4 files changed, 234 insertions(+)
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 183c05944d1d..899e0fe67544 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -159,6 +159,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/driver-conformance.tex}
 \input{device-types/can/driver-conformance.tex}
 \input{device-types/spi/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -248,6 +249,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/device-conformance.tex}
 \input{device-types/can/device-conformance.tex}
 \input{device-types/spi/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index 0e4d68787012..28c1517f3543 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -98,6 +98,111 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 zero-based, dense indices. All fields named \field{clock_id} contain
 clock identifiers.
 
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+If the \field{struct virtio_rtc_resp_head} field \field{status} is not
+VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
+than \field{status}.
+
+The driver MUST set \emph{reserved} fields in the device-readable part
+of the message to zero.
+
+The driver MUST set unnamed bits in \emph{flags} fields in the
+device-readable part of the message to zero.
+
+The driver MUST NOT interpret \emph{reserved} fields in the
+device-writable part of the message.
+
+The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
+device-writable part of the message.
+
+The driver MUST put the request into the device-readable part of the
+message.
+
+The driver MUST allocate enough space for the response in the
+device-writable part of a requestq message.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_OK if the device successfully
+executed the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to a status other than VIRTIO_RTC_S_OK if the
+device did not successfully execute the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{msg_type} field which is not described in this
+specification.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{hw_counter} field which is neither described in this
+specification nor otherwise known to the implementation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
+field value supplied with the request does not identify a clock.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
+inconsistent with the specification and if the inconsistence is not
+described by the requirements which stipulate status
+VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
+of the message is too small.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
+part of the message is too small, unless the \field{status} field does
+not fit into the device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only part.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
+requirements in this document stipulated another \field{status}.
+
+If the device read-only part of a message M is bigger than the size of
+the request specified for message M, the device MUST ignore the
+additional space.
+
+If the device write-only part of a message M is bigger than the size of
+the response specified for message M, the device MUST ignore the
+additional space.
+
+The device MUST NOT interpret \emph{reserved} fields in the
+device-readable part of the message.
+
+The device MUST set \emph{reserved} fields in the device-writable part
+of the message to zero.
+
+The device MUST set unnamed bits in \emph{flags} fields in the
+device-writable part of the message to zero.
+
+After feature negotiation completion the device MUST NOT change the set
+of clocks until device reset.
+
+The device SHOULD NOT change the set of clocks on a device reset after
+the first device reset.
+
+The device MUST use non-negative integers, which are smaller than the
+number of clocks, as clock identifiers.
+
+For a fixed request value V, the device SHOULD either, for every request
+with value V, always execute successfully, or, for every request with
+value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
+
 \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
 
 Through \emph{control requests}, the driver requests information about
@@ -203,6 +308,42 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 
 \end{description}
 
+\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
+
+\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
+time standard (Coordinated Universal Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the time
+epoch of January 1, 1970, 00:00 UTC.
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
+time standard (International Atomic Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
+epoch of January 1, 1970, 00:00 TAI.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use SI
+seconds subdivisions.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONO, the device MUST use an
+epoch at a time instant before or during device reset.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, the device MUST set \field{type} to
+one of the clock types defined in this specification, or to a value
+greater than or equal to 0xF000.
+
+For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
+VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
+would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
+\field{hw_counter} and \field{clock_id} values as in M with status
+VIRTIO_RTC_S_OK, and clear the flag otherwise.
+
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
 Through \emph{read requests}, the driver requests clock readings from
@@ -326,3 +467,76 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 through VIRTIO_RTC_REQ_CROSS_CAP.
 
 \end{description}
+
+\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value greater than or equal to 0xF000.
+
+\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+The device SHOULD continuously support reading of all clocks once
+DRIVER_OK has been set.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY insert UTC
+leap seconds.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MAY smear UTC
+leap seconds through clock slewing.
+
+For any clock C and read requests \emph{A} and \emph{B} which read C,
+\emph{A} being the message which the driver marks as available before
+\emph{B}, the device MUST obtain the \field{clock_reading} value for the
+message \emph{A} response before the \field{clock_reading} value for the
+message \emph{B} response, or the device MUST obtain the same
+\field{clock_reading} value for both \emph{A} and \emph{B}.
+
+For any clock C, the device MUST mark all read requests reading C as
+used in the total order in which the driver marked these messages as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONO and read requests
+\emph{A} and \emph{B} which read C, \emph{A} being the message which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} value for the message \emph{B} response to a value
+greater than or equal to the \field{clock_reading} value for the message
+\emph{A} response.
+
+The device MUST support VIRTIO_RTC_REQ_READ for every clock.
+
+For VIRTIO_RTC_REQ_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for field
+\field{clock_reading}.
+
+For read requests, the device MUST obtain the \field{clock_reading}
+response value after the read request is marked as available.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
+\field{counter_cycles} to a value which approximates the value which the
+driver would have read from the hardware counter identified by
+\field{hw_counter} at the time instant when the device read the
+\field{clock_reading} value.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
+reads the hardware counter identified by \field{hw_counter} through the
+CPU which the driver enumerates as the first.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
+value other than VIRTIO_RTC_S_OK if the device cannot determine the
+approximate value which the driver would have read from the hardware
+counter identified by \field{hw_counter} at the time instant when the
+device read the \field{clock_reading} value.
+
+For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
+\emph{B} which read C and which specify the same hardware counter
+\emph{H} through field \field{hw_counter}, \emph{A} being the message
+which the driver marks as available before \emph{B}, the device MUST set
+the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
+shows after the \field{counter_cycles} value of \emph{A}, or the device
+MUST set the same \field{counter_cycles} value for \emph{A} and
+\emph{B}.
+
+For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
+this specification, the device MUST use the nanosecond as unit for
+field \field{clock_reading}.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 000000000000..4303cd450542
--- /dev/null
+++ b/device-types/rtc/device-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
+
+An RTC device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
new file mode 100644
index 000000000000..689c18d158d0
--- /dev/null
+++ b/device-types/rtc/driver-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
+
+An RTC driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
-- 
2.43.0

