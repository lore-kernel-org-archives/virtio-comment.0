Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5853B155726
	for <virtio-comment@lists.linux.dev>; Fri, 29 Nov 2024 11:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878827; cv=none; b=MT3vJtItQckhOE1jaoMijQCHEMtAjoAL1rP1oeNizQNsVvy5CQfRbOaIJ5bn9lMHoa7PdTy0vaYrMH38mGV+jVn0WCu1UT89WmPgmbRRmF5Q7A8sPtSAeyLktxNiAqgbDGu5u6IrP/8OidrB0voiHhYGd9l2dVpoqoF2Jyyefao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878827; c=relaxed/simple;
	bh=9uwQoc0BFMs4Ye3ZLXl51HImqtk5FAskgOvk22pjGjE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IHVgDFohsB4Odqo0wHAQVZJAq3TXH67CeqlvNh8G7Hw0YXRhIOaKkbSkQN47Zpb6onHGJpNThngvIUajOmv68Ek/eH1pLzv/QkwkUGqyRHH1/VTo+fL4VpWRKXNmS2HM49ak1Gh2NQ+6jvmBf2z+o71eJ76xP4kmfxAc5qAAphA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J3KExzwI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J3KExzwI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT83hVJ004222
	for <virtio-comment@lists.linux.dev>; Fri, 29 Nov 2024 11:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i+tMIUC6LTzvPb4EcuEstm
	u7PwAqXNymr3tTGWAZNWU=; b=J3KExzwILzxrnG4syIpFU7/LvDP0/823TeIvkq
	rnzHRNMrHK7CZRcqjkMJv0ARrlv7v20ZFKYSjAJdbMrwz8fIf6gpzdNg7Wt2+crT
	6At347MtmmaakNvrkswaXiR1EWujhp77kOdo0IjRIG1SZV5MappfqSt4sEgQMQ8n
	EbnYNq/qZw1ZeXSwTelU/LG3dF4T98YXMQ2/I80LKkH+E0mWmxdJjJazGUhFkzzB
	lRS4Qam43Boo+ZgJeupLiyxX3e3L3J6ln0mil7tyjEHWXSiRbD32n5A4hmD93q6Z
	rmUsty6SU9uroGVIrrgMdF0D4miwTw77X4PXgMjg/AZQffYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6rftg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 29 Nov 2024 11:13:45 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ATBDjB3001862
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 29 Nov 2024 11:13:45 GMT
Received: from ACYRIAC.qualcomm.com (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 03:13:43 -0800
From: Aiswarya Cyriac <quic_acyriac@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: <quic_tsoni@quicinc.com>, <quic_svaddagi@quicinc.com>,
        Aiswarya Cyriac
	<quic_acyriac@quicinc.com>
Subject: [PATCH] Reserve device ID 49 for Virtio USB controller device
Date: Fri, 29 Nov 2024 12:13:25 +0100
Message-ID: <20241129111325.952-1-quic_acyriac@quicinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jAyH3TjIc5i2N6e6QfXSR2NEssM9R-Hc
X-Proofpoint-GUID: jAyH3TjIc5i2N6e6QfXSR2NEssM9R-Hc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=517 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290091

Virtio USB controller device is a dual role device, which
can function as a USB host controller or a USB device
controller or support both roles. Additionally, device provides
support for switching of roles between USB host and device.

Signed-off-by: Aiswarya Cyriac <quic_acyriac@quicinc.com>
---
 content.tex | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/content.tex b/content.tex
index c17ffa6..3c687ed 100644
--- a/content.tex
+++ b/content.tex
@@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 45         &   SPI master \\
 \hline
+49         &   USB controller \\
+\hline
 \end{tabular}
 
 Some of the devices above are unspecified by this document,
-- 
2.25.1

