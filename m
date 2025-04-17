Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730F32522A4
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901905; cv=none; b=KnSZwdQigPFOCcFuYjbLIlSpNkP500BTRN1BQDkEyhSL9tTLyq22aWesWvJz/e43Mf9JQy2ciBsQKY6uEhDxWqC2OWZMa7xLKLsdyinHQGhOelL+GIzZ/37ak+s5Jf68qwic6cRP2JVFkoEmNMt39McDrJB6tEjyZ51F4MOpeHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901905; c=relaxed/simple;
	bh=TstlAQshIVEMlqzkEZm9yEwcPr5D4JZw31HA2Lza3mM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lg8pihn+oPKb08LLJ34D2H+Pti3B4ztn77EOT4yh33f7nA5sJ2MfMBn1VIcn6nETkbVs4XBEBwPnMQjhMa9yw8aF+66zTuF2PAjFIQtgoKid06dVzEmcoLhJnFmytmo2Oyso9wR9eFfZHyig6vCsuPSez8onjQDJb8Rh/eqLZHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k0pZHXbj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k0pZHXbj"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClKhE001231;
	Thu, 17 Apr 2025 14:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SUipTHmZ2SzeYqoxgFLvNAZZ
	aEfEKNnx0ISuviIlfbs=; b=k0pZHXbjsndN449govmpQ6qEhwA/wik+T2ndPlTD
	brYGRkisQk02QWE7CKLvh0dXaOn8wgfXVSbULj3GsmScP7LADP8mGXcUVAaJB1ej
	L1b6/kQvzxQ7zd4srrPaoKhmiGcPI9qBCQAFzRSl0We22Pk+CVn7G1N7Gy5Qls+2
	nEfiDpJwMWlCbvmmIZshSQH8mHb/JGYpTG1FCBM+sHl6zU5Kd6GPAOJvjQkJHpNx
	67HB2XThGc2L5O5K6eR5Twx+DYnf2Q7ZW1cYIci1jWnI/yfxqhkoSnZsUwy3Oz2V
	qrbiemBLzFwwKpStKvFB2Pgs85NeihWBciIeQlzRtOvE9A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjfjs6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 14:58:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HEwE7W007407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 14:58:15 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 07:58:12 -0700
Date: Thu, 17 Apr 2025 16:58:09 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 2/4] virtio-rtc: Add initial normative statements
Message-ID: <qadxcyzc2myd5ahankq3i7vq5ruyxhd5r6h45smifvsaf463gz@gqwkzuck7rwk>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-3-quic_philber@quicinc.com>
 <Z/6DQDFNpZMjIDMU@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z/6DQDFNpZMjIDMU@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=68011707 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ac5EnGtsZ5oyt3l5hugA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Hd4rSvgaas-6iOsfCVfgmvsCbUAw4MNn
X-Proofpoint-ORIG-GUID: Hd4rSvgaas-6iOsfCVfgmvsCbUAw4MNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170112

