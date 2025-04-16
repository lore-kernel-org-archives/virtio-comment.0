Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5781F9F73
	for <virtio-comment@lists.linux.dev>; Wed, 16 Apr 2025 14:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744814688; cv=none; b=duKlee9/1CtZ6MRrPhX9mRdM4HicpIvmn2IP4WF4+XjMdFDy4mJ9AX8Aa3fvBwwJ/UXw4tOfe2x5DMIJmRv7a5IQmgTjqCXEVDqikbysdxe2Ox4GJWfqKrFfed0PhmoyuPKpWdu5uddfpcUVwrh7k0yDMvnnDYiZGfX9VT5TSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744814688; c=relaxed/simple;
	bh=BbLUCcFZeQu55tjB9lyv6V6V5kahYCyIk+/Eqn7mP94=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mlLzU/Iw4zGEz0psupHlkTBinD2spR6IBUQYYEgAbJGjtBMTZ5cYIQ5RPvuybzgxqYMgwvYGLzycgMhEeU+d9FXxSy2SYfX6S5px2SusGPv8FSrbrViWr3PKhJYqyxT46qB/X5wAe6KgGn4C1sDwHRc1gAzbXRXtGZ2yWL5l/jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Hin/f/7M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Hin/f/7M"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mG3W003453;
	Wed, 16 Apr 2025 14:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tstVSU1xXELvA6zdtLMgcSH8
	tHa31pQbYG/WgbHh6xY=; b=Hin/f/7MOU+tf45D6IuBRjlerz5BiPxB1m5XfWN5
	0OD/sxPde4drBhiVu7sZw3XqCxAqoPLuwRvo3niNcXIEGrm2VLedF4gZv1wFkiij
	crXy4BJC8hwe5SOlzOXR75433nV/J4Yjp+3LINLB4yHncFdWLLwWXWQThBfmYF1t
	h7QC7jDeXkB6KIvU8CAryt9aNfmOX7K+1dbzGbt68BNflLMCKGyE5NtCYL2BMNOq
	n0Nb3IkipwF0Zp8XicXv+xY/4OaEKv4UDtZ7uwyPn8b1SlwtjfuU7pngvOCLm1O6
	SI3EOyYqYmZMNKNJK+3RfWjIDvOtajdhvVLUPBv3W3pfyQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4628rv92qx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:44:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GEibl1030308
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:44:37 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Apr 2025 07:44:35 -0700
Date: Wed, 16 Apr 2025 16:44:32 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 0/4] virtio-rtc: Add device specification
Message-ID: <o24texxar6qou44fvtul24x7q3ymd7vrq6m4k6kkvgh7rpwvqk@7p44quglxnql>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <Z/+qe+tyH5EGaIXq@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z/+qe+tyH5EGaIXq@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9G2VOrAZhUdTb_z0ydBEDV9jBzNM-TUi
X-Authority-Analysis: v=2.4 cv=RbSQC0tv c=1 sm=1 tr=0 ts=67ffc256 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8 a=JfrnYn6hAAAA:8
 a=COk6AnOGAAAA:8 a=p-8UUv7kwcenDKhPCq0A:9 a=CjuIK1q_8ugA:10 a=YFpLQiK6rFjqGb8m0bXF:22 a=1CNFftbPRP8L7MoqJWF3:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9G2VOrAZhUdTb_z0ydBEDV9jBzNM-TUi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160120

On Wed, Apr 16, 2025 at 03:02:51PM +0200, Matias Ezequiel Vara Larsen wrote:
> Hello Peter,
> 
> I only now had time to share my comments. I could not cover all the
> patches though. These are minor changes. Apologies for the delay.

Hi Matias,

not sure which patches you did not address. I got your replies for all 4
patches. Is it the Linux kernel driver patches?

Thanks for the comments,

Peter

