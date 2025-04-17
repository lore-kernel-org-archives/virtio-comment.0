Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EFC26289
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902309; cv=none; b=s3ApBQHiym9CoIkXrBBenJv/xVIeIRkGdhDVPyyovKwT/k0D487BhtDoA1xTY8xKwYpVcX3V9bceYAbPqgk033mMkHo4x63b5FmSrd7pP3BThak2/M1DJ0V7SLl6bJoIa9d9lkPYFhg+3XTiMoq7Y3KvNcB8ZtU8KH1p/z0Nbqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902309; c=relaxed/simple;
	bh=ci+yBzcSvpZc1iQ07nc1V52w8lbkgGmkW8K1SlAEUWU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhdhfq3uLPzZ4BRBhHX6SrBd0b/Eh9Gi+jjn7FEA8PHI0Zy3Pjz9XRwUgvXZ8JLZo2p55b3EpF0zRR8fth++vittyExS4AQDazkBDy2qeqmpwqQFTGab82OvWCqMyJluY204hHGB/R6v9RaH7oHnKrqPt89AzFCyaBfRHJzSwdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T8JGy+uu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T8JGy+uu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClVnG005242;
	Thu, 17 Apr 2025 15:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h5PQYqDX3zTuGilrj3UIjA+A
	QlQr4DdxUXT9R21kgYk=; b=T8JGy+uugp7PaWf1DbCsMekBDiY56mgSGBwxv/G/
	gHpvgakzIxC9tNwqOetgAkbyoodlieDrrFQ0j6/wU7nHDXy+o/mm83KZ86gb+ZBx
	gxMaNlEzSDelgUL5qrMmg+kKvtmoXf1d6xbDtM4SFst+67oOPuu9OMUeFt35UykV
	0cJJ+dVCHRtRVPiovXqTiE1uWiGkW4/AQKcSsFRmKnlka2L8nM8kbRb4yI77jbES
	rQiVpF2A9kxZsUsJx4wiqPDGZoZIOq9IClo0eElOMeybp1UppvuliyOBGDJ+Uqt6
	rjnxC9XO6M6rf40to6yLxbN4Jqr+78dZRAYmrB+nRI1QRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69yc1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:05:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HF50lq014448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:05:00 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 08:04:57 -0700
Date: Thu, 17 Apr 2025 17:04:55 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 3/4] virtio-rtc: Add alarm feature
Message-ID: <y2drfbo2cplk5dseuvvzfgm7bywu54beynkgsl4z2sawpc2ybd@ct63vqti2tpz>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-4-quic_philber@quicinc.com>
 <Z/9nnYxbkOcyR131@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z/9nnYxbkOcyR131@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1B_xrudVOgHFHgvNU6JhNyrWui5uLsXH
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6801189d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8 a=COk6AnOGAAAA:8
 a=R-8JJbgf2Oq3ihsDa8wA:9 a=CjuIK1q_8ugA:10 a=YFpLQiK6rFjqGb8m0bXF:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 1B_xrudVOgHFHgvNU6JhNyrWui5uLsXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

On Wed, Apr 16, 2025 at 10:17:33AM +0200, Matias Ezequiel Vara Larsen wrote:
> On Thu, Mar 06, 2025 at 10:51:11AM +0100, Peter Hilber wrote:
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
> >     v8:
> >     
> >     - Explicitly describe alarm enabled status, where relevant (Matias
> >       Ezequiel Vara Larsen).
> >     
> >     - Change word order from "field X" to "the X field" (Matias Ezequiel
> >       Vara Larsen).
> >     
> >     - Change word order from "flag X" to "the X flag" or "X".
> >     
> >     - Change "once" to "when" (Matias Ezequiel Vara Larsen).
> >     
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
> >  device-types/rtc/description.tex | 262 ++++++++++++++++++++++++++++++-
> >  1 file changed, 260 insertions(+), 2 deletions(-)
> > 
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index f2a3907de511..93bcf178b042 100644
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
> > @@ -373,7 +384,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >          struct virtio_rtc_resp_head head;
> >          u8 type;
> >          u8 leap_second_smearing;
> > -        u8 reserved[6];
> > +        u8 flags;
> > +        u8 reserved[5];
> >  };
> >  \end{lstlisting}
> >  
> > @@ -384,6 +396,15 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >  variant} through the \field{leap_second_smearing} field. All other
> >  clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> >  
> > +The \field{flags} field provides the following information:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_FLAG_ALARM_CAP               (1 << 0)
> > +\end{lstlisting}
> > +
> > +If VIRTIO_RTC_F_ALARM was negotiated, the VIRTIO_RTC_FLAG_ALARM_CAP flag
> > +indicates that the clock supports an alarm.
> > +
> >  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> >  cross-timestamping for a particular pair of clock and hardware counter.
> >  
> > @@ -690,3 +711,240 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> >  For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
> >  specification, the device MUST use the nanosecond as unit for the
> >  \field{clock_reading} field.
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
> > +device, are available if VIRTIO_RTC_F_ALARM was negotiated. 
> 
> "If the VIRTIO_xxx has been negotiated, ..."

