Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA934E769
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772029297; cv=none; b=LkZKv/hmGLnC9eLqcktHQrElBXRF8YKknF23NGKGhCw7gZn1TTGjg2OxwUUDCH6A+i2Mfoz3oQyAqvRXz1lb1nt/z/EZMxvTUEHDcYjKIpltVfQ4wXm6ThYO/3I4fFh7pbk+hgwrkZG5JgkDH6g6ZgkOn86KY9rsiG4byJkSX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772029297; c=relaxed/simple;
	bh=i86DmHSzXGMaFptnvTkFUgDDBR/E1VWfZnmtLhYeDZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FkGGMQ//yslfqu2JxGj2uMbUme4uzgOI0aF5of9BxHZAwKcXujEctW+00QKJCw1UTPD/3JDWcxj1IiByVdwLH1D5HTilLrU0Cp6FeCdmXNjPi+NCCqjaEbHStX7GRuwHbyjoSjfa4f61Fne6QuGdqXwDfo0BbLEd+8ZFjwDBtgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKT+YWXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QIvkQovY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKT+YWXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QIvkQovY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SfWX1088048
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=; b=FKT+YWXlEcw5E0w5
	NulkGeeXOPVDqsPCk5ZQrmf5I3gIhOgn7lvPkWsGgTCGTq7E7ptnlccgRm1M5vZH
	KGSpEetV9gb21dw/OLw97lozJ2hl7EJqrErcdzh6CLu9XRkaRD5iyVyY9hcVQMZ8
	/yRqv9prWaRNQPppT8UCZK8l4+KdmTnMfetiKfBd2RBRCHctLorw4HazALOnwU1W
	4WTFc8zkffiTXDX0XsdB5sU8aroOdEn61CxbS9YoplQFttzMCqimDsuQTdNVtUMw
	oBhQpJZKsIjIsNzry8U51LnF2h/oYI2PNtFlwj8f+R9w0f/TZLHn4JYsjlfE1bi1
	ZjiESw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh4737be-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 14:21:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c711251ac5so4765223585a.1
        for <virtio-comment@lists.linux.dev>; Wed, 25 Feb 2026 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772029294; x=1772634094; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=;
        b=QIvkQovY9SjtOg5wK91EPsMobL09tszueYTijEbCgFIBqeXZPZ9QAHZECQbkg/jMS3
         jZpDUXjqsbF/k6qmer+zQJTxd3otpKH6AAchqaDTbnl6rj5jalvrSZU5drTJZeoP8n5W
         kKbmWThYmhER2/9/UeoaRzEPUDesxKkCuyjcbacpqq156WPM8U9sIbhlVCtZ3IzhsZ4w
         lwkJgSgSEYJlgUZg+3va8s/72XAsz4dcOzk5zDCKAcbyA+7XHdnFPUonk7Bf98ZVBpaK
         kqybBTejv4yEqBVGes9jQOvywLhmclGY8bXL2tg97kUD3aVArpb5nvh2kjUPDXtmf5pW
         wWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772029294; x=1772634094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFY22rORlCjl1itZoL6ReZ+SgfM8hAioqFUB6hcQ4Cw=;
        b=jlxzKegl10XqDY2+UMuGmkNoQdWuW6iksOwddoKdGFpDs8UJg9ucjPjkuNSyc75I7E
         9MY8aeAowjdUze0H9R2t6wLQcDNM06GNaqLy0ns0w89c3i+Tv1xr8AEjKKKNmCY8DnN8
         4ubmI8fIZa7O//O3BW+WcDi8oAJAG8vAaS9Ado7YgELFBoUqTVI3MYmoOyRjdoXw2/Pm
         w9X1eesdoz79qbg4UDbzSb6oqR2zpC97bWlXSm5n/SOiwTD2cGY4hvIburvqDdyiXXQJ
         38c5tp2waW8+aDaRWJti31Rauqfl3Fd98aScdVKgfQJB51dq6wL6LO99VN+P5c+lKVUA
         /ueg==
