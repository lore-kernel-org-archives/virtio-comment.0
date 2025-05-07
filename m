Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D09A28C033
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 15:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633077; cv=none; b=oqTRnxL1fOXt59iQM9E6K9r7T8L9gJzYw7JqSb9XFdw5PypvXKeGlkNq2wExbHKWRn6D3PuS/Rc1DSjE3ner0LV/b/6E568KwYmoXK1O5HBvUV3c0fL6LKctXMpC3u3iBzvSBa3+yqmblwUTXQjC51uw3tzDWMoQ2GtUxnpNi9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633077; c=relaxed/simple;
	bh=cSzBhSDt4HKGGJ0X1F+A+3IBjcrt1gJw3bIi7wtoMCU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qSjrJQPmgjq6dCSGC2JIPrv1dxDJe7PqvTGW6/K4eKxObA47jVencg1e2gdAb/9BhrliO2GJOgyZOSnsmOJffydH3qOPDZxlOv6o08kG+8GlKQclRvmiJJ9+hNYoEaSMEroGO6YaLLjICyWnbgpIiaIaW0vARtn7EIFfKsikEWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FCSufJx3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FCSufJx3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547A8WwP009115;
	Wed, 7 May 2025 15:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n4N5MgT5Ui+BBbvjRnSaem
	FkV2xeL0YHZcxE/RSA/rM=; b=FCSufJx3EqArRF4LpcpV28b+9mKczG4Fx2rk7k
	Tdjc59zvnX/X18JfLDsvVYzOnpeqFBHTVRIOzCe8+h2HusE00bbNyiFhOYIyXqC5
	IbRYGgei5TQP/APbw7mGNmjVD1IEyC3gWTR0ksYZTE9vqNwEXAAbQhjJe5f3ObHK
	WdYr8U4HOgZ/ZYwCvEiCw5Cb3M6Zobd98ZWBj06pZOQzSS+KUGetx/XWdmKnkc1/
	uE+rCxVEfYlZTUkwaEbJc42RROKjyRE5LAmsgBvZMcbm40jba8dQ0X5z2YDwOQCq
	pYGcA5IZVkpXS+TewYcof/h60OUzNO52CZC/vF8h+s7KtlnA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46g5gh90m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:51:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547Fp7oN015136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:51:07 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 08:51:04 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin"
	<mst@redhat.com>,
        Peter Hilber <quic_philber@quicinc.com>
Subject: [PATCH v9 0/4] virtio-rtc: Add device specification
Date: Wed, 7 May 2025 17:50:32 +0200
Message-ID: <20250507155036.1489-1-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cy9QVN4Z6wPCqgStb-gWugpa4vAp_qu2
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=681b816c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=rSkwMs5QdVAkfNlAlOwA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX5JcmZfV7K1d0
 UhxUgdBxppk85YDhF5MMQjJgkQVRqhd5wfA6CkgossbTDfVa6tgNY0PWgwKvY0QzO4lGzPVZqzx
 2LCZnots8aGMbeIwJ5Swl4SqQ0xCFZo3teX6jChl/faN3n1q3NWvgNQNORSlLyJzL/gbkG27kVx
 zf6O90ax3FrdUSZIty4qtah85ZuMjxvSZGwIidK7UfbtDaf88GxEihrdfEK/TL56DbAauUGJVq1
 kncJKLACj6JN0C19gCciWdNAaCa5LGTNwGHn+0wrencVkZdknL/Y3F+2uLhIP2qVVGzINBY+ho4
 I8gAiCWgl5Og7eCQnNBWkSi36t6Qda5s70aUBJZ6FIyeE+s6a44a9+YUjs3/a01bJoti8uVHSnj
 D3Ojcq128dNj/pVOZk2iWE5do9tWs03H2MTldJDY+bk411i4mJoccEmXApRT0AB3Hb5edNz8
X-Proofpoint-ORIG-GUID: Cy9QVN4Z6wPCqgStb-gWugpa4vAp_qu2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070148

This iteration of the spec should address multiple review findings from
Cornelia Huck, Matias Ezequiel Vara Larsen, and Michael S. Tsirkin.

Summary
-------

The RTC (Real Time Clock) device provides information about current
time. The device can provide different clocks, for the UTC or TAI time
standards, or for physical time elapsed since some past epoch. For UTC
clocks, the device can also indicate how leap seconds are handled. The
driver can read the clocks with simple or more accurate methods.
Optionally, the driver can set an alarm.

The driver-side timekeeping can synchronize precisely to a local clock
exposed by the RTC device. If supported by the device, the driver can
obtain a cross-timestamp from the local clock and the system hardware
counter, in a way similar to the Linux kernel ptp_kvm driver [1].

The alarm allows the driver side to be woken up from a sleep state at a
specific time.

Changelog
---------

v9:

- Add motivation to cover letter (Michael S. Tsirkin).

- Allow more implementation-specific behavior when alarm actions become
  obsolete (Matias Ezequiel Vara Larsen).

- Define how device should not change across resets (Michael S. Tsirkin).

- Document that device converts hardware counter value, accounting for
  device/driver differences in offset/multiplier (Michael S. Tsirkin).

- Restrict implementation-specific id ranges to experimental
  implementations (Michael S. Tsirkin).

- Mandate that only flags allowed by negotiated features may be accessed
  (Michael S. Tsirkin).

- State that an error-free device sets status OK for all requests from a
  well-behaved driver (Michael S. Tsirkin).

- Change name to "Real Time Clock" in device type list (Michael S.
  Tsirkin).

- Remove unneeded requirement about what to put into device-readable
  buffers (Matias Ezequiel Vara Larsen).

- Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen,
  Michael S. Tsirkin).

- Move fixes which were mistakenly placed in patch 2 in v8 (Cornelia Huck).

- Remove statement implying that device MUST NOT check that reserved fields
  are zero.

v8:

- Explicitly describe alarm enabled status, where relevant (Matias Ezequiel
  Vara Larsen).

- Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen).

- Drop unnecessary or redundant requirements (Matias Ezequiel Vara Larsen).

- Change word order from "field X" to "the X field" (Matias Ezequiel Vara
  Larsen).

- Change word order from "flag X" to "the X flag" or "X".

- Move requirements to serve alarm expiration events before requirements
  about stopping to serve (Matias Ezequiel Vara Larsen).

v7:

- Remove leap second and performance indications from struct
  virtio_rtc_resp_read_cross. Remove backing definitions.

- Move wording change which was mistakenly placed in last patch to first
  patch.

v6:

- Make leap second status information optional if the clock smears (or
  might smear) leap seconds.

- Do not use union for leap second indication.

- Improve wording.

- Refer to the new POSIX.1-2024 for UTC epoch definition.

v5:

- Change structure and wording to support adding shared memory like
  vmclock [2].

- Add dedicated clock types for UTC leap second smearing (David
  Woodhouse).

- Extend leap second indications.

- Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.

- For Arm Generic Timer, only support Virtual Count Register (David
  Woodhouse).

- Rename MONO clock to MONOTONIC clock.

- Harmonize bit widths with vmclock [2].

- Change formatting.

v4:

- Distinguish UTC clocks with and without leap smearing (David
  Woodhouse).

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

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0e136d436ded817c0aade72efdefa56a00b4e5e
[2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/


Peter Hilber (4):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature

 conformance.tex                         |    2 +
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1117 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1151 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: a9b942e043d20d24e0be56ddd4e0515133ed652a
-- 
2.43.0