Like this?

	If VIRTIO_RTC_F_ALARM has been negotiated, the device supports
	the alarm feature and the associated alarmq for notifications
	from the device.

> 
> > In addition,
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
> 
> I think you can add the "when" after "expires" and then remove it
> afterward.

Does this not hurt the legibility of the long sentences?

> 
> > +
> > +\begin{itemize}
> > +\item when the associated clock progresses (also: steps) from a time
> > +        prior to the alarm time to the alarm time, or to a time after
> > +        the alarm time, while the alarm is enabled, or
> > +
> > +\item when the driver sets an alarm time which is not in the future,
> > +        while also setting the alarm to enabled, or
> > +
> > +\item when the driver sets the alarm to enabled, and the alarm time is
> > +        not in the future, or
> > +
> > +\item when the device is reset, if the alarm time is retained and not in
> > +        the future, and if the alarm is enabled.\footnote{The device is
> > +                always responsible for detecting alarm expiration
> > +                events. This avoids that the driver needs to reason
> > +                about when it shall poll for alarm expiration.}
> > +\end{itemize}
> > +
> > +When an alarm expires, the driver can disable it. Otherwise, the alarm
> > +expires each time when one of the above expiration events occurs, even
> > +if it occurred before.\footnote{This avoids that the driver may
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
> > +        is not live, or no buffers are available in the alarmq, the
> > +        device will notify once the device is live and buffers are
> > +        available.
> > +
> > +\item Optionally, the device executes other, implementation-specific,
> > +        actions. The device may execute those immediately, regardless of
> > +        the device state.
> > +\end{itemize}
> > +
> 
> I think that, on alarm expiration, you can remove the optionally part
> and then just talk about alarm expiration thus removing the `alarm
> actions` wording.  

My concern about this is that readers may not understand that alarm
expiration can still have consequences while the device is in reset
state. And the alarm feature mostly makes sense for cases where the
driver is in a sleep state, and where, by consequence, the device may be
in reset state.

> 
> > +An alarm \emph{expiration} becomes obsolete
> > +
> > +\begin{itemize}
> > +\item when the driver disables the alarm, or
> > +
> > +\item when the driver sets an alarm time, or
> > +
> > +\item when the clock jumps backwards, before the alarm time, or
> > +
> > +\item when another alarm expiration event happens.
> > +\end{itemize}
> > +
> > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > +actions the device executes for this alarm expiration, and the device
> > +stops executing these alarm actions after a grace period.
> 
> Can't you leave this paragraph implementation-specific and thus
> removing it completely?

OK.

> 
> > +
> > +The device supports all alarm time values which the driver can request
> > +through alarm control requests.
> > +
> > +Initially, the alarm time is the epoch of the clock ($0$), and the alarm
> > +is disabled.
> 
> I would rewrite it as:
> 
> "Every alarm initializes with an alarm time to 0 and disabled."

To me, this seems grammatically inconsistent. Maybe it could be
rewritten as

	Every alarm initializes the alarm time to 0, and the alarm state
	to disabled.

Still, it seems better to me to not make the alarm a subject which
manages itself, but rather let the alarm (implicitly) be an entity which
is managed by the device. But maybe the epoch does not need to be
mentioned. What about this?

	Initially, the alarm time is 0, and the alarm is disabled.

Thanks for the comments,

Peter
