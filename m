Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677403;
	b=FwCicv/sE83FYtjzwvEjxZIgT3wluWYKgaGxQ1PRRdeXpKgBzT2QF64bFtdgXU53gdeZ
	 9hjExUq1nXAMA0YsSJ9qPSoir+I5ljYEInrIm0lngwWjpD0PjxEnANoBWuzAQPPUzpFiv
	 92+ygv7kSiDRFW4rpC2MwUHQyn/c+bZvRmqoriFtKX3OtfR11fmQBBQgOpsOk/THACEf4
	 rjYpn/QQRcEw42kFJ9imSYI4gD0+dxMvt19y3qWQn5TljSwkQhfZTqa3ZIk3SCuiXAAxM
	 xTHd6Uso14AwM7zvq+wOlXnCR6xpbQIbB14jSSPumEADj4BovBWAomWdzjgSfFJdU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fTzMFgy0eDRi1/Pb6zRrknP5LR8bZ+zVvCjYNlZmkis=;
	b=heaGKOKKNx2VYQagNFyLzV3+8iWoPonMB9eoe/RBP9x0FUi4+6eWqQhC6zCUK3cwnsYG
	 nm/NnIwwQdkDcttFnM0XbzfZlo95raoHLOMnV0pYe680vG4uyY0lF5ab0tMdUY9l2cUuV
	 oPywp+6WwihZr2D9u41vBLGi0IUX+g2mcFO4jxXjnfoVWmA0TJUvpl7oYH49Jgxc0FOHP
	 CIpPO8VmFhMEJ8GnOFoGewsYUeElG9RYkcLQqQweD68PqdRBXlT5oLJMB9nD8keieRb2x
	 fhVqyca2Vwpr/mQCIlHyltaZByfs6dkI64PMJLXJmEAal/vqLdM/UH5JIgajfbumS2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a++h9GR0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kuzt8Kqp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58DC606A31A
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 13:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58DC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a++h9GR0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kuzt8Kqp
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M9xqQB3478830
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 13:56:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fTzMFgy0eDRi1/Pb6zRrknP5
	LR8bZ+zVvCjYNlZmkis=; b=a++h9GR00N/bJz2BrcMe5VZQI0IZo8I4jbFCW7DZ
	jAspCyXC3AgGA+ABLTGMXzXTZYTuOt12N0KK9syEs3PVtTy8N1lj6+y2PHbPCYm4
	hpvsKREY424htEu5Qrpc/eZy9KePXNbi5fuuiyMkoeRECLTWaNhPpjW3nI+yLXe5
	MH9fZ56VV/1BtqkfXoLS3CNmNbPneyi+u51DC+aFN4a1RhQGpPBZ/gH/r4KyuO7v
	5PXO0SgsjrBcgLjkZryWimaKT/XJcJUf3OUgwEY1NfFP+kgFDG3BPe2G2JGcb1qw
	clwJGJuT+ZKCA9bJAhg8e6SK9D0ph9ftWiCfBqh4DFuVDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a3u4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 13:56:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f322ef7d3so425357585a.0
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792677401; x=1793282201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fTzMFgy0eDRi1/Pb6zRrknP5LR8bZ+zVvCjYNlZmkis=;
        b=Kuzt8KqpbJyT8OrTUbbD7SYS84ADASJsmRy0iyvKwfO+z9MpUWFg42IWohNu9l5pU0
         THwGS0cIoAZO4ZJ7k2knR4O4jtEpgiPY0Z05vIZxwM6LXXsLZKsooDa7zf667cROKIvI
         TO0Yy1Zfvdpo8sCNIU6z+ikdVR29fSUfN9GyI7ilB5COXyE7Pnqwj4TaN4kH2z1vFrPT
         stHEhLMCBcY7m7xTFxBuXjgaSuNIe1r2XNdRi8jgtFU7EoVH5U9AIG8slo3Iug5QDUKC
         pUtMH8xcUe5UyPkbw/VNbPrLeNwDWvKa3kPTvODfrTMJq1ZV3DqAUB7UOm3zmAaGaQQp
         30LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677401; x=1793282201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fTzMFgy0eDRi1/Pb6zRrknP5LR8bZ+zVvCjYNlZmkis=;
        b=pckdIi+8HnlVfRoJpUCJ7Z0E3j8qIsT2g7LCRxyAX/81H1eM7oBDCJe2/lmN754UCh
         OWjmPMsNQVm45NbSL65bfNjM8L9ppNBxauTPz6rQtBW0gvL7c9mabezdkAVl0tpDX3tP
         cMd3SSWtDyc/B3vfZcowdUvOegBRwwlYR/anuUX123FzAcR6kED53uqebPnMCIoqeEp4
         o/s/zeGLWPmS/dPMgqXo3IzRpWYpnqQqMQsJU5vh/eRob6vukyM/f4pryFvqqBMjhUfX
         +FM3Yk7vkavkYGBfiwN5qIrrIqQWuC+UKfsaQJtFMt/IQ3VMIkkLDGXYhhZulwOb1fy4
         hv6w==
