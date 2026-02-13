Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8473349B0C
	for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770972790; cv=none; b=MPSjT1xg+lsEKaG5L37THdyYh1ACEDXJ7eaqhRzNJFfqhxLm2sLtFr30yt4X0a81nqEJrivFVLxF4lvarZHePvGF/+ZQw5rOusE+aBtX7H9ivFWexHb5814KH5SNergQ+Mig+wK8crYzd5+CZdz50nMGV4AfZLnIf0Od/qBIDso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770972790; c=relaxed/simple;
	bh=ZQ5etSyHYx1J8ATdnj8MDv6RUDi2SosCmRFB5eHl/u4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NiK4yRYSMmlVzPk27xRCh93vaJcFLy/ni5O/iTvg6Pua725/b4Y/mUd5s11VwZQSHmCkdEgvYDKDnCBvhsriUFWkvuVDwG2Mu8XoN8xM5SzoIYO7Uz81iETabY8cr5ETHAHA/HSvsv8+ViNXB7/O1Q4jGa7jd3El+t4CAlTN2a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVKSzuGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ba0fkylK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVKSzuGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ba0fkylK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D67HJu421513
	for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 08:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY9
	4HWXi1b0=; b=cVKSzuGGszUP0FKrpjlxLF91I/KlopEwADvLIrSnxoysXR/+wN+
	lTcmNkfc7Glb/YzSBuMdcgZWn11wFbALQaDbviBIZU+GP7bMHZcoBuoFbY/89qVk
	FPrwNuJR5YApuvE5TO+gZDSRBLm8eIMOzr8xNvTy2tEwlvI3Xb8dp55tvf1I2TRd
	NBP4dt5wi9zuNOSFelCnfdBPqyKzfrgoz0cV2ru2Rh/yPLwwbmJnar+d8kap9M38
	huRL4KDC54+Zz1qY/tTJRO/DNCdZPvmK1miOLVfl6V7hhrDtp0F7h9OnVcowiZc9
	3r7Ue+9KiZuf++iiFEe2vvbhq/XnLvIi3VQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9cy4cbmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 08:53:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c881d0c617so273803385a.1
        for <virtio-comment@lists.linux.dev>; Fri, 13 Feb 2026 00:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770972788; x=1771577588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY94HWXi1b0=;
        b=Ba0fkylK1wM3W6r7mfdxgZyEIV9SK+gpd/sM8XVaK3iDbGdIg3BeW4gAVJwRs10Tzk
         +BWuORSMSV1VGqhknajCViCpVkam1NLBi4OU7yjhQ4vwTmjTPTZ8QwFaAGlS5mWFuO9G
         BBL15kc/IYdHc34z2vL6uWEMZPeO+v3qSIZN7OW+cyyvZg7XXK/5b4BlOMlotFslA43y
         zyHPd69A+diGgE9NPBg/1ubR6ndBJ1sjdYvh40HR8gAw71V+K3tjrjHb0RWLnElLa6op
         5+IcPqb9TWt/fzxDHj9pT91Jue6JxXo1cwyO/btTW560pBXeWvwc9XhYPK67TMd/1hD8
         gv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770972788; x=1771577588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLzeGazBJzkIMsho/B/18RlNxwoh279yGY94HWXi1b0=;
        b=C88csuEJdmJK/NI+VZdQe1vNG6iPTvd9QiOK+qjt5gdny6lBVYnA5UaIQ/Vqu2LLZ+
         X8n82C/JoNOqDBAAnZSS6jy0/Bv88TlEy3wMuN3YN8STfJAt9Tu+g5XeCOioH/YzhRMZ
         EVRjBt86IFjglynzTsFWmVzMP+aTqKRZ9ie4QBIrj2xjp3H7Vd3lup/NWS07J5FSS+2M
         TGczWedyJfiwkr1NK/UieyxW+gTLAXZAnqshY/UTx6fRkNlZt6mJkFPIQAeFy0PeTvvp
         JJvKSUIXZyMdtynnjJncsVqEUtjkstknTgETeh6pjXlQ5eNsCn331bZjLefQz4h7cay4
         ij5w==
X-Gm-Message-State: AOJu0Yyx2+3EvnxxMzCTuloDRKjDxLLZyMINBIkS136c64y6mT2XXfHZ
	SEbgMjqJreqoynokmOkZQopzQ8wOLFxiSUBbc8kJD05G6ajQ1xJ/3DoZfMob4gizb3gAlDiDniU
	7zwWXocegR2vfac/u3KvBB1zTx/1uGLHqY90IVOzcGXow7rFxBNN4NLBfRB7sJQboE8KAWdoqj5
	j9
X-Gm-Gg: AZuq6aKNuw0LiSyNFvmyhzWjgyrznkdKJaO0Qrtt+UJc1m40HZtI2d8oFpJDFZuxRFh
	tuqse3ozAEcGwAuFUVX3Ajm7IZFueTg0P33JTFB5usNHz9uIdWPtYKWKgDEcljTW55NOGrxynu/
	BDH67FnRWTwDF1ZxYQuMgnxfLxUCn951SNPwtnSe517w2D/Kd4CqbV+gfSy3dieULQL/9uk9Hl1
	uX88CgLfct4B3TkabMpg/MdZezJ1KonzVoCrTFQJzq+4rsuTyOpbtrUL5ZiQJuhJ2gZsioTGeFA
	sH68BDFmCx/tPB1OI0gDnuj7UpoQpwSHBg5dgqwDatOfIOtav3rFnK5CI4zN0Ku5PhHMhO0Muif
	n/PecuXP4vegZxMRsFLnZ2YdyohCFjWILW+P6Kn7/450NSmvumsBpAgyqq+C1E+icaKf2
