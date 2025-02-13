Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA98923F400
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 18:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470376; cv=none; b=mzTFwyCUkXP5yWBKhmMuaexPkjNjpZBC5aldzfWu65VzRKo/VLaz9DGGAnOVNbEU1ATFhzkVuU2wNE4xD3mktA8Df/mWYUU9M2lvoiZ9+/m36P/4cxFx1cHP/21LcHjDpmvGHr6inWpLSmsUgOkcU36eIr3gNcsGbDAoXkrNwEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470376; c=relaxed/simple;
	bh=OftkpKDTXlTrJ+8QuFC9dRZzZGIslaX8rFEGQyQaXvU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bRXmQzYC4a4zFj8Wi8vqIl8oJEA9woynKfuG36O4P4KPo6+MKqljiWhdSpRzcf3tfo09LxHXZv+PyqU28VwHeMEbvZ7+3eu8uQbKtdhF8PK6X3s8bcXXazjYgiZO38wBBqRSDsf05EZ/DPSuolXU4//IgHvNKsHMqF08OKqWvTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=X/pPaCzY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="X/pPaCzY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D9I4XI021173;
	Thu, 13 Feb 2025 18:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n5EjYrj4EdD6fIOzlEL/WV/l
	7PjxHeZ8LTGVGrI2SGs=; b=X/pPaCzYLTHIJWxYjroblWJsK2gE/PZYjNOWuUTS
	MnnDLm/TFQ8LlpSoYhd3mE/HxmmGuHzUANUbtnhAO9DQrkSmTlm0S8vwCWwBCCgG
	CkerrkY4/Z3pw6Ta/CwKfx2YiMj5fND6FoHkRu7rtVTL6FzLgL6xY800xr1SwIZh
	25iE1Kd2et+W0IHamWEI3Nb6XuOQ9XzYirZff3a8DEB3sW/v+uvLRde7fLlstxiF
	0HZHrDXvnOVhM7EyKoOTtAsdKW8I2OlEwz71t7VRET0OZNb9ItFj7sxBuCJVn91b
	6OWc076WBt6jXi33MeG3ILKDZlsVdPSCHS8hfWpzHNGRxg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sdyxsdhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:12:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DICitP008702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:12:44 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 10:12:41 -0800
Date: Thu, 13 Feb 2025 19:12:39 +0100
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
Subject: Re: [PATCH v7 1/4] virtio-rtc: Add initial device specification
Message-ID: <arwlhmqlfpihjrb3xw6mb357265symbwwcdns4zvm5bzyhhxqp@cf4gqjhwauxz>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-2-quic_philber@quicinc.com>
 <Z6oEocvjwSsPmVxz@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6oEocvjwSsPmVxz@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qfIv8u2Y-0lHXG5wNofACR0UjdE9PESA
X-Proofpoint-GUID: qfIv8u2Y-0lHXG5wNofACR0UjdE9PESA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130129