> 
> Matias
> 
> On Thu, Mar 06, 2025 at 10:51:08AM +0100, Peter Hilber wrote:
> > This iteration of the spec should address multiple review findings from
> > Matias Ezequiel Vara Larsen.
> > 
> > Summary
> > -------
> > 
> > The RTC (Real Time Clock) device provides information about current
> > time. The device can provide different clocks, for the UTC or TAI time
> > standards, or for physical time elapsed since some past epoch. For UTC
> > clocks, the device can also indicate how leap seconds are handled. The
> > driver can read the clocks with simple or more accurate methods.
> > Optionally, the driver can set an alarm.
> > 
> > Changelog
> > ---------
> > 
> > v8:
> > 
> > - Explicitly describe alarm enabled status, where relevant (Matias Ezequiel
> >   Vara Larsen).
> > 
> > - Reword multiple sentences and requirements (Matias Ezequiel Vara Larsen).
> > 
> > - Drop unnecessary or redundant requirements (Matias Ezequiel Vara Larsen).
> > 
> > - Change word order from "field X" to "the X field" (Matias Ezequiel Vara
> >   Larsen).
> > 
> > - Change word order from "flag X" to "the X flag" or "X".
> > 
> > - Move requirements to serve alarm expiration events before requirements
> >   about stopping to serve (Matias Ezequiel Vara Larsen).
> > 
> > v7:
> > 
> > - Remove leap second and performance indications from struct
> >   virtio_rtc_resp_read_cross. Remove backing definitions.
> > 
> > - Move wording change which was mistakenly placed in last patch to first
> >   patch.
> > 
> > v6:
> > 
> > - Make leap second status information optional if the clock smears (or
> >   might smear) leap seconds.
> > 
> > - Do not use union for leap second indication.
> > 
> > - Improve wording.
> > 
> > - Refer to the new POSIX.1-2024 for UTC epoch definition.
> > 
> > v5:
> > 
> > - Change structure and wording to support adding shared memory like
> >   vmclock [2].
> > 
> > - Add dedicated clock types for UTC leap second smearing (David
> >   Woodhouse).
> > 
> > - Extend leap second indications.
> > 
> > - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> > 
> > - For Arm Generic Timer, only support Virtual Count Register (David
> >   Woodhouse).
> > 
> > - Rename MONO clock to MONOTONIC clock.
> > 
> > - Harmonize bit widths with vmclock [2].
> > 
> > - Change formatting.
> > 
> > v4:
> > 
> > - Distinguish UTC clocks with and without leap smearing (David
> >   Woodhouse).
> > 
> > - Add UTC leap second and TAI offset indication (David Woodhouse).
> > 
> > - Add clock performance information (David Woodhouse).
> > 
> > - Drop distinction of Arm Generic Timer virtual and physical counter.
> > 
> > - Change requirements so that driver can reset alarm to clean slate, and
> >   document how driver can achieve this (Cornelia Hell, Jason Wang).
> > 
> > - Device should assume that driver reads clock from first vCPU (David
> >   Woodhouse).
> > 
> > - Driver should read clock to confirm that alarm has expired.
> > 
> > - Require driver to set unused flags to zero.
> > 
> > - Require device to support all expressible alarm times.
> > 
> > - Formatting and wording improvements.
> > 
> > v3:
> > 
> > - Address comments from Parav Pandit.
> > 
> > - Add an optional alarm feature.
> > 
> > - Various other changes.
> > 
> > v2:
> > 
> > - Address comments from Cornelia Huck.
> > 
> > [1] https://lore.kernel.org/lkml/61364452-bdf5-4bd8-adb1-a9e6236c9d26@opensynergy.com/
> > [2] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> > [3] https://lore.kernel.org/all/78969a39b51ec00e85551b752767be65f6794b46.camel@infradead.org/
> > [4] https://lore.kernel.org/lkml/20241219204208.3160-1-quic_philber@quicinc.com/
> > 
> > 
> > Peter Hilber (4):
> >   virtio-rtc: Add initial device specification
> >   virtio-rtc: Add initial normative statements
> >   virtio-rtc: Add alarm feature
> >   virtio-rtc: Add normative statements for alarm feature
> > 
> >  conformance.tex                         |    2 +
> >  content.tex                             |    3 +-
> >  device-types/rtc/description.tex        | 1100 +++++++++++++++++++++++
> >  device-types/rtc/device-conformance.tex |   13 +
> >  device-types/rtc/driver-conformance.tex |   11 +
> >  introduction.tex                        |    6 +
> >  6 files changed, 1134 insertions(+), 1 deletion(-)
> >  create mode 100644 device-types/rtc/description.tex
> >  create mode 100644 device-types/rtc/device-conformance.tex
> >  create mode 100644 device-types/rtc/driver-conformance.tex
> > 
> > 
> > base-commit: 124fcd0e97f209aab19639e7369116d99ede22a2
> > -- 
> > 2.43.0
> > 
> 
