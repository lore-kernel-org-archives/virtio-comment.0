Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792708796;
	b=EN+Dux4YsrmAnLWG9kh5BTabqJoH8VlFGfX0jbMob67iOT1LLfEbXbPbOFxp6m96wibw
	 ba/RLcx0mbwciuy3f1ckXG9pPr1C9eh15tsSY4cZn+JgiLXut8utruAr0iKaisKeIe+kH
	 RFGGbdqX2Q81cpTSbTylbgwwoG7c76Sp71CnChluqplapkPvcG/cpWYtsxnOTA81B3EgX
	 Xg74mGa1xhCVj19ur2krjD1X7Sd2i/9aAlT/xfMw+YtV5AEu/vxpEIpBYxXPBZd7Z4M0L
	 jPcdcfCMV50CSJypabqrXdbmbdnwwmDRA9gc+ZMJoHJhM16enlBsGtRAt4sPEpAiNTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792708796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WrtJH1l0q53B2Snlo95dQsJFKKlOLv/a1aDsrH/i/ZA=;
	b=xUMlk3WAomQ/rkqD+NZ9DeTPhD2NQerR9DWX53s1rs6H8FEooDbX+eWBfVKx/mt+0T/8
	 OUdOGjLsieE+9clK1Pa8nBhM9mR6QsjSy+rexNzcbtNEHb+htkSpJmyEq3f6x9WiNp82f
	 LxmHnoruRk6VLf7lXj9JKr7q1And8enu9G5BBna6x0qa1KkiMPPumLnjO7pkaE9kegN2V
	 8xKmeGbThlvc9nahlZfeicNWu9oj3qwSSBrOkmzWhUMX9ABfxSIXI5E2uU9yq/3s1tmKj
	 gVQWKgM2NPqIL6aa0RKvf/d2ZomDstD5sQbJ9IWeZFeOSzNz0yRHVmAQ/f/ktWClJLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vne9occe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kN6BoGfj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FEF606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 22:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FEF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vne9occe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kN6BoGfj
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMPuDN933385
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 22:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WrtJH1l0q53B2Snlo95dQsJF
	KKlOLv/a1aDsrH/i/ZA=; b=Vne9occeMcoXH6BJ9P2KOa7dTi3QajoN+F8zFFYT
	huSHUQ+V3+peYq2RU3EHsH9aWnc2jqO8z3HMkxr75+BNOJSVuGGe4ENe52OPbvh8
	AV77Xh6e7zsIEEEkUuxaV7vtitXF6Qp4rL+Z3JsDmyFzmqM5PcVkMN1RyN5pRYlK
	SYS9/maZkjg35iBngurdJ6MoAz+bddDBTDpYm/5jIzU//T3Rni+LHU0+mAxiqfLh
	OHvw+jYgIBN/tK+39raJlrHGjJLZIwgFI1hvErB0qA167n3xdaIdNbWOmn9QQJAJ
	IEhlMN8UUs+jhYNHeYH31kZ04cLuAv6oHxoRF0kTDx7m4w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnyw1ck1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 22:39:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so53378485a.3
        for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 15:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792708794; x=1793313594; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WrtJH1l0q53B2Snlo95dQsJFKKlOLv/a1aDsrH/i/ZA=;
        b=kN6BoGfjtvSy6Sm6ri4mGe6+6M6ILaT2Q7LwW47t2QrmI1DMeifPu9V7v29sdZk3Xm
         TFw0HLWobGI/R9g0rD/cgrylky75AWhNP+V9NPPHNoUJzG3lYuOZ5tpS2nhKd7x1tmf7
         JFQJOxhnMb/jfPLf60HQSFTtcZS4mznINEDAAsFiWJ3yS6Hg7EgwhdLT5dDnhI05OZNH
         m4vNpzXs+cDqxnwh2hmdE+VKFubk+J1gv+WhyChJeFlA3hH0JRDFr9vZQfwbGEsi3BeB
         Z2VfbkPKMJPCXQJb+YDlikHl13Ourt2fB+ubhEI3Hty/GH4uOqyzm3iYL6gRqkQ5pMbJ
         b4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792708794; x=1793313594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WrtJH1l0q53B2Snlo95dQsJFKKlOLv/a1aDsrH/i/ZA=;
        b=Ucs+Vl9GB4MuKbRniBNi6Ox4j87/9IXtxtv/FL8MQw3jU63uhir07gNhRvxzaE5ExM
         PAPgGIpXm0qNE9l1OS3rRcEVecVgnB1mnQVl/clSyNNCGEOM4PAxDW7UzZ57XyTW0F7J
         zPCgX1bb7eM5KkIwvy8mcODtEYpKqyksXTpPnxVRWgGtO6tcFqOuqQAOc0LGwJnJdAfB
         kuj4bFykOYq4YiU1ZS6yM7hfl2vQqfN5oEtxytNUrGwqi04kyiSIq7UTJQAyeUay1ze5
         Nx0MND9DATzoZfeb8uE3qpkijhRlUzzww2B84JRY/rYvg8bz1BLuO5//WNPv3BKLEFkq
         W4+A==