X-Gm-Message-State: AOJu0YzDVIEG++3xS3bhAQLeg34w3ElTNFEm9i1At7auxLVeZSfVNAU3
	EfAlyRjOf7c8IyTKqw4D4cNXskAT2zJgqjZohRAUi8KrtSIuDccRUbS9uNqdmjB6hirv5fggTE9
	We3Ln8l7w7QurL1ufOsa5+Yc1H10SdGRlM0JZ4O6uhn9dZG0qx662POZJusOL5YzNLw+Q
X-Gm-Gg: ATEYQzzU6zWu+JldnsOrfWRsxosVyVoEKU5tZaahC/rFS9KDOVwU6DYbcIatBk99bIf
	m8PX0UIMeBOpiBq9d5eijqK8+bWZe1NzurNe+An8qqD/pDYiE2v6owf7VCrNek32NTVUET6ds7w
	EDyC8D3XZ23owUKfAeu1Uk9kObt3IMFDNMcYWysGgUhqCocm1HXv3aOmdPmCl6W7abviaJwav2E
	f+cy63G7oYciqeYqnRReYon+TZnYOjLMAA1IhXA9UjVD8AqfZH95HtSwaW36WRZk1llMqWSwhvb
	ckdkZICAm2w7uitfVy9C7uamFUnzhykUv8TuXdz7hgHA8jRdTGmPYJg9q+wC2MnzLLjS7SsHA2i
	pov31molA+rVCDqvGt91AGtVT7h/PFkiGxb75DRN3CQtikMTGWBZixv8=
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr2060695985a.14.1772029293227;
        Wed, 25 Feb 2026 06:21:33 -0800 (PST)
X-Received: by 2002:a05:620a:44d2:b0:8cb:47b4:165f with SMTP id af79cd13be357-8cb8c9cdc29mr2060687185a.14.1772029292356;
        Wed, 25 Feb 2026 06:21:32 -0800 (PST)
Received: from [10.224.242.57] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084caea29sm526952266b.25.2026.02.25.06.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:21:31 -0800 (PST)
Message-ID: <9e2584ed-0892-4c8d-a32d-2aba9d6239fc@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:21:30 +0100
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/1] virtio-video: Add virtio video device
 specification
To: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
 <20260213085306.313348-2-alexander.gordeev@oss.qualcomm.com>
 <SJ0PR12MB680603C30AB26E93ECB27E2FDC6FA@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20260215095955-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
In-Reply-To: <20260215095955-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DpFDQAYi-LPYg56Wy9aIaU4Kqh3JBUGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEzNyBTYWx0ZWRfX+T2/wVblNdhS
 oD4oOJkhkI5dHp0lpznpi3mEG8LOuJLIt3edmtR9/vgGxqvKU8ojb4AX4vpZMSnXsYIUNP3OGVm
 gEje6BdHMCltYaDbzCwfQENLKWvNlybyo+epFj7pnJCeTKJLZnwLoZBq0Fl3By0+BAe+2o5pacs
 L/TtZHiV1gS6+Os68S/GUqJqSC96wKjzdNIKF7CarqmO81KFleTsc8qGfSKpFTdfELR+n4pLHmC
 NPM9F1PMuPKy6vWaCD8vtI2lsa9S5wZ+5sIhIpTV0VFh4lgZ5fLFgRco5akE9EqQxUeRQ14vuJ7
 NLT2IZ+f4z2eSlQBuQxKyQ6K8qbHVqqczKGgbC0K4DFeBGjUxPylhNAT27yD671FZxRabs5jMPa
 SPfojg+yoB0E6izYBDzDXoLuEs2c/KEqhxh4Cm8TSlWbzDhIhGd/Z6Tzrpb9IspKf+g2HHQatAP
 NUpfEdLGDdcJfgYfHLw==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699f056e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bs-e4Z8cAAAA:8 a=fVPzZe-SYbF4OaQaJaoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=YFpLQiK6rFjqGb8m0bXF:22
X-Proofpoint-GUID: DpFDQAYi-LPYg56Wy9aIaU4Kqh3JBUGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250137

