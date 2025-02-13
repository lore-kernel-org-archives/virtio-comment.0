Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5814A204C21
	for <virtio-comment@lists.linux.dev>; Thu, 13 Feb 2025 18:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470404; cv=none; b=JAFAtfU8dhRCV3FaBeXjK2AbGKpdyEPsdsIlJGLVRuLjKt735yrxraiJx8vMV+BqTPGGW1FKCokYX/TrcV8cucCOpWyFD1k4d9TJIJbpYqbMtOGO5V0P5xV+E58iI8ZFwbFF+YjdT+9YRlDcHJU3+QkQ9LnYBaocgvV8Vhv36iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470404; c=relaxed/simple;
	bh=RzVqhUeVBuJCMv7/FBEpdL2o7fvOmpkchw0YLZl0SNM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbNEkcSIAPc4MkbnLcYwLyQooIE7ggoefDHQU/3nb35yCY3Wb6KHg7y9uaSNb28xpRN0DEGhrU12a+k6uf5ylJTHRxeEwXkeLmhAe6XR+C+Q9I909aHHzd+Pf4MQTYGZe98m/wDysDYf7V4OToc7AVeUV3cmV6ddBrLiuKJY0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GKyWzOSe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GKyWzOSe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51DA239w001648;
	Thu, 13 Feb 2025 18:13:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ivZOANqTujZbv04h4bbcknR9
	BXBxFi+gYbfSmTu37n8=; b=GKyWzOSeLHTEkONsuhXbqtnCB1pxzhaSkUKiUs8l
	//wATwOHI6K76r+kWu32+NT1Q5ODLnIfdbhA6efMxsE/2hmoIEpwpvd2mQX4u9f0
	Zq8oh0w3CnSc9/NgvvDtASF06t5Ld8kBZLYr+QwE/szmL5/PE3EamQ+119K0jKKW
	PMQLfSpFI0z3B6FfPubUSSAMCVo0omUeV6fwh2B2qnTcj0JGcD1OTKSRWFIz6kHF
	ipRrJaxSGK5/ydi+1xJBccO5vjr8cCwozcsgSu9iieEckWIlOE4Fblg3B502Ak8J
	vaN+gT8K1fXQwBifepXZIEQkg7d8r++kGq2Y0WiWtSzcVA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44semp98wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:13:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51DIDH5w015814
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 18:13:17 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Feb 2025 10:13:14 -0800
Date: Thu, 13 Feb 2025 19:13:12 +0100
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
Subject: Re: [PATCH v7 2/4] virtio-rtc: Add initial normative statements
Message-ID: <uiejj47qg5cu4vfplk2ir4qy3j4leo52uiqw3xxgskfwjlwv4x@urzsoe62n6fq>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-3-quic_philber@quicinc.com>
 <Z6oqSDDOqhRgt/ZB@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z6oqSDDOqhRgt/ZB@fedora>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: sLt0yxYKp0HkhjcU7i7vdBr1iSUWEK_U
X-Proofpoint-GUID: sLt0yxYKp0HkhjcU7i7vdBr1iSUWEK_U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502130129

On Mon, Feb 10, 2025 at 05:33:12PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Jan 23, 2025 at 11:16:13AM +0100, Peter Hilber wrote:
> > Add the normative statements for the initial device specification.
> > 
> > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > ---
> > 
> > Notes:
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
> >  device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
> >  device-types/rtc/device-conformance.tex |   9 +
> >  device-types/rtc/driver-conformance.tex |   9 +
> >  4 files changed, 289 insertions(+)
> >  create mode 100644 device-types/rtc/device-conformance.tex
> >  create mode 100644 device-types/rtc/driver-conformance.tex
> > 

[...]

> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
> > +inconsistent with the specification and if the inconsistence is not
> > +described by the requirements which stipulate status
> > +VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the device read-only part
> > +of the message is too small.
> 
> What do you mean with `too small`?
> 

"Too small" means that the cumulative length of the buffers marked as
device-readable is less than the (minimum) length of the request which
is indicated by the message type in the header.

Maybe I could reword like this?

	For \field{struct virtio_rtc_resp_head}, the device MUST set the
	\field{status} field to VIRTIO_RTC_S_EINVAL if the request
	specified in the request header through the \field{msg_type}
	field does not fit into the device read-only part of the actual
	message.

> > +
> > +For \field{struct virtio_rtc_resp_head}, the device MUST set the
> > +\field{status} field to VIRTIO_RTC_S_EINVAL if the device write-only
> > +part of the message is too small, unless the \field{status} field does
> > +not fit into the device write-only part.
> > +
> 
> I think we can improve the wording by replacing `too small` with
> something else.
> 