X-Forwarded-Encrypted: i=1; AKwUvBygj+pnjX4bmX0hu4QYzYKI20W3u8dRMYEwZuSacCWgo4Bta0yRtmrefOKBI0LB0bmdQUcIbuLv+/uJlP4cYA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLT2aW7AMFe+Rcgeb3OC5ngu+eXhIYCZ4/OVqQ/NIHuxJpHJvVs
	rUTDy/+k3BMnfZgoaUWB7q6FU7ZbXkSu0CEX+Ad4+OdGSzMxBknDeC3RQ4BnV8C9AmpZ8j3dq67
	xp0F2Y3vVQceDyXA9knRBJT3ITWMfabInt+YQUrGNLfDlf/gBY5kPfW105TJVNu6z3K1R2w==
X-Gm-Gg: AYBFou3L36sLTLW+yiUU/3InZMHo3vkTsRK8gtbmuEXKCd0a8k0qNnk6kY0G1oN1Otq
	4lKBfV2Gp2GJupR9WTkRgH4WnngtByw0XiVhRDCU7epNabtGjeG3+gfVhaVMFH+JZxhBONlXtIE
	VuMFiyzazBi4ur2ZpicwxxxuszpHZWEv3bu/9MfLdFqKHGw0qNs789rG/nayAST9Z077aiLW7OP
	IsV2iWNI4f+JWYFf5JOceNFGFvuH2lrxeqfvmi421wde7BKA54771iXfIrKiJYcQXCP20sXGG9c
	Ambsn1r2PfcYBVQstcYlYTPg+dNRE9cCUYv9yrF1QRrmRmc+34Arz/29QEb/83VYQgYvW5r8Wl8
	DuwMcHQkrolxbn/dmYW1DgNK35tTtv3MSFw==
