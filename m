Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651E04028E5
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183312; cv=none; b=GWBVHLPt+XcaOr5KuNeHBSIMGroWcS1EOlWysvmpQMmb3g+yH5p5z4uGH4Epups9OtCiEGRlH6UxUNJRl8Pz1rgT4pp0uDPRf5zzjFGINHxSmAdKsnAS+kHkAlc8G4FI3wB0LcQ+7j7Nwv1AUxdUaC6GeqiFDVuMsmA8qEjjoQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183312; c=relaxed/simple;
	bh=XmtPdSTz6//f1HyZ4vGfR9VM16v0mH+UH8q0E3kjV+I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=JdusiMcIbnXIq/qQF3VU/bXYQo9ZgnjHaIuXBiszT3MnGf49PxvkWgUFHs4EtQXgGT7x/6cjahkNZJp7kM48qXNSVgmizLGmboYSRGI3Jl+w0JNcRv7mURuqiEuuoera5kdC2o1XJnUqqxoqWDxCclPwOgvddm8PuY8b44g6Zko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZabxemvI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yr7P9Zp+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZabxemvI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yr7P9Zp+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSmEo546395
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dKBJ/shKynjU50jbczgC9C
	dE7kTjidJ7SB7mNGdUEcg=; b=ZabxemvIQZs9tN4DUxufMwZFqrVTaHrSQRS191
	RtoONg/GIQ2TokSSW3ED1+8EdPE46dd84ihhsS8jW5Y+XdOLjeQHPtuxjdbx0cS8
	9cf4rLEeAsRL02ouzhw/IC4RgXaMp00q/E79NJb91Pr8OEvdEYBAvyIuwEYUlF1r
	YEEGDM+dHCyFEPkmUG6Dr6S3ucl1OwmEPJyS+F0EcRRvdIjAzmUJ5x+2uj78I053
	/wClA0xj9v8UAABxi9giPaujPDA/S6cQjKZqRagCxDqZROr2pmoERXWl4NUevgn3
	YCECCiOeNBjQRsBn9PSMfL2gQEHbXteBdPFljS/80UwAHqJQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6skk6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:30 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b550a521so8664541a34.0
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 06:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781183309; x=1781788109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dKBJ/shKynjU50jbczgC9CdE7kTjidJ7SB7mNGdUEcg=;
        b=Yr7P9Zp+vKjgLXGI34FATl/HO07MRULZQkxVOmG5BeWsmtaTsntTY71v/8DueDpmCy
         3rgTarzcS4jTx+lZ/4lxhSmQ9tiBlgP0eI7obebhz9h3aOQvam7CGzPV8k3U37PVA5V6
         zqXxslNj/BsyuZZLyq5VLPKCAQ+aU4+W+B9HasDhsYaeCqj+2trXPo66YqhPj7g9xHnv
         tXHpJ7SMICjBB+l5adZ/xXdPHPFirZHRgNDrgBySUSY3m2XGgW3110Ukx1DVkbav6xA+
         9AiVeOJNzFjZSPLan0Gk8u/iN6kpCZ+zKtI6Y13xYkNt2Q2k/Xp/VhYRm5qIAF9UtXe4
         x5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781183309; x=1781788109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKBJ/shKynjU50jbczgC9CdE7kTjidJ7SB7mNGdUEcg=;
        b=sJVwvlgNv/zoel2Tu9lbyUiJrFYGyDyFcepiVerLuuY7CiMqAMD3WMFfLvQboi36My
         w4cp6jtnrmzMmmSkcruwlNZtiGS85fe4l27fgv+p4yottTOcO1BxDv3nRncyMTO3hWP1
         atYMKXBKVCL2grL486+wSa/roko6WxQk97WYBC0LqgmhBHzJjKuw0k/Fyhwyau8HcFPN
         e65vbOD9YCx/gMZUpAteOJHpnlyGzPCHof8OBM8XOEbQFEw7C1pdqA/nNyGAq5aURaop
         pmrjr3fTRa/fonO062YVyQMNShU1BsCEY6LqYaolLy7ThTLUXYDKlv0+IE0KiBB2bEDb
         BdIg==
X-Gm-Message-State: AOJu0YyJV/vFTC+F5reGaKHPEvOBU8s/+IuziY71EGzepfVC4wzpvSmx
	WPcMpdOw+HdD+H1HaEp5ILv3417Xbdf4g0/NIB4JLpsgtwfsPMlwfWIBRaW1yw11jZKVwThLdkY
	8ouRDTTzuqpgNWr9KNkHasi+5SIQm2tNS9ryaOAFmYriHLKAk8W6orGTxQsZaIP9hfc5I0aUZ+O
	fL+667BFY=
