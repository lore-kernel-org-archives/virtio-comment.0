Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815151684AE
	for <virtio-comment@lists.linux.dev>; Tue, 25 Feb 2025 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740482348; cv=none; b=DI9aHH9umAvxkdA8SGxt7DXAjNWhho84YFI8b49ZRVdMD57xudInRtlnIjg1wAl7BBSDUok9/CDvwNQxqqBFjtrBm34mkhRINw8sZZOExlOPAOnvOe47EqJgSa6rHem3rkAU1+iGNA1MRJO9TBVWNq3oWbnZ2zrej+jO1XMPXPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740482348; c=relaxed/simple;
	bh=RktFAawjibpc7zIShrvdRfA7mlM5WhR2dfwMPH6RMhM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWMeceObrAIrOFb6fXsd0sqXv2gemWo77TIJGQTuLht3ZSOK8skzU13FAb1Ee//LurdJ4mkZEazTz/WKZuYluUrrSiKZLPI5iCDTGr2km0UKZOXkONfNajYPSkNizNIYLFAy3+L5d9kevwVGqYfkOkzy2hwpEgRF8wQFJ6TOerM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DoJdMZh9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DoJdMZh9"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8dnUI013317;
	Tue, 25 Feb 2025 11:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hgk81qWY1heQPQjKJ8Hr3bmn
	GxITs258fl3LbqIDI58=; b=DoJdMZh9NvEQrZgVpA/fZxWoSevKZLIBLIwNInd+
	6R/L3nBObfrmW4awlx9sVhMLW/yNcjuM0jA20NuhxeNpc7q1LW4Lt7i+nXM8FnUw
	RtA4R3406f7O2iXMhtHiJFCZHtc/HdFwyd/y11LeRAIfLIiyF0U2KYR/ehwaq8Ji
	WhFCe+FMWbTGkaN87zswMLgg6qRBrdHj01uVfncOgBr9q2uYUBblfgNQhL8Mi3dT
	x/E6gh1ES/7J/Lfg+EqJN+RD8DBGojZbd0m/b3agYISvgKPEYTBJZbiitCqZR347
	cX0WR7Bbgx1XVvI/GSWG6k3vYXepJrq6V7NG+Lz75hNuIA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5wgrqxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:18:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PBIva8027263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 11:18:57 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 03:18:54 -0800
Date: Tue, 25 Feb 2025 12:18:51 +0100
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
Subject: Re: [PATCH v7 4/4] virtio-rtc: Add normative statements for alarm
 feature
Message-ID: <4wre24mz2dkf3xlokwrhrtyekgaprezwhkubsqts6ywicz74kh@5imrnci63tuc>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
 <Z7X6bpwsqRymDHZu@fedora>
 <4g74di7srjp45qxc4qwjo6phvbxixmpmwxhu35ujchuyqshjoz@j75ttnxcqtry>
 <Z7xieowGXaZ3kqBc@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z7xieowGXaZ3kqBc@fedora>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: weO-Gsd0NBz_WzQZC8FL1thblGdqTpmm
X-Proofpoint-ORIG-GUID: weO-Gsd0NBz_WzQZC8FL1thblGdqTpmm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250080

On Mon, Feb 24, 2025 at 01:13:46PM +0100, Matias Ezequiel Vara Larsen wrote:
> On Thu, Feb 20, 2025 at 06:06:38PM +0100, Peter Hilber wrote:
> > On Wed, Feb 19, 2025 at 04:36:14PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > On Thu, Feb 13, 2025 at 07:14:30PM +0100, Peter Hilber wrote:
> > > > On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > > > > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > > > > Add the normative statements for the alarm feature added previously.
> > > > > > 
> > > > > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > > > > ---
> > > > > > 
> > > > > > Notes:
> > > > > >     v7:
> > > > > >     
> > > > > >     - Remove inadvertent v6 changes, which should have been part of
> > > > > >       preceding patches.
> > > > > >     
> > > > > >     v4:
> > > > > >     
> > > > > >     - Update normative statements to match v4 changes to non-normative
> > > > > >       statements (patch 3).
> > > > > >     
> > > > > >     - Driver should read clock to confirm that alarm has expired.
> > > > > >     
> > > > > >     - Formatting and wording improvements.
> > > > > > 
> > > > > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > > > > >  device-types/rtc/device-conformance.tex |   4 +
> > > > > >  device-types/rtc/driver-conformance.tex |   2 +
> > > > > >  3 files changed, 163 insertions(+)
> > > > > > 
> > 
> > [...]
> > 
> > > > > > +
> > > > > > +If a clock C steps to a time previous to C's alarm time, the device MUST
> > > > > > +stop serving any previous alarm expiration event for C, within a grace
> > > > > > +period.
> > > > > > +
> > > > > > +If an alarm expiration event happens for clock C, the device MUST stop
> > > > > > +serving any previous alarm expiration event for C, within a grace
> > > > > > +period.
> > > > > > +
> > > > > > +If the device is currently serving an alarm expiration event E, the
> > > > > > +device MUST send a single VIRTIO_RTC_NOTIF_ALARM notification for E, as
> > > > > > +soon as an alarmq buffer is available for this purpose.
> > > > > > +
> > > > > > +While the device is serving an alarm expiration event, the device MAY
> > > > > > +execute implementation-specific alarm actions.
> > > > > > +
> 
> Does not `serving` mean also that the device execute
> implementation-specific alarm actions?

As for `serving an alarm expiration event`, I intended this to be a
speaking name for a state to which different requirements can refer.
Maybe this was bad naming.

> Besides notifying the guest when
> an alarm has expired, is not any other action or device behavior
> implementation-specific and then not constrained by the spec?

So this would imply that the below MUST NOT requirement should not be
adopted? I chose to refer to implementation-specific alarm actions so
that 

1) it is clear to any spec reader that alarms may work even when an
   alarmq notification would not work and

2) an implementation's documentation can usually refer to the spec as to
   when the implementation-specific alarm actions may be executed.

I find the references helpful, but I do not have a strong opinion about
keeping them in the normative or non-normative parts.

Thanks for the comments,

Peter

> > > > > > +The device MAY ignore the device status when executing
> > > > > > +implementation-specific alarm actions.
> > > > > > +
> > > > > > +The device MAY ignore whether VIRTIO_RTC_F_ALARM was negotiated when
> > > > > > +executing implementation-specific alarm actions.
> > > > 
> > > 
> > > I wonder if these last three requirements are needed or we can just drop
> > > them.
> > > 
> > > Matias
> > > 
> > 
> > The intent of these requirements is to clarify that this is legitimate
> > and expected behavior of the device. I can drop them if this is
> > considered unnecessary as normative requirements. Or maybe one
> > requirement would be enough:
> > 
> > 	While the device is not serving an alarm expiration event, the
> > 	device MUST NOT execute implementation-specific alarm actions.
> 
