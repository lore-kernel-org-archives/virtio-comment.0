Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788991;
	b=5HnJzFNiMg2m7uKUfrgi1FXmBNiAvEAB203JriIuj617c9UpY9D7NaO8T0sSid/YCVJB
	 JjAlUr4XArrTiq8LUaS8Sib16SQJFKgyNHaWw01ZFbBu2wWDgHrrLALluBNLO948sR4+F
	 bNg1oPx861KTJY39D+6gaedDn4uNLYStt294d2Xf3t6apLXQq55zVuTudBgihzHWoMvjU
	 vT2uAvofkX+Wi4Q3YTOhDW7kb2t5mVsxZivcKO2xrbT+hnjrJ/xUy/1QHhV5ClX/f6KSI
	 A9glvIh9uCHs2hB3fkXEeg+KY5zZcDSLCYvIgoh5o7Lp6s2wVI52je78zb/Sat+m74A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0dT8/r7nIDSFLWCIjg6j+gJrBQLhTR7DEJ+w+MMMQSI=;
	b=QR0H6fqc1xlYOD1ujKhZX8s55ebopIVFGtQOD8I/N1xIk7gF1uRQuEssBfQlyzb8RykT
	 145dkmc6hchOcylcPw1KvdgEBhg4JK3cz7DMOftKMeCmYgQYO6QXAu6gOxEehJe/5zF4U
	 nS1iKjqHtT85MApanUfD1g+hOXyIZ0ipVk8/8eGeR+l107LtLfklosHR1Whn2678Rp/RZ
	 kNBgJ5FDnJuk3G/bnrxGGvDIU/epCvmmxyxv+XeLVNU7BhgpK4j4nDsqAKpGg4fAriqQc
	 fpKhT9UpyGEVAhnz8v2U1nt10DyfrOeunpBdkHwjSOq6eYtF5NRDmIBrNk06Z2DttYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYNhH60C;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXoG4aR3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A60606A31A
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 20:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A60606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EYNhH60C;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AXoG4aR3
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIaWSf3260875
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 20:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0dT8/r7nIDSFLWCIjg6j+gJrBQLhTR7DEJ+w+MMMQSI=; b=EYNhH60CKwqkb+cb
	UCqFQSgrDCFmmYjMnyUElrJysS+iOuXd0u+aVGRZ7M+o4LCa2ehQ6HDGYK6B3sxz
	MeWGUbs/c6eOxKvtfPu7IC7VL2KX+yWGgpVDxkdgkbT6/MGhNBN8B9ucNXZhswg7
	mv0PCPWTuiq7uL3Y4bF+2xKLoOwGWuJYRMlzF3H/Fksa/J3iapsaXX6xEV8kh8sa
	SZ9grHLYJLhkljTZNqAsKdc56wzWTRoWCoC5qbd85TDfhnCv3y83bV62e8cC/S0q
	JAcbm+4/NF8fkkQEK0lNvo46TZsuF4OHK60qW0ECQp6sLNovRzTQ0JvEY1+9MUjx
	33dPpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas6ryap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 20:56:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53380b67cfdso27584741cf.1
        for <virtio-comment@lists.linux.dev>; Fri, 23 Oct 2026 13:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792788989; x=1793393789; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0dT8/r7nIDSFLWCIjg6j+gJrBQLhTR7DEJ+w+MMMQSI=;
        b=AXoG4aR3Dg9b/CF4yWIDg5uE1uXca/pbjZ3YZ5xsjUustfvDzllAIkOh1i2iZ9AReY
         6+411+9udKWJp50visi4mrLh0CxqiQxXoUun5zTTmteXDiv+UKEeFBtCPfWTnb5gXrq9
         ztXUMwBv5gtNEI7n83aulXwhZYKqXFXt3OH4Ysq7sotW71mOQJJyCLRMOxCfgBNSkAuz
         puF2LS1NASZLYEjwM2m5gLkk6tafeYqvpwbmjjzLamtga26F9cHeK2lWv0uU3XvijsfT
         1SRQ3DKmGnjFC4F83hcCZIramAzQXj2Njn8R9NYoV1SYKjyy0DMrtkAKvsBDF6mPXOLw
         WQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788989; x=1793393789;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0dT8/r7nIDSFLWCIjg6j+gJrBQLhTR7DEJ+w+MMMQSI=;
        b=DRb1qECnbz2W9PDIW2c8h9tU0ZxvNUftFIYW6GDQQL0qeMEPsW43YGi3tpPlWC931R
         Tx5rzpLQpEBkQH+sTFl+ew8LGIhjFkewez684DMTj3T2aGIt3RKGMV454YfaejMnOIs4
         4AyTOxyzWVZsb5Rt/ZdyNiOUvIfaEJVxbdkp8HVv9j9ZaKldQZCmkOKqMT4ik+PXXbVg
         RDPnO3pNjd3JsBsGqIvQIUqe/bHvQNKtcBfg1Jes1rpBvqJCdiZMwebEEA/BK4gMZ6Ke
         DW4qZqj7eVN8MUFWjfdT2toctCDvkZbzHQ9X11vRVfUd5U/FrMFvchb0bHIWL7f8DJP7
         Ljlw==