On Mon, Feb 10, 2025 at 02:52:33PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Jan 23, 2025 at 11:16:12AM +0100, Peter Hilber wrote:
> > The virtio-rtc device provides information about current time through
> > one or more clocks. As such, it is a Real-Time Clock (RTC) device.
> > 
> > The normative statements for this device follow in the next patch.
> > 
> > For this device, there is an RFC Linux kernel driver which is being
> > upstreamed, and a proprietary device implementation.
> > 
> > Miscellaneous
> > -------------
> > 
> > The spec does not specify how a driver should interpret clock readings,
> > esp. also not how to perform clock synchronization.
> > 
> > The device uses the "Timer/Clock" device id which is already part of the
> > specification. This device id was registered a long time ago and should
> > be unused according to the author's information. The name "RTC" was
> > determined to be the best for a device which focuses on current time.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
> >     v7:
> >     
> >     - Remove leap second and performance indications from struct
> >       virtio_rtc_resp_read_cross. Remove backing definitions.
> >     
> >     - Add wording change which was previously mistakenly placed in last
> >       patch.
> >     
> >     v6:
> >     
> >     - Make leap second status information optional if the clock smears (or
> >       might smear) leap seconds.
> >     
> >     - Do not use union for leap second indication.
> >     
> >     - Improve wording.
> >     
> >     - Refer to the new POSIX.1-2024 for UTC epoch definition.
> >     
> >     v5:
> >     
> >     - Change structure and wording to support adding shared memory like
> >       vmclock [8].
> >     
> >     - Add dedicated clock types for UTC leap second smearing (David
> >       Woodhouse).
> >     
> >     - Extend leap second indications.
> >     
> >     - Split UTC-TAI offset and fractional offset due to smearing (David
> >       Woodhouse).
> >     
> >     - Remove requirement that TAI offset must not be a whole second while
> >       clock is being smeared.
> >     
> >     - Align bit widths, and some names, with '[RFC PATCH v4] ptp: Add
> >       vDSO-style vmclock support' [8].
> >     
> >     - Replace VIRTIO_RTC_SUBTYPE_ by VIRTIO_RTC_SMEAR_.
> >     
> >     - For Arm Generic Timer, only support Virtual Count Register (David
> >       Woodhouse).
> >     
> >     - Rename MONO clock to MONOTONIC clock.
> >     
> >     v4:
> >     
> >     - Drop distinction of Arm Generic Timer virtual and physical counter [7].
> >     
> >     - Add requirement that device should assume that driver reads clock from
> >       first vCPU (David Woodhouse) [6].
> >     
> >     - Formatting and wording improvements.
> >     
> >     v3:
> >     
> >     - Address comments from Parav Pandit.
> >     
> >     - Split off normative requirements into a second commit [2].
> >     
> >     - Merge readq and controlq into requestq [3].
> >     
> >     - Don't guard cross-timestamping with feature bit [3].
> >     
> >     - Pad request headers to 64 bit [2].
> >     
> >     - Rename Virtio status codes to match UNIX error names [2].
> >     
> >     - Avoid Virtio status code clashes with net controlq ack values.
> >     
> >     - Reword to refer more to "requests", rather than "messages" [2].
> >     
> >     - Rephrase some sentences [2].
> >     
> >     - Use integer data types without "__" prefixes [2].
> >     
> >     - Reduce clock id width to 16 bits [5].
> >     
> >     - Make VIRTIO_RTC_FLAG_CROSS_CAP a bit mask rather than a bit index.
> >     
> >     v2:
> >     
> >     - Address comments from Cornelia Huck.
> >     
> >     - Add VIRTIO_RTC_M_CROSS_CAP message [1].
> >     
> >     - Fix various minor issues and improve wording [1].
> >     
> >     - Add several clarifications regarding device error statuses.
> >     
> >     [1] https://lists.oasis-open.org/archives/virtio-comment/202304/msg00523.html
> >     [2] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mffb93800fea11d6dda9e151078abedd6ff1c0f1e
> >     [3] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#m94efd0aa9b9c2b96a246b79ef8bfc3bf64ebe791
> >     [4] https://lore.kernel.org/lkml/20230630171052.985577-1-peter.hilber@opensynergy.com/T/#m65fa1d715933360498c4e33d7225e4220215a9d6
> >     [5] https://lore.kernel.org/virtio-comment/b59a7dda-06fe-cff9-df61-b90aa4e50836@opensynergy.com/t/#mf00ce330228c28556d735eb9597469048c5d8b62
> >     [6] https://lore.kernel.org/lkml/d796d9a5-8eda-4528-a6d8-1c4eba24aa1e@opensynergy.com/
> >     [7] https://lore.kernel.org/all/20231218064253.9734-2-peter.hilber@opensynergy.com/
> >     [8] https://lore.kernel.org/lkml/20240708092924.1473461-1-dwmw2@infradead.org/
> > 
> >  content.tex                      |   3 +-
> >  device-types/rtc/description.tex | 426 +++++++++++++++++++++++++++++++
> >  introduction.tex                 |   6 +
> >  3 files changed, 434 insertions(+), 1 deletion(-)
> >  create mode 100644 device-types/rtc/description.tex
> > 

[...]