X-Gm-Gg: Acq92OFVnWFVEJliWkGUhGkG1dN4OKExV6AQvE8lGCT5AYnHW0Eu68o2lp5hd0bAUER
	y8s/iqNogFX2NET4LzRV7iY1pdkzZmSu3KEW9G+N6HmTuEa9uPcwRkFCD/FiNRhgps/NDM+yZan
	T8QLnW5IaCzxV46gEjO4K3OfwPqSPS9D1V4ovy29giM9hO0PNa3x1OXh4PKgxCXwjFO1XJA67UP
	9JtOS1/qGXp3dEK9/FLkDNDO1Vak62njp7GZ37fQsk4nMriBWrxYAR0FuXiiKjklNtcyMys8VkM
	bw0D9vAIfUaXzeNoKDJ3FqZLDKKWviPKJky3txvrpCUc9wInvm0QcbezxkWauJB4a9Yhf/eIJ4p
	Y8ZeuVacf3Rqpc9jbavHSmP1ZksnSkjfS6wvi5ZitjpIAsd8WOvivw+w0nFrR7fNFzg==
X-Received: by 2002:a05:6820:993:b0:694:8683:3860 with SMTP id 006d021491bc7-69ecb059336mr1656200eaf.48.1781183309357;
        Thu, 11 Jun 2026 06:08:29 -0700 (PDT)
X-Received: by 2002:a05:6820:993:b0:694:8683:3860 with SMTP id 006d021491bc7-69ecb059336mr1656185eaf.48.1781183308890;
        Thu, 11 Jun 2026 06:08:28 -0700 (PDT)
Received: from vianikee1.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f15de8sm63894366b.12.2026.06.11.06.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:08:27 -0700 (PDT)
From: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: igor.skalkin@oss.qualcomm.com
Subject: [RFC PATCH] virtio-usb: Add initial virtio-usb specification
Date: Thu, 11 Jun 2026 15:08:25 +0200
Message-Id: <20260611130826.287372-1-vasilii.ianikeev@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a2ab34e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Lv1nS67BwW8269MOrZkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: fgKyq5uy4-q6wAgRPb47rLZznPfZglVA
X-Proofpoint-GUID: fgKyq5uy4-q6wAgRPb47rLZznPfZglVA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEzMiBTYWx0ZWRfX1MnEXnSSN4Yf
 kZXN5ioUN15nhDjybRlf1rkCUjttiW3CXBQeINyKeIIyxIkc2Dyr2fJtFq7P107Ze6faoODKUar
 D+BDqEjh0JwnAIM3fRHhBRBs+N9G6Rl/Sin7CW/3WuLin93ep69OwZoR+jkp9D22DN39j3SXdvT
 KXObbb0mNCODw5/9X+cQJXLMLUO9UINxS/x3T3D5X7/LxZyesyhxw8yGSluIXjbnWJ21pCL3ugR
 b8ixi80O0Jt+A+AH47mXsJzgeOyDPu6MJDXAw4p/GAA1yqpCtUlhrIWe6Iao94JvgVIWGTuAr+H
 fJuABVdILi4K/esdP3uREiq3S8qg6Wa5NtVL2qKD9ya0w3EI9wmldUH4oAYeR8JBlgunqUU8hv9
 TZwkS8rHWRHojihe/DGGUmX//LW77igEj21l6U8E465yG/uaBYDWb2CLrnHy7PFr91w/LIWeHJk
 6TzVi3UTMH0XILFhkew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEzMiBTYWx0ZWRfX+7HoVlMOykFO
 OgBDcVeDTo/HUcT8CDlpKgiBf2p14byPbdXSSC92JvLr6eINgG1lNfIl/Z/3TnVPbLYsEsPIlI+
 JvCWKnSVxeOq+I9MgaHzO/2nvxS/E9g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110132

This patch introduces the draft virtio-usb device specification, which
defines a dual-role USB device capable of operating as a USB host
controller, USB device controller, or both roles with dynamic role
switching support.

A USB device may support one or more ports. Each port can operate as a
USB host controller port, USB device controller port, or a dual-role
port that allows role switching, depending on the device’s capabilities.


The specification includes:

- Device ID assignment (49) (already reserved) and feature bits for
  host, device, and role switching capabilities
- Dedicated virtqueue sets for USB host role, USB device role, and OTG
  role switching operations
- Data transfer support for all USB endpoint types (control, interrupt,
  bulk, and isochronous)
- USB host role operations including device connection/disconnection
  events, URB submission, and bulk stream management
- USB device role operations including endpoint management, gadget
  lifecycle events, and control request handling
- USB OTG support for dynamic role switching between host and device
  modes
- Multi-port support allowing devices to expose multiple USB ports with
  independent role configurations

The specification refers to USB 2.0 and USB 3.2 specifications for
common terms.

For this device, there is a prototypical Linux kernel driver for which
upstreaming is planned, and a proprietary device implementation.

Any feedback is appreciated very much.


Vasilii Ianikeev (1):
  virtio-usb: Add initial virtio-usb specification

 conformance.tex                         |   12 +-
 content.tex                             |    1 +
 device-types/usb/description.tex        | 1369 +++++++++++++++++++++++
 device-types/usb/device-conformance.tex |   26 +
 device-types/usb/driver-conformance.tex |   17 +
 introduction.tex                        |    6 +
 6 files changed, 1427 insertions(+), 4 deletions(-)
 create mode 100644 device-types/usb/description.tex
 create mode 100644 device-types/usb/device-conformance.tex
 create mode 100644 device-types/usb/driver-conformance.tex

-- 
2.34.1

