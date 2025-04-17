Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44ED724E4C7
	for <virtio-comment@lists.linux.dev>; Thu, 17 Apr 2025 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744902921; cv=none; b=SuNM0hEKpw9AHH5V1drbFdajaJAalOMhYtcPp4E2ija4nL6Lxo0iyaLUTDLJPRWrFhcar1tW0/ekiuuJ3x8XLqK4YwEzWh5UFSm4x1pjiHYGBVhnkOJSnJu/24MOv0hbaeo7o6lqXgxSgABzNGoMjMvhrbNFG+Wsla8UCVG+7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744902921; c=relaxed/simple;
	bh=VnOIkbIFcAhOmLfZJAzKaxv8yHrl+aAR6aJaHcMIs6A=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4x7eZ4kloc25uBSbsPm4A+V465Qgdf1fs1snMkg8/issR8sEocb1LpxN8z2pOlF1TW692l2kWM6BT5qi5jwQbCGOHGNpwZOTO8WRS/owB+3ZsZNlCRBf06BHeeBpNGwlxl2eO8y5LueQnfyuE7XaNjS9dUOUVVqHpug1WqGjw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ASl7zTlI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ASl7zTlI"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HClOp3014269;
	Thu, 17 Apr 2025 15:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=te75GSkVwNIGGV6fOsjqoN5C
	2Jv4fOeyV36RNLhQbaE=; b=ASl7zTlIDGNkyGCiPyMKicAoFSM+GtftEJM35WM+
	+O//GP6n6/ssGaqDnK96l72VpOcmLWMEV2Mev5AXnLm9m5e6Q74LvvRthXjgrmDA
	ZFsnQAFrypUywmyIY6QQeyrNHhP3+8mr8ea17LEsh4yCwRLOyhQLWDJlYHgyc+oU
	3XWZ95a4Z4ESVO2+QCkGNklA6Tou/SCgI6+m8CTnkScPuqlt6kQZov7Swt33933+
	Uz0b8IzhqCwOfXufnZfW23ZwhRPM/2JccZoeVm0754xWeoqfJis5v84iOzGi2NVx
	BcVszqfv5rJYYJi/axnJk3plLiIig6XZCJjtybwquz0Vsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs1f928-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:15:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53HFFCsc008247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 15:15:12 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Apr 2025 08:15:09 -0700
Date: Thu, 17 Apr 2025 17:15:06 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Matias Ezequiel Vara Larsen
	<mvaralar@redhat.com>
Subject: Re: [PATCH v8 2/4] virtio-rtc: Add initial normative statements
Message-ID: <u5fvk2d6lju4a5mnmsqoocgrfz34vjowq2t7fksjbdpqlm7i5o@2znrsogq4ipd>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-3-quic_philber@quicinc.com>
 <20250416113450-mutt-send-email-mst@kernel.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250416113450-mutt-send-email-mst@kernel.org>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=68011b01 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=bqLgPGq_LkolQPOP4oMA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pJM7aL-ePOIQiQSrivEmgVo8ZaxNYBIx
X-Proofpoint-ORIG-GUID: pJM7aL-ePOIQiQSrivEmgVo8ZaxNYBIx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_04,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170113

On Wed, Apr 16, 2025 at 11:42:01AM -0400, Michael S. Tsirkin wrote:
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
> > +
> > +The driver MUST set \emph{reserved} fields in the device-readable part
> > +of the message to zero.
> > +
> > +The driver MUST set unnamed bits in \emph{flags} fields in the
> > +device-readable part of the message to zero.
> 
> 
> This is problematic, it should depend on features negotiated
> not on features listed in the spec as we will not
> remember to change this and break drivers.
> Just add in the description explanation which flags are legal for each request,
> then refer to that.

OK.

> 
> 
> > +
> > +The driver MUST NOT interpret \emph{reserved} fields in the
> > +device-writable part of the message.
> > +
> > +The driver MUST NOT interpret unnamed bits in \emph{flags} fields in the
> > +device-writable part of the message.
> 
> same though a bit less of a problem here.

I will change this in a similar way as above.

> 
> 
> > +
> > +The driver MUST put the request into the device-readable part of the
> > +message.
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
> 
> really SHUOLD is more appropriate
> 
> and first in what sense? here is the text for features:
> 
> 
> 	If a device has successfully negotiated a set of features 
> 	at least once (by accepting the FEATURES_OK \field{device 
> 	status} bit during device initialization), then it SHOULD
> 	NOT fail re-negotiation of the same set of features after
> 	a device or system reset.  Failure to do so would interfere
> 	with resuming from suspend and error recovery.
> 
> do something similar and be specific pls.

OK.

Thanks for the comments,

Peter