X-Received: by 2002:a05:620a:3705:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cb422ab85amr113660585a.26.1770972787889;
        Fri, 13 Feb 2026 00:53:07 -0800 (PST)
X-Received: by 2002:a05:620a:3705:b0:8ca:2cf9:819d with SMTP id af79cd13be357-8cb422ab85amr113658585a.26.1770972787369;
        Fri, 13 Feb 2026 00:53:07 -0800 (PST)
Received: from euvirt-devbuilder-04.eu.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796abc9b2sm3692675f8f.21.2026.02.13.00.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:53:06 -0800 (PST)
From: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: Albert Esteve <aesteve@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Enric Balletbo i Serra <eballetb@redhat.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
        Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
        Trilok Soni <tsoni@quicinc.com>, Matti Moell <matti@qti.qualcomm.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v10 0/1] Virtio video device specification
Date: Fri, 13 Feb 2026 09:53:05 +0100
Message-ID: <20260213085306.313348-1-alexander.gordeev@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vSiYcDazkLYosoHzZ42IV13NnRfjNOmz
X-Proofpoint-GUID: vSiYcDazkLYosoHzZ42IV13NnRfjNOmz
X-Authority-Analysis: v=2.4 cv=XvX3+FF9 c=1 sm=1 tr=0 ts=698ee674 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=HDcqBCEvkTplNmHNSisA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA2OCBTYWx0ZWRfXxvwcvuchS8bJ
 KOYlNGnk025LJRhRNwZJUpfEsvt7bnnjbN/u6IEc3mIUnC19qoicDzYCavlsUYb42JPo39FvrOA
 ux8tvdFXJInMyDDsbqE6t52IB/1BMRlVdj1Gyto1DDL2V8k19xdnOhKrog2Onfih/GEbN7klNRX
 +BX5wTpn/xImglQJAvOxAkOfZ/ngiAx9GTkBPCk0hUCtCPOHtHocqT7sv1q8RedYwEYsMmMF0g8
 2WyIMFU68BMevVJEcRArkw8seDPexmjlE71MtmhuLA2yB/Vh3BLjlpidoKicQQLcu9/1vgGPGzk
 nKOt8kGAchWIhuD+bQIUM8y0UP6GIKncN/W3ecf6sCaBX/buZ0KO0PJ/PEQiE3QTDoM2z9loWyi
 RZGmZR5a8VZo/Q2ikT/K9PnQbau/Sv623OpYnqw3QD97M9eIsAqOCUCKi72c2EmyTi0YdtS1hDs
 zXcCylcUE6rhjbT/D3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130068

Hi,

This is the 10th version of virtio-video device specification patch.
There are some major changes based on internal review. I think it is
good enough conceptually, but may need few minor changes, when the
driver gets fully updated. It took a long time. We were very busy
working on the implementation. I hope to release the updated driver
soon. Please review.

Changelog v9 -> v10:
1. Combine both encoder and decoder in a single device.
There is HW out there that can do both encoding and decoding at the
same time (e.g. Qualcomm). Having both functions in a single device
can save resources.

2. New device ID.
Point 1 required the new device ID. I've already sent the patch to
reserve the new ID and asked for a vote. I took the liberty to already
put this new ID here. I'll send a new patch if any change would be
necessary.

3. Reinvented the internal queues, added per stream main queue.
This is based on internal review. Having too many virtqueues may use
more HW resources. Still there is a change in the scheme. Now each
stream has three internal queues: mainqX, inputqX, outputqX.

4. Now all stream commands return the results as async responses over
eventq and nothing is returned on the commandq anymore. This way the
race handling both commandq's and eventq's used queues is completely
avoided. Now the eventq is the single source of truth about the
device's state.

5. SET_PARAMS returns only changed parameters, GET_CONFIG returns
everything.

6. SET_PARAMS/dynamic parameter change now blocks outputqX to allow
driver finish output format negotiation and reallocate buffers if
necessary. This fixes a potential race in the implementation. This
is somewhat similar to what V4L2_DEC_CMD_START is for.

7. Added VIRTIO_VIDEO_F_V4L2_COMPATIBLE_LAST_BUFFER feature flag for
compatibility with V4L2's V4L2_BUF_FLAG_LAST.

8. The spec size went down from 19 to 18 pages.

Alexander Gordeev (1):
  virtio-video: Add virtio video device specification

 conformance.tex                           |   12 +-
 content.tex                               |    1 +
 device-types/video/description.tex        | 1592 +++++++++++++++++++++
 device-types/video/device-conformance.tex |   22 +
 device-types/video/driver-conformance.tex |   20 +
 introduction.tex                          |   21 +
 6 files changed, 1664 insertions(+), 4 deletions(-)
 create mode 100644 device-types/video/description.tex
 create mode 100644 device-types/video/device-conformance.tex
 create mode 100644 device-types/video/driver-conformance.tex

-- 
2.43.0

