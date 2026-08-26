Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C55A382F1E
	for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 11:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787745317; cv=none; b=pX3HzAY+iSmpv8hVKoKP0kNG3xY5d9XYLrbPUJBwOFbUd383wlzOApLic1Ij87HpPHlao+J2Im0xOni9RAgJxN2OwCwoUU5SxtPkbUa3iDjTN6t6aNqZSHY9oighXIMP2MEdWZEGnwri57GsJGsHeXdqUJ0e4SHAgLOxBjf+4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787745317; c=relaxed/simple;
	bh=NyGyq5p4f71wBVG+pMV1pIsfHT8wZTq3wqNLlt2GCtM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SdcC8kVBlzbA9uSZIXAITsBcoKhYMPyFpGsFEQzuXkHIrCiIJ5UcQ2MSSVtjlQz/uovvcmCW2MJBXYPabthKqy+N9Gre1oT252mXxmjfP2bwiYWE9+tQeHHAlSFS2h2qhTpBHmLdTFUZF4jczFLFAFy8S7rIj5ZYXZX+iiaqCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qm3w7fW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sck1rC+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qm3w7fW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sck1rC+6"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH2Hk972453
	for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 11:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=m2/8mOutUdYF5kLMtvhMDXUQLVl0JXQ17Fj
	4xwgs3cY=; b=Qm3w7fW6/IGTqxkAG8Qg086xp7Y1aoIgQ05vWVsYUvQ638udiO0
	gp6Kq9GMQyVB1ZODjBY8KiT0g/UZu5SZCT3gUcDi4I2vHSsAX3fIitAhDcH2gmOC
	wEail0RUd8u5o7dCU6kguwOEC/wSoeczDcV/8lzRNpfDVvKJ6rMxH/Hte1M1MOL+
	mVx3HXEk1YFcAAgEd3u8RLJlFsGct/rRFmVRSZ8HnZxDp7JUTxnv4Q98e8L160nN
	/uvxbuRmpBjHhB+998i+rkjzH6JAKUERrlVPrdbCtDvceDjuVCldfTDPTPeBalcx
	NaBpufIROSocKxH9trdFM7sFTNFPzbc3ssw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r1ghvy9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 11:55:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52cd0374265so15404621cf.1
        for <virtio-comment@lists.linux.dev>; Wed, 26 Aug 2026 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787745315; x=1788350115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m2/8mOutUdYF5kLMtvhMDXUQLVl0JXQ17Fj4xwgs3cY=;
        b=Sck1rC+6lYs7nEKHMRoZhpae6lxKT++0pC7jhJ0hoDZ9SQujYJwx9H1chDetkGo5If
         9NSIN+b0lgINgLQZ1S243swbFlDII8rDR8kiuZAtuZpbs4P39jIm0NTTvySu2oJcgNbT
         s3o8UOL7cU4iVDBPK7kYWCnLKXvCDfRPTMPMwj9pjrZ9Nfo0M1/9iKNL5VTNhhF13M80
         cUfZGyopQIW6sMmfV0aKTCXLfHud/RPHk5tISza+ySo8HotEe7cQWnEErITBu6IGEMgE
         cXJigIsWWaRGYGuynGy6kVH5jiZrma3ouFkSpIie5LPhC9T5rva6swZ/Oilt0lJnPdnC
         +Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787745315; x=1788350115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m2/8mOutUdYF5kLMtvhMDXUQLVl0JXQ17Fj4xwgs3cY=;
        b=ZkDVtp5CgMuv/umE0GEnvUxykUAdH1hjLqGlLhoTauULnSOn7oXVdHcimFSonPWke9
         ViOVBY9oNL98cKmqkb1N/01GOnGR5TBRaIN1koQH5fDPtwk5h/fRWdeSIx9LH3W7GeuZ
         pQXSWtevwkCkUuLIYFcxsQRSrUvzUpHYVNk11dNcTZ8LHK/wcmy89IZ9LoGOsCx/pq2O
         tznWYag3NmASTqs9+ZcXogNF1OTee5zFLWXK4IU0yulJgtcNPBtOw2dq4b5+CYXJH723
         NudcyXkN5aprOqV03tW357HgG4JVxO8Wky/72WUYXYuXKz1ENAKrrFoEhz2iDh865KVE
         py9A==
