Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B15B36EAB8
	for <virtio-comment@lists.linux.dev>; Fri, 17 Jul 2026 15:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784303357; cv=none; b=Q8vJUJeOjIl/iWTIoxDXe0M7DqXQi/YGiIwDWD4wc/RpC/4wlzcenOt3BIoKVotLAdAW8hmCpCRV+rmEO261e2vScxjBfOeotwJaxNss/R/ERyRMGlWqcXwlNmxDvIQi5WunMkXdxXQNfpIbK8+hwy/UOV4yWfyBBa+iY2LZ/Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784303357; c=relaxed/simple;
	bh=5ammnAxtnqqku9hE3WeHAvUc432mttQ95xNnfacKelg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKu6Xb9JqYvPMoIuJ0e5ZmbKcfIa1TViJDeOdcOu6oJDcW+IA82NE3ZinIvCOXXWeRES92lnHUcJ7Xyaj8uWOWSLk+NRiuLv3yEFkfTf/CAUH8oFL/WuBxGPdDVko5l+USnK0j/xQnt9Bs/LzmiWX5MFVrAoR+2X1A/XRFSrn78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epVUTLa7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epVUTLa7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE8qFN1876887;
	Fri, 17 Jul 2026 15:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OQ67jjb3yGx
	qiaTFFNLhFS25o+gKDREbrpdai77TGPk=; b=epVUTLa79MV3D6oK55jjAjjP+pm
	l6j34240skr/3oP2HLNVLswMyI9Tvo5Mle8BiM4tBgpjaDCNd5f4shUDmVF3Uau5
	QMuBfb1sdqtlZoWPlG+gMfp04fpWFwtyV8jg3lhklLGkhdHEwatWi6Oq77S/E2UF
	mk9v8DKmqiBTZgtzoHD0MO7SimeJyzSwNSv5J3ZFcMlcDBqAv8md+Ko30AseSooZ
	YJhNELmpvnxLePXu3kzTsPv9yAENfHTb9SNtWAVQKWBZK8xh/eDYBmuaK5QhJj7s
	lCzIP+0NPyqSs6R3fU8i1kCSXtGX4AnOSn2T1ljsAvq7T85G+oAaO2SieWQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9pa3xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 15:49:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66HFnAn6028093;
	Fri, 17 Jul 2026 15:49:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4feeg31rqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 15:49:10 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66HFn9Rd028088;
	Fri, 17 Jul 2026 15:49:10 GMT
Received: from zeloren-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 66HFn9gB028083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 15:49:09 +0000 (GMT)
Received: by zeloren-gv.qualcomm.com (Postfix, from userid 3947827)
	id 331284200C; Fri, 17 Jul 2026 23:49:08 +0800 (CST)
From: Zelong Ren <zeloren@qti.qualcomm.com>
To: zeloren@qti.qualcomm.com, virtio-comment@lists.linux.dev
Cc: demiobenour@gmail.com, lixian@qti.qualcomm.com, lxia@qti.qualcomm.com
Subject: Re: [PATCH] Reserve device ID 51 for Virtio HAB (Host-Guest Auxiliary Bridge) device
Date: Fri, 17 Jul 2026 23:48:45 +0800
Message-ID: <20260717154845.3553474-1-zeloren@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706061539.2339496-1-zeloren@qti.qualcomm.com>
References: <20260706061539.2339496-1-zeloren@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: wPxZGhLDr2rjF3CwYE3IbfBs3sjsihS4
X-Proofpoint-ORIG-GUID: wPxZGhLDr2rjF3CwYE3IbfBs3sjsihS4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE2MSBTYWx0ZWRfX0mx2qZFIZbgY
 N5tr32WFmwspcyV3s0Nr3GW5K60YmJZIVVQvt3efAMzp52T7fKUaSNN5WgIprq7fZyim/f+4y6j
 HoJsuHHHpxfaCEd4cQVCCnF2qAgN3lctVlaOTJod4ua48iXmyAk18u7DtArNyqFwswLSaVOhomP
 XTRwz7xKeQLtiW48l1Lm1wy9d137jdgqhjPgrPPO70FYjGRDBUFkuqJzPx9pGlxcngnstCt/Umz
 oFxFjW6txG7OAuwi1vHND1/h2yACDfwjB9cf8LxslBSX9eNyy/xDLHh81xAUk1JgpVs/h8SJwEj
 kFrozZMSFIZa/hGCZMfZ04ht1zpWXKJ4pQtNpJssDb9n+Jdt6f09uqyYRwE2BZVMP1oeqyN847f
 pQuRsACiSTU5zJqOP1hI03ICq53aF8PFfOgol0BeIc3wiXH+/dh27DLRngsvRAwagGFWxQVO/s9
 OfT7lYOsGWLtkbhmdRA==
X-Authority-Analysis: v=2.4 cv=TaqmcxQh c=1 sm=1 tr=0 ts=6a5a4ef9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=QqNqbk5ZqoMZaFcMOuMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE2MSBTYWx0ZWRfX3Zff5K3ZCp8P
 polAUO9CrogRK5t7od2j8v4WSR3ncex65wbLfwURQMxp7mXTTKXQKhYmkdkEd7MzdXuoOoUfAGb
 nvI9QW6U2/hzFAY7uIjx7RrjQhPKnVo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170161

Hi all,

Gentle ping on this patch.

The earlier questions have been addressed in the thread. Could anyone comment
on whether there are any remaining concerns with reserving Device ID 51 for
Virtio HAB?

I'd be happy to provide additional details if needed.

Thanks for your review.

Best regards,
Zelong

On Mon, 7 Jul 2026, Zelong Ren wrote:
>
> > Can this be used for communication between two different guest VMs?
>
> We didn't have this use case today but with some effort this can be supported.
> It should be viewed as 2 GVMs still requires the setup of PVM and assistance
> of it to reach this functionality.
>
> > Do you plan to upstream the specification for this device as well?
>
> Yes, agree 100%.
> The ID reservation is the first step, we plan to upstream the device specification
> to the virtio TC as well.
>
> On Thu, 2 Jul 2026, Demi Marie Obenour wrote:
> >
> > > Virtio HAB device is an inter-VM IPC and shared-memory device
> > > intended for multi-VM systems.
> > >
> > > Virtio HAB provides named service channels between guest VMs
> > > and primary/service VM, primarily targeting platform-specific
> > > hardware accelerators and system services (deployed in Qualcomm
> > > automotive platforms).
> >
> > Can this be used for communication between two different guest VMs?
> >
> > > It also supports bi-directional zero-copy shared-memory lifecycle
> > > operations (export/unexport/import/unimport).
> > >
> > > The driver is shipping in Qualcomm automotive IVI products,
> > > supports Gunyah, QNX, Green Hills, Red Bend and Xen hypervisors
> > > (KVM in progress), and is being prepared for Linux kernel upstreaming.
> > >
> > > Signed-off-by: Zelong Ren <zeloren@qti.qualcomm.com>
> > > ---
> > >  content.tex | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/content.tex b/content.tex
> > > index 243ce2d..25837d8 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> > >  \hline
> > >  50         &   Video encoder/decoder device \\
> > >  \hline
> > > +51         &   HAB (Host-Guest Auxiliary Bridge) device \\
> > > +\hline
> > >  \end{longtable}
> > >
> > >  Some of the devices above are unspecified by this document,
> >
> > Do you plan to upstream the specification for this device as well?
