Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D381C6F073
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 18:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470441; cv=none; b=Tq+CNODCt516uvwElMnfCMA/KbmlXKny7kQNx7FhHLQ115KPDmFf3W3htMFEVP4ASqiDbzwbLaeARvZHGHHMuniYsCrZ/iol3VLyrTxkExBpVw1D00Gf2bDw/PtKyv0TF56+OZwuk3pIVjkWNWfbIcA2cUCmO9WmGDKOZQyOmyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470441; c=relaxed/simple;
	bh=IAh1y8Efig7XXDHkesKNzELsqXK7kF0Jl0V/mjX2UWc=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKShm4cuxwLJu5LLoKxDgzM0h/TW/xCHTq2ef6N0SkgOahI/KdgB+ODA+d8f/VAjArUJftt7p9QLFP3Ucp+RQ8Yhwm05Ffq+BWohLFGFPYacpLUb4nSOveQsvDW/JCcxey/gSP65q8Ma8GEQXomNGKTmlbyGPjhkUaJJ61n0lEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RmTc02+X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RmTc02+X"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DGaiv3008261;
	Thu, 13 Feb 2025 18:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g3FJ119rfqgf60dDtxjl87wc
	IYtaeKXLbzUDo3V9zz8=; b=RmTc02+XvSyVWURvvP9exU4Xn2hdH37YOFFX2H1p
	4fa5Bq+aimn3dGOIVtyJMxi52r9YSNzgc7ZnrFn3268d2+xmXjol7G48P9NJuxFs
	d7v1n/FUEWSRFj4QjheQaqcXL0fsaO+1YOL6wkEPOTDiRL8lKw6zvf7NH7bPCjGc
	YeKnKvwRfLhbYzLvP1qHSHW86PKcbwo9V31BT8qGi+/w75ehJVZgeSYgG0f0CKAv
	SsfSEhvdC6gARXXMYb1RewLY46uG/VpV3703K1uLZqM9VVV+jR/JFUzF+DV8QFuh
	2WGPkw4Z1LUrz9o1fNDPALUeS1gbfPXz5pT8KwyVV3ZKDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhbs58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:13:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DIDqUY019271
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:13:52 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 10:13:50 -0800
Date: Thu, 13 Feb 2025 19:13:47 +0100
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
Subject: Re: [PATCH v7 3/4] virtio-rtc: Add alarm feature
Message-ID: <3gos5s6jqul2o5bn26t5ie5b44ernrbk7r262kns5gnma5mvpe@ej3aicxv2jav>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-4-quic_philber@quicinc.com>
 <Z6s52sYSmuhp8M4/@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6s52sYSmuhp8M4/@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: trVKtuzcClkRlBHWjYqRLouqo8xF_4Wi
X-Proofpoint-GUID: trVKtuzcClkRlBHWjYqRLouqo8xF_4Wi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130129

