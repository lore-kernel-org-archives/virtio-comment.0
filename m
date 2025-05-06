Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFB125DB1E
	for <virtio-comment@lists.linux.dev>; Tue,  6 May 2025 15:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746544762; cv=none; b=IMRBuLHhMKY7ICAFWIUmfVO8zwiWWENw0oEYtPdvb8kZ4RISFPys13qgeSB12dB+DXiA9FG6M8fZdcsUlPVf2oHRSziVKz3TYE25Dlbj6eDv9AE3puMbjzCf+e1uTEjuzCyi++i2Jw2Q67plA6fOSWEK+4mNcSu33laIan8Hk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746544762; c=relaxed/simple;
	bh=0NpzqyhiFEPc22yZ0ByuuVxJYaO2XweUXKL1xd36nTE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CU6cV4TiWDdNwFIf4nhJVlhy2WwYNuYbGwtvMY+ra3dYbMiX98Hn+/4q4DVqZnZOGu/uLMTzTTObYckDZ7d0VkZsLS51vvAZNeVV/FzISv87vAcWdvjRuoTCztyKGGWBDOW5jxbiFYfY8fDx+gzGiY20mUYb9T+Ra0ycUcvkVsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QAMCu2YJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QAMCu2YJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54684sfL020770;
	Tue, 6 May 2025 15:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cg8CcuX7P3ehSujxszUTvZAW
	RkKXv+k1RNDSKPlUnmo=; b=QAMCu2YJFoYWXar68HkPaoODEL+5Ls1RHKRj/JUE
	geHPO7cS3SVWc8Yfu/xMjxXLJd+BtdcqvcG24DenDnhVBipAgPo8ygdJ7WJ4Ud/e
	lbcgLdp+/nTVYcs1r9zyDqDOu3VOx2SvLeTgFj/qJWk2CHOi+t787L+YxdvjILSX
	JMfBxYWTu1f9fV6Em8DLbi+wgIe/XXpK0eVzq7EpBeXv4Xa3Ryyq+wy9o3PvHgLC
	D0IKAyQbY2vyDdj/OgtdOYlmuOwBiiH8mMWKYzTCoXHKL/agR0A0cO9Gi1hxYvty
	l2jW8SJCyG2FY+m8p5IDUSyex4Q5Rnqbd2L9S5VHTPkB8g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfqyav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 15:19:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546FJCTJ031255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 15:19:12 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 08:19:10 -0700
Date: Tue, 6 May 2025 17:19:07 +0200
From: Peter Hilber <quic_philber@quicinc.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
CC: <virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>,
        "Parav Pandit" <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
        David
 Woodhouse <dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v8 3/4] virtio-rtc: Add alarm feature
Message-ID: <ycphd6ubopui3rhaagg2tw2wt4jyhzg5ewv2ub2wme3rdvr7pj@ndducl65ktcm>
References: <20250306095112.1293-1-quic_philber@quicinc.com>
 <20250306095112.1293-4-quic_philber@quicinc.com>
 <Z/9nnYxbkOcyR131@fedora>
 <y2drfbo2cplk5dseuvvzfgm7bywu54beynkgsl4z2sawpc2ybd@ct63vqti2tpz>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <y2drfbo2cplk5dseuvvzfgm7bywu54beynkgsl4z2sawpc2ybd@ct63vqti2tpz>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2Dv8EQhTpJk4joGt4qXiaqVdhdVZonvZ
