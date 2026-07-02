Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34564C6F17
	for <virtio-comment@lists.linux.dev>; Thu,  2 Jul 2026 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001445; cv=none; b=oxkdLQcATe7Isin8W0Q+p8K9jPBfzpMH7AR+z3yFmFktVIJgzjeluzYpNjw7AwXOxnhOOWx8u6Cz5v/E3GOmn1BZFJM5X63lpYUlXlWRk6+Chg5zq7UlanyJSic6cx2q0Ka0KmIYQSsuKRyBxCIVCuFakalIHDZ/SKoP2lZK99U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001445; c=relaxed/simple;
	bh=b69RwyFa1JPWEHBO2x25vi0SyEjbzYcawGJWurxV6ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CUBTXWD6GDNkqHNxTzVe2083sQmT48DewopjAgM87PJ3m/ZMCCnknqLtUKolkexV7ebWaEeLhiMUYLDSDnrsDCwLeY3/jcoj5ILCoXxNRtZq77Zc817hm00VNnxbAAWSFrU9QZVbn7JpWRgrKjAV5IPnxDisMpdJ1SBp5+iCNhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKx2n51A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKx2n51A"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3V5p647330
	for <virtio-comment@lists.linux.dev>; Thu, 2 Jul 2026 14:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xa0T3EMCaAzhHhQQI/tBnO
	RrWn40AgUyXrEo/6ZWjWU=; b=mKx2n51A9RYrV6sW36XZk82FIH+PFw4A5J31fU
	D5EDVJ40p8mygHwwUyPs7oipt0I4sjLrSLbuNxTvU0WXMXW/T+ALf6DeKnWFpozr
	1mTmLWryvdPv9/WM6WiOzhj3Bv5rPt0qgrv1Dg/k0WzdneeovZgYD8T0gy36XTsm
	1ce+24DCcGKQ8N5Y8N7HECdEg3XJP80IU3OBVG3Wlqy7w+72C3igLfnflqRKPOZZ
	WGE32lKd+Hj70GxUUiNnxv+i9S+eSnJiGBfsJ8M3hmeUtJZE3TGVn0zR3Elsj43G
	XxzxxxOzyXjlnbafb9IY9vMSsbwbVNpqsCPNVL0SCu/4so1g==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb28ta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 02 Jul 2026 14:10:42 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 662EAdwD009017;
	Thu, 2 Jul 2026 14:10:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4f27kjsekf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 02 Jul 2026 14:10:39 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 662EAda8009011
	for <virtio-comment@lists.linux.dev>; Thu, 2 Jul 2026 14:10:39 GMT
Received: from zeloren-gv.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 662EAdIc009004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jul 2026 14:10:39 +0000 (GMT)
Received: by zeloren-gv.qualcomm.com (Postfix, from userid 3947827)
	id 05B1A41B43; Thu,  2 Jul 2026 22:10:37 +0800 (CST)
From: Zelong Ren <zeloren@qti.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: lxia@qti.qualcomm.com, lixian@qti.qualcomm.com,
        Zelong Ren <zeloren@qti.qualcomm.com>
Subject: [PATCH] Reserve device ID 51 for Virtio HAB (Host-Guest Auxiliary Bridge) device
Date: Thu,  2 Jul 2026 22:09:30 +0800
Message-ID: <20260702140939.3535968-1-zeloren@qti.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: APT8AXBrw6BBSyxTSKCMp_bdIhhXW83o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE0OCBTYWx0ZWRfX6zKe/EyRHvfe
 2wvCCzmIGRWIVXMrZTpRVYmlI6PAZEhYgByCJGHiioCXHDSSZZuzLdILYPH7ys4Hwa6rcu3rGId
 CDydQ+3ruX4t/CdLDXw1CU2w6YzrkuY=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a467162 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BUd2sSPMLhlVJ8gLgmAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE0OCBTYWx0ZWRfX/mNtUyadVF9M
 t0BtF7bkDzf5HEUxvrhZBz8ohIXJh96dKjYOjzsBEERYckhZVFThD/uBVnX9xOtmI2x4g9SNXZ/
 y811ianZpTrofcrQ90tvI9mtB8aRok3O/huQJBW+vWuCUq0f6/DjcI2qb02hh2xDYV0kNVD4Rof
 9tdaGeBVVOi+/b6Cy19cOX8Tm9XzVPahJKFQctDJ6iMBcBzRiulNSk4ztmyIET87bQBKWL4TZVU
 O8H/GEs/UPSSY2/WwIPFFqtFBzCQHPCETVnXVo8O9n8AWD47uFtMLjBrnd7ierdiwi6YCA2oNJB
 DFLOf7JOZH1k8UubL62I8EIJ+CUBSsETOb8a2aogALgwkDwWH6jYzAxRGwWKdfc239MFaP1UHej
 Rzm5Kr1U1eyT5C7r+pVCqB46MoC9UxlN9jJdMYxkn3eY0LMa0LJykGiL6twMbkOQnt1OMvtnm7e
 jOx1nGhsC/6azIKz0vg==
X-Proofpoint-ORIG-GUID: APT8AXBrw6BBSyxTSKCMp_bdIhhXW83o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020148

Virtio HAB device is an inter-VM IPC and shared-memory device
intended for multi-VM systems.

Virtio HAB provides named service channels between guest VMs
and primary/service VM, primarily targeting platform-specific
hardware accelerators and system services (deployed in Qualcomm
automotive platforms).

It also supports bi-directional zero-copy shared-memory lifecycle
operations (export/unexport/import/unimport).

The driver is shipping in Qualcomm automotive IVI products,
supports Gunyah, QNX, Green Hills, Red Bend and Xen hypervisors
(KVM in progress), and is being prepared for Linux kernel upstreaming.

Signed-off-by: Zelong Ren <zeloren@qti.qualcomm.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index 243ce2d..25837d8 100644
--- a/content.tex
+++ b/content.tex
@@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 50         &   Video encoder/decoder device \\
 \hline
+51         &   HAB (Host-Guest Auxiliary Bridge) device \\
+\hline
 \end{longtable}
 
 Some of the devices above are unspecified by this document,
-- 
2.43.0

