Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792605643;
	b=J62eJpVFBXQMtzvBhhBYiXlVwcJ2T8//MaG9aRYQIJ/2UxpHRoxRXQfL6/dTKcD6o4aC
	 +p2IYkbnCNFm2h1ivCOrc9WnoGi0CyGWNbGHCW0J7syIf79VA9Yd1wE6F/vUNQuuLQv5Y
	 q2dHRg9I1WA+K0k02MAaMV2+5NHdq2FrlVTs8lKYAwGPZOcGnys47gvKcdxLwAenNScoi
	 Ao85NmHiXJoTc0jQz44851PXRHOHDhhdzgnvJBSKXpN9QSyYZ7sEjRb4ZsG9n7/YXbm1K
	 AWHAGvttnAaZtiUAeHmEswTh5U9kU7uKb2czxy5BHhVeEBJiJBeauzcsPCP5yLv9iYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792605643;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=idalyZGmsQJrJg5zvgblftYEKnBDUf4LZYOd51ABWUg=;
	b=3/c0gh6zpQ34mKWfopx/z4Cm9vAaXxuLrorroJ+bYv51paQ2jhPQfxDQkH/WBLQ6Cc4x
	 3ujAP/tyVcGu5WDZ2hU+HsfjfRiFGC6Plwv4bDvtoMCkWYXoC6riGVlEvdID88p3Vix2m
	 8EckLr2L88pIDBF5XQA7kIrJ4MLOo9xmgcXmIdFnxrmIZ9TwoJZBkbaXhV9iaCUMK6qSf
	 ma05ohTWh/oFFJNmfnwPN1aOWE2xc9iColfmlV/FR1UZDPg+9Ec2nf2mJq5SDRD/hXwVh
	 P4yFL3GzX7DyNe+6qFlLNG+zukp89Zl+nTrAxWAGJrO9o2Y4nJkx1FiFPcwjudhHo0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRg+iKyZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SK+40gw6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3028606A31B
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 18:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3028606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BRg+iKyZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SK+40gw6
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LHpav82416792
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 18:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=idalyZGmsQJrJg5zvgblftYEKnBDUf4LZYO
	d51ABWUg=; b=BRg+iKyZXHc0xX382FFxYiRmqGGmPjXA2GEt5JdJ3ZpWPnOwDGI
	ZNvz7vUQMM+UUIPpfz/yRI4F1LRqujYzMyLIegBKIPQtEF28GsEvo6PNfNglR3Q7
	PEtiXCS3pqnEDRgkHXd7zr3AYVBUSd9BQxYVvLj3BGzBV6K49gEsKXHhrAtSudFI
	kC6tpuXGXH14W0h4uv7NryhrQoswDUhWydYhsgWIEHUi1vHcpQgDhTRkNZstN/Qv
	3U5eZFykPMVNwumnun7WymBo3wTGvjP0yCuGonI7ouMjkiYxnD7tfGRfLTo6CSya
	vzrHq4ifU7gi6rKBOvt+3ku9W2ByGE1yygQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhx2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 18:00:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so22067585a.1
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792605640; x=1793210440; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=idalyZGmsQJrJg5zvgblftYEKnBDUf4LZYOd51ABWUg=;
        b=SK+40gw6B/bnL2NZztgK0yKHKJEn9ZCOz1VPILv+/2d/+abbIW913GNrFN0u1iuyM1
         tkgJzC0+e0YWs7RqWcMzQTDzSkJFilOSi4UWQcK73jPWN8wcBShsKgRmpGC263wW0W5V
         H6Mp2t3Oozq6VbKA8ggs+E4vwKd78ThXYcwAInBwmjGEm6/BKhc3C53qJcadmeUztb0U
         FgtlQSNlpXQsbg0z10CL9V67JdqbP9zn41NQJg3kBMLxYMEq8MH/9EZ8zeuak2OJ0CoE
         zt/UAb84ogbnIf1DctLjY+cxnmfoC+ojn0ncJb/cL1DMjFd2pTSgPmSfQgdvYQwT3RmF
         bvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792605640; x=1793210440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idalyZGmsQJrJg5zvgblftYEKnBDUf4LZYOd51ABWUg=;
        b=I19tzvZP6KYGeZLnnlosQSKsMC4RJ++v5JsAjm5cwmQtX1QMUr3esq1sMMrwix8Zmo
         Q0lTFj8aG0ugd76b4cEA7/rSMkzqkUQQp1MYFgk0z1WZphKZp47Wr7GJiuqa5xZs+CTc
         8drSJDbCqZSPpKD0QdXL84uIOUm6K2Rkce1B1hd/5hZjGmUP9QVYANsS6DkxBd2kFxc1
         h+++95Tfc87GG+YMKHx0IIUX4QoWuBFWNEPuaXUeNN1DNZay8vbqQ1UT4l0EcUa3CsO2
         GJZGKpRaWGW02mxRarX6ao0flnKGSokYrYfLGPuj5+ND6QyqOCR+cF4L+xl8MH55Lmfe
         KQdQ==