X-Gm-Message-State: AFq9FYIyD4Zw9iQLo8j0yFDbdLS1SDtgDf+HnF0ipWuiqsrUhizAKVdY
	FtqG7EiakLdXk/xjzl0CXud2gtq3z6E0rjG0/fR3djb8gM3bJTzRFC9wO21o3DCLO9jubCdLSy9
	y+IBJgiPz7htrasY/YoNnHF4DUEO946FPhgKaFU2ghJipSDfoVC6fHobQ/pg/d81GNa55rA==
X-Gm-Gg: AYBFou2cH0Qf7ae8fa7ErZGiakuOql6suO00UW3I0IpNAZ+l4oP7X98rLdJWEEJg9xm
	xXTq78uI+rupHhhdnQXkT4PqkLktaPawRGM8L8RzaovVFa4Gxgod7dSizcpUmuZc7TnIba93bzh
	ESDXbxtvsf4Ojk7z3qtE74oU+IIZOpLSZ1ye03qiQZdi5qDRe22+eTJ8GwOm3GnzPMtLAP4L9pZ
	bDvtUyVF5Sk2V5pyFBypStRKMg/pzOqNO3fiMjx5bRIGpj8nnEP8YeihRHLfeH2WEBtEscXDsWy
	zSmCvOShYWmS4hDsk1IUU6oTjNArQEKEcFwexXK2xcEuZTTMbiFDWVrwdcNdswaRonPF8st7ItY
	SR665p1cbK9xErX+lNJ/4SLBGKF97JvMwdA8eG/HaqUtnbWoPtHxM56vJXobKHz2GM1BZl50RQ4
	khQzUpL2mzT3eZ
X-Received: by 2002:a05:620a:2b4d:b0:93a:2e8:5aff with SMTP id af79cd13be357-93f57f2008cmr971029285a.21.1792677400815;
        Thu, 22 Oct 2026 06:56:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93a:2e8:5aff with SMTP id af79cd13be357-93f57f2008cmr971025585a.21.1792677400316;
        Thu, 22 Oct 2026 06:56:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1144dddsm1164574e87.0.2026.10.22.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:56:37 -0700 (PDT)
Date: Thu, 22 Oct 2026 16:56:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <odtalcbazy3oajmdpdztlpng5r4b4e4e6yfb6qilovzcgy2wxj@c6vppgfxms76>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX3atdi0YeUTFx
 agvKWeQIacCQMmXtRm55TJ0kwP5+OBFrd02aqT/hrStTzQntVIT0vA103YouA/+ItismxwQ2hE0
 04aJLZv6fv8UwS82AJ24W2bI9tkz+qNhijv60oIQ3dwmI52/0B1hPp2jVkLzQ3IRFgmAIzDtqVC
 yuihPHDMc7CBk0Op2ZkcQ+0ZFSicUtRj6CgSvvVA25URXxniglFp7D+mhuno2CcLho326j6PRFI
 39mirBZJP1yb4J9S8oXf/kuO0zVmP4+rzHPQOcutNeoStRq1Pn1fq03zNXtjh94sPKe346D+0q/
 juv5E5YOJjdGh3QyC9fvP4sFi01gof5aTrZzunlTfgJe+LltIq0gwchXu+X64U9tQN0V6LezMKU
 atUJN5V8hJlyJlo1m/h0r+UIpTJD7M/m0KarHcfy4QTlKmubs5xRQfNDh5x1NhKiu/NZMaBbSmh
 6B/oZEl9szJRgBJSKIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NSBTYWx0ZWRfX8rhJn4dVdusV
 XBusH+qGFomY1auQL59YIWSOIPVo555tgrep1ab5VZUpIbMaDkbOoBMt08jmkA8ZbaqBfBsF1Un
 zhbXnUADbgxghTrVjPsmWo5aSh4lgng=
X-Proofpoint-GUID: yIw0cZsT6dykXVuGaL9Zg55sOIlrKkzc
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada1619 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IbgqrMtserlBAEe-43gA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: yIw0cZsT6dykXVuGaL9Zg55sOIlrKkzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220055

On Wed, Oct 21, 2026 at 08:00:31PM +0200, Peter Hilber wrote:
> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> Firmware Interface). QPSFI devices expose functionality across SoC
> subsystems through a common Virtio-based protocol. There are no plans to
> standardize the devices.
> 
> The Linux DCP display driver series is planned as the first user of this
> device ID:

What exactly does this mean? What other users are planned for this
device? How do we plan to differentiate between them on the kernel side?
What exactly is planned for device 52? If the QPSFI device is passed
into the Guest VM, what should that VM do?

> 
> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> 
> Device ID 51 is already reserved for the Virtio HAB device:
> 
> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
> ---
> 
>     v2:
>     
>     - Rename the device from "Snapdragon device" to "QPSFI device".
>     
>     - Refer to DCP Linux driver patch as planned first QPSFI user.
>     
>     v1:
>     
>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
>     
>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> 
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 243ce2dde36b..7416939e67d3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  50         &   Video encoder/decoder device \\
>  \hline
> +52         &   QPSFI device \\
> +\hline
>  \end{longtable}
>  
>  Some of the devices above are unspecified by this document,
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
