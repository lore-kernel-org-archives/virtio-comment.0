Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680690;
	b=DNkDr7myROXNxM12gkKNRWMchN7WEWWPI/LHBB5r83BghDw3YtdhAV1W29yswS0xDeBm
	 QlUKnuktxFE7BLsMqmEfTDkqHmd1GH1mRkwBWP7jFTIEBangjdQWPvGAXDMNwfku+6eqK
	 TWHl4G4A0rhomyNc2rJ5URokONMAg33npthr2aFxG1mnST1vXJ1v+cOqRZQESbsPGgrcj
	 hT0kPqptZuafga5mIXC/aZ7AJr7xdLa5opp8SpZey3HZNLqAmQivgvUM6v49h5NPnfn9F
	 pGaKTIsxYCnXspDKgfOejYjH4EoyIQ6qCNa1DeO1FbZgpF2SNawjVTuTT1fsnw5tzGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680690;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Reinject:X-QCInternal:X-QCInternal:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lZLgSatFkVJJHErhd0qhnKBJtGeLQfSWD0QuG6N+KTQ=;
	b=35LtNOBZdpfNM46oDNrr7a9x+3JcGLVaL6klnPkSmW4Pp+etc/DN3j3DEMtgg+/fkMDQ
	 9PXyyGrzCnHEgsglyngqwyU4m9OS2nGdlDeB+qjCvrHwY/7u7K/QwaVeeIBB3vvH3bih3
	 8UON23R9zbtpnv/jUq6PybH9LIjIMJNGQNRTDTxBX8wptF3dtOd09LXQ4mRf13E2lbdU0
	 OrlQVO97MijAj6BH6NmRpwXLFW8wnhPAZkncrVRXs8Ie3alSHDxHbz30f8PKriHqTnodG
	 mP2d6QbuXcqxOn9hOKIc1p2SNSmzM5Fj6kbBACgNhVA+EYF/6E/i3qqsHiHC0B5+S6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qti.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5uyA2FL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5660606A319
	for <virtio-comment@lists.linux.dev>; Thu, 22 Oct 2026 14:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5660606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C5uyA2FL
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFUnK451406;
	Thu, 22 Oct 2026 14:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lZLgSatFkVJ
	JHErhd0qhnKBJtGeLQfSWD0QuG6N+KTQ=; b=C5uyA2FLEqYBpeVZ3hgm5tyxxaT
	Xf4SnbtEcIxoXk+MBhzpH6J8DXYrnf9UMRVlCNUrb35QnNaz0dI+7F0JSdM2mJRl
	3/p9pke+IWm2eeU5fTF4TWEyaLJDHgjGThjcq1AaRKVfooMESm89QAhdD/GCB/ZY
	TDbrEnh65vanxJmYWw5iLzblA0frNiAUyOuITkDipUjy7rY1B+kmHbPX5aHWAW0K
	Khx/u1otz5O8B/Uzx3GQLqBB4Hx4CKNAAqW3/kNnSfYm4rWiqI/Ya1XeSA32gbjI
	jYv2m3wDa0IJ0H3IEM1n4gpYE1wfQzMXxzW5fafhEhHsf+lHgHiRK30HY2A==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cc72v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:51:27 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEpPCW1428513;
	Thu, 22 Oct 2026 14:51:25 GMT
Received: from zeloren-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69MEpOrx1428502
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 14:51:25 +0000 (GMT)
Received: by zeloren-gv.qualcomm.com (Postfix, from userid 3947827)
	id E3C4141C9E; Thu, 22 Oct 2026 22:51:23 +0800 (CST)
From: Zelong Ren <zeloren@qti.qualcomm.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>, lxia@qti.qualcomm.com,
        virtio-comment@lists.linux.dev
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Date: Thu, 22 Oct 2026 22:50:59 +0800
Message-ID: <20261022145101.2892371-1-zeloren@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022091645-mutt-send-email-mst@kernel.org>
References: 
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX42dRPuCyIgVc
 0SFzP039BcZW+DP4kVYFMLlSXQnqZ0MDhzg4ZoxDTETF7PRIyMRvWorFjvq2LLvnhKemTI+uSqL
 I3pYU9OxSbZlxO+TMsy9eM4P2McIqHg=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada22ef cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=B_jmI4xS5t4S_NT_yhYA:9
X-Proofpoint-GUID: RsXbaEQdPNZctv2zMYFrcTwXGwFjMhpH
X-Proofpoint-ORIG-GUID: RsXbaEQdPNZctv2zMYFrcTwXGwFjMhpH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfXy/yF4m5Eqx8S
 koEK1lJoMZdCGJD3zbNdfJjszdSAMUzpRfzjOBC/tGitoXLTpNgOqgkThibgaY1K9JkAFLnBkSQ
 JXbovgVBHbZ+bUy4JZxmntA6qri1HYlIf47EQ4cpuKe97e6JMo84Fl2Hfz1oQVV44z074zn2/rx
 nn1c9Ny527GyKraSw0VbMgt9DLUho4eoZ0m+nj3omZQq+AzEfHEtXYw5pxMFJAeYytKrR05Cykc
 vVxwWQigpiZEQm65PLfH22nPpl1gucu1NMsG96SfNGjGgtIKoSFCL5ApJ8Z+3/ORjBhfGnn96yS
 gpssr/HxbJSYSlVXmk8fj7GcNNGwd32nTkLYoTQrf5n5M5jy4k7BF2QaOPjRa8vNkdRJrXE1PTf
 gQURwMceQ5rcXwL7Y25MSMMMTyvwkYqtMw1Y6bbA7peoTNlX8hI1rKF3cD2TeKzj2poss//Gi9z
 FQm1AnRocjAPqXnnxUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

Hi Manos, Michael,

> What about the HAB btw? It was said the spec will be upstreamed
> did I miss that?

> It doesn't make sense to me that HAB/QPSFI need an ID when they are
> unusable to anyone except for qualcomm kernel drivers so maybe we
> should require that an ID allocation always needs an explicit
> justification (i.e. "the spec will be upstreamed", or "we cannot use
> VIRTIO_ID_VENDOR because X/Y/Z").

We are already working on virtio-hab specification, linux kernel RFC patch and qemu patch
as the first review package. It is not intended to remain a Qualcomm-only device or driver. 

In fact, even the downstream virtio-hab hab vendor specific implementation, it has already
been used by many external Qualcomm customers as an easy-to-use and reliable generic
inter-VM shared-memory IPC mechanism.

Current work is trimming down the vendor specific implementation and add support
for more common arch(x86, arm), more common vmm(qemu, crosvm) based on kvm(and Xen follows).
We need some time to complete this work but it will be soon.

We will need everybody's support on this.

Just to repeat the functionality of virtio-hab is to provide a generic inter-VM shared-memory IPC
mechanism for user-space applications on multi-VM systems. HAB provides shared-memory support as
the primary data path, including complete shared-memory lifecycle management. HAB also provides
a simple messaging mechanism as the control path for connection management and simple synchronization
between the frontend and backend.

So for virtio-hab, the existing approved device id 51 is more appropriate for everyone. This is very
different than a generic VIRTIO_ID_VENDOR.

Please let us know if you have any more questions.

Best regards,
Zelong