X-Received: by 2002:a05:620a:2706:b0:93f:26e7:844 with SMTP id af79cd13be357-93f6f878a6bmr167674685a.55.1792708793961;
        Thu, 22 Oct 2026 15:39:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2706:b0:93f:26e7:844 with SMTP id af79cd13be357-93f6f878a6bmr167671885a.55.1792708793575;
        Thu, 22 Oct 2026 15:39:53 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([5.28.88.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a210473567sm28025365e9.12.2026.10.22.15.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 15:39:52 -0700 (PDT)
Date: Fri, 23 Oct 2026 00:39:48 +0200
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
References: <CAAjaMXZgKGWL0dJJSh74Pf20EezY8zPOsSg1aNkp_ssvXuP7BQ@mail.gmail.com>
 <20261022091645-mutt-send-email-mst@kernel.org>
 <oinsf3ecwsrgxuff2m4q3qsjzfg3quldsqv3wjnlzxqbiyzhrz@m4s7bjwc2fsf>
 <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
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
In-Reply-To: <20261022122727-mutt-send-email-mst@kernel.org>
X-Proofpoint-GUID: 5nh7sv38KE1-8yXBBZxZuRm3OTPb0sLk
X-Proofpoint-ORIG-GUID: 5nh7sv38KE1-8yXBBZxZuRm3OTPb0sLk
X-Authority-Analysis: v=2.4 cv=dphOmFg4 c=1 sm=1 tr=0 ts=6ada90ba cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=/GwMXQ6HEHG2q0jO9P/HgQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=6xFB8at5gdKFYLWNAWYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA5MCBTYWx0ZWRfXznOMz3yFQuQU
 HzC4KM4+bk540wIfIpavYoTpjdt7FJ9BpR64mu+rs/emk7EDEUepNkbf/bkZwmBdCSwlLmIxADU
 yJke+p4Ym7sfLealz2oqKOBhEBPGWE4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA5MCBTYWx0ZWRfX2jlHiutUCroZ
 IU/X4icoy+hm5gOOAnRU/THi3VQ+a3toVlTa0CJ2mX0Qct2UfI6LgxiIHC29gbkEpJ6ac9SOdPS
 lH3uNAmbNs6YYXuEg2RFILJiiGpUioeoy7OmadixNTIUE45eyfl0r8ilIaWZ/ukDCKZFubgOSmE
 BXqDu/UfG5Q5VjW2sSsqiVmwyco6P93eNebuq8STsCh4n31ZHolPfiuzXqGLxlcEQBaGYnfeTMv
 NmV5qpqKd+MmDymF80d2aB2efFyqcBLwZv5ArioE2saSw19HnXYnETnIJwjHBSyzrxbJEYBJ4sK
 so3WI0nRHafXRyNwoX2XrO/o96A9xo2kHeDSRGFolEuJX2udWwCMvZFfsjA5OX58kA9XMrRq5dA
 CHve32jDSBrgBtam3zN04rNQEM66uFWLZgVYN2AlAkWZp1JfmjqJUZVOp+TRMSomvU/LMV3sMoi
 0988uwx6vjq7ZGdH94Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220090

On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
> On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> > 
> > > From: Michael S. Tsirkin <mst@redhat.com>
> > > Sent: 22 October 2026 09:32 PM
> > > 
> > > On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> > > >
> > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > Sent: 22 October 2026 09:12 PM
> > > > >
> > > > > On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> > > > > >
> > > > > > > From: Cornelia Huck <cohuck@redhat.com>
> > > > > > > Sent: 22 October 2026 08:35 PM
> > > > > > >
> > > > > > > On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > > > > >
> > > > > > > > Let's define some standard way for the vendors to declare that this
> > > > > > > > device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> > > > > > > > block".
> > > > > > >
> > > > > > > Are we able to use the first <n> bytes of config space for that? I guess
> > > > > > > that is the only way that can possibly work for any transport.
> > > > > > >
> > > > > > > Then, maybe something like one or two bytes for a vendor id (including
> > > > > > > one for "testing purposes" or so), and the rest to be used in a
> > > > > > > vendor-specific way.
> > > > > > >
> > > > > > device ids are independent of the transport.
> > > > > >
> > > > > > but Peter already announced that:
> > > > > > " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> > > > > > Firmware Interface). QPSFI devices expose functionality across SoC
> > > > > > subsystems through a common Virtio-based protocol. There are no plans to
> > > > > > standardize the devices."
> > > > > >
> > > > > > So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> > > > > > Why a vendor specific implementation of device and driver is not sufficient?
> > > > >
> > > > > I don't really think we should vendors burn up device IDs every
> > > > > times they want something non standard. Reserving ID 52 as
> > > > > "vendor specific" so vendors can go wild sounds good,
> > > > > but a bit more needs to be done than just reserving:
> > > > > document what is expected, e.g. no auto load based on ID
> > > > > alone.
> > > >
> > > > First, you indicate to open virtio to vendor specific extension. This is huge in itself.
> > > 
> > > Not as such.  It's just reserving an id. People always do things like
> > > implement some crazy spec saying "we will upstream later" and later they
> > > do not.
> > > And then the ID conflicts with a standard one. Suboptimal.
> > > 
> > > So if we can tell everyone "always use this ID, and use platform
> > > specific tool dor discovery, until your device is in the spec"
> > > then that's not too bad.
> > > 
> > > 
> > > 
> > > > that should be first discussed.
> > > > If you suggest this, may be every device type should be able to extend, and not just demux at device id level.
> > > >
> > > > Second, one reserved id is not enough, because a given system may have multiple such different vendors devices installed.
> > > 
> > > I don't think we should care.
> > > 
> > than all 0xffff as one experimental id once for all is good enough.
> > than vendor FOO, BAR, differentiation is not needed.
> 
> I don't think we want 0xffff, a lot of systems treat that value as
> special, pci comes to mind.
> 
> > And if it is not for experimental purpose, not sure why would vendor stop at only one device.
> 
> They can reuse that id as many times as they want and differentiate
> with a device specific or out of band methods.
> First X bytes of config space was mentioned. or whatever.
> 
> We can add a recommentation maybe if vendors desire that.
> 

Thank you to everybody contributing to the discussion and to the concept
of a vendor-specific device. Just for clarity, Qualcomm intends to
upstream Linux kernel drivers for this new device type, so would
definitely want to use a registered device ID.

In case of an in-band approach, I suppose we would then have an explicit
vendor list in the spec where vendors have to register?

Best regards,

Peter


> > > > So why to bend things so much and re-invent the wheel?
> > > > Why for say PCI transport's any vendor and device id are not sufficient to indicate a vendor and device?
> > > >
> > > > and if so, why to even document it in the virtio spec?
> > > >
> > > > I guess, I am missing the basic motivation part.
> > > 
> > > For the virtio spec? Above. For Qualcomm since they decided never to
> > > upstream - donnu. Don't care much, either...
> > 
> > ok. so yeah, let vendor's platform device be in the vendor's OSS zone.
> 