X-Proofpoint-GUID: 2Dv8EQhTpJk4joGt4qXiaqVdhdVZonvZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE0OCBTYWx0ZWRfX2M50srcdfBQw
 gclekS8WcdOSS0CaCRRzDr4Wf5Pn4YJ0OjPWDauxtPg55OPOBoiHCEjXDHcL9OXl0wb/I9UvbYn
 N1nQ/68iOH9RlLzlkpUbj1lp0pq+OQX1lzxG+x6/RqsaCnlintZqKmP0/v0jqxSfEcYrHhNc2Cz
 ydMPcCD8XN2fzbgMss3rb68abxNnoWsSL7I7lL19JBfdwXHCB8D+gKfIpSe42+4Sx6phL7wh0x1
 WH9uZ5hHewVnLaMz/HW2S3Wyg5AVaAwTYLGquk347bbeWXiT/wEtAi8S2apgz9Tg3LOOeZLX1JZ
 U4NUNqiLWqfoEApWVVu+vqIbm700CSeVj4cq7mgIhKQSN8Gc0hVRZWiiFXp7PIAEGz7mKG1jMe5
 OHqYIiLtLxl98VN7NTUAmdx+Dmxv5IIIEKa5+mmv+CR+XiOkrNAWH2ZeEZjnd6deiLtwX3sp
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=681a2870 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8
 a=bs-e4Z8cAAAA:8 a=COk6AnOGAAAA:8 a=cUT89lhJSSQL6q9Az6EA:9 a=CjuIK1q_8ugA:10
 a=YFpLQiK6rFjqGb8m0bXF:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_07,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=981
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060148

On Thu, Apr 17, 2025 at 05:05:00PM +0200, Peter Hilber wrote:
> On Wed, Apr 16, 2025 at 10:17:33AM +0200, Matias Ezequiel Vara Larsen wrote:
> > On Thu, Mar 06, 2025 at 10:51:11AM +0100, Peter Hilber wrote:
> > > Add the VIRTIO_RTC_F_ALARM feature (without normative statements).
> > > 
> > > The intended use case is: A driver needs to react when an alarm time has
> > > been reached, but at alarm time, the driver may be in a sleep state or
> > > powered off. The alarm feature can resume and notify the driver in this
> > > case. Alarms may be retained across device resets (including reset on
> > > boot).
> > > 
> > > Peculiarities
> > > -------------
> > > 
> > > Unlike usual alarm clocks, a virtio-rtc alarm-capable clock may step
> > > autonomously at any time: An alarm may change back from "expired" to
> > > "not expired" before the driver has started processing an alarm
> > > notification.
> > > 
> > > To address the above, and the device resets, define "alarm expiration"
> > > in such a way that the driver always has a chance to react to an alarm,
> > > and make the device always responsible for notifying the driver about an
> > > alarm expiration.
> > > 
> > > The VIRTIO_RTC_REQ_SET_ALARM_ENABLED request is there so that the Linux
> > > ioctls RTC_AIE_ON and RTC_AIE_OFF only need to emit one request.
> > > 
> > > Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
> > > ---
> > > 

[...]

> > > +An alarm \emph{expiration} becomes obsolete
> > > +
> > > +\begin{itemize}
> > > +\item when the driver disables the alarm, or
> > > +
> > > +\item when the driver sets an alarm time, or
> > > +
> > > +\item when the clock jumps backwards, before the alarm time, or
> > > +
> > > +\item when another alarm expiration event happens.
> > > +\end{itemize}
> > > +
> > > +If an alarm expiration becomes obsolete, it is unspecified which alarm
> > > +actions the device executes for this alarm expiration, and the device
> > > +stops executing these alarm actions after a grace period.
> > 
> > Can't you leave this paragraph implementation-specific and thus
> > removing it completely?
> 
> OK.

It seems complicated to me. If the device does not stop alarm actions
when the driver disables the alarm, it becomes impossible to reliably
clear the device state ("start with a clean slate", as per the
discussion in [2]). For this, v8 has the requirement

	If the driver successfully requests VIRTIO_RTC_REQ_SET_ALARM, or
	VIRTIO_RTC_REQ_SET_ALARM_ENABLED, for clock C, the device MUST
	stop serving any previous alarm expiration event for C before
	the device marks the message as used.

This is the only hard requirement which restricts a v8 implementation,
every other alarm action could still be done within an indefinite "grace
period".

I think the "grace period" related requirements should be dropped, so
that the behavior is essentially implementation-specific apart from
stopping the alarm action when the driver disables the alarm. Maybe I
can change the last paragraph cited from the patch like the following:

	If an alarm expiration becomes obsolete, it is unspecified which
	alarm actions the device executes for this alarm expiration.
	When the driver disables an alarm, the device stops any alarm
	action for this alarm before using the buffer.

Best regards,

Peter

[2] https://lore.kernel.org/virtio-comment/a284ed4f-9ca1-4b8a-8c79-beec5040bd6b@opensynergy.com/