On 15/02/2026 16:11, Michael S. Tsirkin wrote:
> On Sun, Feb 15, 2026 at 10:49:22AM +0000, Parav Pandit wrote:
>>
>>> From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
>>> Sent: 13 February 2026 02:23 PM
>>>
>>> From: Alexander Gordeev <Alexander.Gordeev@opensynergy.com>
>>>
>>> Add the specification of the video decoder and encoder device, which
>>> can be used to provide host-accelerated video operations to the guest.
>>>
>>> Signed-off-by: Alexander Gordeev <alexander.gordeev@opensynergy.com>
>>> ---
>>>  conformance.tex                           |   12 +-
>>>  content.tex                               |    1 +
>>>  device-types/video/description.tex        | 1592 +++++++++++++++++++++
>>>  device-types/video/device-conformance.tex |   22 +
>>>  device-types/video/driver-conformance.tex |   20 +
>>>  introduction.tex                          |   21 +
>>>  6 files changed, 1664 insertions(+), 4 deletions(-)
>>>  create mode 100644 device-types/video/description.tex
>>>  create mode 100644 device-types/video/device-conformance.tex
>>>  create mode 100644 device-types/video/driver-conformance.tex
>>>
>>> diff --git a/conformance.tex b/conformance.tex
>>> index 9af31e2..f34e600 100644
>>> --- a/conformance.tex
>>> +++ b/conformance.tex
>>> @@ -37,8 +37,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
>>>  \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
>>>  \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
>>> -\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
>>> -\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
>>> +\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
>>> +\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
>>> +\ref{sec:Conformance / Driver Conformance / Video Driver Conformance}.
>>>
>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>    \end{itemize}
>>> @@ -68,8 +69,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
>>>  \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
>>>  \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
>>> -\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
>>> -\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
>>> +\ref{sec:Conformance / Device Conformance / Media Device Conformance},
>>> +\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
>>> +\ref{sec:Conformance / Device Conformance / Video Device Conformance}.
>>>
>>>      \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
>>>    \end{itemize}
>>> @@ -170,6 +172,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \input{device-types/spi/driver-conformance.tex}
>>>  \input{device-types/media/driver-conformance.tex}
>>>  \input{device-types/rtc/driver-conformance.tex}
>>> +\input{device-types/video/driver-conformance.tex}
>>>
>>>  \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
>>>
>>> @@ -264,6 +267,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
>>>  \input{device-types/spi/device-conformance.tex}
>>>  \input{device-types/media/device-conformance.tex}
>>>  \input{device-types/rtc/device-conformance.tex}
>>> +\input{device-types/video/device-conformance.tex}
>>>
>>>  \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy
>>> Interface: Transitional Device and Transitional Driver Conformance}
>>>  A conformant implementation MUST be either transitional or
>>> diff --git a/content.tex b/content.tex
>>> index 5de811f..0c13f68 100644
>>> --- a/content.tex
>>> +++ b/content.tex
>>> @@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
>>>  \input{device-types/spi/description.tex}
>>>  \input{device-types/media/description.tex}
>>>  \input{device-types/rtc/description.tex}
>>> +\input{device-types/video/description.tex}
>>>
>>>  \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>>>
>>> diff --git a/device-types/video/description.tex b/device-types/video/description.tex
>>> new file mode 100644
>>> index 0000000..8945e26
>>> --- /dev/null
>>> +++ b/device-types/video/description.tex
>>> @@ -0,0 +1,1592 @@
>>> +\section{Video Device}
>>> +\label{sec:Device Types / Video Device}
>>> +
>>> +The virtio video device provides support for host-accelerated video encoding
>>> +and decoding.
>>> +
>>> +\subsection{Device ID}
>>> +\label{sec:Device Types / Video Device / Device ID}
>>> +
>>> +50
>>> +
>>> +\subsection{Virtqueues}
>>> +\label{sec:Device Types / Video Device / Virtqueues}
>>> +
>>> +\begin{description}
>>> +      \item[0]
>>> +            commandq - driver commands
>>> +      \item[1]
>>> +            eventq - device async responses to commands and standalone device events
>>> +\end{description}
>>> +
>>> +\subsection{Feature bits}
>>> +\label{sec:Device Types / Video Device / Feature bits}
>>> +
>>> +\begin{description}
>>> +      \item[VIRTIO_VIDEO_F_ENCODER (0)]
>>> +            The device can encode video.
>>> +      \item[VIRTIO_VIDEO_F_DECODER (1)]
>>> +            The device can decode video.
>>> +            % Use-case: the device can support both encoding and decoding, so having both
>>> +            % here can save resources.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES (2)]
>>> +            Guest pages can be used as the backing memory of resources.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG (3)]
>>> +            The device can use non-contiguous guest memory as the backing memory of
>>> +            resources. Only meaningful if VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES is also
>>> +            set.
>>> +      \item[VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT (4)]
>>> +            Objects exported by another virtio device can be used as the backing memory
>>> +            of resources.
>>> +      \item[VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER (5)]
>>> +            The device releases an extra empty output buffer after a drain or DPC so that
>>> +            the driver can send a buffer with V4L2_BUF_FLAG_LAST set in the V4L2 way.
>> This does not seem relavant to the video device.
>> It should not be attached to any V4L2 implementation.
>> Can you please craft it differently?
> 
> My understanding is that this is a V4L2 device just like virtio input makes
> the linux input layer into a device.

