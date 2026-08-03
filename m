Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D204133CE88
	for <virtio-comment@lists.linux.dev>; Mon,  3 Aug 2026 11:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755384; cv=none; b=IGk99nu2k5EWlvP+OXszM7QgMcKnbVy2xSFIrQ3Au8qw+sRAU+quDoRp2O/9CuIMoXZhixPWy+zMzor2WCh0v+3BgQlYTGqaNbr+WVuCEVTqDvHAoBce+1SEF00PPe0g6FcEdRLhoZlCOIITR92f6dG1pQMIB53jMSSqHDyxb4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755384; c=relaxed/simple;
	bh=Pi5/DryIfu5Gr5VRiZOdoxoTuIZ7FJSPAK9jmqbWp7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVNRVsFYfdetz96FrojF7j6lJ1GfaNYcYDCfXbja6nf+YYgazdBp3oPFNXKG/bWpDHOJRHYuXdBh62YKK41aI8nV7qOwcmjxFmInNDN4m6ilcCjlMh3ovZ6mAZV35ERh3UgKhVmGWBfTwDr1dTg00XckXzJFKpxb9liSHXcOQBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c12Jh/Ae; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c12Jh/Ae"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sQ9F3790602;
	Mon, 3 Aug 2026 11:09:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CTuB2gy/iFI
	PPAmUD9XZ+mmHanqHjN2WgPnj8qxXe40=; b=c12Jh/AeHUhBfreI6GKFZqlgQkc
	naWjdBxl8gSsuLC95TMNaZ8zluvApSFXgE48+QyQG82grHTw5VkxUh+dHfJSf5DE
	JSzS1bxrg5eTfxCngxFq7BBkBkvEbgjgc+t88YMbLq4xDPXoxT89XyzLcrfARU+e
	o9Mu5TRYCq71d/CEqtLD9Dzk4en6dGj2+y0pruMps91KVJP07SFCzg4yWJjtuYrv
	B8L6xIvRO4oKOnvEm5r5YtujMEs2z+5vMIGuBXVsrYIms9qEfPCc/CqNU76rm35T
	vlO45L34Xo1PMwmvYWfHobrRhHKzNPoBVF9Gi4gZe9CJRzSCnSS8/g8u1kA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r141p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 11:09:40 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 673B9bAo032045;
	Mon, 3 Aug 2026 11:09:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fs9vjmrq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 11:09:37 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 673B9btU032040;
	Mon, 3 Aug 2026 11:09:37 GMT
Received: from zeloren-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 673B9a0F032033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Aug 2026 11:09:37 +0000 (GMT)
Received: by zeloren-gv.qualcomm.com (Postfix, from userid 3947827)
	id B411242349; Mon,  3 Aug 2026 19:09:35 +0800 (CST)
From: Zelong Ren <zeloren@qti.qualcomm.com>
To: aesteve@redhat.com
Cc: demiobenour@gmail.com, lixian@qti.qualcomm.com, lxia@qti.qualcomm.com,
        virtio-comment@lists.linux.dev, zeloren@qti.qualcomm.com
Subject: Re: [PATCH] Reserve device ID 51 for Virtio HAB (Host-Guest Auxiliary Bridge) device
Date: Mon,  3 Aug 2026 19:09:12 +0800
Message-ID: <20260803110912.3785818-1-zeloren@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CADSE00KHLXywjkJJ5fzJPcgTeAz9k3_pq9+7+WV43a+yosDXmw@mail.gmail.com>
References: <CADSE00KHLXywjkJJ5fzJPcgTeAz9k3_pq9+7+WV43a+yosDXmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a7076f4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=1OYpqXWWkMlAYNYMeLQA:9
X-Proofpoint-ORIG-GUID: Wa7S3HmbY5Tyd23dX9yCdi4HMmHOsjSR
X-Proofpoint-GUID: Wa7S3HmbY5Tyd23dX9yCdi4HMmHOsjSR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfX0sfHqEad80Bp
 vZU2vqN2LAjy+V2QD3KF1H8nbDUDWDgUHQ7mx25dRJH5Q2LDnm+jDkFA6P1s02AR9yJfp1upREF
 1jZhEbH6eual5NslzBhERQ2296TRFaE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5OSBTYWx0ZWRfX2l78Gsf1fXX5
 qolm06hRQZFQ3Iv9EM/Wm6oqSOpPvH70gRzmder7RRvhxdV4i01Ez4NwwjRbQv+UoXNakb4NdeL
 SdsY6go7eDd2zwqtVlzCFOPKlpBFucuSBSRgwGq4a6xqOmWrFqkDrSPoW8HNHArnzfQ7VRF3rPZ
 CDjIRrzn2oX2KN0O3EUFnQqeICjt0FsKJg2lG/xFiwkiFvQ4+EFoji3erRqtDauS2CVANBspfFv
 jj4I0wbbbIicClrj4uPuCrB//8GkeT80hyJA1V5KURTn42yxQA5EWnTiBIkchdnczZg8Fk20j9b
 B6kZCQ+Ti353Q0p0jLfOwzXx8LHq5oWcjlWh93kkSXJkB4qfVs1NUbzq7n9DpNWn5IJLdhePo18
 BPhhe1vhmZ5fghVyLPTTy4zCYA/YCL1ika/GrvCAVIOI6TBgstui7pGXV3ysqQnzfbrXZiA+W8K
 li1iD0s660hn5F6hKkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030099

