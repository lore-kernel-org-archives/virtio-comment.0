Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC518DB0E
	for <virtio-comment@lists.linux.dev>; Tue, 15 Apr 2025 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726672; cv=none; b=ktJ2ZGI0Kk38yvJrHRWYIvyk+dFgzKiDL9mw3fej852oxUqY6qEU9cVbRBQT8UV49Ai3cCfBC1GCVZ5EoZuaM8x+qbzqJPYiQbVYB5Y0fkQgZ+RtmFFAisHy+vVn4rrCmC2QHf1wNAcZpFUANmlnpq3GJMR/CM0pEYayQlXww/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726672; c=relaxed/simple;
	bh=oGiBxLtgMxJbBgGYG3+Os56OJ7qNegjeTJug1dfIFG8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLngzmHvhOhMf3L/QMJAQltIfNJY83gTPUKyWBhJZDn/7x9shoW8mn8Bzlz4DNSk4ZYgh1o2dxbTcG9d71HguxVaKQiFKZqLhXKlTpL4TU9uO/aJPJyeYgHn0l6+Y9XdrSCICtWzigtZSGJ5TT9sCNcl/cyGWYYuPJWvCEIpLGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zl4MLb+T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zl4MLb+T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tLTn019767;
	Tue, 15 Apr 2025 14:17:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cmg46b7DcILae7Hl2aawTmCt
	h45+9Mbg9sqRZW5tU5o=; b=Zl4MLb+Tko/YC8joVzJ79z6exNIYMnHj77s/B+5x
	Z42LLMd4ZZ6V+/E/o4uUqHGJC6hhRJmeuOOoU78eg54E0NxLZduQBPK5J0/vemsx
	2rvbDsQ828QvFmxG+KVpNmFvrnmhezZRF2X09JVTyK0Pvq+EGWLH64demZpHQNbL
	Z0uMTm1BXYvhHP4uYi7FYT7reNVGvt65kbflDZInEXzQMnN4qu8Qc9N2amghysyr
	2L3HvtaaGGJoaHN622eaFUp+Sz+PEa1a5kKzoMDX/fWhzmsRSJPWTMbyLYu+t0Wi
	E2Zacj+mbKWi8BRnwfzRHZw1poQJluPuDQ9KWHtLH/pZTw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd08qa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 14:17:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53FEHfL8012512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 14:17:41 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 07:17:39 -0700
Date: Tue, 15 Apr 2025 16:17:36 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Cornelia Huck <cohuck@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>
Subject: Re: [PATCH v8 1/4] virtio-rtc: Add initial device specification
Message-ID: <5yakav2wrh2kaib7o5rmevzi7r4kgkgb6fnwpazjiath7mfu4q@p6pox5hylwhx>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-2-quic_philber@quicinc.com>
 <87plhdsfp9.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87plhdsfp9.fsf@redhat.com>
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fe6a86 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=C8M9u_ofQKZzGE93Q_8A:9 a=CjuIK1q_8ugA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: dFcNt_xPCRYsnhJGzgWgo_-yySsAFHhw
X-Proofpoint-ORIG-GUID: dFcNt_xPCRYsnhJGzgWgo_-yySsAFHhw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=949 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150101

On Tue, Apr 15, 2025 at 03:43:30PM +0200, Cornelia Huck wrote:
> On Thu, Mar 06 2025, Peter Hilber <quic_philber@quicinc.com> wrote:
> 
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
> 
> (...)
> 
> [First of all, apologies for the very late feedback...]
> 
> > +The \field{status} field indicates whether the device successfully
> > +executed the request. The device sets the \field{status} field to one of
> > +the following values:
> > +
> > +\begin{lstlisting}
> > +#define VIRTIO_RTC_S_OK         0
> > +#define VIRTIO_RTC_S_EOPNOTSUPP 2
> > +#define VIRTIO_RTC_S_ENODEV     3
> > +#define VIRTIO_RTC_S_EINVAL     4
> > +#define VIRTIO_RTC_S_EIO        5
> > +\end{lstlisting}
> 
> Any reason there's no status code 1 here? (I assume there used to be
> one... not a real problem, I just stumbled over it.)
> 

Status code 1 would be the same as VIRTIO_NET_ERR.

In the past, there was some discussion about reusing the spec in the net
device, so I changed the status values to align with the net control
virtqueue ack values. I am not sure if this will be helpful, should the
net device reuse ever materialize, since AFAIU the admin queue might
be used instead of the net control virtqueue.

Thanks for the comment,

Peter