Well, the device isn't really V4L2 and doesn't even use V4L2, but indeed the V4L2 driver is our main target for now. There is already virtio-media for exposing V4L2 devices from the host.
There are other drivers to come though, so we're going to have setups with no V4L2 at all.

>>> +\end{description}
>>> +
>>> +\devicenormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>> +
>>> +The device MUST set at least one of VIRTIO_VIDEO_F_ENCODER or VIRTIO_VIDEO_F_DECODER.
>>> +
>>> +The device MUST set at least one of VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES or
>>> +VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT, since the absence of both bits would
>>> +mean that no memory can be used at all for resources.
>>> +
>>> +The device MUST NOT set VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG unless it also sets
>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES.
>>> +
>>> +\drivernormative{\subsubsection}{Feature bits}{Device Types / Video Device / Feature bits}
>>> +
>>> +The driver MUST negotiate at least one of the VIRTIO_VIDEO_F_ENCODER and
>>> +VIRTIO_VIDEO_F_DECODER features.
>>> +
>>> +The driver MUST negotiate at least one of the
>>> +VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES and VIRTIO_VIDEO_F_RESOURCE_VIRTIO_OBJECT
>>> +features.
>>> +
>> You wouldn't need virtio_object feature bit. It should be covered using the capability.
> 
> To be frank I'm pretty split on this. Capabilities make sense
> if there are envisioned to be lots of these.
> I'll let the contributor decide if that is the case.

I'd rather not change this. We won't have many flags I think.