> > +
> > +\paragraph{Clock Types}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Clock Types}
> > +
> > +The following clock types are defined:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_CLOCK_UTC                    0
> > +#define VIRTIO_RTC_CLOCK_TAI                    1
> > +#define VIRTIO_RTC_CLOCK_MONOTONIC              2
> > +#define VIRTIO_RTC_CLOCK_UTC_SMEARED            3
> > +#define VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED      4
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +
> > +\item[VIRTIO_RTC_CLOCK_UTC] uses the UTC (Coordinated Universal Time)
> > +        time standard. This clock uses the time epoch of January 1,
> > +        1970, 00:00 UTC. This is the same epoch as \emph{Unix time}. The
> > +        clock's seconds since the epoch are related to UTC time as
> > +        defined by \hyperref[intro:EPOCH]{EPOCH}.
> > +
> > +        This clock observes positive and negative leap seconds as
> > +        announced by standard bodies. At the start of leap seconds, the
> > +        clock steps accordingly.
> > +
> > +\item[VIRTIO_RTC_CLOCK_TAI] uses the TAI (International Atomic Time)
> > +        time standard. This clock uses the time epoch of January 1,
> > +        1970, 00:00 TAI.
> > +
> > +\item[VIRTIO_RTC_CLOCK_MONOTONIC] uses monotonic physical time (SI
> > +        seconds subdivisions) since some unspecified epoch. The epoch is
> > +        before or during device reset.
> > +
> > +\item[VIRTIO_RTC_CLOCK_UTC_SMEARED] deviates from the UTC standard by
> > +        smearing time in the vicinity of a leap second. This avoids
> > +        clock steps due to UTC leap seconds. Otherwise, this clock is
> > +        similar to VIRTIO_RTC_CLOCK_UTC.
> > +
> > +\item[VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED] This clock
> > +
> > +\begin{itemize}
> > +\item may deviate from the UTC standard by smearing time in the vicinity
> > +        of a leap second (similar to VIRTIO_RTC_CLOCK_UTC_SMEARED), or
> > +
> > +\item may step at the start of leap seconds like VIRTIO_RTC_CLOCK_UTC.
> > +\end{itemize}
> > +
> > +A clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED can change this
> > +behavior for every leap second.
> > +
> > +\end{description}
> > +
> > +In the following, \emph{UTC-like clock} designates any clock of type
> > +VIRTIO_RTC_CLOCK_UTC, VIRTIO_RTC_CLOCK_UTC_SMEARED, or
> > +VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED.
> > +
> > +Additional clock types may be standardized in the future.
> > +Implementation-specific definitions of clock types are not recommended
> > +and use ids between 0xF0 and 0xFF.
> 
> Do you mean that ids between 0xF0 and 0xFF are not recommended?

I mean that implementation-specific definitions must use this id range
(this is defined as a requirement in the patch with the normative
requirements). Is the following better?

	Implementation-specific definitions of clock types are not
	recommended. Implementation-specific definitions use ids between
	0xF0 and 0xFF.

> 
> > +
> > +\paragraph{Smearing Variants}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Smearing Variants}
> > +
> > +Leap second \emph{smearing variants} describe the deviation from the UTC
> > +standard in the vicinity of a leap second. The following smearing
> > +variants are currently defined:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_SMEAR_UNSPECIFIED    0
> > +#define VIRTIO_RTC_SMEAR_NOON_LINEAR    1
> > +#define VIRTIO_RTC_SMEAR_UTC_SLS        2
> > +\end{lstlisting}
> > +
> > +\begin{description}
> > +
> > +        \item[VIRTIO_RTC_SMEAR_UNSPECIFIED] means that it is unspecified
> > +                how time is smeared in the vicinity of leap seconds.
> > +
> > +        \item[VIRTIO_RTC_SMEAR_NOON_LINEAR] specifies a linear smear
> > +                from noon prior to the leap second until noon after the
> > +                leap second.
> > +
> > +        \item[VIRTIO_RTC_SMEAR_UTC_SLS] specifies a linear smear as per
> > +                the \hyperref[intro:UTC-SLS]{UTC-SLS} proposal.
> > +
> > +\end{description}
> > +
> > +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED always behave according to a
> > +smearing variant. The smearing variant does not change over the clock's
> > +lifetime.
> > +
> > +For clocks of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, it is unspecified
> > +whether leap seconds are smeared, and how leap seconds are smeared.
> > +
> > +Additional smearing variants may be standardized in the future.
> > +Implementation-specific definitions of smearing variants are not
> > +recommended and use ids greater than or equal to 0xF0.
> 
> Like the question above, It is not clear to me if `ids greater than or
> equal to 0xF0` are not recommended.
> 

Is the following better?

	Implementation-specific definitions of smearing variants are not
	recommended. Implementation-specific definitions use ids greater
	than or equal to 0xF0.

