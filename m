Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C65B194A74
	for <virtio-comment@lists.linux.dev>; Thu, 23 Jan 2025 10:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627403; cv=none; b=ZNntGuyc5GGDmrgY218LoYHAegQjTFpV72+D0emcP1NoiFIQQX5U57DVqjiGs82DDqhmlwTfQ1f6hMEbp6hANfKBXKmtlxRBxGs75fJsW0m3DDS5UE+iRxlm9O69iWlhzSHGpLws+5dj5FqkzHVw7e/p5PzNpJ5xekReqqOalzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627403; c=relaxed/simple;
	bh=MXQpYBb+N2kuv6BW2oRsEjkmvW4LfskZjPLDHjCl/ng=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MxagETSq3EC0DT+hYgrzoTtTFTmdlEycAQT+kxFOP4r7oVB8DdgWe3hM/3F4IvheC/9P7qhVLJ28R6nf/c0FnKKz5rmENU72Pym6zr4rLZx5wZhmNrFKDAqJi+S0ax2v6HQaFkSXGqlCh599q3r4ZTyTkuPZVVlAAqdK9AN9hPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=N1/QJLuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="N1/QJLuE"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N434FG015732;
	Thu, 23 Jan 2025 10:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NV/Faw1Sf2MNbqNpsM6Qhx
	l9EmrBgw/cPjwp2p1OOUQ=; b=N1/QJLuEnTbHib8ZacCAkjAOnpV6QaO6MdrPK7
	v6cW63rVk1NEy5VMn5ZOIu1cCZhgvfRAkd/oX9uf7MuhPT0/LPrTVdYLGKkhMrAI
	EbLprC/4ywYyznR09SFMMqc2oFDoOxn/j+MblMuHro4ZQRZt8LmoGBZmQOnpO+gZ
	W8xUUr5Y7kh96Y9tWkVt72tQ9fG4xoV7YqK68nfUBjaN+Izpp251bQyhYdrSEvyh
	RjN0UtyUm/rOpSVI+zxqblVw+tua/XKZFWazDuk3lVEyscDhfY9nRyRtKVNUr0j5
	Y9yiZLxZozEwxoM8g4r6AS71Pm/qSuXEXIWsnblGU9MOlk7Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bed38t8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:16:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50NAGZ1w031959
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 10:16:35 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 02:16:32 -0800
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa
 Vaddagiri" <quic_svaddagi@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [PATCH v7 0/4] virtio-rtc: Add device specification
Date: Thu, 23 Jan 2025 11:16:11 +0100
Message-ID: <20250123101616.664-1-quic_philber@quicinc.com>
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
X-Proofpoint-GUID: NjcNjEd27KT9i7BRQXVEXrVWyLXeh88d
X-Proofpoint-ORIG-GUID: NjcNjEd27KT9i7BRQXVEXrVWyLXeh88d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501230078

This iteration of the virtio-rtc spec removes the indication of leap
second status and performance metrics. The reason for this is that the
Linux kernel driver lacks a good interface to expose this information to
user space (and an attempt to add one [4] was rejected). The
compatibility with vmclock [3] is not affected.

This iteration also drops the "RFC", since the remainder of the spec did
not change significantly lately.

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
 device-types/rtc/description.tex        | 1118 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1152 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
-- 
2.43.0