On Tue, Apr 15, 2025 at 06:03:12PM +0200, Matias Ezequiel Vara Larsen wrote:
> On Thu, Mar 06, 2025 at 10:51:10AM +0100, Peter Hilber wrote:
> > Add the normative statements for the initial device specification.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
> >     v8:
> >     
> >     - Drop requirement to ignore reserved fields in the device-readable part
> >       of the message (Matias Ezequiel Vara Larsen).
> >     
> >     - Drop requirement about returning same status in response to identical
> >       requests (Matias Ezequiel Vara Larsen).
> >     
> >     - Reword requirements about size mismatches for device
> >       read-only/write-only parts of the message (Matias Ezequiel Vara
> >       Larsen).
> >     
> >     - Change word order from "field X" to "the X field" (Matias Ezequiel
> >       Vara Larsen).
> >     
> >     v7:
> >     
> >     - Remove obsolete requirements for leap second indication.
> >     
> >     v6:
> >     
> >     - Update requirements to make leap second status information optional if
> >       if the clock smears (or might smear) leap seconds.
> >     
> >     - Allow indicating VIRTIO_RTC_SMEAR_UNSPECIFIED for
> >       VIRTIO_RTC_CLOCK_SMEARED.
> >     
> >     - Shorten some requirements by omitting redundant information.
> >     
> >     v5:
> >     
> >     - Update normative statements to match v5 changes to non-normative
> >       statements (patch 1).
> >     
> >     v4:
> >     
> >     - Require driver to set unused flags to zero.
> >     
> >     - Update normative statements to match v4 changes to non-normative
> >       statements (patch 1).
> >     
> >     - Improve formatting.
> > 
> >  conformance.tex                         |   2 +
> >  device-types/rtc/description.tex        | 272 +++++++++++++++++++++++-
> >  device-types/rtc/device-conformance.tex |   9 +
> >  device-types/rtc/driver-conformance.tex |   9 +
> >  4 files changed, 288 insertions(+), 4 deletions(-)
> >  create mode 100644 device-types/rtc/device-conformance.tex
> >  create mode 100644 device-types/rtc/driver-conformance.tex
> > 
> > diff --git a/conformance.tex b/conformance.tex
> > index d92a2369488e..4ce86a525e84 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -162,6 +162,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \input{device-types/pmem/driver-conformance.tex}
> >  \input{device-types/can/driver-conformance.tex}
> >  \input{device-types/spi/driver-conformance.tex}
> > +\input{device-types/rtc/driver-conformance.tex}
> >  
> >  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
> >  
> > @@ -254,6 +255,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >  \input{device-types/pmem/device-conformance.tex}
> >  \input{device-types/can/device-conformance.tex}
> >  \input{device-types/spi/device-conformance.tex}
> > +\input{device-types/rtc/device-conformance.tex}
> >  
> >  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
> >  A conformant implementation MUST be either transitional or
> > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > index 5d8cf91a6991..f2a3907de511 100644
> > --- a/device-types/rtc/description.tex
> > +++ b/device-types/rtc/description.tex
> > @@ -73,7 +73,7 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
> >  VIRTIO_RTC_S_EOPNOTSUPP indicates that the device could not execute the
> >  specific request due to an implementation limitation. The device also
> >  returns status VIRTIO_RTC_S_EOPNOTSUPP for requests with unknown values
> > -in the fields \field{msg_type} or \field{hw_counter}.
> > +in the \field{msg_type} or \field{hw_counter} fields.
> >  
> >  VIRTIO_RTC_S_ENODEV indicates that the \field{clock_id} field value
> >  supplied with the request does not identify a clock.
> > @@ -98,6 +98,106 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
> >  zero-based, dense indices. All fields named \field{clock_id} contain
> >  clock identifiers.
> >  
> > +\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
> > +
> > +If the \field{struct virtio_rtc_resp_head} field \field{status} is not
> > +VIRTIO_RTC_S_OK, the driver MUST NOT interpret response fields other
> > +than \field{status}.
> 
> Can't we say "The driver MUST interpret response field only when status
> is VIRTIO_RTC_S_OK".

OK.

> 
> > +
> > +The driver MUST set \emph{reserved} fields in the device-readable part
> > +of the message to zero.
> > +
> > +The driver MUST set unnamed bits in \emph{flags} fields in the
> > +device-readable part of the message to zero.
> > +
> > +The driver MUST NOT interpret \emph{reserved} fields in the
> > +device-writable part of the message.
> 
> Why the driver would interpret reserved fields?

The driver shall not do this in any way. Especially, the driver shall
not fail due to unexpected reserved field values. 

> 
> > +
> > +The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
> > +device-writable part of the message.
> > +
> > +The driver MUST put the request into the device-readable part of the
> > +message.
> 
> I do not think this is required in this section. The spec defines the
> device-readable as the only section in which the driver can write. Other
> devices just add in "// Device-readable part" in the common structures
> for the response and request. Are other devices specifying something
> similar? 
> 