On Tue, Feb 11, 2025 at 12:51:54PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Jan 23, 2025 at 11:16:14AM +0100, Peter Hilber wrote:
> > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> > 
> > The intended use case is: A driver needs to react when an alarm time has
> > been reached, but at alarm time, the driver may be in a sleep state or
> > powered off. The alarm feature can resume and notify the driver in this
> > case. Alarms may be retained across device resets (including reset on
> > boot).
> > 
> > Peculiarities
> > -------------
> > 
> > Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> > autonomously at any time: An alarm may change back from "expired" to
> > "not expired" before the driver has started processing an alarm
> > notification.
> > 
> > To address the above, and the device resets, define "alarm expiration"
> > in such a way that the driver always has a chance to react to an alarm,
> > and make the device always responsible for notifying the driver about an
> > alarm expiration.
> > 
> > The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> > ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
> >     v7:
> >     
> >     - Change flag numeric value due to removing leap second indication.
> >     
> >     v5:
> >     
> >     - Reformat.
> >     
> >     v4:
> >     
> >     - Change requirements so that driver can reset alarm to clean slate, and
> >       document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
> >     
> >     - Require device to support all expressible alarm times.
> >     
> >     - Formatting and wording improvements.
> >     
> >     [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/
> > 
> >  device-types/rtc/description.tex | 270 ++++++++++++++++++++++++++++++-
> >  1 file changed, 268 insertions(+), 2 deletions(-)
> > 
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index 2aefc22cb649..47ad50cd95ca 100644
> > --- a/device-types/rtc/description.tex
> > +++ b/device-types/rtc/description.tex
> > @@ -4,6 +4,7 @@ \section{RTC Device}\label{sec:Device Types / RTC Device}
> >  time. The device can provide different clocks, e.g.\ for the UTC or TAI
> >  time standards, or for physical time elapsed since some past epoch. The
> >  driver can read the clocks with simple or more accurate methods.
> > +Optionally, the driver can set an alarm.
> >  
> >  \subsection{Device ID}\label{sec:Device Types / RTC Device / Device ID}
> >  
> > @@ -13,13 +14,23 @@ \subsection{Virtqueues}\label{sec:Device Types / RTC Device / Virtqueues}
> >  
> >  \begin{description}
> >  \item[0] requestq
> > +\item[1] alarmq
> >  \end{description}
> >  
> >  The driver enqueues requests to the requestq.
> >  
> > +Through the alarmq, the device notifies the driver about alarm
> > +expirations. The alarmq exists only if VIRTIO_RTC_F_ALARM was
> > +negotiated.
> > +
> >  \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> >  
> > -No device-specific feature bits are defined yet.
> > +\begin{description}
> > +\item[VIRTIO_RTC_F_ALARM (0)] Device supports alarm.
> > +\end{description}
> > +
> > +VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> > +alarm for some of the clocks.
> >  
> >  \subsection{Device configuration layout}\label{sec:Device Types / RTC Device / Device configuration layout}
> >  
> > @@ -376,7 +387,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >          struct virtio_rtc_resp_head head;
> >          u8 type;
> >          u8 leap_second_smearing;
> > -        u8 reserved[6];
> > +        u8 flags;
> 
> I wonder if you can just define flags in the first patch instead of
> introduce it here. I think flags field may be used for other purpose in
> the future but I do not have an strong opinion.
> 

Extending the spec by adding new fields in place of reserved array
members should be unproblematic, so I added the field only when
introducing a meaningful flag. Actually, other messages could also get
flags fields in the future (which would only become meaningful if the
respective features are negotiated).

So I propose to not change, since otherwise "flags" fields could
arguably be added all over the place in the first patch.

> > +        u8 reserved[5];
> >  };
> >  \end{lstlisting}
> >  
> > @@ -387,6 +399,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >  variant} through field \field{leap_second_smearing}. All other clocks
> >  set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> >  
> > +The \field{flags} field provides the following information:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
> > +\end{lstlisting}
> > +
> > +If VIRTIO_RTC_F_ALARM was negotiated, flag VIRTIO_RTC_FLAG_ALARM_CAP
> > +indicates that the clock supports an alarm.
> > +
> >  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> >  cross-timestamping for a particular pair of clock and hardware counter.
> >  
> > @@ -693,3 +714,248 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> >  For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in
> >  this specification, the device MUST use the nanosecond as unit for
> >  field \field{clock_reading}.
> > +
> > +\subsubsection{Alarm Operation}\label{sec:Device Types / RTC Device / Device Operation / Alarm Operation}
> > +
> > +Through the optional alarm feature, the driver can set an alarm time. On
> > +alarm expiration, the device notifies the driver. On alarm expiration,
> > +the device may also wake up the driver, while the driver is in a sleep
> > +state, or while the driver is powered off. How this is done is beyond
> > +the scope of the specification. The driver can set one alarm time per
> > +clock, if the clock supports this.
> > +
> > +The device may retain alarm times across device resets.\footnote{Drivers
> > +        may reset the device on boot or on resume from sleep state. It
> > +        can make sense for the device to retain the alarm time then,
> > +        similar to other alarm clocks.}
> > +
> > +The alarm feature, and the associated alarmq for notifications from the
> > +device, are available if VIRTIO_RTC_F_ALARM was negotiated. In addition,
> > +if the driver previously set an alarm time, even if the device no longer
> > +both
> > +
> > +\begin{itemize}
> > +\item is live and
> > +\item has negotiated VIRTIO_RTC_F_ALARM,
> > +\end{itemize}
> > +
> > +the device may still execute implementation-specific actions on alarm
> > +expiration.
> > +
> > +An alarm expires
> > +
> > +\begin{itemize}
> > +\item when the associated clock progresses (also: steps) from a time
> > +        prior to the alarm time to the alarm time, or to a time after
> > +        the alarm time, or
> > +
> > +\item when the driver sets an alarm time which is not in the future, or
> > +
> > +\item when the device is reset, if the alarm time is retained and not in
> > +        the future.\footnote{The device is always responsible for
> > +        detecting alarm expiration events. This avoids that the driver
> > +        needs to reason about when it shall poll for alarm expiration.}
> > +\end{itemize}
> > +
> > +When an alarm expires, the driver can disable it. Otherwise, the alarm
> > +expires each time when one of the above expiration events occurs, even
> > +if it occurred before.\footnote{This avoids that the driver may
> 
> When an alarm expires, the device keeps notifying the driver that the
> alarm has expired? is that implementation-specific?
> 

Devices are not required to retain the alarm across a reset. So whether
an alarm is retained across a reset is unspecified.

Apart from this, there is nothing implementation-specific about when the
device notifies the driver through the alarmq (once after each expiry
event as per the above enumeration).

The expiry events avoid that the driver misses an alarm, or that the
driver needs to implement extra logic to recognize a missed alarm.

As for "keeps notifying", the notification only happens once after each
of the expiry events described above. Real-life drivers will likely
disable the alarm when they first acknowledge the notification,
preventing any further expiry events. The Linux kernel RTC subsystem
does this.

> > +        miss an alarm when the clock steps backwards after alarm
> > +        expiration, but before the driver has resumed operation. This
> > +        also facilitates distinct drivers using the same device,
> > +        e.g.\ a driver in the bootloader, and a driver in the OS.}
> > +
> > +On alarm expiration, the device executes the alarm actions. The alarm
> > +actions are:
> > +
> > +\begin{itemize}
> > +\item The device notifies the driver through the alarmq. If the device
> 
> Do you mean the driver?
> 

