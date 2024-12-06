Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D61DDA3A
	for <virtio-comment@lists.linux.dev>; Fri,  6 Dec 2024 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478527; cv=none; b=jZx5QjXGTzR3FIpeDxz8k9gzSHsEdviYxPV7mYugTFi8Q1LJgO4rKaaXWsh+fMKC+wWNjdzIe+ig5EaLC808TznsGIrVgKs4JHXcOKIl7s+gRc/VMJcgSQ95W+91wQIlB/pCYHauO4+DXmTMjp2U8buh2WuXkojFYUmYowflYlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478527; c=relaxed/simple;
	bh=MmrAAJsoaHqMNNsLDSHUgyQzZV4StPKthEU5AHzCccw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iBL1yf7HUETLMvzWMdbKRItDsCdcg5p4twXSaTYo4whuVCeVk3xptVDSlPRY1Vg6NdnQm3e35qwh+VliZpZ0GDeQFYh88HmDl00CBnbS2GB1F3391asRC4v3Ots9hCXe+5xrx/OOxeayHyjedIA+Na6J4jwErt62K+h/RruSvgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZwoiKCSp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZwoiKCSp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67aQjj003720;
	Fri, 6 Dec 2024 09:48:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PDptMHsZ5d0mFx7hDYIcWJ
	dZJxSD/M2gVNAowktcmvE=; b=ZwoiKCSpJPejsLhZ2wXMdT4w4a/0rCYqZRcax0
	6lz5TsVh/tVoSmt7XEysnWxleJO5gSw3VJhWAkxfxbYS5V6QCbD/Hh73P6gVIHC3
	KIdh05k/PH/u9S+hjqr+ddWvOgUIO4ikQDyirSwn0RFZoBxk2fX1oZPlu9SMfUgu
	L6GgvZTJLiG7BIHo8vrG5URM9SQZ0zjJ66chwBn+L4WTevowrvdXE7FOT1veiPgk
	ym2LVx7S2DZ+R2GdJGD5HXaEFefw2igdq/vSxbR4/iFkl9+WSHEnwFSfaR+zXmVz
	cOiAZ/or5XtVkCISwDgv650GY9KrDS8itU7EK+9u+j9DOoLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kkepn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 09:48:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B69mdAr032203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 09:48:39 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 01:48:36 -0800
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
Subject: [RFC PATCH v6 0/4] virtio-rtc: Add device specification
Date: Fri, 6 Dec 2024 10:48:15 +0100
Message-ID: <20241206094819.858-1-quic_philber@quicinc.com>
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
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ui9U3ZViYI4t0gA5QcZrqmKv27Ix_FwQ
X-Proofpoint-GUID: ui9U3ZViYI4t0gA5QcZrqmKv27Ix_FwQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060071

This iteration of the virtio-rtc RFC spec revises the leap second
support some more. In cases where leap seconds are smeared (or might be
smeared), the driver might not care about the particular smearing
algorithm, and the time during which smearing will be applied.
Therefore, make the leap second status information optional for such
clocks. The compatibility with vmclock [3] is not affected.

Summary
-------

The RTC (Real Time Clock) device provides information about current
time. The device can provide different clocks, for the UTC or TAI time
standards, or for physical time elapsed since some past epoch. For UTC
clocks, the device can also indicate leap seconds and how they are
handled. The driver can read the clocks with simple or more accurate
methods. Optionally, the driver can set an alarm.

Changelog
---------

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


Peter Hilber (4):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature

 conformance.tex                         |    2 +
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1427 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1461 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: b2990c8a6642e696d6f269d1db991b2c928d3a9f
-- 
2.43.0

