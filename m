Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13331205E0D
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 16:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105513; cv=none; b=J6yZ05WJyZZTz7k3EJa4JXoTqvekcPj9PcTixGw2c9BL3Oa/cYsDVm+WgISvCPflY4RDxxgnNvgMkYcibEivJc/3FlLRmyIRJNmlJwCWyJGdvMyZvxIIGIQzEgJm2Pb13j91nPOGzZex4U4LWVa9ywBHkVVt7BgCBf8FjG3TK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105513; c=relaxed/simple;
	bh=jVpIXjW5qVqj+BGmeGilMkv8JjHmIu6rAoTOwb+lQ8k=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Li7H8uHnGT5ARUetmtvYZGkaKvOJ5YS3TpqX1uCOhKeuMkwWb8DAvXRoRSWuWbJDmdXoHrqK1vSWfLj8rZxDiJX5lL/YCA5bHxrn8uzwl9syzkZ4mzx+bAN9Mt0fUXyIZBmiwDrxqcPghONdxldW9FBYA8DXc4EcVj1l5auqe8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aq2W4KDQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aq2W4KDQ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AG4Xb000796;
	Tue, 4 Mar 2025 16:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z1GCLjhIqT9ZuijX0/hCHODH
	+FFx41WeAc6ToOewTco=; b=aq2W4KDQn9oMsNYqjf4NgWK3m8rQ2/P14sxzgRtg
	zj/OZV56fYb5OhFCqbm47DcNa18IDbT3l1ud5UQpL3LJhiDJoVN85UW3oJE6xNfO
	gOTfQNc8BPxZeXpLdZaQDGwu8ubARrQjoqzBFR31YXBaRt2bsa+mloZfgPRBD6+d
	Fu1bVmjWv6L85nC9r8nbwGSOpe4lsNv90g/Y40kK6V8xl56GaF6uYTWChPDqg2El
	vq1DRO3hrcbrXUjOOzT0kxcWdNKO8EUK832lg5tltMaxeVDbVwkW9u/KhfjfJ9HE
	aIo9nsgGgS8Um50b6R/apApwRoKup/f0Iw/vlIdN5GrsbA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6vjgnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 16:25:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524GP54p010181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 16:25:05 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 08:25:03 -0800
Date: Tue, 4 Mar 2025 17:25:00 +0100
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
Message-ID: <au2i2ziiyiz3zwp3qtw34xbh2qqtlpnt3al52xmtx2ryxvjxox@t2tybspz53so>
References: <20250123101616.664-1-quic_philber@quicinc.com>
 <20250123101616.664-5-quic_philber@quicinc.com>
 <Z6tDpi07Pyk+Xjzi@fedora>
 <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cyjnfnuijj57k32t2naprt65jsvm4bxc3ehkpdmempp2kgkg5i@kkere6bvir6d>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sT1yUo_xR88XJNLfWDE7Pv7HLWmklMhM
X-Authority-Analysis: v=2.4 cv=LYfG6ifi c=1 sm=1 tr=0 ts=67c72961 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=SmhjHTpgqMcAHezR3NEA:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: sT1yUo_xR88XJNLfWDE7Pv7HLWmklMhM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_07,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=945 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2503040133

On Thu, Feb 13, 2025 at 07:14:35PM +0100, Peter Hilber wrote:
> On Tue, Feb 11, 2025 at 01:33:42PM +0100, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Jan 23, 2025 at 11:16:15AM +0100, Peter Hilber wrote:
> > > Add the normative statements for the alarm feature added previously.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 
> > > Notes:
> > >     v7:
> > >     
> > >     - Remove inadvertent v6 changes, which should have been part of
> > >       preceding patches.
> > >     
> > >     v4:
> > >     
> > >     - Update normative statements to match v4 changes to non-normative
> > >       statements (patch 3).
> > >     
> > >     - Driver should read clock to confirm that alarm has expired.
> > >     
> > >     - Formatting and wording improvements.
> > > 
> > >  device-types/rtc/description.tex        | 157 ++++++++++++++++++++++++
> > >  device-types/rtc/device-conformance.tex |   4 +
> > >  device-types/rtc/driver-conformance.tex |   2 +
> > >  3 files changed, 163 insertions(+)
> > > 
> > > diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
> > > index 47ad50cd95ca..32fed5f8620f 100644
> > > --- a/device-types/rtc/description.tex
> > > +++ b/device-types/rtc/description.tex
> > > @@ -32,6 +32,11 @@ \subsection{Feature bits}\label{sec:Device Types / RTC Device / Feature bits}
> > >  VIRTIO_RTC_F_ALARM determines whether the device supports setting an
> > >  alarm for some of the clocks.
> > >  
> > > +\devicenormative{\subsubsection}{Feature bits}{Device Types / RTC Device / Feature bits}
> > > +
> > > +The device SHOULD offer VIRTIO_RTC_F_ALARM if the device can support
> > > +setting an alarm for any of its clocks.
> > 
> > I think you can remove `can`.
> > 
> 
> OK.
> 

After looking at the context, I think `can support` is better here,
since in the paragraph above the normative requirement, `supports
setting an alarm` implies that the feature was actually negotiated.

So I now propose not to remove `can`.

Peter