No. "The device is live" means that the DRIVER_OK status bit is set (and
the DEVICE_NEEDS_RESET bit is cleared). But the "live" terminology is
apparently not used much outside of "Driver Requirements: Device
Initialization".

Maybe I should write instead "If the device is not operating, or if no
buffers are available [...]".

> > +        is not live, or no buffers are available in the alarmq, the
> > +        device will notify once the device is live and buffers are
> > +        available.
> > +
> > +\item Optionally, the device executes other, implementation-specific,
> > +        actions. The device may execute those immediately, regardless of
> > +        the device state.
> > +\end{itemize}
> > +
> > +An alarm expiration becomes obsolete
> > +
> > +\begin{itemize}
> > +\item once the clock jumps backwards, before the alarm time, or
> > +
> > +\item once the driver sets an alarm time, or
> > +
> > +\item once another alarm expiration event happens.
> > +\end{itemize}
> > +
> 
> This is a minor comment, I think you can use `when` instead of `once` like
> in the paragraph before.
> 

OK.

> > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > +actions the device executes for this alarm expiration, and the device
> > +stops executing these alarm actions after a grace period.
> 
> What is a grace period? You mean that whatever the device does after
> alarm expiration, the device has to STOP doing it after a grace period.
> Am I right?
> 

"[An] alarm expiration becomes obsolete" means that the device should no
longer act according to the alarm (typically because the driver disabled
the alarm, or for one of the other reasons listed in the above
enumeration). In this case, the device must stop the alarm actions as
soon as possible (within a finite grace period). 

Maybe I could rephrase like this?

	If an alarm expiration becomes obsolete as per the above
	conditions, it is unspecified which alarm actions the device
	executes for this alarm expiration, and the device stops
	executing these alarm actions as soon as possible.

> > +
> > +The driver-visible settings of an alarm consist of two elements:
> > +
> > +\begin{itemize}
> > +\item \field{driver_alarm_time}, a valid time for the corresponding
> > +        clock, and
> > +
> > +\item \field{alarm_enabled}, a boolean. While \field{alarm_enabled} is
> > +        true, \field{driver_alarm_time} is the actual alarm time.
> > +        While \field{alarm_enabled} is false, the device will act as if
> > +        the alarm time was in the future, so that the alarm will not
> > +        expire.
> > +\end{itemize}
> 
> Is `alarm_enabled` a field that is device implementation specific?
> 

No. The use of "\field{}" around alarm_enabled is for typographic
purposes, not because it is supposed to correspond to a particular
element in the device implementation. It is unspecified how the device
implements the alarm feature.

The two elements mentioned above describe the state of the alarm in the
device which the driver can set and get through the respective requests.

By overriding driver_alarm_time with an alarm time in an unreachable
future if alarm_enabled is false, the spec does not need to consider the
alarm_enabled state in most places. Most non-normative text and most
requirements just need to refer to "alarm time reached", not to "alarm
time reached and alarm enabled".


Thanks for the review,

Peter