>>> +If VIRTIO_VIDEO_F_RESOURCE_GUEST_PAGES has been negotiated, but not
>>> +VIRTIO_VIDEO_F_RESOURCE_NON_CONTIG, the driver MUST use physically
>>> +contiguous memory for all the buffers it allocates.
>>> +
>>> +\subsection{Device configuration layout}
>>> +\label{sec:Device Types / Video Device / Device configuration layout}
>>> +
>>> +The video device configuration space uses the following layout:
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_video_config {
>>> +        le32 max_streams;
>>> +        le32 caps_length;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{max_streams}]
>>> +            is the maximum number of concurrent streams the device supports.
>>> +      \item[\field{caps_length}]
>>> +            is the minimum length in bytes that a device-writable buffer must have
>>> +            in order to receive the response to VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS, see
>>> +            \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Device Commands / QUERY CAPS}.
>>> +\end{description}
>>> +
>>> +\devicenormative{\subsubsection}{Device configuration layout}{Device Types / Video Device / Device configuration layout}
>>> +
>>> +\field{max_streams} MUST be positive.
>>> +
>>> +\field{caps_length} MUST be set to the response size of
>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS.
>>> +
>> This plumbing can be easily done using 'Device and driver capabilities' located in the 'Group administration commands'.
>> Please rework the patch to use the existing basic facility.
>> This can also possibly eliminate plumbing device specific command q.
>> More below.
> 
> admin commands are kind of heavyweight, they are designed for control
> path.  Question is, is this a data path or a control path thing?
> If data path it is not appropriate, if control path it is.
> 
> 
>>> +\subsection{Device Initialization}
>>> +\label{sec:Device Types / Video Device / Device Initialization}
>>> +\begin{enumerate}
>>> +      \item
>>> +            The driver reads the feature bits and negotiates the features it needs.
>>> +      \item
>>> +            The driver sets up the commandq and the eventq.
>>> +      \item
>>> +            The driver reads the \field{caps_length} field of the configuration
>>> +            space, prepares a buffer of at least that size and sends the buffer on the
>>> +            commandq with the VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS command.
>>> +      \item
>>> +            The device sends a response over commandq to
>>> +            VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS via used descriptors provided with the
>>> +            command.
>>> +      \item
>>> +            The driver receives the response from the device, and parses its capabilities.
>>> +\end{enumerate}
>>> +
>>> +\subsection{Device Operation}
>>> +\label{sec:Device Types / Video Device / Device Operation}
>>> +
>>> +The device supports opening and operating a number of parallel streams up to
>>> +\field{max_streams}. Each stream has three internal device queues: mainqX,
>>> +inputqX and outputqX, where X is the stream id. Each stream command has a
>>> +field that dispatches the command to the specific internal queue.
>>> +
>> If these queues are internal to the device it does not need exposure in the spec here. If they have a meaning to the driver,
>> Than keyword 'internal' should be dropped and rephased.
> 
> I think the implication is that within each queue commands
> are consumed in order?
> 
> This isn't terribly clear.

Noted, I'll make sure to improve the description in the next draft.

