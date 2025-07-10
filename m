Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0889222330F
	for <virtio-comment@lists.linux.dev>; Thu, 10 Jul 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138962; cv=none; b=R8Ug316Uy1WWTwygmYKIhnB2NQOzOazX72BbxAjQ17CbRSNPYIGhPMXVyAIBCYNTn4Sl+lqR940zzwG4g5KgKh5Vi5OiK4XK+oTrx5xKw42rZQaAJW91giiuQYhPK1vr5BoEgkRAkBqQY1mXa2VmLuvLFd2Z1dhLo2zi7m9DS2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138962; c=relaxed/simple;
	bh=VRlRuFYe0nNTF1FF+kH2iRB4YhV15IfrzF41KJpsdmM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XffxwzsNA2ZTeU49t73qSAqzW6HUR29y/IQVQIsJw518TTCHEdX07w2n7RpluPZQKXGkNqcI850FXXO0h+/gi7JUz5izusD3v8CeFy+KVdt5Hyunz6C1onypSGrrg94qbJlIL9EeTbRSDuTZCq/ShXUTcuTTeHF5Y3u4f/4G+fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HM1yHhe1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HM1yHhe1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A94ZIe024729;
	Thu, 10 Jul 2025 09:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p5zfu0wIhQbARoeYIrF+wN31
	0tiHbZuVq4i1byqSAws=; b=HM1yHhe117vnrgKcZ9LFy7I9it+i3zxUOFESw8BN
	7hrrAeitF23odujPgOxGxkQ+ARmxyRB0P8dwcIcxmzEHjUUbx4+KTyQzved3DPbe
	EtxZzjJm6a/gITFiRkibto6b5RBEOoq+WVSf0Al4bq1q/fkgkemxK/xtUpknLxK1
	hNV4KiOkC2yk9rsDAx4tfAMhHKxd4DTSxhBN61Pd7OEcYXx89pkKPaRv2mb90T8y
	WRpRxc5QhL9OXYXQuw0PRc9mrqIzPBCESFu33QZ4l5GirYI0lGEAgY14Rvl0bbyB
	9qiEofy69o5PMbyf4JoeYfbKS24HvdPFd9z8p1Mwi/7Ixw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbembt6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:15:57 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A9FvbJ009977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 09:15:57 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 10 Jul 2025 02:15:55 -0700
Date: Thu, 10 Jul 2025 11:15:49 +0200
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
	<mst@redhat.com>
Subject: Re: [PATCH v10 0/4] virtio-rtc: Add device specification
Message-ID: <phgvo46gljk6ck55n776cl2q3xdja3d6j4jyx3zjrkla7tch4b@7wcxe5djpujt>
References: <20250710090648.1711-2-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250710090648.1711-2-quic_philber@quicinc.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXw33gNiqaVtmm
 awfFSADRMFNCRlemHxymQ0S63Z1qBuG4raQAHugoIu4P6BIkW6ZdvxOBrFTAU7VaMdUHDtP3FSh
 tZOdbAYtWQUdJ4XZjUk5PwQ2wPJwwykZ1ESrHKUxmo1NgVEwYqCDZA/P0QHB3z3a/n6JACSkGaR
 2Nd+iE2Qf3JaVBk3jLqPwpz9GoD3aDZdvcrQsXda+roWxszWfjZebRtnSkhxaQ2BUlrM9W+xQLz
 ngFaKa1gU8otxo7T96QwJWiLqJwT0EXoICpKzw8KXwF0NZ+MMBamzUb/8mIlqpkQhlY2RHNy4wa
 MlU5X6S7nOSWuxiC4zaiE64baozF7kS9vWTnvKLKFjwd0v1pz/3qFsb/vdmLWrdFNTqT+x2pimb
 TESDsCT1Tb1alWfbD1ijJdfOTwVhGNbXjXbdvmnsEHzMY6t3F1U7VZu/tNTdXc408+NDXoZx
X-Proofpoint-GUID: 0JQr5Pb1dkzyumZ0Mejf7vCtPP-ibJen
X-Proofpoint-ORIG-GUID: 0JQr5Pb1dkzyumZ0Mejf7vCtPP-ibJen
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=686f84cd cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=GTCM9GiCoy53ecsFyEIA:9 a=CjuIK1q_8ugA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100079

On Thu, Jul 10, 2025 at 11:06:45AM +0200, Peter Hilber wrote:
> This iteration of the spec fixes merge conflicts with the recently merged
> virtio-media device and adds two missing entries in the Conformance
> section.
> 
> Summary
> -------
> 
> The RTC (Real Time Clock) device provides information about current
> time. The device can provide different clocks, for the UTC or TAI time
> standards, or for physical time elapsed since some past epoch. For UTC
> clocks, the device can also indicate how leap seconds are handled. The
> driver can read the clocks with simple or more accurate methods.
> Optionally, the driver can set an alarm.
> 
> The driver-side timekeeping can synchronize precisely to a local clock
> exposed by the RTC device. If supported by the device, the driver can
> obtain a cross-timestamp from the local clock and the system hardware
> counter, in a way similar to the Linux kernel ptp_kvm driver [1].
> 
> The alarm allows the driver side to be woken up from a sleep state at a
> specific time.