X-Forwarded-Encrypted: i=1; AKwUvBwlZwGDCKOHam2i5yTM1DFsH8zQcX18QKpWRsr7hRWckYRq4bJ8Xl+be1grAeF38B4vUWCTD2/B5hJk4xtvfA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJlR1Q0pZ8mTQmmfdqKNdifTJUAsfy5aIHcR6LRr9y8MJRHjI4J
	oTrcMTEM35JnC7+MDCq9ZtMB/8KH0QSlvZ1z/YBp8QRX7/BIxgPbT06sxo2calS3tA7JhfMRE3J
	Y0gn5w7cfsEXbM+f/dGggD+WmwtM/yrng8pVoWVPAHRZXaKqjxG9NOUxfZh4rhbA81b2QbQ==
X-Gm-Gg: AYBFou1vFgJWtSxVXglZPEp/z58ZOQC7pHof+NzDTxWUv4ptA4+Dj1zJBnX16HUIic0
	IUchCyhU0oEEKm+vvTaLQ4CBQ92ZbdmVIteRRZ3ZzHGzE03aNI3KkRxyQBhE+RqFHpIcwwB8tq/
	MG8GnJPimt+hjYXdv0kW2WYRVT0Eq2634XrHOlW2qt9hLBDM80zTas0rDFRTEOx6MdrJ55J1r7I
	nP3pv3W0+XEaa9WrNJ7fhCq7zpYN4nyYlyX0sgBWhwuF7XFeaG9VBnVwKci7jsHe8jzxFBA6OJs
	ryHqoB0MA5fxDlfA41CEYeduc3yG96/1dwngxT2L8/ScsM3pM+Ib5mJ1xMZsd62OOEpZetsEciS
	LZJUb4M/KWdooehFvnpndi8oGjVYtMblNxw==
X-Received: by 2002:a05:620a:711b:b0:93f:334e:df25 with SMTP id af79cd13be357-940ef8db9c7mr39177285a.41.1792788988761;
        Fri, 23 Oct 2026 13:56:28 -0700 (PDT)
