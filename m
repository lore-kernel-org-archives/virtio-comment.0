Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6667F24EA86
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902466; cv=none; b=p1nNelcGwZ905wd9t52TXH4MAM9lqhkxGeWHr5/+0N3QgQCvu0iTsWBPIp0esFywDZ5ptsscbsfBPDcnGVHCW82637+BwcID6b5dvSxqLCqqw9hmWANifEYUXPGIu2DkupB+sRsXpXoRZ1Vpmcyl63GxIKREZjEQZvsFjqBT6TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902466; c=relaxed/simple;
	bh=kZstn4yDkVXrG7tB8EICta5fraMwb/PEVW19M231m60=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG38EBVukHFyrhRXBUUGtho+RvpaxIrpNeh1TbLBikmC+/2qxlMt3XG24eXwMBIUZ8WGBCIJB+leUBeU6yhikZ90VwXV6mRB6rQRuitHChxYfrmULgOkR9nuZ3kYAlAbhdiORqPkqcjbXnOQu7ck+8nDWLqS5QUg5tFAfSXiIH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d91HSA8U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d91HSA8U"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClO44008161;
	Thu, 17 Apr 2025 15:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iXIdo9rv/i4zhL2C8Iy7a2os
	291FzgQGejdlONvgSq0=; b=d91HSA8UP3Bm0sqfeHtR8c7iY6+GyFubFdxD1skr
	UEOPAINeAwH5hoJJQwdM/3MDH3CQ8de8GEtfgoe3nbDvJJyM4AhzdCr1czRTd/1G
	fPCMGewVFZTR+20In6IjUxjz2sZmv1mqCr7eI0VfRDnjR/DWNDktm3hffUg8Bl7T
	m85AHer7DpYnKNUzKgm93KUemFweH4cZty0VMlkiL/4Q5EgZ78ZmNLTE8LWuP0P6
	D/eqYD25DoQhEiFsM5QtCstk2wmV7AknU0M2oFqp/PjXoLXh7IbGJ+Tn/2i7LJii
	XAS3saSyR/Z7zt4cEkfxPeTzGkidnzG01j0D1CyJDHhvow==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk77u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:07:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HF7ck8017284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:07:38 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 08:07:36 -0700
Date: Thu, 17 Apr 2025 17:07:33 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <avjwpepc72sivjwl4gvhedxhrspdmgdxstc5kjibwtkabybfst@kihtarztiyq3>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-5-quic_philber@quicinc.com>
 <Z/+fLOJwadLkbaYZ@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z/+fLOJwadLkbaYZ@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=6801193a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Zfv0Wm2LvtRo1WlR198A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EacSrIfB05SCPm_u1fbr05avRwyTk9Fb
X-Proofpoint-ORIG-GUID: EacSrIfB05SCPm_u1fbr05avRwyTk9Fb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170113

On Wed, Apr 16, 2025 at 02:14:36PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Thu, Mar 06, 2025 at 10:51:12AM +0100, Peter Hilber wrote:
> > Add the normative statements for the alarm feature added previously.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
> >     v8:
> >     
> >     - Explicitly describe alarm enabled status, where relevant (Matias
> >       Ezequiel Vara Larsen).
> >     
> >     - Simplify requirement about clock readings after alarm (Matias Ezequiel
> >       Vara Larsen).
> >     
> >     - Move requirements to serve alarm expiration events before requirements
> >       about stopping to serve (Matias Ezequiel Vara Larsen).
> >     
> >     - Change word order from "field X" to "the X field" (Matias Ezequiel
> >       Vara Larsen).
> >     
> >     - Change word order from "flag X" to "the X flag" or "X".
> >     
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
> >  device-types/rtc/description.tex        | 150 ++++++++++++++++++++++++
> >  device-types/rtc/device-conformance.tex |   4 +
> >  device-types/rtc/driver-conformance.tex |   2 +
> >  3 files changed, 156 insertions(+)
> > 
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index 93bcf178b042..91afae7c2110 100644
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
> > +
> 
> I think you can remove `can` here.