I can remove this. There are some requirements about the queues where to
put device-readable/device-writable buffers for other devices, like the
console device, but none which explicitly specify the readable/writable
split.

> > +
> > +The driver MUST allocate enough space for the response in the
> > +device-writable part of a requestq message.
> > +
> > +\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_OK if the device successfully
> > +executed the request.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to a status other than VIRTIO_RTC_S_OK if the
> > +device did not successfully execute the request.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
> > +execute the specific request due to an implementation limitation.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
> > +value of the \field{msg_type} field which is not described in this
> > +specification.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
> > +value of the \field{hw_counter} field which is neither described in this
> > +specification nor otherwise known to the implementation.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
> > +field value supplied with the request does not identify a clock.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
> > +inconsistent with the specification and if the inconsistence is not
> > +described by the requirements which stipulate status
> > +VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the request specified in
> > +the request header through the \field{msg_type} field does not fit into
> > +the device read-only part of the actual message.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the response specified in
> > +the request header through the \field{msg_type} field does not fit into
> > +the device write-only part of the actual message, unless the
> > +\field{status} field does not fit into the device write-only part.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
> > +\field{status} field if the \field{status} field does not fit into the
> > +device write-only part.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
> > +requirements in this document stipulated another \field{status}.
> > +
> > +If the device read-only part of a message M is bigger than the size of
> > +the request specified for message M, the device MUST ignore the
> > +additional space.
> > +
> > +If the device write-only part of a message M is bigger than the size of
> > +the response specified for message M, the device MUST ignore the
> > +additional space.
> > +
> > +The device MUST set \emph{reserved} fields in the device-writable part
> > +of the message to zero.
> > +
> > +The device MUST set unnamed bits in \emph{flags} fields in the
> > +device-writable part of the message to zero.
> > +
> > +After feature negotiation completion the device MUST NOT change the set
> > +of clocks until device reset.
> > +
> > +The device SHOULD NOT change the set of clocks on a device reset after
> > +the first device reset.
> > +
> > +The device MUST use non-negative integers, which are smaller than the
> > +number of clocks, as clock identifiers.
> > +
> >  \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
> >  
> >  This section makes common definitions.
> > @@ -253,7 +353,7 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >  };
> >  \end{lstlisting}
> >  
> > -Field \field{num_clocks} contains the number of clocks. A device
> > +The \field{num_clocks} field contains the number of clocks. A device
> >  provides zero or more clocks. Valid clock ids are those smaller than
> >  \field{num_clocks}.
> >  
> > @@ -281,8 +381,8 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >  zero or more clocks for a clock type.
> >  
> >  Clocks of type VIRTIO_RTC_CLOCK_UTC_SMEARED indicate the \emph{smearing
> > -variant} through field \field{leap_second_smearing}. All other clocks
> > -set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> > +variant} through the \field{leap_second_smearing} field. All other
> > +clocks set \field{leap_second_smearing} to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> >  
> >  \item[VIRTIO_RTC_REQ_CROSS_CAP] discovers whether the device supports
> >  cross-timestamping for a particular pair of clock and hardware counter.
> > @@ -315,6 +415,103 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
> >  
> >  \end{description}
> >  
> > +\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
> > +
> > +For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
> > +one of the hardware counter identifiers defined in this specification,
> > +or to a value between 0xF0 and 0xFE.
> > +
> > +\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
> > +time standard (Coordinated Universal Time).
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED or
> > +VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MUST use the UTC time
> > +standard, insofar as the following requirements do not say otherwise.
> > +
> > +For any UTC-like clock, the device MUST use the time epoch of January 1,
> > +1970, 00:00 UTC.
> > +
> > +For any UTC-like clock, the device MUST count seconds since the epoch
> > +according to \hyperref[intro:EPOCH]{EPOCH}.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
> > +positive leap second according to the UTC time standard by
> > +instantaneously stepping the clock backwards by 1 s at the start of the
> > +leap second.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
> > +negative leap second according to the UTC time standard by
> > +instantaneously stepping the clock forward by 1 s at the start of the
> > +leap second.
> > +
> > +For any leap smearing clock, the device MUST NOT step the clock due to a
> > +leap second.
> > +
> > +For any leap smearing clock, on a positive leap second, the device MUST
> > +slow down the clock during part of the day containing the leap second
> > +and/or part of the day after the leap second.
> > +
> > +For any leap smearing clock, on a negative leap second, the device MUST
> > +speed up the clock during part of the day containing the leap second
> > +and/or part of the day after the leap second.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, on a
> > +leap second, the device MUST change the frequency of the clock exactly
> > +from noon prior to the leap second until noon after the leap second.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
> > +changing the frequency of the clock due to a positive leap second, the
> > +device MUST decrease the frequency of the clock by $1/86400$.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
> > +changing the frequency of the clock due to a negative leap second, the
> > +device MUST increase the frequency of the clock by $1/86400$.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, on a leap
> > +second, the device MUST change the frequency of the clock exactly during
> > +the last 1000 seconds of the day with the leap second.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
> > +changing the frequency of the clock due to a positive leap second, the
> > +device MUST decrease the frequency of the clock by 0.1\%.
> > +
> > +For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
> > +changing the frequency of the clock due to a negative leap second, the
> > +device MUST increase the frequency of the clock by 0.1\%.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MAY
> > +deviate from the UTC standard with respect to leap second introduction.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
> > +time standard (International Atomic Time).
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
> > +epoch of January 1, 1970, 00:00 TAI.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use SI
> > +seconds subdivisions.
> > +
> > +For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use an
> > +epoch at a time instant before or during device reset.
> > +
> > +For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
> > +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
> > +\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.
> > +
> > +For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
> > +VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
> > +\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED,
> > +VIRTIO_RTC_SMEAR_NOON_LINEAR, VIRTIO_RTC_SMEAR_UTC_SLS, or to a value
> > +greater than or equal to 0xF0.
> > +
> > +For a VIRTIO_RTC_REQ_CROSS_CAP message M, the device MUST set the
> > +VIRTIO_RTC_FLAG_CROSS_CAP flag in the \field{flags} field if the device
> > +would respond to a VIRTIO_RTC_REQ_READ_CROSS message with the same
> > +\field{hw_counter} and \field{clock_id} values as in M with status
> > +VIRTIO_RTC_S_OK, and clear the flag otherwise.
> 
> I wonder if we could rewrite this sentence to make it more clear.