>>> +% Use-case: there might be different real-time requirements for different
>>> +% streams, so more virtqueues can be added in the future if necessary.
>>> +% The internal queues don't change, the data formats don't change, only the
>>> +% mapping of streams/internal queues to particular virtqueues changes.
>>> +
>>> +The mainqX is used to open a stream with VIRTIO_VIDEO_CMD_STREAM_OPEN,
>>> +close a stream with VIRTIO_VIDEO_CMD_STREAM_CLOSE, reset inputqX or outputqX
>>> +using VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET, set some of the stream parameters out
>>> +of band with high priority with VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, unblock
>>> +the outputqX with VIRTIO_VIDEO_CMD_STREAM_UNBLOCK if it gets blocked for
>>> +format negotiation.
>>> +
>>> +The inputqX and outputqX are used to queue input or output resources using
>>> +VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE. Additionally inputqX is used to set input and
>>> +output parameters using VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS, to complete
>>> +processing of all queued input resources and make the resulting output
>>> +resources available to the driver using VIRTIO_VIDEO_CMD_STREAM_DRAIN.
>>> +
>>> +All the stream commands start async operations, return the results
>>> +using async responses over eventq.
>>> +The eventq is used by the device to send the device's async responses to
>>> +stream commands and the device's standalone events.
>>> +
>>> +% This way eventq becomes the single source of truth about the device's state,
>>> +% the driver doesn't have to tediously synchronize commandq's and eventq's
>>> +% used queues the way it was necessary in the past (similarly to V4L2's DQBUF
>>> +% and DQEVENT). One more benefit is that commandq is processed fast and
>>> +% strictly in order, so commandq descriptors exhaustion should never happen in
>>> +% practice.
>>> +
>> Video device should be implementable without any V4L2 binding/description etc.
>>
>>> +Parameters allow the driver to configure the stream including setting up the
>>> +resources. Available parameters depend on the device type, see
>>> +\ref{sec:Device Types / Video Device / Device capabilities and parameters}.
>>> +
>>> +A resource is a set of memory buffers that contain a unit of data that
>>> +the device can process or produce. Most resources have only one buffer,
>>> +raw frames using a multi-planar format can have several.
>>> +Input resources are filled by the driver with compressed (coded) video data
>>> +for a decoder and raw frames for an encoder, output resources are filled by
>>> +the device as the result of processing the input resources with decoded raw
>>> +frames for a decoder and compressed (encoded) data for an encoder.
>>> +Resources from inputqX and outputqX are consumed independently, not in pairs.
>>> +One input resource can result in zero to many produced output resources.
>>> +A decoder device dequeues the output decoded frames in presentation order.
>>> +An encoder device dequeues the output decoded frames in decoding order.
>>> +The driver can reuse a queued resource after receiving a corresponding async
>>> +response. Dequeued output resources can still be used by the device as
>>> +reference frames, so the driver can't write to them.
>>> +
>>> +% TODO: maybe send the second RESOURCE_QUEUE async response, when the dequeued
>>> +% output resource is not used by the device anymore and therefore becomes
>>> +% writeable?
>>> +
>>> +The device can detect standalone stream-related events: errors and dynamic
>>> +parameters changes that require intervention from the driver (e.g.
>>> +reallocating backing memory of output resources to fit the new parameters).
>>> +The events are signalled on the eventq, see
>>> +\ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>> +
>>> +\devicenormative{\subsubsection}{Device Operation}{Device Types / Video Device / Device Operation}
>>> +
>>> +The device MUST set to zero all unused, disabled or padding bits in its
>>> +responses.
>>> +
>>> +\subsubsection{Device Operation: Command Virtqueue}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Command Virtqueue}
>>> +
>>> +This section lists the commands that can be sent by the driver to commandq.
>>> +
>>> +Different structures are used for each command and response. A command
>>> +structure starts with the requested command code, defined as follows:
>>> +
>>> +\begin{lstlisting}
>>> +/* Device */
>>> +#define VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS      0x100
>>> +
>>> +/* Stream */
>>> +#define VIRTIO_VIDEO_CMD_STREAM_OPEN            0x200
>>> +#define VIRTIO_VIDEO_CMD_STREAM_CLOSE           0x201
>> You can craft the stream using a existing basic facility of resource object.
>> Where each stream is just a resource object, that be queried or modified.
>>
>>> +#define VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS      0x202
>>> +#define VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS      0x203
>>> +#define VIRTIO_VIDEO_CMD_STREAM_UNBLOCK         0x204
>>> +#define VIRTIO_VIDEO_CMD_STREAM_DRAIN           0x205
>>> +#define VIRTIO_VIDEO_CMD_STREAM_QUEUE_RESET     0x206
>>> +#define VIRTIO_VIDEO_CMD_STREAM_RESOURCE_QUEUE  0x207
>>> +\end{lstlisting}
>>> +
>>> +Stream commands start with a header:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_MAIN    0
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_INPUT   1
>>> +#define VIRTIO_VIDEO_QUEUE_TYPE_OUTPUT  2
>>> +
>>> +struct virtio_video_stream_cmd_header {
>>> +        le32 type; /* One of VIRTIO_VIDEO_CMD_STREAM_* */
>>> +        le32 stream_id;
>>> +        le32 queue_type; /* One of VIRTIO_VIDEO_QUEUE_TYPE_* */
>>> +        le32 async_response_cookie;
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{async_response_cookie}]
>>> +            is an async response cookie provided by the driver, that allows
>>> +            to relate an async response to the previously submitted command.
>>> +\end{description}
>>> +
>>> +\subsubsection{Device Operation: Event Virtqueue}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: Event Virtqueue}
>>> +
>>> +The eventq is used by the device to send async responses to commands queued
>>> +by the driver on commandq and standalone events. Stream errors and dynamic
>>> +parameters changes are caused by changes in the device's state, not by
>>> +commands, still they are delivered as responses to implicit
>>> +VIRTIO_VIDEO_CMD_STREAM_CLOSE and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS,
>>> +respectively.
>>> +
>>> +Events start with a header:
>>> +
>>> +\begin{lstlisting}
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_ERROR              (1 << 0)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_STANDALONE         (1 << 1)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_CANCELED           (1 << 2)
>>> +#define VIRTIO_VIDEO_EVENT_FLAG_BLOCKED            (1 << 3)
>>> +
>>> +struct virtio_video_event_header {
>>> +        le32 event_type; /* VIRTIO_VIDEO_CMD_STREAM_* */
>>> +        le32 stream_id;
>>> +        le32 async_response_cookie;
>>> +        le32 event_flags; /* Bitmask of VIRTIO_VIDEO_EVENT_FLAG_* */
>>> +};
>>> +\end{lstlisting}
>>> +
>>> +\begin{description}
>>> +      \item[\field{event_type}]
>>> +            is the type of the event.
>>> +      \item[\field{stream_id}]
>>> +            is the ID of a valid stream.
>>> +      \item[\field{async_response_cookie}]
>>> +            is an async response cookie provided by the driver, that allows
>>> +            to relate the event to a previously submitted command.
>>> +      \item[\field{event_flags}]
>>> +            is a bitmask of VIRTIO_VIDEO_EVENT_FLAG_* flags
>>> +
>>> +            \begin{description}
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_ERROR]
>>> +                        is set if the command finished with an error due to an
>>> +                        invalid argument or for other reasons.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_STANDALONE]
>>> +                        is set for standalone events, see
>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Standalone Events}.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_CANCELED]
>>> +                        is set if the command has been canceled by another
>>> +                        command, that has higher priority. Doesn't make sense
>>> +                        for standalone events.
>>> +                  \item[VIRTIO_VIDEO_EVENT_FLAG_BLOCKED]
>>> +                        is set if the command triggered a block on the
>>> +                        outputqX to allow output format negotiation.
>>> +                        When the negotiation is finished the block has to be
>>> +                        removed using VIRTIO_VIDEO_CMD_STREAM_UNBLOCK
>>> +                        command, see
>>> +                        \ref{sec:Device Types / Video Device / Device Operation / Device Operation: Stream commands / UNBLOCK}.
>>> +            \end{description}
>>> +\end{description}
>>> +
>>> +The particular data structure representing the event is selected according to
>>> +the \field{event_type}.
>>> +
>>> +\drivernormative{\paragraph}{Device Operation: Event Virtqueue}{Device Types / Video Device / Device Operation / Device Operation:
>>> Event Virtqueue}
>>> +
>>> +The driver MUST at any time have at least one descriptor with a used
>>> +buffer large enough to contain a \field{struct virtio_video_event}
>>> +queued on the eventq.
>>> +
>>> +The driver MUST NOT put device-readable descriptors into the eventq.
>>> +
>>> +The driver MUST account for the fact that the async responses to commands
>>> +might come out-of-order (i.e. after other commands sent to the device),
>>> +and that some of them can be cancelled.
>>> +
>>> +The driver SHOULD wait for an async response of command A, that caused
>>> +cancellation of command B, before queueing the command B again.
>>> +
>>> +\subsubsection{Device Operation: TLV format}
>>> +\label{sec:Device Types / Video Device / Device Operation / Device Operation: TLV format}
>>> +
>>> +VIRTIO_VIDEO_CMD_DEVICE_QUERY_CAPS and VIRTIO_VIDEO_CMD_STREAM_SET_PARAMS/
>>> +VIRTIO_VIDEO_CMD_STREAM_GET_PARAMS
>>> +commands represent device capabilities and corresponding device parameters
>>> +in the form of TLV (Type-Length-Value):
>>> +
>>> +\begin{lstlisting}
>>> +struct virtio_video_tlv {
>>> +        le32 type;
>>> +        le32 length;
>>> +        u8 value[length];
>>> +};
>>> +\end{lstlisting}
> 
> will cause all kind of padding mischief if length is not a multiple of
> 4.

Yes, true. It is indeed mentioned further:
+      \item[\field{length}]
+            specifies the \field{value} size in bytes aligned to 4 bytes.