Maybe I could reword like this?

	For \field{struct virtio_rtc_resp_head}, the device MUST set the
	\field{status} field to VIRTIO_RTC_S_EINVAL if the response
	specified in the request header through the \field{msg_type}
	field does not fit into the device write-only part of the actual
	message, unless the \field{status} field does not fit into the
	device write-only part.

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
> > +The device MUST NOT interpret \emph{reserved} fields in the
> > +device-readable part of the message.
> 
> I wonder if last three requirements are needed.
> 

I included them because in my understanding this is not specified in the
generic part of the spec, and because I tried to be *somewhat*
forward-compatible.

Do you think they are unneeded because they are self-evident? Then I
think they could be dropped indeed. However, the IOMMU device explicitly
requires the device to reject a request if some reserved field is not
zero, and to ignore some other reserved field. 

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
> > +For a fixed request value V, the device SHOULD either, for every request
> > +with value V, always execute successfully, or, for every request with
> > +value V, always set a fixed \field{status} other than VIRTIO_RTC_S_OK.
> 
> I am not familiar enough with rtc clocks, what does `request with value
> V` mean ?
> 

I tried to avoid ambiguity by emulating the language used in semi-formal
proofs. "V" refers to any particular request, e.g. VIRTIO_REQ_READ with
clock_id 1. For any such particular request the device SHOULD either
always return success, or always return the same error code.

Maybe I could rephrase like this:

	The device SHOULD always set the same \field{status} in response
	to identical requests.

> > +
> > +For any clock C and read requests \emph{A} and \emph{B} which read C,
> > +\emph{A} being the message which the driver marks as available before
> > +\emph{B}, the device MUST obtain the \field{clock_reading} value for the
> > +message \emph{A} response before the \field{clock_reading} value for the
> > +message \emph{B} response, or the device MUST obtain the same
> > +\field{clock_reading} value for both \emph{A} and \emph{B}.
> 
> Can't we just say that the device MUST processes the available ring as FIFO
> queue?
> 

The spec mandates FIFO processing for all the readings *of the same
clock* by the above requirement (in conjunction with the below
requirement, if you care about the used order).

The ordering requirement only applies to readings of the same clock, so
that clocks which are slow to read (such as GPS clocks read over UART),
or future slow commands, do not necessarily stall other processing, such
as fast clock readings.

To guarantee that a clock never goes backwards (unless the clock is
stepped backwards), the spec explicitly specifies the order of
clock_reading values of successive clock readings. Just mandating FIFO
processing would not prohibit a clock from going backwards.

E.g. when hardware counters are not properly synchronized across a
multi-core device, the clock can go backwards when read on different
cores. The spec mandates that the device avoid this. By this, the
driver does not have to do mitigation.

> > +
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
> 
> See comment above.
> 
> > +
> > +The device MUST support VIRTIO_RTC_REQ_READ for every clock.
> > +
> > +For VIRTIO_RTC_REQ_READ and for any clock type listed in this
> > +specification, the device MUST use the nanosecond as unit for field
> > +\field{clock_reading}.
> 
> In other parts of the document the word `field` is written after the
> name of the field. I think we could just put it after the name
> everywhere.
> 

OK.

> > +
> > +For read requests, the device MUST obtain the \field{clock_reading}
> > +response value after the read request is marked as available.
> > +
> > +For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
> > +\field{counter_cycles} to a value which approximates the value which the
> > +driver would have read from the hardware counter identified by
> > +\field{hw_counter} at the time instant when the device read the
> > +\field{clock_reading} value.
> 
> s/read/reads
> 

"read" seems correct to me. The last "read" in the above sentence is
simple past tense, since the device sets the field after reading the
clock_reading value. 

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
> 
> s/read/reads
> 

The last "read" above is simple past tense, too.

> > +
> > +For any clock C, and VIRTIO_RTC_REQ_READ_CROSS messages \emph{A} and
> > +\emph{B} which read C and which specify the same hardware counter
> > +\emph{H} through field \field{hw_counter}, \emph{A} being the message
> > +which the driver marks as available before \emph{B}, the device MUST set
> > +the \field{counter_cycles} value for \emph{B} to a value which \emph{H}
> > +shows after the \field{counter_cycles} value of \emph{A}, or the device
> > +MUST set the same \field{counter_cycles} value for \emph{A} and
> > +\emph{B}.
> 
> Can't we just say that the request queue follows a FIFO semantics?
> 

As discussed above, this would not guarantee that the counter_cycles
value does not decrease across reads (ignoring rollovers), e.g. if
successive READ_CROSS messages are processed on different cores whose
hardware counters are not properly synchronized.


Thanks for the review,

Peter
