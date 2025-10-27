Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07352798E5
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 20:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597242; cv=none; b=SC+2yciWPOKoiaCjgRKq8jyvSrgw7gQBC4guKGNT9iTctKi9NuREkntMEL8gF3rb0HYKND2epwB8ppS0O408oZl5kRbIUF0fmbla5hqvudIgkBKO7YpMCnPuVN7S0X35bCrADcOIXGD0bCz6DfW1VqK78iEFGxCbYzrhwykQz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597242; c=relaxed/simple;
	bh=GNXp0I9QrKJx/0JaMTWJCSgvGIO6SYSJTOpiK89v+9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uFBZU8U5Yfv7R3+6bZxzBfUnv7Z2iwmXkKOFUX0gSFQcHbZAaNRLCoLpQ5mJIMtwGakN/iuYnhGPxckyZ5fmxpEnkOpuI74w1UwXjoViEJ3XXVuFhyE7eKuWhpzGie/IrQhs17L+jERUN2RYjW87IWHyVMPEP9PfpYirmiJoYMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V11lYJ47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V11lYJ47"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RFK5Ru2232337
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 20:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=jHNtUsY2i75WwHuqTLLzRwgf73UXBpmAMvl
	FXHXIP+0=; b=V11lYJ47yYG9MzaBrXVrAqG5TXsyMFbnMMI6W5X6qc+L5043//7
	dLecusYwC5O7u2pGru5pDnDF45c3PkD86KTTb8rYNaRPkibHOzGW+wIdNxKe+xUO
	SgOH+D6YvYvlOoXIgTGILjlu0LgCDyQ5+gilb2KQE1qHLXi2FezSmKNETyBkgu7z
	t3crCSZ2v2Tw87reMgcOQyf/e0KCxy1WlNPBJK9WV7m2m/UWW+WGnAxhk1XOPLWZ
	d1IA8KM3EfQiXl3qx2jNmpK6vNeLheXi2OlLLOIlryhT6kVbMpH24kJRgCPeNZWb
	9uS8pXxIqmeT6Bu8d+Ys6AMeNx52gOf+RAQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a24wna9s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 20:33:59 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e88ddf3cd0so140743751cf.3
        for <virtio-comment@lists.linux.dev>; Mon, 27 Oct 2025 13:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761597239; x=1762202039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jHNtUsY2i75WwHuqTLLzRwgf73UXBpmAMvlFXHXIP+0=;
        b=T2jB5FEgNcBPkZiNKs0myxnadiZ40mEH0Jqj+ol0CFSVUVPudTOF7GIkRnIxbe9xuQ
         JDDSj9RI2i5pPAp2eAfJpuTRftfcsWhbuDQ9ZLJB/XjfvV6C1PmSd7BUVHPMtLFJYoJW
         ERQhMyIa/vpVLb6Gperp+abeO9YbR3Mp5IhUB3+VI/MlVxAZYQ3f/lqVu2+Z5JS3IWFo
         8wuNAwNF7KON79VlQtN5ZEtXr0kZ72/REKG7+xfQo9h8OIcWayT2Fpy2p0BZWDsqSdkd
         rKDMGe+gJKL4yTqDuXr/EDKVkHfzoTLms2YtsNFceCqB2OiI1hCpS86ghc4d+sWBKHOo
         eBWA==
X-Gm-Message-State: AOJu0YwfX0UTWgN39KSvh6CftiTwOLYebtIlXLUUnkfkEkb8ub2IP8a0
	nv1CA0KrHWf2LFUDG4Ii2zdIKJT8WMDIZZt6pjUVyKUG+gspk4LUYYJW49PV/Kgdjx7+Ad78Xs0
	VGr2eKCuVa7M2SVozgaWnUGpILTyfoRBEcsw7H4aOHgzIsb299z1lL+YGBxgs63qodtvJa7ielk
	CV8cg=