> > +
> > +In the following, \emph{leap smearing clock} designates
> > +
> > +\begin{itemize}
> > +
> > +\item any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED
> > +
> > +\item any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED at any time
> > +        when the clock is smearing a leap second.
> > +
> > +\end{itemize}
> > +
> > +\paragraph{Hardware Counters}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}
> > +
> > +The following hardware counter identifiers are specified:
> > +
> > +\begin{lstlisting}
> > +/* Arm Generic Timer Counter-timer Virtual Count Register (CNTVCT_EL0) */
> > +#define VIRTIO_RTC_COUNTER_ARM_VCT      0
> > +/* x86 Time-Stamp Counter */
> > +#define VIRTIO_RTC_COUNTER_X86_TSC      1
> > +/* Invalid */
> > +#define VIRTIO_RTC_COUNTER_INVALID   0xFF
> > +\end{lstlisting}
> > +
> > +Additional hardware counter identifiers may be standardized in the
> > +future. Implementation-specific hardware counter identifiers are not
> > +recommended and have values between 0xF0 and 0xFE.
> > +
> > +\subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Operation / Control Requests}
> > +
> > +Through \emph{control requests}, the driver requests information about
> > +the device capabilities. The driver enqueues control requests in the
> > +requestq.
> > +
> > +\begin{description}
> > +
> > +\item[VIRTIO_RTC_REQ_CFG] discovers the number of clocks.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_REQ_CFG 0x1000 /* message type */
> > +
> > +struct virtio_rtc_req_cfg {
> > +        struct virtio_rtc_req_head head;
> > +        /* no request params */
> > +};
> > +
> > +struct virtio_rtc_resp_cfg {
> > +        struct virtio_rtc_resp_head head;
> > +        le16 num_clocks;
> > +        u8 reserved[6];
> > +};
> > +\end{lstlisting}
> > +
> > +Field \field{num_clocks} contains the number of clocks. A device
> > +provides zero or more clocks. Valid clock ids are those smaller than
> > +\field{num_clocks}.
> > +
> > +\item[VIRTIO_RTC_REQ_CLOCK_CAP] discovers the capabilities of the clock
> > +identified by the \field{clock_id} field.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_REQ_CLOCK_CAP 0x1001 /* message type */
> > +
> > +struct virtio_rtc_req_clock_cap {
> > +        struct virtio_rtc_req_head head;
> > +        le16 clock_id;
> > +        u8 reserved[6];
> > +};
> > +
> > +struct virtio_rtc_resp_clock_cap {
> > +        struct virtio_rtc_resp_head head;
> > +        u8 type;
> > +        u8 leap_second_smearing;
> > +        u8 reserved[6];
> > +};
> > +\end{lstlisting}
> > +
> > +The \field{type} field identifies the clock type. A device provides
> > +zero or more clocks for a clock type.
> > +
> > +Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
> > +variant} through field \field{leap_second_smearing}. All other clocks
> > +set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> > +
> > +\item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> > +cross-timestamping for a particular pair of clock and hardware counter.
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_REQ_CROSS_CAP 0x1002 /* message type */
> > +
> > +struct virtio_rtc_req_cross_cap {
> > +        struct virtio_rtc_req_head head;
> > +        le16 clock_id;
> > +        u8 hw_counter;
> > +        u8 reserved[5];
> > +};
> > +
> > +
> > +struct virtio_rtc_resp_cross_cap {
> > +        struct virtio_rtc_resp_head head;
> > +#define VIRTIO_RTC_FLAG_CROSS_CAP       (1 << 0)
> > +        u8 flags;
> > +        u8 reserved[7];
> > +};
> > +\end{lstlisting}
> > +
> > +The \field{clock_id} field identifies the clock, and the
> > +\field{hw_counter} field identifies the hardware counter, for which
> > +cross-timestamp support is probed. The device sets flag
> > +VIRTIO_RTC_FLAG_CROSS_CAP in the \field{flags} field if the clock
> > +supports cross-timestamping for the particular clock and hardware
> > +counter, and clears the flag otherwise.
> > +
> > +\end{description}
> > +
> > +\subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
> > +
> > +Through \emph{read requests}, the driver requests clock readings from
> > +the device. The driver enqueues read requests in the requestq. The
> > +device obtains device-side clock readings and forwards these clock
> > +readings to the driver. The driver may enhance and interpret the clock
> > +readings through methods which are beyond the scope of this
> > +specification.
> > +
> > +Once DRIVER_OK has been set, the device should support reading every
> > +clock, even when a clock may yet have to be aligned to reference time
> > +sources.
> > +
> > +In general,
> > +
> > +\begin{itemize}
> > +\item clocks may jump backwards or forward, and
> > +\item the clock frequency may change. Clocks may be \emph{slewed},
> > +        i.e.\ clocks may run at a frequency other than their current
> > +        best frequency estimate.
> > +\end{itemize}
> > +
> > +As long as a clock does not jump backwards, the driver clock readings
> > +through read request responses increase monotonically:
> > +
> > +\begin{itemize}
> > +\item As long as a clock does not jump backwards in-between device-side
> > +        clock readings, the driver-side readings for that clock increase
> > +        monotonically as well, in the order in which the driver
> > +        marks read requests as available.
> > +
> > +\item The device marks read requests for the same clock as used in
> > +        the order in which the messages were marked as available.
> > +\end{itemize}
> > +
> Should it not be `MUST` here?
> 

There are corresponding MUST requirements in the normative statements
patch. E.g. for the last enumeration item:

	For any clock C, the device MUST mark all read requests reading
	C as used in the total order in which the driver marked these
	messages as available.

I understood that the prevailing preference is to avoid MUST outside of
the normative statements.


Thanks for the review,

Peter