How about

	The device SHOULD set the VIRTIO_RTC_FLAG_CROSS_CAP flag in the
	VIRTIO_RTC_REQ_CROSS_CAP response if and only if the device
	would return status VIRTIO_RTC_S_OK for a
	VIRTIO_RTC_REQ_READ_CROSS message with the same
	\field{hw_counter} and \field{clock_id} values.

In the above, I also changed the requirement from MUST to SHOULD, since
I think that there might be intermittent error conditions which are
acceptable for the device not to detect when processing the
VIRTIO_RTC_REQ_CROSS_CAP message.

> 
> > +
> >  \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
> >  
> >  Through \emph{read requests}, the driver requests clock readings from
> > @@ -426,3 +623,70 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
> >  \ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
> >  
> >  \end{description}
> > +
> > +\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
> > +
> > +For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
> > +one of the hardware counter identifiers defined in this specification,
> > +or to a value between 0xF0 and 0xFE.
> > +
> > +\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
> > +
> > +The device SHOULD continuously support reading of all clocks once
> > +DRIVER_OK has been set.
> > +
> 
> I think you can rewrite as: "After DRIVER_OK has been set, the device
> SHOULD continuously support reading of all clocks."

OK.

> 
> > +For any clock C and read requests \emph{A} and \emph{B} which read C,
> > +\emph{A} being the message which the driver marks as available before
> > +\emph{B}, the device MUST obtain the \field{clock_reading} value for the
> > +message \emph{A} response before the \field{clock_reading} value for the
> > +message \emph{B} response, or the device MUST obtain the same
> > +\field{clock_reading} value for both \emph{A} and \emph{B}.
> > +
> 
> I wonder how we can rewrite it without A, B, and C.