X-Received: by 2002:a05:620a:711b:b0:93f:334e:df25 with SMTP id af79cd13be357-940ef8db9c7mr39174185a.41.1792788988242;
        Fri, 23 Oct 2026 13:56:28 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.na.qualcomm.com ([5.28.88.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece13aasm259981f8f.58.2026.10.23.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 13:56:26 -0700 (PDT)
Date: Fri, 23 Oct 2026 22:56:24 +0200
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <rltfxbrlfrqixbuevqknfake6hmcs62vjwgpk66tzvyswvfuej@6imyqn2npcby>
References: <87h5id3he3.fsf@redhat.com>
 <SJ0PR12MB6806C8FCEDA2E3D40CA82EB6DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022114028-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB6806C7432951E2DB6CB3C945DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022115837-mutt-send-email-mst@kernel.org>
 <SJ0PR12MB68066B4C6D821EF792DAA220DC652@SJ0PR12MB6806.namprd12.prod.outlook.com>
 <20261022122727-mutt-send-email-mst@kernel.org>
 <xkzvep5mx77zm57l5im3qef6k3uiqfdnyi3lxuvmsiu7rjkeeu@ey5gquhbb2s4>
 <CAAjaMXbFY8d_H6YJSbb+2ycx-Bh7wBym0UpCy2Z4XsftkhQSzA@mail.gmail.com>
 <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe70886a-b119-4302-b35d-f99dfab4b018@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA4MiBTYWx0ZWRfXwfQPFvkRIMOm
 rX81QyuoBFx9UyrZRuBs/5rPOsgNzEIwmr3YxG657oXS3/6KD3IJNGBJKtQXGVeT74fvPt5u7oD
 fgnjUfhKMe8ux3B343NLvDYQPkhW//3iQUeRNxgOSw07A8Dip1wfo/gEd0FcTopVBJmP+rlCTN4
 QGj8j0eKNw65s+Lnut7dkkHHk72Mf05xRx9sLkft4wO780GGFWahryZk5O6nA4if3w/GXfmvGP1
 HH1A9KyIQNs+7pCOkNi7v1QHrauOx/6k5U53bd0mlcSip6eBvrU2cKsK8dbD0XbikEZ6O0jecdt
 PYeDLIbI1WQlm8dGSX0sGIwW/oSTj/Mdlb20Y6f6H8bcKq9C2Kysg+ohPa4lofYv7hwWOqOBa5E
 4skDYDgI9kYCBcaWLsmdIrK+basnDWJgZSlPQ6cgw3x+Nt2lkTTP6YIaeBfcr3s14v9OqTaTRUt
 ZLKuXyzhBUW6cLhDFcA==
X-Authority-Analysis: v=2.4 cv=DK0acCNb c=1 sm=1 tr=0 ts=6adbc9fd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=kKaaE6PLneHIm50+NUvtWA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=RZDCnxaar27uT6A4PzkA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 82xBlj7BeYCXYT75fV2_H1TdmOCM42u_
X-Proofpoint-ORIG-GUID: 82xBlj7BeYCXYT75fV2_H1TdmOCM42u_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA4MiBTYWx0ZWRfXz/XlT0LhBCci
 kNKAwu2Cl8MGCZpeqQ/diSZuNdzeU/zl6X4pxYAaF6IW7hc4N8L+0vt8kB38CchqwMQlZNGt8dQ
 NTRxZCi9Z11NNEjJ7Fcd93MA5qwhyw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230082

On Fri, Oct 23, 2026 at 01:40:13AM -0400, Demi Marie Obenour wrote:
> On 10/23/26 01:37, Manos Pitsidianakis wrote:
> > On Fri, Oct 23, 2026 at 1:39 AM Peter Hilber
> > <peter.hilber@oss.qualcomm.com> wrote:
> >>
> >> On Thu, Oct 22, 2026 at 12:29:31PM -0400, Michael S. Tsirkin wrote:
> >>> On Thu, Oct 22, 2026 at 04:20:51PM +0000, Parav Pandit wrote:
> >>>>
> >>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>> Sent: 22 October 2026 09:32 PM
> >>>>>
> >>>>> On Thu, Oct 22, 2026 at 03:49:51PM +0000, Parav Pandit wrote:
> >>>>>>
> >>>>>>> From: Michael S. Tsirkin <mst@redhat.com>
> >>>>>>> Sent: 22 October 2026 09:12 PM
> >>>>>>>
> >>>>>>> On Thu, Oct 22, 2026 at 03:35:51PM +0000, Parav Pandit wrote:
> >>>>>>>>
> >>>>>>>>> From: Cornelia Huck <cohuck@redhat.com>
> >>>>>>>>> Sent: 22 October 2026 08:35 PM
> >>>>>>>>>
> >>>>>>>>> On Thu, Oct 22 2026, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>>>>>>
> >>>>>>>>>> Let's define some standard way for the vendors to declare that this
> >>>>>>>>>> device is "Qualcomm", "NXP" or "hobbyist which doesn't own PCI or USB id
> >>>>>>>>>> block".
> >>>>>>>>>
> >>>>>>>>> Are we able to use the first <n> bytes of config space for that? I guess
> >>>>>>>>> that is the only way that can possibly work for any transport.
> >>>>>>>>>
> >>>>>>>>> Then, maybe something like one or two bytes for a vendor id (including
> >>>>>>>>> one for "testing purposes" or so), and the rest to be used in a
> >>>>>>>>> vendor-specific way.
> >>>>>>>>>
> >>>>>>>> device ids are independent of the transport.
> >>>>>>>>
> >>>>>>>> but Peter already announced that:
> >>>>>>>> " Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> >>>>>>>> Firmware Interface). QPSFI devices expose functionality across SoC
> >>>>>>>> subsystems through a common Virtio-based protocol. There are no plans to
> >>>>>>>> standardize the devices."
> >>>>>>>>
> >>>>>>>> So, I am unable to understand why should it be part of vendor agnostic virtio spec?
> >>>>>>>> Why a vendor specific implementation of device and driver is not sufficient?
> >>>>>>>
> >>>>>>> I don't really think we should vendors burn up device IDs every
> >>>>>>> times they want something non standard. Reserving ID 52 as
> >>>>>>> "vendor specific" so vendors can go wild sounds good,
> >>>>>>> but a bit more needs to be done than just reserving:
> >>>>>>> document what is expected, e.g. no auto load based on ID
> >>>>>>> alone.
> >>>>>>
> >>>>>> First, you indicate to open virtio to vendor specific extension. This is huge in itself.
> >>>>>
> >>>>> Not as such.  It's just reserving an id. People always do things like
> >>>>> implement some crazy spec saying "we will upstream later" and later they
> >>>>> do not.
> >>>>> And then the ID conflicts with a standard one. Suboptimal.
> >>>>>
> >>>>> So if we can tell everyone "always use this ID, and use platform
> >>>>> specific tool dor discovery, until your device is in the spec"
> >>>>> then that's not too bad.
> >>>>>
> >>>>>
> >>>>>
> >>>>>> that should be first discussed.
> >>>>>> If you suggest this, may be every device type should be able to extend, and not just demux at device id level.
> >>>>>>
> >>>>>> Second, one reserved id is not enough, because a given system may have multiple such different vendors devices installed.
> >>>>>
> >>>>> I don't think we should care.
> >>>>>
> >>>> than all 0xffff as one experimental id once for all is good enough.
> >>>> than vendor FOO, BAR, differentiation is not needed.
> >>>
> >>> I don't think we want 0xffff, a lot of systems treat that value as
> >>> special, pci comes to mind.
> >>>
> >>>> And if it is not for experimental purpose, not sure why would vendor stop at only one device.
> >>>
> >>> They can reuse that id as many times as they want and differentiate
> >>> with a device specific or out of band methods.
> >>> First X bytes of config space was mentioned. or whatever.
> >>>
> >>> We can add a recommentation maybe if vendors desire that.
> >>>
> > 
> > 
> > Hello Peter,
> > 
> >> Thank you to everybody contributing to the discussion and to the concept
> >> of a vendor-specific device.
> > 
> > I'd like to echo the sentiment that it unfortunately doesn't seem
> > necessary to call vendor devices virtio at all.
> 
> It acts like a virtio device, but otherwise I agree.
> 
> >  > Just for clarity, Qualcomm intends to
> >> upstream Linux kernel drivers for this new device type, so would
> >> definitely want to use a registered device ID.

Qualcomm's intent is to upstream a Linux kernel Virtio driver for a
non-standardized device using a Virtio transport [1]. It should be able
to work in a vanilla Linux kernel. I think this requires a new
"vendor-specific" or similar device. The driver needs to avoid
collisions with other devices and must not take an unassigned ID.

I think "vendor-specific" does not capture all possible use cases for
such a device, though. It could be a "self-assigned" device, e.g. for
prototypes to be standardized later.

In the discussion, it was proposed to distinguish "vendor-specific"
devices through common configuration space fields. I would suggest to
use a UUID at the start of the configuration space of the new device 52
to distinguish "vendor-specific"/"self-assigned" devices. Everybody can
generate a UUID when needed. This would

- allow everybody to create new devices without ID collisions due to
  using unregistered IDs

- allow using UUIDs for prototyping, with a new one available for each
  breaking change

- be a way to resolve the device ID scarcity

- relieve Virtio TC from some device ID registration work.

Best regards,

Peter


[1] https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/

> > 
> > But no upstream specification, correct? There's no point without an
> > open device specification to being included in a specification. People
> > can only implement frontend drivers for this vendor device, and only
> > by reading the upstream code - no spec to follow. Similar to a vendor
> > SoC in concept.
> > 
> >>
> >> In case of an in-band approach, I suppose we would then have an explicit
> >> vendor list in the spec where vendors have to register?
> >>
> >> Best regards,
> >>
> >> Peter
> >>
> >>
> >>>>>> So why to bend things so much and re-invent the wheel?
> >>>>>> Why for say PCI transport's any vendor and device id are not sufficient to indicate a vendor and device?
> >>>>>>
> >>>>>> and if so, why to even document it in the virtio spec?
> >>>>>>
> >>>>>> I guess, I am missing the basic motivation part.
> >>>>>
> >>>>> For the virtio spec? Above. For Qualcomm since they decided never to
> >>>>> upstream - donnu. Don't care much, either...
> >>>>
> >>>> ok. so yeah, let vendor's platform device be in the vendor's OSS zone.
> >>>
> -- 
> Sincerely,
> Demi Marie Obenour (she/her/hers)



