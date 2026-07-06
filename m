Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3961D3BFE4C
	for <virtio-comment@lists.linux.dev>; Mon,  6 Jul 2026 06:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783318547; cv=none; b=jeoWtR8rTG8RGCz4ScMcNzZSeh+oL28XjrHXHwz0eMGSJDK3nA3xgoTafaWqt4U2zeRgo+KaY5lBzMXnbQJI/yw4K4CVh4289P63ivYOPuxDa4WpQpPAEitmoLQIwzV8JQx6hdCDepmnzLe5RFOiw+dXH86zN1OlZNWwBpT8Mqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783318547; c=relaxed/simple;
	bh=KqNlzHEQs9KagdzWCH/i6vQBeePUvCATcJzA/G+6XuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAa9Z9Dftx37BKIKSHf70hTEnPc3bXe604Eze05XbdVEKB/Evy49QnvNLt8J0E/AqvIcopiSjNzS53WmiQDcwV048hb1fCN8kyvyqehoj244L/Lm+4EAh8/vAERbhvRJ/ujG7SFT6Vtnyj5aJsC3Ezcf1UbIS7GhzLaHUHMrzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paalfYYG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paalfYYG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641SuA3585281;
	Mon, 6 Jul 2026 06:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mZu8Kc77ljs
	GjnsE9qFSS3XQ2zFFFSyJiuX72Wsyzn4=; b=paalfYYGTAOOpucdK/UESJ2ZeaG
	xzuzTMKtYCGYIAA39H3hUFIssuKH28qTymdgYwKxA93zraK3HVGS0kCODPYbmIuQ
	GWi9fgOxDXF9dCbkimEwe0GLifHjrQ2hAWImep5c/52MYjetmjVnUSI8pUquSSdQ
	0Ts4XabOoCeDUJaKSBEX5Ur4dvnggG3O/HKHVu9Nsd9ZBA+ucdCVDTzfzdSj4ZRE
	O1z3CPQuRvPN0HWNFd3Lp/KpwJ+sv3MbBvQW3FRX7xervV+GTVp5JWxchfD78Gz4
	eCI0o8NB/VPyImkn0PqlMB62ZYW425eD2OlIhC8RCYY+QOWFBGpYHyqi3/w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8umpba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 06:15:44 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6666Fftx012132;
	Mon, 6 Jul 2026 06:15:41 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f6u8hjt7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 06:15:41 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 6666Ffta012124;
	Mon, 6 Jul 2026 06:15:41 GMT
Received: from zeloren-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 6666Ff9C012117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jul 2026 06:15:41 +0000 (GMT)
Received: by zeloren-gv.qualcomm.com (Postfix, from userid 3947827)
	id 1017E41C08; Mon,  6 Jul 2026 14:15:39 +0800 (CST)
From: Zelong Ren <zeloren@qti.qualcomm.com>
To: demiobenour@gmail.com
Cc: lixian@qti.qualcomm.com, lxia@qti.qualcomm.com,
        virtio-comment@lists.linux.dev, zeloren@qti.qualcomm.com
Subject: Re: [PATCH] Reserve device ID 51 for Virtio HAB (Host-Guest Auxiliary Bridge) device
Date: Mon,  6 Jul 2026 14:15:39 +0800
Message-ID: <20260706061539.2339496-1-zeloren@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4a8b58fa-0b8c-41f7-b7eb-16cc6e0480bf@gmail.com>
References: <4a8b58fa-0b8c-41f7-b7eb-16cc6e0480bf@gmail.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Q1G64SlOhfXih5WiHfI6gPXGRI5M1G85
X-Proofpoint-GUID: Q1G64SlOhfXih5WiHfI6gPXGRI5M1G85
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfXwvNwmYwnq+6g
 yjbY0ti8Nh87yZoWHYkoZ7TIKB6H3mrfyjx0tOfWrnChaDtJckMhcbDIny7wdPJdlZjRa06x04n
 yzeb4pk6PjnI7Fhg1htjxu+WWB0RgPQ=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b4810 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=vlbC8qhDcBHonJFFpHgA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA2MCBTYWx0ZWRfX1le1WpExRFMz
 W+eB7PSBk+pWv/0g2y7hVnoFWqUYAgG4bR9pg26e298IS3ftVsl9Diyo/DU2ic5gvNxrmdfHRpB
 ieH5UXlunL5WXmwSY3uMMB7Y5ikO6AFweaX/FHZOAckk5eRPMx4ayFOQoUSjDjj836OUo1Wfxd4
 xObEcGaQYDEq+TS1jI4c7+eknFPQPnVnYwhMpVVq26SHcjSULdcsWXqgj78MzLAmkmJMxNoC1pi
 kdi6rU3pMNku24rmpSjlixuPhVmC5YpC1OMCt0I2PY2VbUfw6E0G2gzjlwBSJAAS3EPKZ670p11
 YD4ZClZzaDzF/KsYOuMQ+A7Q3DgqDKexVfM85S32faJVbRnJEdgvP02j9kgwY/wUr69+GWKD56Y
 f5aa9GawISAl0KJdVRLFvs2o7dtT3n8WL+CQEWUi14IyAqk99FqlNKl7RBexWzPEfoijy4NreNl
 v1XEnbMuNzW/I4UQ3lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060060

> > Virtio HAB device is an inter-VM IPC and shared-memory device
> > intended for multi-VM systems.
> >
> > Virtio HAB provides named service channels between guest VMs
> > and primary/service VM, primarily targeting platform-specific
> > hardware accelerators and system services (deployed in Qualcomm
> > automotive platforms).

> Can this be used for communication between two different guest VMs?

We didn't have this use case today but with some effort this can be supported.
It should be viewed as 2 GVMs still requires the setup of PVM and assistance
of it to reach this functionality.

> > It also supports bi-directional zero-copy shared-memory lifecycle
> > operations (export/unexport/import/unimport).
> >
> > The driver is shipping in Qualcomm automotive IVI products,
> > supports Gunyah, QNX, Green Hills, Red Bend and Xen hypervisors
> > (KVM in progress), and is being prepared for Linux kernel upstreaming.
> >
> > Signed-off-by: Zelong Ren <zeloren@qti.qualcomm.com>
> > ---
> >  content.tex | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/content.tex b/content.tex
> > index 243ce2d..25837d8 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
> >  \hline
> >  50         &   Video encoder/decoder device \\
> >  \hline
> > +51         &   HAB (Host-Guest Auxiliary Bridge) device \\
> > +\hline
> >  \end{longtable}
> >
> >  Some of the devices above are unspecified by this document,

> Do you plan to upstream the specification for this device as well?

Yes, agree 100%.
The ID reservation is the first step, we plan to upstream the device specification
to the virtio TC as well.