How is using short instance names a problem? Looking at e.g. the C
standard, such naming is used to avoid ambiguity.

Is this better?

	For any two read requests to the same clock, the device MUST
	either obtain the \field{clock_reading} value for the message
	which the driver makes available first before obtaining the
	\field{clock_reading} value for the other message, or the device
	MUST return the same \field{clock_reading} value.

> 
> > +For any clock C, the device MUST mark all read requests reading C as
> > +used in the total order in which the driver marked these messages as
> > +available.
> > +
> > +For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
> > +\emph{A} and \emph{B} which read C, \emph{A} being the message which the
> > +driver marks as available before \emph{B}, the device MUST set the
> > +\field{clock_reading} value for the message \emph{B} response to a value
> > +greater than or equal to the \field{clock_reading} value for the message
> > +\emph{A} response.
> > +
> > +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> 
> I would start the sentence by:
> 
> "For every clock, ..."

OK.

> 
> > +
> > +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> > +specification, the device MUST use the nanosecond as unit for the
> > +\field{clock_reading} field.
> > +
> > +For read requests, the device MUST obtain the \field{clock_reading}
> > +response value after the read request is marked as available.
> 
> This is not clear. Who mark the read request available? I think ti is
> the driver. The device cannot access anything in the available ring
> without driver notification.

To avoid ambiguity:

	For read requests, the device MUST obtain the
	\field{clock_reading} response value after the driver made the
	read request available.

> 
> > +
> > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> > +\field{counter_cycles} to a value which approximates the value which the
> > +driver would have read from the hardware counter identified by
> > +\field{hw_counter} at the time instant when the device read the
> > +\field{clock_reading} value.
> > +
> > +For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
> > +reads the hardware counter identified by \field{hw_counter} through the
> > +CPU which the driver enumerates as the first.
> > +
> > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
> > +value other than VIRTIO_RTC_S_OK if the device cannot determine the
> > +approximate value which the driver would have read from the hardware
> > +counter identified by \field{hw_counter} at the time instant when the
> > +device read the \field{clock_reading} value.
> > +
> > +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> > +\emph{B} which read C and which specify the same hardware counter
> > +\emph{H} through the \field{hw_counter} field, \emph{A} being the
> > +message which the driver marks as available before \emph{B}, the device
> > +MUST set the \field{counter_cycles} value for \emph{B} to a value which
> > +\emph{H} shows after the \field{counter_cycles} value of \emph{A}, or
> > +the device MUST set the same \field{counter_cycles} value for \emph{A}
> > +and \emph{B}.
> 
> I just rewrite this sentence as the following, WDYT?:
> 
> If two VIRTIO_RTC_REQ_READ_CROSS messages read the same clock using the
> same hardware counter, and one message is made available before the
> other, the device must do one of the following:
> 
> - Set the later message's counter_cycles to a value that the hardware
>   counter shows after the earlier message's counter_cycles.
> - Or, set both messages to have the same counter_cycles value.

Like this?

	If two VIRTIO_RTC_REQ_READ_CROSS messages read the same clock
	using the same hardware counter, and one message is made
	available before the other, the device MUST either
	
	- set the later message's counter_cycles to a value that the
	  hardware counter shows after the earlier message's
	  counter_cycles, or
	
	- set both messages to have the same counter_cycles value.

Thanks for the comments,

Peter
