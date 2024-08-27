Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF2E1C4600
	for <virtio-comment@lists.linux.dev>; Tue, 27 Aug 2024 13:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724766759; cv=none; b=fKzSgXoBOKsZMFwQFYlBHAj/0ADjQBLZdmtQ31073ymjZuf6qRWS7aEQOtDF9FDXEP23qG2WayW5luS8B2FwBTJUcKwoizU2DTOEgJ7bzU+EAbP0QVrcL/iM7EAVXxNAP0BWt6KkWC9gMabaXngQDoU3Osn+K2GJi01mfaW6TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724766759; c=relaxed/simple;
	bh=rk1MUu9FupyUfsAzml1GjcR4RCRtrXqvYhyvGcxdvks=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G1sET47uBVxZ1rHYSMfPkhJxPK3WZWYeB3xUpLA4INqWE91PLrRxIYLmp4wifOZ8a4yuMbM6zotaWqx5M5Sl8LyNluo8pSlWAVdau912CD3FE2y52lUcb2xHfPCmxL/bnnWMeKUq8MsdbQsEv2mFFsqlKgKFtSgAZVDhTJNBQ7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BSrz+h+X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BSrz+h+X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7kevD002639;
	Tue, 27 Aug 2024 13:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yTMYJvxSgPfjxG+NzNXPVi
	Xvt/uqEnQAEPZYXpzJlNk=; b=BSrz+h+X6KftmEoeWvV7aY42tTy50lA1Ap4qU1
	uRxqD1vqXKrIM8lFYC75BVqZyL9VeJnUSfvMF7AjCbeOV9TkR/dwFYOqsWg5hSv0
	CSAo7UGt8x9B+rkwqLVsKsytnjluuyb/H+Yq8aVnmneJoXMU1xO+0kdWlGkWbUqZ
	WQms6VvdNiP+E1ZUPiFWJDVtyOlZXs75BhsuXcRyYNhjtvFUO6yDfB63DyMbmVUL
	b4zFAQOgMa4zdImGoKqRuWqB/8GKIxxhnhAYuKBAqMHDZvr3+BUzyaEP72DVB2p1
	eH3hc72CKYVH3b6w6VYWrYVIv7zWfaGBJqVZegY2vzZ0p8mg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419aq78yjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 13:52:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RDqPQx011395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 13:52:25 GMT
Received: from PHILBER.qualcomm.com (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 27 Aug
 2024 06:52:22 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <tsoni@quicinc.com>,
        "Srivatsa
 Vaddagiri" <quic_svaddagi@quicinc.com>,
        Peter Hilber
	<quic_philber@quicinc.com>
Subject: [RFC PATCH v5 0/4] virtio-rtc: Add device specification
Date: Tue, 27 Aug 2024 15:51:57 +0200
Message-ID: <20240827135201.1251-1-quic_philber@quicinc.com>
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
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Cyjc_S_4NVQFCWuFyszJGKzXJhneQdpG
X-Proofpoint-ORIG-GUID: Cyjc_S_4NVQFCWuFyszJGKzXJhneQdpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_07,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=929 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408270102

This iteration of the virtio-rtc RFC spec revises the leap second support,
and changes the spec structure to support adding a shared memory like
vmclock [2].

Summary
-------

The RTC (Real Time Clock) device provides information about current time.
The device can provide different clocks, for the UTC or TAI time standards,
or for physical time elapsed since some past epoch. For UTC clocks, the
device also indicates leap seconds and how they are handled. The driver can
read the clocks with simple or more accurate methods. Optionally, the
driver can set an alarm.

Changelog
---------

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
[2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/


Peter Hilber (4):
  virtio-rtc: Add initial device specification
  virtio-rtc: Add initial normative statements
  virtio-rtc: Add alarm feature
  virtio-rtc: Add normative statements for alarm feature

 conformance.tex                         |    2 +
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1397 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1431 insertions(+), 1 deletion(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
-- 
2.43.0

