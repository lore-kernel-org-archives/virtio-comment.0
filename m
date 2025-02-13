Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483323A9AE
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470480; cv=none; b=ZwYoa4cP11wd3MbfbsUyllaMqitPXSrq3IR7HDc0YejqusjNmmRE72av/a0VKJ4FYrxQRFhF9ujf6bDhRPaY6EKlhMcyQkgT5Zj9Et56ZnFr4JxjZCXfsn+OKbBVrAyx45opFoOHYVXaA8VFGmZlN9fL2FUnqccPeGU++Ml62WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470480; c=relaxed/simple;
	bh=MZIU56kAfq7b3d6VVBOI37hEnA4LF2hjJs2o/vl39+g=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyxdMdSMgE+xH/2RZOgxs8iCM+fqGssXe18gCcbq3f0cc5leoTZemlUHhUZ5hmbeTCvA+uf/pnu8FX4ejKPKgDjQ0HZ7W4NW9jcQg+70GJ5Bf74khbTv6n1fWBC58ynzGF4Do/2a7Nn/fVKjCuOfKOEepj5le780sj4M1J/HzE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cwEuEJZY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cwEuEJZY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGu1fL008278;
	Thu, 13 Feb 2025 18:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kNVdlPhSYaxScurSsQ55Zkrd
	X55bqafWAA3FT+AJ48g=; b=cwEuEJZYhii88uPcn49RexOHoOlRkY5txMc7c5gb
	Af5OtkAAdItDUh2HM74niCM6yglwsL8CLH6O6WPp+/AgKcJBjobc0aeg86m5R8+j
	kNpNMWCU1NF/H761K3vhtz9JzMXZhU1C3OOQTApMfhlEaVOPP9lwhp4wKGpN4j/n
	1N0uVwGyVxC0lwAgRKxDMFfvzFBsuffH3w9GSE1bKeNMJTxgKeVPNu9Uztyqa9lN
	OVAWgIfr29upCGLjnzkrjJrAXaEZPFMc//3suCPXy6Q74oiLM6tuPsr9YXFXRdAS
	967AN91mhHBupoR3kxebm6khvKXLjEG+qcVZkKTBcmiyhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbs6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:14:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DIEZAm012600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:14:35 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 10:14:32 -0800
Date: Thu, 13 Feb 2025 19:14:30 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>
Subject: Re: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6tDpi07Pyk+Xjzi@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2Maub23KAVsWgpLN0VgSXFvXeK4wlBWW
X-Proofpoint-GUID: 2Maub23KAVsWgpLN0VgSXFvXeK4wlBWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130129

On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > Add the normative statements for the alarm feature added previously.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
> >     v7:
> >     
> >     - Remove inadvertent v6 changes, which should have been part of
> >       preceding patches.
> >     
> >     v4:
> >     
> >     - Update normative statements to match v4 changes to non-normative
> >       statements (patch 3).
> >     
> >     - Driver should read clock to confirm that alarm has expired.
> >     
> >     - Formatting and wording improvements.
> > 
> >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> >  device-types/rtc/device-conformance.tex |   4 +
> >  device-types/rtc/driver-conformance.tex |   2 +
> >  3 files changed, 163 insertions(+)
> > 
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index 47ad50cd95ca..32fed5f8620f 100644
> > --- a/device-types/rtc/description.tex
> > +++ b/device-types/rtc/description.tex
> > @@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> >  VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> >  alarm for some of the clocks.
> >  
> > +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
> > +
> > +The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
> > +setting an alarm for any of its clocks.
> 
> I think you can remove `can`.
> 

OK.

> > +
> >  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> >  
> >  There is no configuration data for the device.
> > @@ -715,6 +720,12 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> >  this specification, the device MUST use the nanosecond as unit for
> >  field \field{clock_reading}.
> >  
> > +If VIRTIO_RTC_F_ALARM was negotiated, and the device sent an alarm
> > +notification N for clock C with alarm time A, the device MUST, for all
> > +read requests of C which the driver marks as available after the device
> > +marked N as used, return a \field{clock_reading} which does not precede
> > +A, unless C stepped backwards to before A.
> > +
> 
> I wonder if there is a simpler way to rewrite this paragraph. It is a
> bit hard to follow.
> 

Like this?

    If the device sent an alarm notification for clock C with alarm time A,
    the device MUST, for all read requests of C which the driver marks as
    available after the notification, return a \field{clock_reading} which
    does not precede A (except if C stepped backwards to before A).

> >  \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> >  
> >  Through the optional alarm feature, the driver can set an alarm time. On
> > @@ -828,6 +839,79 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
> >  To prevent the above issues, the driver also marks buffers in the alarmq
> >  as available only after completing the above steps for all clocks.
> >  
> > +\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
> > +
> > +The device MAY retain both \field{driver_alarm_time} and
> > +\field{alarm_enabled} of a clock across a device reset.
> > +
> > +If the device did not retain \field{driver_alarm_time} and
> > +\field{alarm_enabled} of a clock across a device reset, the device MUST
> > +initialize \field{driver_alarm_time} to 0.
> > +
> > +If the device did not retain \field{driver_alarm_time} and
> > +\field{alarm_enabled} of a clock across a device reset, the device MUST
> > +initialize \field{alarm_enabled} to false.
> > +
> > +While \field{alarm_enabled} for a clock is true, the device MUST set the
> > +alarm time to \field{driver_alarm_time}.
> > +
> > +While \field{alarm_enabled} for a clock is false, the device MUST act as
> > +if the alarm time was in the future.
> > +
> > +If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
> > +messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
> > +more clocks.
> > +
> > +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
> > +alarm messages.
> > +
> > +The device MUST set flag VIRTIO_RTC_FLAG_ALARM_CAP in \field{struct
> > +virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
> > +messages, and clear the flag otherwise.
> > +
> > +The device MUST consider it an alarm expiration event when the
> > +associated clock progresses (also: steps) from a time prior to the alarm
> > +time to the alarm time, or to a time after the alarm time.
> > +
> > +The device MUST consider it an alarm expiration event when the
> > +driver sets an alarm time which the associated clock has already reached
> > +or passed.
> > +
> > +If the device retained \field{driver_alarm_time} and
> > +\field{alarm_enabled} of a clock across a device reset, and the clock
> > +has already reached or passed the alarm time, the device MUST consider
> > +this device reset an alarm expiration event.
> > +
> > +If an alarm expiration event E happens, the device MUST start serving
> > +the alarm expiration event E.
> > +
> > +If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
> > +serving any previous alarm expiration event for C before the device
> > +marks the message as used.
> 
> What do you mean with serving?
> 

"Serving an alarm expiration event" means 

- executing the corresponding alarm actions, and/or 

- waiting for alarmq notification to become possible.

That execution is defined in the third and fourth requirement quoted
below. Maybe these requirements should be moved above the others. Would
that suffice to clarify?


Thanks for the review,

Peter

> > +
> > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > +stop serving any previous alarm expiration event for C, within a grace
> > +period.
> > +
> > +If an alarm expiration event happens for clock C, the device MUST stop
> > +serving any previous alarm expiration event for C, within a grace
> > +period.
> > +
> > +If the device is currently serving an alarm expiration event E, the
> > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > +soon as an alarmq buffer is available for this purpose.
> > +
> > +While the device is serving an alarm expiration event, the device MAY
> > +execute implementation-specific alarm actions.
> > +
> > +The device MAY ignore the device status when executing
> > +implementation-specific alarm actions.
> > +
> > +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> > +executing implementation-specific alarm actions.
