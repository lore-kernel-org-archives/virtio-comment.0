Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD9C1804A
	for <virtio-comment@lists.linux.dev>; Wed,  4 Jun 2025 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749028604; cv=none; b=EIm+/sb4vcPJiaBFbm0/Gz2ILmdS/nD+wDvO/E+KGme2GvCBK74gmwwpRwk7TKRCUC7OowzIiUnpZj9S1QiYOQntmWULoB16OQTus8QsQJtkX1UhELuxphPScX3sum5sIs6j9S0viAxovwjQXmzOP7zJUNTskUfgSKVwJdRGa7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749028604; c=relaxed/simple;
	bh=J/C7O+f9AAk2y8SjXVPdybpWqQGK1WzupY+wN1SzYsk=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=drFmJJzBrUNwYYM07f65DCra8yxK8xl+aqZX02Xl6ClyaIZqnlSrfsctWPusUJGQtE+qWtsuBE6Xke7Y9PiNfizo0zDA2fQEvJTAO0eIkK+9RNJvRkc8CKyYO8zvO2MlELW1IznF5MJeFNbuxAD+H5IGrcwwmEPFqosw7MJeXsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6ZHx5+0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6ZHx5+0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547xMd8028362;
	Wed, 4 Jun 2025 09:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cGh5zToOvUc5KP74NcFDocg+
	olkfg3GtOBzwSC0gMcw=; b=F6ZHx5+0hIAkDJtRbjv9NwMrOVLeVnm/FfguvACz
	ia+dTv+lNfMUtRmTUb5ui9nosabG8MrWl4vyZinjT0f3mOMu/kgQbRcu5T65QAfG
	MZ6P0cMrLAmTGRtnTjsx11NM+C5bpcf0wQj08lSppGBtVBCpiEKtJz2daFaM5R9V
	Oxh+NQl5uFkVRxJGVis+ZljYMEri+CJsdIg0uW65AtXC62PwUz9Wgr4hvLTYY1pq
	CpO3gEAULdZ59FwY2XEQlZ1o4ef9HhcGfuHQAXJAY3RAAv15JYnH2PETWiizhd5F
	yNx6y6UVT99VV35XC7ly7bpumJTT2RLqfz1V60whYYkxwg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8twhyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 09:16:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5549GWVp031657
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Jun 2025 09:16:32 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Jun 2025 02:16:30 -0700
Date: Wed, 4 Jun 2025 11:16:27 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin"
	<mst@redhat.com>
Subject: Re: [PATCH v9 0/4] virtio-rtc: Add device specification
Message-ID: <ijqnvwvqcrzcn3dq6uz46u2ptw7idjjsthl3xjz4btzhoc5oao@xhqpjbcl7ue5>
References: <20250507155036.1489-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250507155036.1489-1-quic_philber@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rekbjEQU48Dr52dTr6DFHyIJupJXUSUF
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68400ef1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8
 a=XMeBEGNjNwkjLZydG0oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2OCBTYWx0ZWRfX7scycxp+ppMq
 hQmwccsX7OsoucdJXsuXr2mbEsiHsdlxKwOuk9lat42zSQuXN54Bqis3um5YugBE3lyHctw4av3
 QaimNrHVs7T7PLpSc4nklMMSl6jy9mf05CMyV2CEd1FDX8aoE1iH/EZRQLFfPgLgbqL/7QmhUL3
 XRsS64Seu29TuSCfg0iV29FvL4e/TvRPdz7mjX+zD3SOoA3e0ya37LjvsXE/s1PN29yb9gQb4fq
 6/PIfPDzr2YsVkqXSLSleg5y3SgBD/ihg0PYm0/LilNLQ6uGwamIiqMljKrrrPXIwBbnqS9cp1G
 7DmRvqFBYqDKiCpZ+qZmLzVbo2NnsQr/seVlkkGzaLW/owQBvZ+bF+Kf2xPE4zA2/1eHojp5GPe
 X3OfKCYQNxNayJBJpTad6Q+Yq9jNusqgAKMfyw9AGOaCU/pWFy0eku4KHvOD/NMDKEY0k1o+
X-Proofpoint-ORIG-GUID: rekbjEQU48Dr52dTr6DFHyIJupJXUSUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040068

On Wed, May 07, 2025 at 05:50:32PM +0200, Peter Hilber wrote:
> This iteration of the spec should address multiple review findings from
> Cornelia Huck, Matias Ezequiel Vara Larsen, and Michael S. Tsirkin.
> 
> Summary
> -------
> 
> The RTC (Real Time Clock) device provides information about current
> time. The device can provide different clocks, for the UTC or TAI time
> standards, or for physical time elapsed since some past epoch. For UTC
> clocks, the device can also indicate how leap seconds are handled. The
> driver can read the clocks with simple or more accurate methods.
> Optionally, the driver can set an alarm.
> 
> The driver-side timekeeping can synchronize precisely to a local clock
> exposed by the RTC device. If supported by the device, the driver can
> obtain a cross-timestamp from the local clock and the system hardware
> counter, in a way similar to the Linux kernel ptp_kvm driver [1].
> 
> The alarm allows the driver side to be woken up from a sleep state at a
> specific time.
> 

Could you please open a voting ballot for these changes?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/221

This version of the patch series should have addressed all issues raised
so far. Since posting it 4 weeks ago, there has been no additional
feedback. I updated the Github issue to point to v9 instead of v8.

Best regards,

Peter