Could you please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/221

Apparently no ballot has been opened for v9. I am now requesting one for
the v10 (with changes as mentioned at the top).

Best regards,

Peter

> 
> Changelog
> ---------
> 
> v10:
> 
> - Add RTC clauses to the "Conformance Targets" section.
> 
> - Fix merge conflicts with recently merged virtio-media device.
> 
> v9:
> 
> - Add motivation to cover letter (Michael S. Tsirkin).
> 
> - Allow more implementation-specific behavior when alarm actions become
>   obsolete (Matias Ezequiel Vara Larsen).
> 
> - Define how device should not change across resets (Michael S. Tsirkin).
> 
> - Document that device converts hardware counter value, accounting for
>   device/driver differences in offset/multiplier (Michael S. Tsirkin).
> 
> - Restrict implementation-specific id ranges to experimental
>   implementations (Michael S. Tsirkin).
> 
> - Mandate that only flags allowed by negotiated features may be accessed
>   (Michael S. Tsirkin).
> 
> - State that an error-free device sets status OK for all requests from a
>   well-behaved driver (Michael S. Tsirkin).
> 
> - Change name to "Real Time Clock" in device type list (Michael S.
>   Tsirkin).
> 
> - Remove unneeded requirement about what to put into device-readable
>   buffers (Matias Ezequiel Vara Larsen).
> 
> - Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen,
>   Michael S. Tsirkin).
> 
> - Move fixes which were mistakenly placed in patch 2 in v8 (Cornelia Huck).
> 
> - Remove statement implying that device MUST NOT check that reserved fields
>   are zero.
> 
> v8:
> 
> - Explicitly describe alarm enabled status, where relevant (Matias Ezequiel
>   Vara Larsen).
> 
> - Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen).
> 
> - Drop unnecessary or redundant requirements (Matias Ezequiel Vara Larsen).
> 
> - Change word order from "field X" to "the X field" (Matias Ezequiel Vara
>   Larsen).
> 
> - Change word order from "flag X" to "the X flag" or "X".
> 
> - Move requirements to serve alarm expiration events before requirements
>   about stopping to serve (Matias Ezequiel Vara Larsen).
> 
> v7:
> 
> - Remove leap second and performance indications from struct
>   virtio_rtc_resp_read_cross. Remove backing definitions.
> 
> - Move wording change which was mistakenly placed in last patch to first
>   patch.
> 
> v6:
> 
> - Make leap second status information optional if the clock smears (or
>   might smear) leap seconds.
> 
> - Do not use union for leap second indication.
> 
> - Improve wording.
> 
> - Refer to the new POSIX.1-2024 for UTC epoch definition.
> 
> v5:
> 
> - Change structure and wording to support adding shared memory like
>   vmclock [2].
> 
> - Add dedicated clock types for UTC leap second smearing (David
>   Woodhouse).
> 
> - Extend leap second indications.
> 
> - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> 
> - For Arm Generic Timer, only support Virtual Count Register (David
>   Woodhouse).
> 
> - Rename MONO clock to MONOTONIC clock.
> 
> - Harmonize bit widths with vmclock [2].
> 
> - Change formatting.
> 
> v4:
> 
> - Distinguish UTC clocks with and without leap smearing (David
>   Woodhouse).
> 
> - Add UTC leap second and TAI offset indication (David Woodhouse).
> 
> - Add clock performance information (David Woodhouse).
> 
> - Drop distinction of Arm Generic Timer virtual and physical counter.
> 
> - Change requirements so that driver can reset alarm to clean slate, and
>   document how driver can achieve this (Cornelia Hell, Jason Wang).
> 
> - Device should assume that driver reads clock from first vCPU (David
>   Woodhouse).
> 
> - Driver should read clock to confirm that alarm has expired.
> 
> - Require driver to set unused flags to zero.
> 
> - Require device to support all expressible alarm times.
> 
> - Formatting and wording improvements.
> 
> v3:
> 
> - Address comments from Parav Pandit.
> 
> - Add an optional alarm feature.
> 
> - Various other changes.
> 
> v2:
> 
> - Address comments from Cornelia Huck.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a0e136d436ded817c0aade72efdefa56a00b4e5e
> [2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> 
> 
> Peter Hilber (4):
>   virtio-rtc: Add initial device specification
>   virtio-rtc: Add initial normative statements
>   virtio-rtc: Add alarm feature
>   virtio-rtc: Add normative statements for alarm feature
> 
>  conformance.tex                         |   12 +-
>  content.tex                             |    3 +-
>  device-types/rtc/description.tex        | 1117 +++++++++++++++++++++++
>  device-types/rtc/device-conformance.tex |   13 +
>  device-types/rtc/driver-conformance.tex |   11 +
>  introduction.tex                        |    6 +
>  6 files changed, 1157 insertions(+), 5 deletions(-)
>  create mode 100644 device-types/rtc/description.tex
>  create mode 100644 device-types/rtc/device-conformance.tex
>  create mode 100644 device-types/rtc/driver-conformance.tex
> 
> 
> base-commit: c5e5810cb6cb48b673bd3247eb48490d29b1e0fb
> -- 
> 2.43.0
> 
