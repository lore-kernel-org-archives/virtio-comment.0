Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E81F4E4F
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138500; cv=none; b=bPGSn9+wqqxHiX3t2L2yOdtyi77PclXnFkPQHuVeQJdoSKYVhnpeMTGcMbTnFTLHwEsvCvWgnciJHSf6YFxikssPPc+IORCa3bc1AGG4Sg9WtGZJFL20Pc2uOVaPdoKXHcZ6VfQi2MK43LhMOq9eSPZ8sZMHHTQFM7kyduK+XVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138500; c=relaxed/simple;
	bh=OOWGR0VtbBVMS2trozSGnd9S2zfmQbTxxJ+AVibPFYU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uVboSN1BTQ0X74Zd7gsJfHyNKAunO2o1rp9ZAyKRo/6NHQ+erhUtZOtomI6u0EGwPWimlW18aToJL47sbgNFBSSPhNR9CRepgLmmNjjlPxavMElgj6ukavVCkn2mU0cNQHiAOeORTXAjnj3lcffGdmxh5fqieyG/LNZGOSDQXSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PKEuxQlW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PKEuxQlW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8mJFX015336;
	Thu, 10 Jul 2025 09:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=f1iURLLX6LmkKFkrOI/j81
	K1QxYUZDTtsnj71OSv1nc=; b=PKEuxQlWQR11jWg/rt55Zw8GEDEwz0EwLXKX6/
	Og6m6SUJTHEZVrvgYi6MM3bJxds9AgHTaz3r5P2vsWqBEYJV3pfWDWikdUUzaQbo
	WPblw3GQfSIGuTaY1EWzSZqwBRUbpeD+LcW1p8MH7w5ToZGv0oWzhfq95qttEIOB
	msiBrz7XxM907SL9OWZfbMtJHgFMwbGEfiL0trMvxVAUK+exIASokj2vUOZsirJa
	SAohWRBWsSX6H0q8qnhDz+1Z9oJtXtln9mQ3JR1lGJZYveqgUgVhtegtGa2E4Gmo
	0kzdehdt+cvPZUx/LXdKstUZkpoOey5zHrtrnGeAwCqkLdjA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b157w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:11 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A98AeW027695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:08:10 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:08:07 -0700
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
Subject: [PATCH v10 0/4] virtio-rtc: Add device specification
Date: Thu, 10 Jul 2025 11:06:45 +0200
Message-ID: <20250710090648.1711-2-quic_philber@quicinc.com>
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
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=686f82fb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8
 a=rSkwMs5QdVAkfNlAlOwA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3NyBTYWx0ZWRfXymAxy0+zh1Oo
 vpvIvqtQqvLCB01Qg0DuCtukmw69NUPDwGz1TxK7SJvPNGygZghCXeL96ga6rZAxsT8APl/ErWL
 bz/fbHithioizizQbk0q/cCoD/N7y6l+ns4MjFMWsQgdVpdQSCs0qSF5WtFEK+fxw8kaRVccjDe
 xfhiANUE40jypy/KHBp8e51XlOBAhdfD6dwkMVwM882MU6Z7PNele76uk+8Qb1jeaSaR4Cwb8Y3
 7DLnxMy6i1gnZuZjXofLh9YSH1CKIUqTm/sz4hlMZfeHYEc3A7+M9gIQYSPDcxIr+N2wk/i9GzL
 u0UlVFDMq+it7CXjIYwZKP9ZyxRMYtlgdRSRuFZycR+VqvQTaTENCVYD6reg29eXqYqlnWnWT8v
 fXuSdZofBl2Cnx85JIDmY89f/mktf7ytlXNXL/HQ9bnvl8/rQGULUiP2edSMVPr/HwEVgNTt
X-Proofpoint-GUID: TriT_PaSXO_b1NKglP7U20sR-_FusNhx
X-Proofpoint-ORIG-GUID: TriT_PaSXO_b1NKglP7U20sR-_FusNhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100077

This iteration of the spec fixes merge conflicts with the recently merged
virtio-media device and adds two missing entries in the Conformance
section.

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

v10:

- Add RTC clauses to the "Conformance Targets" section.

- Fix merge conflicts with recently merged virtio-media device.

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

 conformance.tex                         |   12 +-
 content.tex                             |    3 +-
 device-types/rtc/description.tex        | 1117 +++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   13 +
 device-types/rtc/driver-conformance.tex |   11 +
 introduction.tex                        |    6 +
 6 files changed, 1157 insertions(+), 5 deletions(-)
 create mode 100644 device-types/rtc/description.tex
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex


base-commit: c5e5810cb6cb48b673bd3247eb48490d29b1e0fb
-- 
2.43.0