I think there was already a discussion about this for v7. My argument
was that "supports setting an alarm" is only the case if the feature is
actually negotiated, and that this interpretation is consistent with the
wording in the rest of the device specification. What do you think?

> 
> >  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> >  
> >  There is no configuration data for the device.
> > @@ -712,6 +717,11 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> >  specification, the device MUST use the nanosecond as unit for the
> >  \field{clock_reading} field.
> >  
> > +If the device sent an alarm notification for clock C with alarm time A,
> > +the device MUST, for all read requests of C which the driver marks as
> > +available after the notification, return a \field{clock_reading} which
> > +does not precede A (except if C stepped backwards to before A).
> > +
> >  \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> >  
> >  Through the optional alarm feature, the driver can set an alarm time. On
> > @@ -819,6 +829,76 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
> >  To prevent the above issues, the driver also marks buffers in the alarmq
> >  as available only after completing the above steps for all clocks.
> >  
> > +\devicenormative{\paragraph}{Alarm Operation}{Device Types / RTC Device / Device Operation / Alarm Operation}
> > +
> > +The device MAY retain both alarm time and alarm enabled status of a
> > +clock across a device reset.
> > +
> > +If the device did not retain alarm time and alarm enabled status of a
> > +clock across a device reset, the device MUST initialize alarm time to 0.
> > +
> > +If the device did not retain alarm time and alarm enabled status of a
> > +clock across a device reset, the device MUST disable the alarm.
> > +
> > +If VIRTIO_RTC_F_ALARM was negotiated, the device MUST support the alarm
> > +messages, VIRTIO_RTC_REQ_READ_ALARM, VIRTIO_RTC_REQ_SET_ALARM,
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, and VIRTIO_RTC_NOTIF_ALARM, for one or
> > +more clocks.
> > +
> > +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST NOT support the
> > +alarm messages.
> 
> `has been negotiated ...` I think there are others below.

Do you propose s/was not negotiated/has not been negotiated/? Or also to
avoid negations?

Thanks for the comments,

Peter