X-Gm-Message-State: AFuF++mSPVz0D82e/9DA61LU0psGiKtxjeONeoBYzIb7lyKRcKduVSGU
	8aVbjU89UPd3eEIl3E1jRThCitYg5AKNEJPITOZ96kq5p2VpY/DTVdXbJe0eLw+wyQ736euHOeS
	UXzSXtHi8URX6ayuFNOwYcvyHDozgeKNjaXWDkg4oW4/LnrDWrOYcPcZuHLZGsp+RDhwo0hkCpS
	DvGA==
X-Gm-Gg: AR+sD13wqzZ7dHbQc8cyG5iCE7IwSlWa7nznjPGtKl2yQVN/HTxQczM3jTGbV3zSdKR
	eN8KhN69d0h2L2b7ZQcJZHgK4ksmySbke6YUUWQ2FG4nXh2sxo+N1Y0PyiDSTM5d9CfoXIIarBn
	MFMB/ujEO67Ydte9aHEWNKtvqN24L7HII0AUfddxkJFKyk6Wx5iP3Z/4YsR+ncS832GwD3nFaMa
	nDusyYnhncgZ88U2n7lMyUPWaAuCJJOljGCQPpnQrA/+XPNCMQuMBXIErX90yuu9RalS/jJrf0y
	qe9K975DYPTAbGN9qj3nDuDKk5zcrEgoGR/rApmdJmft2aNwLgJx5m3XYfmwc7P0hS34E0CJHBp
	zOfMEG1zth+iIz2opn2Yq06dh8F5Mf/4=
X-Received: by 2002:a05:622a:34e:b0:517:9570:c1bd with SMTP id d75a77b69052e-52e423df2d5mr55837901cf.25.1787745314490;
        Wed, 26 Aug 2026 04:55:14 -0700 (PDT)
X-Received: by 2002:a05:622a:34e:b0:517:9570:c1bd with SMTP id d75a77b69052e-52e423df2d5mr55833341cf.25.1787745309194;
        Wed, 26 Aug 2026 04:55:09 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e28e8499sm2538326f8f.26.2026.08.26.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:55:08 -0700 (PDT)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH] content: Reserve ID 52 for Snapdragon device
Date: Wed, 26 Aug 2026 13:55:04 +0200
Message-ID: <20260826115504.1955-1-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1O3hyPHUazMtgnguKOSZEVw7fncvSM-j
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=6a8ed423 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=T4lOIzLRIv_Vv-bTPpkA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfX1cDqneAszsJb
 +RLkb6Hhjxovmn5ZDvU/238xZEQgK5PudJMmXq8+Tubk1F8nCYDsc3ljK/lkO3nm+/b3Otw8gZ2
 4hyI1hoohKdIa98mTXTdEPPPG/BMNcY=
X-Proofpoint-ORIG-GUID: 1O3hyPHUazMtgnguKOSZEVw7fncvSM-j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5OSBTYWx0ZWRfX8PwOycY1nn4+
 p7wd4oQ9LZTh3Sghq7lJTJxIFVbE/Tc0IPfW1inndBBE2cIo137kDexecRlL6HpqihRfrkH4Cls
 zY7bjoX2L7V+KvHVNJzCCUc7X1fBwD/DQdVH4UTeogoH1yejY5Htn/bZmNukazFTDODaH+f67qh
 Il7aNmsWftOuDgRflK5p8EFq+Ifl8HgtVEJ+Q0M1rh9KE89W82HQAsN2Xm602yLZql7KS1bsL6i
 BxaV2BZzRwVuDSQ45FIxAxULzMfrN1UZ1HfjB8uAwPOmBTrVn0Ozv9t+b3s39SHGanW6L75WulD
 AwIzmUg49y8zRERCElkVsro/4/G7vq74gucWihA3XZwPqWB0+GuUpZEY888gYqS5cv7qp1Zp75K
 7t4Q+nLKXW3dwMXY1Vr+Rg09aNLbi1lLd44W8v97Y0vs06LYiCAxEMJkDJ12rD0GrkHdGjgsKK8
 hpjVEqB3//xoPzrLITw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260099

Reserve a device ID for the Snapdragon device.  A Virtio Snapdragon
device exposes functionality across Snapdragon SoC subsystems through a
common Virtio-based protocol.

Device ID 51 is already reserved for the Virtio HAB device:

https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 243ce2d..ac61ec6 100644
--- a/content.tex
+++ b/content.tex
@@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 50         &   Video encoder/decoder device \\
 \hline
+52         &   Snapdragon device \\
+\hline
 \end{longtable}
 
 Some of the devices above are unspecified by this document,

base-commit: bb1dd2e1fe89b862f38f15873d835a698b196f89
-- 
2.43.0