Hi Albert,

Thank you for the clarification.

Could the TC please open a voting ballot for reserving Device ID 51 for
Virtio HAB?

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/249

Best regards,
Zelong

On Mon, Aug 3, 2026 at 5:37 PM Albert Esteve <aesteve@redhat.com> wrote:
>
> On Fri, Jul 17, 2026 at 6:10 PM Zelong Ren <zeloren@qti.qualcomm.com> wrote:
> >
> > Hi all,
> >
> > Gentle ping on this patch.
> >
> > The earlier questions have been addressed in the thread. Could anyone comment
> > on whether there are any remaining concerns with reserving Device ID 51 for
> > Virtio HAB?
>
> Hi,
>
> If there are no concerns raised for a period of time, the next step
> would be to open an Issue in the repository (which you already did),
> and request a TC voting as specified in [1].
>
> BR,
> Albert.
>
> [1] https://github.com/oasis-tcs/virtio-spec#use-of-github-issues
>
> >
> > I'd be happy to provide additional details if needed.
> >
> > Thanks for your review.
> >
> > Best regards,
> > Zelong
> >
> > On Mon, 7 Jul 2026, Zelong Ren wrote:
> > >
> > > > Can this be used for communication between two different guest VMs?
> > >
> > > We didn't have this use case today but with some effort this can be supported.
> > > It should be viewed as 2 GVMs still requires the setup of PVM and assistance
> > > of it to reach this functionality.
> > >
> > > > Do you plan to upstream the specification for this device as well?
> > >
> > > Yes, agree 100%.
> > > The ID reservation is the first step, we plan to upstream the device specification
> > > to the virtio TC as well.
> > >
> > > On Thu, 2 Jul 2026, Demi Marie Obenour wrote:
> > > >
> > > > > Virtio HAB device is an inter-VM IPC and shared-memory device
> > > > > intended for multi-VM systems.
> > > > >
> > > > > Virtio HAB provides named service channels between guest VMs
> > > > > and primary/service VM, primarily targeting platform-specific
> > > > > hardware accelerators and system services (deployed in Qualcomm
> > > > > automotive platforms).
> > > >
> > > > Can this be used for communication between two different guest VMs?
> > > >
> > > > > It also supports bi-directional zero-copy shared-memory lifecycle
> > > > > operations (export/unexport/import/unimport).
> > > > >
> > > > > The driver is shipping in Qualcomm automotive IVI products,
> > > > > supports Gunyah, QNX, Green Hills, Red Bend and Xen hypervisors
> > > > > (KVM in progress), and is being prepared for Linux kernel upstreaming.
> > > > >
> > > > > Signed-off-by: Zelong Ren <zeloren@qti.qualcomm.com>
> > > > > ---
> > > > >  content.tex | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > > >
> > > > > diff --git a/content.tex b/content.tex
> > > > > index 243ce2d..25837d8 100644
> > > > > --- a/content.tex
> > > > > +++ b/content.tex
> > > > > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > > > >  \hline
> > > > >  50         &   Video encoder/decoder device \\
> > > > >  \hline
> > > > > +51         &   HAB (Host-Guest Auxiliary Bridge) device \\
> > > > > +\hline
> > > > >  \end{longtable}
> > > > >
> > > > >  Some of the devices above are unspecified by this document,
> > > >
> > > > Do you plan to upstream the specification for this device as well?