> 
> > +
> > +The device MUST set the VIRTIO_RTC_FLAG_ALARM_CAP flag in \field{struct
> > +virtio_rtc_resp_clock_cap.flags} if the respective clock supports alarm
> > +messages, and clear the flag otherwise.
> > +
> > +The device MUST consider it an alarm expiration event when the
> > +associated clock progresses (also: steps) from a time prior to the alarm
> > +time to the alarm time, or to a time after the alarm time, while the
> > +alarm is enabled.
> > +
> > +The device MUST consider it an alarm expiration event when the
> > +driver sets an alarm time which the associated clock has already reached
> > +or passed, while also setting the alarm to enabled.
> > +
> > +The device MUST consider it an alarm expiration event when the driver
> > +sets the alarm to enabled, if the clock has already reached or passed
> > +the alarm time.
> > +
> > +If the device retained alarm time and alarm enabled status of a clock
> > +across a device reset, and the clock has already reached or passed the
> > +alarm time, the device MUST consider this device reset an alarm
> > +expiration event, if the alarm is enabled.
> > +
> > +If an alarm expiration event E happens, the device MUST start serving
> > +the alarm expiration event E.
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
> > +
> > +If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST stop
> > +serving any previous alarm expiration event for C before the device
> > +marks the message as used.
> > +
> > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > +stop serving any previous alarm expiration event for C, within a grace
> > +period.
> > +
> > +If an alarm expiration event happens for clock C, the device MUST stop
> > +serving any previous alarm expiration event for C, within a grace
> > +period.
> > +
> >  \paragraph{Alarm Control Requests}
> >  
> >  If VIRTIO_RTC_F_ALARM is negotiated,
> > @@ -913,6 +993,59 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
> >  
> >  \end{description}
> >  
> > +\drivernormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> > +
> > +For VIRTIO_RTC_REQ_SET_ALARM and for any clock type listed in this
> > +specification, the driver MUST use the nanosecond as unit for the
> > +\field{alarm_time} field.
> > +
> > +\devicenormative{\subparagraph}{Alarm Control Requests}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> > +
> > +If VIRTIO_RTC_F_ALARM was not negotiated, the device MUST set status
> > +VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
> > +VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
> > +
> > +If the clock does not support alarm messages, the device MUST set status
> > +VIRTIO_RTC_S_ENODEV for VIRTIO_RTC_REQ_READ_ALARM,
> > +VIRTIO_RTC_REQ_SET_ALARM, and VIRTIO_RTC_REQ_SET_ALARM_ENABLED.
> > +
> > +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
> > +\field{alarm_time} field to the alarm time.
> > +
> > +For VIRTIO_RTC_REQ_READ_ALARM, the device MUST set the
> > +VIRTIO_RTC_FLAG_ALARM_ENABLED flag in the \field{flags} field if the
> > +alarm is enabled, and clear the flag otherwise.
> > +
> > +For VIRTIO_RTC_REQ_READ_ALARM and for any clock type listed in this
> > +specification, the device MUST use the nanosecond as unit for the
> > +\field{alarm_time} field.
> > +
> > +For VIRTIO_RTC_REQ_SET_ALARM, the device MUST accept any
> > +\field{alarm_time} value.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> > +the device MUST set the alarm time to the time represented by the
> > +\field{alarm_time} field.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> > +the device MUST enable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is set
> > +in the \field{flags} field.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for VIRTIO_RTC_REQ_SET_ALARM,
> > +the device MUST disable the alarm if VIRTIO_RTC_FLAG_ALARM_ENABLED is
> > +cleared in the \field{flags} field.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST enable the alarm if
> > +VIRTIO_RTC_FLAG_ALARM_ENABLED is set in the \field{flags} field.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST disable the alarm if
> > +VIRTIO_RTC_FLAG_ALARM_ENABLED is cleared in the \field{flags} field.
> > +
> > +If the device sets status VIRTIO_RTC_S_OK for
> > +VIRTIO_RTC_REQ_SET_ALARM_ENABLED, the device MUST retain the alarm time.
> > +
> >  \paragraph{Alarm Notifications}
> >  
> >  If the alarmq is present, the driver should make buffers available in
> > @@ -948,3 +1081,20 @@ \subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Ope
> >  
> >  \field{clock_id} identifies the expired alarm through its associated
> >  clock.
> > +
> > +\drivernormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> > +
> > +If VIRTIO_RTC_F_ALARM was negotiated, the driver SHOULD populate the
> > +alarmq with buffers.
> > +
> > +The driver MUST allocate enough space for any alarmq message in the
> > +device-writable part of an alarmq buffer.
> > +
> > +If the driver receives a VIRTIO_RTC_NOTIF_ALARM notification, the driver
> > +SHOULD read the associated clock instead of assuming that the alarm time
> > +which the driver set last has been reached.
> > +
> > +\devicenormative{\subparagraph}{Alarm Notifications}{Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> > +
> > +The device MUST NOT send a VIRTIO_RTC_NOTIF_ALARM notification for a
> > +clock which does not support alarm messages.
> > diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
> > index 4303cd450542..705691a7319f 100644
> > --- a/device-types/rtc/device-conformance.tex
> > +++ b/device-types/rtc/device-conformance.tex
> > @@ -3,7 +3,11 @@
> >  An RTC device MUST conform to the following normative statements:
> >  
> >  \begin{itemize}
> > +\item \ref{devicenormative:Device Types / RTC Device / Feature bits}
> >  \item \ref{devicenormative:Device Types / RTC Device / Device Operation}
> >  \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
> >  \item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
> > +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation}
> > +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> > +\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> >  \end{itemize}
> > diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
> > index 689c18d158d0..a87c4cde99c2 100644
> > --- a/device-types/rtc/driver-conformance.tex
> > +++ b/device-types/rtc/driver-conformance.tex
> > @@ -6,4 +6,6 @@
> >  \item \ref{drivernormative:Device Types / RTC Device / Device Operation}
> >  \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
> >  \item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
> > +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Control Requests}
> > +\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Alarm Operation / Alarm Notifications}
> >  \end{itemize}
> > -- 
> > 2.43.0
> > 
> 