X-Gm-Message-State: AFq9FYKUOX91uwaaRszp2W32op/stbmrzlwX7ZyatozC3GQgZFXUvaVU
	4CSfcLNz1YrGqPqQqos9fUYuV2OMPG1VEXHRi6paRE9lKCZpaRqnuBmwqE++3bylv7GIqGZOs7r
	5wHrssT3gsW5V/3yYr/jh+LnWE3YzU5yMsagOsDfWl4oxCZsVQ12BT/FV1VItHB0bpV6aHR8elv
	+DOg==
X-Gm-Gg: AYBFou0fcxBhmmc91KNRjot7+1RIE3vQHY6l5srfK2xKLTeUQ5Y5rqXQ5P5nxYScCpg
	NxbtugYoouJxakTJqMzUldaT1aLmvCxbSiq20Utv4lYA00Z/Fvv1TY0h0jJ4/fRJv/AXDfJfjFT
	BCuBoWcJ+eRmy+n+eeybL/oN3BRyuzcOqJI/WNBaYecGJ5TYukkjNq5jTFsmIjdUOKGl9ziulR5
	qaybTXJ0DHAnDCJBFT7kbpVjPfp1UX+VdNb56dF7IQy0AuguzjLqfc2wWBbCTfnLzLHs2JgDLrL
	FDZMboML4qR6oZrfdzeJHdsobO3A8Z4wQHvNl5xeuyyBKOMdtQ9XWu95pMom8MQxUtcC9kLx2cN
	S52SjJOPKaF5q6Ci+aEtf6afptRbxfxM=
X-Received: by 2002:a05:620a:6488:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f6277080fmr10660185a.26.1792605638176;
        Wed, 21 Oct 2026 11:00:38 -0700 (PDT)
X-Received: by 2002:a05:620a:6488:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f6277080fmr10641285a.26.1792605636780;
        Wed, 21 Oct 2026 11:00:36 -0700 (PDT)
Received: from QCOM-LDTZRie9bq.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2583e25asm7299379f8f.46.2026.10.21.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 11:00:35 -0700 (PDT)
From: Peter Hilber <peter.hilber@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Stefan Hajnoczi <stefanha@redhat.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Trilok Soni <trilok.soni@oss.qualcomm.com>,
        Peter Hilber <peter.hilber@oss.qualcomm.com>
Subject: [PATCH v2] content: Reserve ID 52 for QPSFI device
Date: Wed, 21 Oct 2026 20:00:31 +0200
Message-ID: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8fdc9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=IHffJJoBqwYPnavbcQgA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3MSBTYWx0ZWRfX+1JvvA+ORZAm
 lWPOT8UmcPXb+GJTtsgUewH9QmENJmPH4rTo7BtVJb6vkm9s60I4qwlhT6GpN1Hqb5UI3rd1cwX
 yu3/1S/4z/yRNssacKYvSKUaywt6fs8=
X-Proofpoint-GUID: jn5emF3V1YC-lID4gxcwvYJyHbTF1cjf
X-Proofpoint-ORIG-GUID: jn5emF3V1YC-lID4gxcwvYJyHbTF1cjf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3MSBTYWx0ZWRfX6DFkHfTGSEUL
 dK7sVBfpU2Y5fdIo7wuDGYpdKvcVlC8IwV8W6m3hKntylflN+ByQeQVoSXKZMMd44Xzd3HpVT6t
 mSw0fGkY+qyRbSIxNqaemRj9vOd8m44+EkBUPgxnYrC6g9iCrEwdq9q/pWrf0xfpCtnDFyOvZjw
 XTUuzbvqpmsMG2WY+M0kFihQBs5ypz6K8RnXrb6MEShXqfYF1/hocMPMMimAHM0ICBDDVN1cmRB
 d5Z60qlxpRf9YH5dMuWn94vT6uEifD8WgbV017SqArWxEl2mXC7hjLPONUnDBd3sYLUpHMozi3h
 xzBIuRKWLmrZTABCUQD9ayJELBAD7kI3pgibVkeT/lJbpvu57r/0FsUyqdTdCJFCergVqASJPXQ
 CRCOAOJxmwGfKdup0laBABX18IwQjA1XwujicQIe6I5WdTmhHBW4dsUiinbLtuiS4E9nd+Yo0GT
 pwaqeO4jYHf8Ufb70Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210071

Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
Firmware Interface). QPSFI devices expose functionality across SoC
subsystems through a common Virtio-based protocol. There are no plans to
standardize the devices.

The Linux DCP display driver series is planned as the first user of this
device ID:

https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/

Device ID 51 is already reserved for the Virtio HAB device:

https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/

Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>
---

    v2:
    
    - Rename the device from "Snapdragon device" to "QPSFI device".
    
    - Refer to DCP Linux driver patch as planned first QPSFI user.
    
    v1:
    
    - Was posted as "content: Reserve ID 52 for Snapdragon device":
    
      https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/

 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 243ce2dde36b..7416939e67d3 100644
--- a/content.tex
+++ b/content.tex
@@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 50         &   Video encoder/decoder device \\
 \hline
+52         &   QPSFI device \\
+\hline
 \end{longtable}
 
 Some of the devices above are unspecified by this document,
-- 
2.43.0

