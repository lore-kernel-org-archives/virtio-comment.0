Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594DB20A5D8
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 09:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741254706; cv=none; b=JZkGtQgLrTBqAlL2UOrWdM2C1APHjzkpkdiH6upSvlo0sCrTM8LKmq03PMCMt803q+CCt3FtaqY50hEAHDIWfTWNRsj1uVimASbNS8gxu1GBOJBw6QlfkJCOAI07F02w7hGj1AdlrduNL3n2DVOzYNSXzHO40/s7GzHP8wmIiqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741254706; c=relaxed/simple;
	bh=NMLAKzy8GECQ8vLbnDpbDEO/FmTvcLP0RLYqDIcJGdY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bDRjrod+jRaUaPMae/iRC0/nqhJvRLoZqf5TCFMUmdexfJYVMzT9xrSCkn12O2nmJ2RDDKxi50M0TIGCGL0s8RbxHAeK+1m6WTsuedDmBjjdqF1aOvopeVXWjT89g0Ia5IsnK8NurX6LfHYe/8fpbfQASbuLp27P/QgC6DRK26Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pFzpIUMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pFzpIUMz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267uSZh028674;
	Thu, 6 Mar 2025 09:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PVBR4wREv04IDv33f2SEdH
	X6LuoE9H4TY5Dgq8LfgxQ=; b=pFzpIUMzW7QocPN8jMegkUtUWJFAbA+xikk/n3
	4rn7kHR68exXYqoGtbfmiMt3dnTGVAfOCidRyJY99Di6/EOXq+ndkXxtudWlNHmV
	UjqWyqUZc+fZ+ziW5r2eD1Ll3uDfvc/6bz8xe5VAX1JWaCNS5aLVK8PEY68edHPe
	ZXXa9pl0oAIF3GLhTlxACwbDp1MldmuNELoQO2F+NFkqGItUv56R3j/bTyfAZrBt
	zqwsKTVqGGBr4d8qbYmyFxMMqqUZio6jrDdOUrun55QwktWYnXV4w9Ul0rJ7b2OL
	PeXgUHTZpAVeFFhfaQUhrxGChOoJOiUb+ihBowxrUvTOW3mQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577rpganj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 09:51:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5269pWI6028474
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 09:51:32 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Mar 2025
 01:51:30 -0800
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
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [PATCH v8 0/4] virtio-rtc: Add device specification
Date: Thu, 6 Mar 2025 10:51:08 +0100
Message-ID: <20250306095112.1293-1-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EYQyQOmC c=1 sm=1 tr=0 ts=67c97025 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8 a=JfrnYn6hAAAA:8 a=COk6AnOGAAAA:8
 a=J1lVTegTR5SQ_eAAGNkA:9 a=YFpLQiK6rFjqGb8m0bXF:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: WQtV47UTC1G7Bc1651uAoc_yfCiWNo9b
X-Proofpoint-GUID: WQtV47UTC1G7Bc1651uAoc_yfCiWNo9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_04,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060073

This iteration of the spec should address multiple review findings from
Matias Ezequiel Vara Larsen.

Summary
-------

The RTC (Real Time Clock) device provides information about current
time. The device can provide different clocks, for the UTC or TAI time
standards, or for physical time elapsed since some past epoch. For UTC
clocks, the device can also indicate how leap seconds are handled. The
driver can read the clocks with simple or more accurate methods.
Optionally, the driver can set an alarm.

Changelog
---------

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

[1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/
[2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
[3] https://lore.kernel.org/all/78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org/
[4] https://lore.kernel.org/lkml/20241219204208.3160-1-quic_philber@quicinc.com/


Peter Hilber (4):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature

 conformance.tex                         |    2 +
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1100 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1134 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
-- 
2.43.0