X-Gm-Gg: ASbGncvXu7eKruyG940DHtRh8DDXd5BKDYLtip0YJuQhsZImN9GmLg0iAFpIqPkwHE4
	pxYxbXj/5spYh9iIkgn05CIrD22xEWktiDzqcF6BZJ+27/HDyghy1fBDI2hTZ4ILFNQ2ZoILk8x
	B2+C4n5Two5IB2TxmE8f0SgN6ZNooeJdxD9nmReHlL7xI3g8j6t1kKCDTZ6a2Ryxmc/b5YGPcwr
	2PWB2li5ox2hlBb2Zt+ZLUClWV0lLnfEHGGqOwYZ4fI1acidy05uNE/dJ/LXzHBoKpJoBLe5qg8
	6h1NcELagUgNX7DLV8RA45MKYcM3qbd/r/y+Apa0Xlab2BfsH8Vivs0JZHc74OGtaalImC81wmR
	ZmK2Enlwxv88Nv26z6wpXwAeD3ZZh
X-Received: by 2002:a05:622a:5a91:b0:4e8:b3cf:a7d9 with SMTP id d75a77b69052e-4ed075bb067mr17309781cf.48.1761597238995;
        Mon, 27 Oct 2025 13:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhBtPh3VU4UB74QTrh7wLCws5VCe1a52k6jn2F5R9ocOB44T8ckDgYT5xjhNsVLaW+l+n+Q==
X-Received: by 2002:a05:622a:5a91:b0:4e8:b3cf:a7d9 with SMTP id d75a77b69052e-4ed075bb067mr17309021cf.48.1761597237317;
        Mon, 27 Oct 2025 13:33:57 -0700 (PDT)
Received: from AGORDEEV.qualcomm.com ([46.189.19.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85369675sm859669666b.28.2025.10.27.13.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 13:33:56 -0700 (PDT)
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH] content: Reserve ID 50 for video encoder/decoder device
Date: Mon, 27 Oct 2025 21:33:56 +0100
Message-ID: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XIY9iAhE c=1 sm=1 tr=0 ts=68ffd737 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aosLOigpbTjOPzs4ktCsSg==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=r1O4H-HejN0bUpxT8NAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: IJQn5ojAYP-Qdye9XJQUZX64rpaHpEBL
X-Proofpoint-ORIG-GUID: IJQn5ojAYP-Qdye9XJQUZX64rpaHpEBL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE4OCBTYWx0ZWRfX0ED3SsGKmWjk
 PtNmDGT5RRc4u4ttVKuI/PLLxH/B52oYRdvS3E75JyDTkvcSlD6Ow6w/lAH1vW7OJ8Sigzt8aK7
 4/p9JeFOcHnV/fn5qvJ5deDp3SsGogE1w+FuohBo5rCZ2qrwr8RydogI03tgC4YGCnSGMAW63Ek
 A4Q2xqQey3HJShWS+uX6Dy0UEOSWTQfe6CxBHkd7Sr5sSTLpeiao6W3z80G7yDJreYSOFpgXcpe
 tmW0OHlq3lZuJtD6OkvD1sLWWoXYMhpBvP3m7DzRV2RVQFpkX6HHwAeYu+x2RBN9p5F1SGYGt+7
 MIe4y4+yKE1S/fsJV/LcIY7fEPaVAIRU+qwoMAtp05bVFFgMhU6AtRHC4xlgoq6FxZ4A+wMamBg
 fpwY9G3Ba6fCvhLn4cEW+ajVmKIfXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510270188

Virtio video encoder/decoder device provides a stateful API for video
encoding and decoding.

IDs 30 and 31 are already reserved for devices providing only one of
the two functions. There are use-cases for a device providing both
functions, so a new ID is reserved after a discussion on the ML ([1]).

[1] https://lore.kernel.org/virtio-comment/20241223055543-mutt-send-email-mst@kernel.org/

Signed-off-by: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 5de811f..243ce2d 100644
--- a/content.tex
+++ b/content.tex
@@ -803,6 +803,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 49         &   USB controller \\
 \hline
+50         &   Video encoder/decoder device \\
+\hline
 \end{longtable}
 
 Some of the devices above are unspecified by this document,
-- 
2.43.0

