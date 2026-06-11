Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC44028E5
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183320; cv=none; b=C+RN1QhJJaPNAjReISjNVaiNoVsQmYcabWgZVpbwcxbCob6LSpSSDB1cWLwh4JQ0yxQPxo4O6Tz+DZb0BFPXgK8qqzMsObcCgm8gLTp0g6bLBCsfWXjvGAbIiIMRX2/c3am6Mc2haCX123C9NuM4/VktZs9Mmk4N72dA6GZrGv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183320; c=relaxed/simple;
	bh=ILFXcjJsFAPv1faVH6xyOzEbXPWO3HA2FYH1g++PhrY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LK0vN+p8+XlAslKjz6ZTsQboGN+216O9GLj5py2k/taMdCPRNGaRP7ZEL6i6epW7uYvRy2pUNb7zrae6/Fofeb5zHsQj1G/7iRIdT0TTyrMGFD9kCypmUNiHo2mn5IgaIIfn46sjrAOY4yQSxpS8faBnt1OQWyBslqNXr8JnXHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SbJCfWxo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLq9vNCG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SbJCfWxo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLq9vNCG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BCSnc3630444
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BBU8UURgrQM
	h6Y0nX6x2f1Hc00QGMZAEA7elvHHZt1I=; b=SbJCfWxoqM6jtQjRoSCOtEJlM/n
	hxFdndDKRznIOjOH9cgU8ZQKj7NmN6173Zm4UoXay6jt55WyUFzeWQpijNyFYdGR
	rE1GFm5wYvr7NWnSjLbe81LimYhUusAMj+61V7qx2eFQg0g7I2nj/9vqMHFGEylV
	ETvOCY2c/fxgGkVQ//tEc2ZrM3+JLDWeDzUXbRO9MC0pYoz6PZlI2saaayPI2MpA
	ubHdfx+hxOLwVDkKMTA7OkdiPOGVTVdXBrKjqxau7/l3IYHNOUqtWCc1CVM8l72w
	N0s9A1Wsk4ESPgOKoUlbQtNALNomLJUB8BNYFtP0P50V/BaLGk00k7Cns6A==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqtb5gt0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 13:08:34 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-69d8e718acbso11359684eaf.1
        for <virtio-comment@lists.linux.dev>; Thu, 11 Jun 2026 06:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781183314; x=1781788114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBU8UURgrQMh6Y0nX6x2f1Hc00QGMZAEA7elvHHZt1I=;
        b=jLq9vNCGL5A0C2Zs3YR9mv6RI55GJ/8/Z0fq4wHN6VosYCJhTpYvTjIa5PBOknYVhX
         k3yA+cvBJGgyi+vwxnCgN1OfMwtqEIcDCjP/ouLFoCeFQUGjJuhzxtRmdJh50CZBONUL
         GotwfGh1OUwDF/3fIL8GTiNdzzxmlXOKaZfYplq6ddHy71FJT/VZENlnIlYn8xzDX0tQ
         ZL5B808BNYgTRHivc7JEWoiAsjTaLgHXsJaA6Yy01P6eS43HPiLooPZCcseGTrYAXRUL
         7ym0zN3P473kJCXfoftTMNrwnEd0VuwPo7E4ANLtoQWa41aBqV2jIyUmdyoRw0RFlU0x
         +7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781183314; x=1781788114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BBU8UURgrQMh6Y0nX6x2f1Hc00QGMZAEA7elvHHZt1I=;
        b=rxGzm+iEvikLoc+bWcMeukJdkQ/I59YmYLFOROH3e8Sk3XxLT64PccaKetRth2AYwK
         5m8qtJRr8jZr+bCSehmoorGGSElT21bgQ7YZKD+DerFnB7TCpIILnJz3NUKH+JcU+Z89
         ATm+qNC0PzBOnC2Qk9nYDTwx07VCtXzcVpV9PtWsFyWhrWZACqViE4AvCqQ3JCHmXP8+
         7lijGKM8Ax7vTk0k68Mn6ggh2OQ0l3GgaQj+L8qmK3Ehxv5fd+F8qtIn4pH1uwgTMtp9
         ZhKpEKAGIfJ/NyT3TORM07l6hwd4D4YtF2MAkF2eXxD9muPu2CPOJuQctzojbvVhG9+M
         QhgA==
X-Gm-Message-State: AOJu0Yw/ZMeEnr5gENYZxmrxzQmeNRVKLV2NHEtX0MEDihEp3P32oezR
	mDfV6ypIGqq7QU67ZAsMKfY3YiU8hJI/62zJCFlKrKpxxENvr2NPlg/dp69Fwika9hETFZw0+V8
	rhXJLCnf2xO6cYEPvw544hXWf8yU3roUDXMUymJbU5YQMM/ZCO39hP3mTLA6wKYLaBQ9XKJvby0
	U92/QjTWU=
X-Gm-Gg: Acq92OHdhIhs7sP8ENCXgz0NOFUdwcM/0BgLRB76vvDQeF3uoiSVLwCZ0/6zP7FkmcW
	MPjrLccMOzpWFTMHKQNXeMcT9+022sa2GXTThkYW5KZf820PL1odxm8IGJkahll0wdehUp5bzkj
	qakXU/kU90ujJSdVLScl6zoHtNWu9lMhPqf0FI9LlkgDjRMras263pxzNw8zqwUXupQidyVnt6H
	nXz4Gumk3blTC0Nx8HV/WB/zS36rXSjWF6P6CJrV7oEtJ4KoLChIV31Tx9vP+EY1A+40+wqWcMk
	tqO9X8AxssgNnzvuniioQ40c8VxILPIaINF0Df48GucbnQdJ3ia2dc4GC0hDfLZQ6dTZrzq8Gwq
	YTDA7cOuQVAPcYxyLc+O6h/29ciCoQjtc/plnkTKtAjN4dotRnAomZDPNu0r/VTqHNw==
X-Received: by 2002:a05:6820:1527:b0:69e:3c64:7f6f with SMTP id 006d021491bc7-69ecb06bc01mr1601388eaf.48.1781183312381;
        Thu, 11 Jun 2026 06:08:32 -0700 (PDT)
X-Received: by 2002:a05:6820:1527:b0:69e:3c64:7f6f with SMTP id 006d021491bc7-69ecb06bc01mr1601344eaf.48.1781183310711;
        Thu, 11 Jun 2026 06:08:30 -0700 (PDT)
Received: from vianikee1.na.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f15de8sm63894366b.12.2026.06.11.06.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 06:08:29 -0700 (PDT)
From: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
To: virtio-comment@lists.linux.dev
Cc: igor.skalkin@oss.qualcomm.com,
        Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>
Subject: [RFC PATCH] virtio-usb: Add initial virtio-usb specification
Date: Thu, 11 Jun 2026 15:08:26 +0200
Message-Id: <20260611130826.287372-2-vasilii.ianikeev@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260611130826.287372-1-vasilii.ianikeev@oss.qualcomm.com>
References: <20260611130826.287372-1-vasilii.ianikeev@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDEzMiBTYWx0ZWRfXxJ7UQ1hUpAzG
 kWtaCTVnx4pPuHU8Rkt9iPkzzI8oWN00mPeEvGNAsCcxglTzokYAyXk/CrTcR1R34qqBanEuYjb
 reYVor7wywUFefmCi0q1s7bYSHQccrMHlLOaj3jjqZ+GNGO3TpCHf2yM5KYyAhp2r80nulIvupc
 hEpd7C9FJ25LjWdeS+qdBOJNED0ozXZJNNKvN79SPSM7UhFzMpm6XW5+dQso8MypfcCTe1hbZdH
 XwyacOfNrpuz4HMddAH2yMraoEFvgMsmBHwtX+29QdRGQcRoJkUFid1Kd1uBYiAzJreGkcnUCPz
 4QCtgGq5tLe88Tqe61n0YEIa6nU32mu4KJHBG1eGW/Hc7MFtDOMzUaKA6AH8ScWJ7w2eKucV03y
 QZPoJ36EeP+0dioMoZU6WaQtpLdvnYTWt0zrE9ByM5W8YWesuip3j6K27cVOGy4Fj8gHxD0gO/h
 mRQy9COisKx9dOgd9oQ==
X-Proofpoint-ORIG-GUID: pbwutLIk1JUHE1nIXU7bO9mxv3M5IZFR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDEzMiBTYWx0ZWRfX0UHFPv7dBnpb
 zP10KpGKlMHD7iYo9l8Ao0CYqu4gWvzLMPMuX4x3WYdqtFjzEJF3dSSZCdGHtoiCL5vKdzZWXjz
 An+4iIelOTGLgvQ5tNbBiZbH6Ye0ah4=
X-Authority-Analysis: v=2.4 cv=e6g2j6p/ c=1 sm=1 tr=0 ts=6a2ab352 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=4ZDdAZLOAAAA:8
 a=G0XHSz-fAAAA:8 a=EUspDBNiAAAA:8 a=7k6DyvRmnVTt-CBviFQA:9
 a=xndrPlyQ53NFIRkj:21 a=k4UEASGLJojhI9HsvVT1:22 a=ms4y0dK72A0a-LjZ2Cu-:22
 a=9GzJQMQvVMogKS571uVa:22
X-Proofpoint-GUID: pbwutLIk1JUHE1nIXU7bO9mxv3M5IZFR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 clxscore=1011 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110132

A Virtio USB device is a dual role device capable of functioning as a
USB host controller, or a USB device controller, or supporting both
roles.  Additionally, the device supports switching between the USB host
role and USB device role.

A USB device may support one or more ports. Each port can operate as a
USB host controller port, USB device controller port, or a dual-role
port that allows role switching, depending on the device's capabilities.

Co-Authored-By: Aiswarya Cyriac <aiswarya.cyriac@oss.qualcomm.com>
Signed-off-by: Vasilii Ianikeev <vasilii.ianikeev@oss.qualcomm.com>
---
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

diff --git a/conformance.tex b/conformance.tex
index fb16c16..b77c7bf 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -36,8 +36,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / Media Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / Media Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / RTC Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / USB Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -67,8 +68,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
 \ref{sec:Conformance / Device Conformance / CAN Device Conformance},
 \ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance},
-\ref{sec:Conformance / Device Conformance / Media Device Conformance} or
-\ref{sec:Conformance / Device Conformance / RTC Device Conformance}.
+\ref{sec:Conformance / Device Conformance / Media Device Conformance},
+\ref{sec:Conformance / Device Conformance / RTC Device Conformance} or
+\ref{sec:Conformance / Device Conformance / USB Device Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -168,6 +170,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/spi/driver-conformance.tex}
 \input{device-types/media/driver-conformance.tex}
 \input{device-types/rtc/driver-conformance.tex}
+\input{device-types/usb/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -262,6 +265,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/spi/device-conformance.tex}
 \input{device-types/media/device-conformance.tex}
 \input{device-types/rtc/device-conformance.tex}
+\input{device-types/usb/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index 5de811f..b9b7c2f 100644
--- a/content.tex
+++ b/content.tex
@@ -835,6 +835,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/spi/description.tex}
 \input{device-types/media/description.tex}
 \input{device-types/rtc/description.tex}
+\input{device-types/usb/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/usb/description.tex b/device-types/usb/description.tex
new file mode 100644
index 0000000..646191d
--- /dev/null
+++ b/device-types/usb/description.tex
@@ -0,0 +1,1369 @@
+\section{USB Device}\label{sec:Device Types / USB Device}
+
+A virtio USB device is a dual role device capable of functioning as a
+USB host controller, or a USB device controller, or supporting both
+roles. Additionally, the device supports switching between the USB
+host role and USB device role.
+
+A USB device supports one or more ports. Each port can operate as a
+USB host controller port, USB device controller port, or a dual-role
+port that allows role switching, depending on the device's capabilities.
+
+This section relies on definitions from USB specification 2.0
+(\hyperref[intro:USB2]{USB2}) and USB specification 3.2
+(\hyperref[intro:USB3.2]{USB3.2}).
+
+\subsection{Device ID}\label{sec:Device Types / USB Device / Device ID}
+
+49
+
+\subsection{Virtqueues}\label{sec:Device Types / USB Device / Virtqueues}
+
+\begin{description}
+\item[0] commandq(host)
+\item[1] eventq(host)
+\item[2] dataq(host)
+\item[3] commandq(device)
+\item[4] eventq(device)
+\item[5] dataq(device)
+\item[6] commandq(role-switch)
+\item[7] eventq(role-switch)
+\end{description}
+
+The device always presents all virtqueues listed above. The device uses
+a dedicated set of command, event and data queues for the USB host role,
+USB device role, and USB OTG role. Feature bits determine which queues
+the driver is permitted to use.
+
+The command queue in the USB host role is used by the driver to send USB
+command messages to the device. The device replies with responses
+over the same queue.
+
+The event queue in the USB host role is used by the device to send
+notifications about events to the driver.
+
+The data queue in the USB host role is used to submit URBs (USB Request
+blocks) to the device. The device replies with a response over the
+same data queue.
+
+The command queue in the USB device role is used by the driver to
+send USB device controller commands to the device. The device replies
+with a response over the same queue.
+
+The event queue in the USB device role is used by the device to
+deliver USB events such as bind, unbind, suspend, and resume to the
+driver.
+
+The data queue in the USB device role is used by the driver to post
+transfer buffers for all USB Endpoints --- transmit buffers for IN
+endpoints, and receive buffers for OUT endpoints.
+
+The command queue for USB OTG is used by the driver to send requests
+to the device to get or set the current USB role (Host or Device). The
+device responds with a reply over the same queue.
+
+The event queue for USB OTG is used by the device to deliver OTG
+events to the driver.
+
+\devicenormative{\subsubsection}{Virtqueues}{Device Types / USB Device / Virtqueues}
+
+\begin{itemize}
+  \item The device MUST present all virtqueues defined in this section
+    regardless of negotiated feature bits.
+\end{itemize}
+
+\drivernormative{\subsubsection}{Virtqueues}{Device Types / USB Device / Virtqueues}
+
+\begin{itemize}
+  \item The driver MUST NOT use USB host related queues (commandq, eventq and
+    dataq) if VIRTIO_USB_F_HOST feature is not negotiated (see
+    \nameref{sec:Device Types / USB Device / Feature bits}).
+  \item The driver MUST NOT use USB device related queues (commandq, eventq and
+    dataq) if VIRTIO_USB_F_DEVICE feature is not negotiated (see
+    \nameref{sec:Device Types / USB Device / Feature bits}).
+  \item The driver MUST NOT use USB OTG related queues (commandq and eventq)
+    if VIRTIO_USB_F_ROLE_SWITCH feature is not negotiated (see
+    \nameref{sec:Device Types / USB Device / Feature bits}).
+\end{itemize}
+
+\subsection{Feature bits}\label{sec:Device Types / USB Device / Feature bits}
+
+\begin{description}
+\item[VIRTIO_USB_F_HOST (0)] Indicates whether the device is
+capable of operating in the USB host role.
+\item[VIRTIO_USB_F_DEVICE (1)] Indicates whether the device is
+capable of operating in the USB device role.
+\item[VIRTIO_USB_F_ROLE_SWITCH (2)] Indicates whether the device
+supports dynamic switching between the USB host and device roles,
+provided both VIRTIO_USB_F_HOST and VIRTIO_USB_F_DEVICE are also
+supported.
+\end{description}
+
+\devicenormative{\subsubsection}{Feature bit requirements}{Device Types / USB Device / Feature bits / Feature bit requirements}
+
+\begin{itemize}
+  \item The device MUST NOT offer VIRTIO_USB_F_ROLE_SWITCH unless both
+    VIRTIO_USB_F_HOST and VIRTIO_USB_F_DEVICE are also offered.
+\end{itemize}
+
+
+\subsection{Device configuration layout}\label{sec:Device Types / USB Device / Device configuration layout}
+
+\begin{lstlisting}
+struct virtio_usb_config {
+	le32 ports;
+};
+\end{lstlisting}
+
+A configuration space contains the following fields:
+
+\begin{description}
+\item[\field{ports}] (driver-read-only) Indicates the total number of
+USB ports supported by the device.
+\end{description}
+
+The \field{port} field used throughout the protocol is a zero-based
+index in the range 0 to \field{ports} - 1, identifying a physical USB
+controller port. The virtio device manages the mapping from port index
+to physical USB connection internally; USB device addresses assigned
+during enumeration are not visible in the virtio protocol.
+
+\devicenormative{\subsubsection}{Device configuration layout}{Device Types / USB Device / Device configuration layout}
+
+\begin{itemize}
+\item The device MUST set \field{ports} to a non-zero value.
+\item The device MUST NOT set \field{ports} to a value greater than
+  65535, as the port field in device-role command structures
+  (virtio_usb_dev_cmd_hdr) and data queue request structures
+  (virtio_usb_request) is 16 bits wide.
+\end{itemize}
+
+\drivernormative{\subsubsection}{Device configuration layout}{Device Types / USB Device / Device configuration layout}
+
+\begin{itemize}
+\item The driver MUST NOT write to the \field{ports} field.
+\end{itemize}
+
+\subsection{Device Initialization}\label{sec:Device Types / USB Device / Device Initialization}
+
+\begin{enumerate}
+\item The driver configures all queues.
+\item The driver reads the \field{ports} field.
+\item If VIRTIO_USB_F_ROLE_SWITCH has been negotiated, the driver sends
+a control request to retrieve the current role of each available port.
+\item The driver populates event queues with empty buffers based on
+negotiated features:
+
+\begin{itemize}
+\item The driver populates the USB host role event queue if
+VIRTIO_USB_F_HOST has been negotiated.
+\item The driver populates the USB device role event queue if
+VIRTIO_USB_F_DEVICE has been negotiated.
+\item The driver populates the role switch event queue if
+VIRTIO_USB_F_ROLE_SWITCH has been negotiated.
+\end{itemize}
+
+\end{enumerate}
+
+\drivernormative{\subsubsection}{Device Initialization}{Device Types / USB Device / Device Initialization}
+
+\begin{enumerate}
+\item The driver MUST populate the USB host role event queue with empty
+buffers of at least the size of struct virtio_usb_host_port_event if
+VIRTIO_USB_F_HOST has been negotiated.
+\item The driver MUST populate the USB device role event queue with
+empty buffers of at least the size of struct virtio_usb_dev_event if
+VIRTIO_USB_F_DEVICE has been negotiated.
+\item The driver MUST populate the role switch event queue with empty
+buffers of at least the size of struct virtio_usb_otg_event if
+VIRTIO_USB_F_ROLE_SWITCH has been negotiated.
+\item The driver MUST send VIRTIO_USB_CMD_OTG_GET_ROLE for each
+available port if VIRTIO_USB_F_ROLE_SWITCH has been negotiated, before
+using any role-dependent functionality.
+\end{enumerate}
+
+\devicenormative{\subsubsection}{Device Initialization}{Device Types / USB Device / Device Initialization}
+
+\begin{itemize}
+\item The device MUST present a valid, non-zero \field{ports} value
+  in the configuration space before the driver completes initialization.
+\end{itemize}
+
+\subsection{Device Operation: Data queues}\label{sec:Device Types / USB Device / Device Operation: Data queues}
+
+Data queues are used to exchange USB data between driver and the device.
+For the USB host and the USB device roles, all data messages are placed
+into  their respective role-specific data queues.
+
+They use the following common definitions:
+
+\begin{lstlisting}
+enum {
+	/* USB data transfer direction */
+	VIRTIO_USB_DIR_OUT = 0,
+	VIRTIO_USB_DIR_IN,
+};
+
+enum {
+	/* USB endpoint direction mask */
+	VIRTIO_USB_EP_DIR_OUT = 0,
+	VIRTIO_USB_EP_DIR_IN = 0x80,
+};
+
+enum {
+	/* USB endpoint transfer types; also used as bit positions
+	 * in the virtio_usb_dev_ep_info.types capability bitmap */
+	VIRTIO_USB_EP_CONTROL = 0,
+	VIRTIO_USB_EP_INTERRUPT,
+	VIRTIO_USB_EP_BULK,
+	VIRTIO_USB_EP_ISOCHRONOUS,
+};
+
+enum {
+	/* USB endpoint data transfer flags */
+	VIRTIO_USB_FLAG_SHORT_NOT_OK = (1 << 0),
+	VIRTIO_USB_FLAG_ISO_ASAP = (1 << 1),
+	VIRTIO_USB_FLAG_ZERO_PACKET = (1 << 2),
+};
+
+enum {
+	/* common status codes */
+	VIRTIO_USB_S_OK = 0,
+	VIRTIO_USB_S_ERR_BAD_MSG,
+	VIRTIO_USB_S_ERR_INTERNAL,
+	VIRTIO_USB_S_ERR_NO_DEVICE,
+	VIRTIO_USB_S_ERR_ISO_XFER,
+	VIRTIO_USB_S_ERR_ISO_BIG,
+	VIRTIO_USB_S_ERR_DATA_IN,
+	VIRTIO_USB_S_ERR_DATA_OUT,
+	VIRTIO_USB_S_ERR_MSG_SIZE,
+	VIRTIO_USB_S_ERR_OVERFLOW,
+	VIRTIO_USB_S_ERR_STALL,
+	VIRTIO_USB_S_ERR_SHORT_PKT,
+	VIRTIO_USB_S_ERR_CANCELLED,
+};
+\end{lstlisting}
+
+A data message consists of a request part, a response part and
+optionally a data buffer which can be either device readable or device
+writable, based on the direction of USB data transfer.
+
+A request part has, or consists of, a header which uses the following
+layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_request {
+	le64 tag;
+	le16 port; /* Port ID */
+	le16 endpoint; /* Endpoint ID */
+	le16 transfer_type; /* VIRTIO_USB_EP_XXX */
+	le16 transfer_flags; /* VIRTIO_USB_FLAG_XXX */
+	union {
+		/* transfer_type = VIRTIO_USB_EP_CONTROL */
+		struct {
+			u8 setup[8];
+		} control;
+		/* transfer_type = VIRTIO_USB_EP_INTERRUPT */
+		struct {
+			le32 interval;
+		} interrupt;
+		/* transfer_type = VIRTIO_USB_EP_BULK */
+		struct {
+			le32 stream_id;
+		} bulk;
+		/* transfer_type = VIRTIO_USB_EP_ISOCHRONOUS */
+		struct {
+			le32 interval;
+			le32 start_frame;
+			le32 number_of_packets;
+			le32 padding;
+		} iso;
+	};
+};
+\end{lstlisting}
+
+The request header contains the following device-readable fields:
+
+\begin{description}
+\item[\field{tag}] Specifies a unique identifier for the data request,
+which can be used to cancel it later.
+\item[\field{port}] Specifies destination port ID for the data.
+\item[\field{endpoint}] Specifies the endpoint address using the same
+encoding as USB \field{bEndpointAddress} (USB 2.0
+(\hyperref[intro:USB2]{USB2}) Table 9-13): bit 7 specifies direction
+(VIRTIO_USB_EP_DIR_IN = 0x80, VIRTIO_USB_EP_DIR_OUT = 0x00) and
+bits 3:0 specify the endpoint number (0--15). Bits 15:8 and 6:4
+are reserved and MUST be set to 0.
+\item[\field{transfer_type}] Specifies the type of data transfer:
+
+\begin{itemize}
+\item VIRTIO_USB_EP_CONTROL - USB control transfer described in USB 2.0
+specification (\hyperref[intro:USB2]{USB2}) Section 4.7.1 and Chapter 4.
+\item VIRTIO_USB_EP_INTERRUPT - USB interrupt transfer described in USB
+2.0 specification (\hyperref[intro:USB2]{USB2}) Section 4.7.3 and
+Chapter 4.
+\item VIRTIO_USB_EP_BULK -  USB bulk transfer described in USB 2.0
+specification (\hyperref[intro:USB2]{USB2}) Section 4.7.2 and Chapter 4.
+\item VIRTIO_USB_EP_ISOCHRONOUS - USB isochronous transfer described in
+USB 2.0 specification (\hyperref[intro:USB2]{USB2}) Section 4.7.4 and
+Chapter 4.
+\end{itemize}
+
+\item[\field{transfer_flags}] Specifies the flags which could affect the USB data
+transfer, which could be combination of below:
+
+\begin{itemize}
+\item VIRTIO_USB_FLAG_SHORT_NOT_OK - USB short reads need to be
+treated as errors.
+\item VIRTIO_USB_FLAG_ISO_ASAP - Specific to VIRTIO_USB_EP_ISOCHRONOUS
+transfer type and specifies to use the first expired slot in
+ISO scheduling.
+\item VIRTIO_USB_FLAG_ZERO_PACKET - Specific to
+VIRTIO_USB_EP_ISOCHRONOUS transfer type with data transfer direction
+VIRTIO_USB_DIR_OUT and specifies to finish the USB data transfer with a
+short packet.
+\end{itemize}
+
+\item[\field{setup}] Specifies setup packet used for
+VIRTIO_USB_EP_CONTROL transfer_type for the USB host role, in the
+raw USB wire format defined by USB 2.0
+(\hyperref[intro:USB2]{USB2}) Table 9-2. The wValue, wIndex, and
+wLength sub-fields are in little-endian byte order.
+\item[\field{interval}] Specifies polling interval used for ISO and
+interrupt endpoints for the USB host role.
+\item[\field{stream_id}] Specifies stream ID for bulk stream transfer
+(USB host role).
+\item[\field{start_frame}] Specifies start frame for
+VIRTIO_USB_EP_ISOCHRONOUS transfer_type for USB host role, using the
+same frame number coordinate space as \field{frame_number} returned
+by VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER.
+\item[\field{number_of_packets}] Specifies number of ISO packets in the
+data request for VIRTIO_USB_EP_ISOCHRONOUS transfer_type for the USB
+host role.
+\item[\field{padding}] Reserved. Must be set to 0.
+\end{description}
+
+In the case of isochronous data transfers for the USB host role, the
+request header is immediately followed by an array of
+virtio_usb_iso_packet structures in the same buffer, where the number
+of elements matches the value specified in the
+\field{number_of_packets} field.
+
+virtio_usb_iso_packet has the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_iso_packet {
+	le32 offset;
+	le32 length;
+};
+\end{lstlisting}
+
+The virtio_usb_iso_packet packet contains the following device-readable
+fields:
+
+\begin{description}
+\item[\field{offset}] Specifies offset within specified data buffer for
+the packet.
+\item[\field{length}] For VIRTIO_USB_DIR_OUT transfers, specifies the
+number of bytes to send for this packet from the data buffer at the
+given \field{offset}. For VIRTIO_USB_DIR_IN transfers, specifies the
+maximum number of bytes that may be received into the buffer at the
+given \field{offset}. The \field{actual_length} field in the
+corresponding virtio_usb_iso_status entry indicates the actual bytes
+transferred.
+\end{description}
+
+The request part may be followed by an additional device-readable data
+buffer for data transfer to a port in USB host role with data direction
+VIRTIO_USB_DIR_OUT, or a port in USB device role with data direction
+VIRTIO_USB_DIR_IN. For isochronous transfers, this data buffer is a
+separate buffer placed after the iso_packet array.
+
+For VIRTIO_USB_EP_CONTROL transfers with VIRTIO_USB_DIR_IN, the data
+buffer length MUST be at least the wLength value specified in the
+\field{setup} packet. A device response shorter than wLength is a
+short transfer and is governed by the VIRTIO_USB_FLAG_SHORT_NOT_OK
+flag in the usual way.
+
+A response part has, or consists of, a common header containing the
+following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_response {
+	le32 status; /* VIRTIO_USB_S_XXX */
+	le32 actual_length;
+	le32 interval; /* type = VIRTIO_USB_EP_INTERRUPT/ISOCHRONOUS */
+	le32 start_frame; /* type = VIRTIO_USB_EP_ISOCHRONOUS */
+};
+\end{lstlisting}
+
+The response contains the following device-writable fields:
+\begin{description}
+\item[\field{status}] Indicates status of transfer updated by the
+device.
+\item[\field{actual_length}] Indicates actual bytes of data transferred or
+received.
+\item[\field{interval}] Indicates the actual polling interval when
+VIRTIO_USB_FLAG_ISO_ASAP \field{transfer_flags} is specified and
+\field{transfer_type} is VIRTIO_USB_EP_ISOCHRONOUS in the data
+request by the driver for USB host role. For
+VIRTIO_USB_EP_INTERRUPT transfers, indicates the actual polling
+interval used by the host controller.
+\item[\field{start_frame}] Indicates the actual start frame when
+VIRTIO_USB_FLAG_ISO_ASAP \field{transfer_flags} is specified and
+\field{transfer_type} is VIRTIO_USB_EP_ISOCHRONOUS in the data
+request by the driver for USB host role. Uses the same frame number
+coordinate space as \field{frame_number}.
+\end{description}
+
+In the case of isochronous data transfers for the USB host role, the
+response header is immediately followed by an array of
+virtio_usb_iso_status structures in the same buffer, where the number
+of elements matches the value specified in the
+\field{number_of_packets} field in the request header.
+
+virtio_usb_iso_status has the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_iso_status {
+	le32 status; /* VIRTIO_USB_S_XXX */
+	le32 actual_length;
+};
+\end{lstlisting}
+
+The virtio_usb_iso_status contains the following device-writable fields:
+
+\begin{description}
+\item[\field{status}] Indicates status of the iso packet transfer
+(VIRTIO_USB_S_XXX).
+\item[\field{actual_length}] Indicates actual length of data transmitted
+or received for a specific iso packet.
+\end{description}
+
+The response part may be followed by an additional device-writable data
+buffer for VIRTIO_USB_DIR_IN data transfer for a port in USB host role,
+or VIRTIO_USB_DIR_OUT transfer for a port in USB device role. For
+isochronous transfers, this data buffer is a separate buffer placed
+after the iso_status array.
+
+Note: for the USB device role, IN and OUT directions follow the USB
+convention of naming endpoints relative to the USB host. A device-role
+IN endpoint transmits data from the gadget to the USB host; the driver
+provides the transmit data as a device-readable buffer. A device-role
+OUT endpoint receives data from the USB host into the gadget; the
+device writes the received data into a device-writable buffer. This is
+the inverse of the host-role convention, where VIRTIO_USB_DIR_OUT means
+the driver is sending and VIRTIO_USB_DIR_IN means the driver is
+receiving.
+
+\paragraph{Status Codes}
+
+The following status codes are used by the device to indicate the
+outcome of an operation. These codes may appear in response structures
+such as virtio_usb_response and virtio_usb_iso_status,
+and are applicable to both data transfers and command executions
+throughout the Virtio USB specification.
+
+\begin{itemize}
+\item VIRTIO_USB_S_OK - The operation completed successfully.
+
+\item VIRTIO_USB_S_ERR_BAD_MSG - The request contained invalid or
+unsupported values. This can include:
+
+\begin{itemize}
+\item Unsupported transfer type.
+\item Invalid or unsupported periodic transfer interval.
+\item Attempt to change interval for isochronous transfers.
+\end{itemize}
+
+\item VIRTIO_USB_S_ERR_INTERNAL - An unspecified internal error occurred
+within the device. This includes USB bus-level errors such as CRC
+errors, bit-stuffing errors, and no-response timeouts.
+\item VIRTIO_USB_S_ERR_NO_DEVICE - The USB device was removed or is no
+longer available.
+\item VIRTIO_USB_S_ERR_ISO_XFER - This error is specific to USB host
+role data transfers. It indicates that the VIRTIO_USB_FLAG_ISO_ASAP
+flag was not set in the request, and the specified \field{start_frame}
+has already expired for all frames in which the isochronous packets were
+to be scheduled.
+\item VIRTIO_USB_S_ERR_ISO_BIG - This error is specific to USB host role
+data transfers. It indicates that the host controller was unable to
+schedule the requested number of isochronous packets.
+\item VIRTIO_USB_S_ERR_DATA_IN - This error is specific to USB host role
+data transfers. During a data transfer with direction VIRTIO_USB_DIR_IN,
+the USB host controller received data from an endpoint faster than it
+could be written to system.
+\item VIRTIO_USB_S_ERR_DATA_OUT - This error is specific to USB host
+role data transfers. During a data transfer with direction
+VIRTIO_USB_DIR_OUT, the USB host controller could not retrieve data from
+system memory fast enough to maintain the required USB data rate.
+\item VIRTIO_USB_S_ERR_MSG_SIZE - The message size was invalid. This can
+occur in the following cases:
+
+\begin{itemize}
+\item The endpoint's maximum packet size is zero or not usable in the
+current interface alternate setting.
+\item An isochronous packet exceeds the endpoint's maximum packet size.
+\item The requested data transfer length is too large.
+\end{itemize}
+
+\item VIRTIO_USB_S_ERR_OVERFLOW - The amount of data returned by the
+endpoint exceeded either the endpoint's maximum packet size or the
+remaining buffer size.
+\item VIRTIO_USB_S_ERR_STALL - The remote USB endpoint returned a STALL
+handshake PID, indicating a protocol stall condition.
+
+\item VIRTIO_USB_S_ERR_SHORT_PKT - The data read from the endpoint did
+not fill the specified buffer, and the VIRTIO_USB_FLAG_SHORT_NOT_OK
+flag was set in the transfer flags.
+\item VIRTIO_USB_S_ERR_CANCELLED - The request was cancelled before
+completion.
+\end{itemize}
+
+\drivernormative{\subsubsection}{Device Operation: Data queues}{Device Types / USB Device / Device Operation: Data queues}
+
+\begin{enumerate}
+\item The driver MUST set unique \field{tag} for the request.
+\item The driver MUST initialize the \field{padding} bytes to 0.
+\item The driver MUST NOT set undefined \field{transfer_flags} and
+\field{transfer_types}.
+\end{enumerate}
+
+\devicenormative{\subsubsection}{Device Operation: Data queues}{Device Types / USB Device / Device Operation: Data queues}
+
+\begin{enumerate}
+\item The device MAY complete data messages out of order.
+\item The device MUST eventually complete all data requests that have
+  not been cancelled.
+\item If the \field{status} field in the virtio_usb_response is
+VIRTIO_USB_S_OK, the device MUST set \field{actual_length} of
+virtio_usb_response to actual bytes of data transferred or
+received.
+\item If the \field{status} field in the virtio_usb_iso_status is
+VIRTIO_USB_S_OK for isochronous data responses for the host role,
+the device MUST set \field{actual_length} of
+virtio_usb_iso_status to actual bytes of data transferred or
+received.
+\end{enumerate}
+
+\subsection{Device Operation: Host role}\label{sec:Device Types / USB Device / Device Operation: Host role}
+
+All command messages for the USB host are placed into the host command
+queue by the driver, and all notifications are placed into the host
+event queue by the device.
+
+The virtio device executes USB transactions on the physical hardware
+transparently. After receiving VIRTIO_USB_EVT_HOST_PORT_CONNECTED, the
+driver enables the port and submits USB transfers via the host data
+queue. Enumeration transfers (SET_ADDRESS, GET_DESCRIPTOR,
+SET_CONFIGURATION) are submitted as VIRTIO_USB_EP_CONTROL requests on
+the host data queue alongside all other control, bulk, interrupt, and
+isochronous transfers. Port management operations such as port power
+and port reset are managed locally by the driver and do not require
+virtio commands.
+
+The following enumerations define the types of host commands, events,
+and supported speeds:
+
+\begin{lstlisting}
+enum {
+	/* host command request types */
+	VIRTIO_USB_CMD_HOST_CANCEL = 0,
+};
+
+enum {
+	/* host event types */
+	VIRTIO_USB_EVT_HOST_PORT_CONNECTED = 0,
+	VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED,
+};
+
+enum {
+	/* supported USB speed values */
+	VIRTIO_USB_SPEED_UNKNOWN = 0,    /* unknown speed */
+	VIRTIO_USB_SPEED_LOW,            /* usb low speed */
+	VIRTIO_USB_SPEED_FULL,           /* usb full speed */
+	VIRTIO_USB_SPEED_HIGH,           /* usb high speed */
+	VIRTIO_USB_SPEED_WIRELESS,       /* usb wireless (usb 2.5) speed */
+	VIRTIO_USB_SPEED_SUPER,          /* usb super speed */
+	VIRTIO_USB_SPEED_SUPER_PLUS,     /* usb super speed plus */
+};
+\end{lstlisting}
+
+\paragraph{Host notifications}
+
+Host notifications consist of a virtio_usb_host_port_event structure,
+which use the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_host_port_event {
+	le32 code; /* VIRTIO_USB_EVT_HOST_PORT_XXX */
+	le32 port_id;
+	le32 speed; /* VIRTIO_USB_SPEED_XXX */
+	le32 padding;
+};
+\end{lstlisting}
+
+The virtio_usb_host_port_event structure has the following
+device-writable fields:
+
+\begin{description}
+\item[\field{code}] Indicates a host event type:
+\begin{itemize}
+\item VIRTIO_USB_EVT_HOST_PORT_CONNECTED - A USB device has been
+connected to the host controller port.
+\item VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED - A USB device has been
+disconnected from the host controller port.
+\end{itemize}
+\item[\field{port_id}] Indicates the port ID ranging from 0 to nports - 1.
+\item[\field{speed}] Indicates speed of the connected USB device to the
+host controller port (VIRTIO_USB_SPEED_XXX).
+\end{description}
+
+\devicenormative{\subparagraph}{Host Notifications}{Device Types / USB Device / Device Operation: Host role / Host Notifications}
+
+\begin{itemize}
+\item The device MUST NOT set undefined event code values.
+\item The device MUST initialize the \field{padding} bytes to 0.
+\item The device MUST set the \field{speed} field to
+  VIRTIO_USB_SPEED_UNKNOWN for
+  VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED events.
+\end{itemize}
+
+\paragraph{Host commands}\label{sec:Device Types / USB Device / Device Operation: Host role / Host commands}
+
+Host commands consist of a request part and a response part.
+
+A request part has, or consists of, a common header which uses the
+following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_host_cmd_hdr {
+	le32 code; /* VIRTIO_USB_CMD_HOST_XXX */
+	le32 port; /* Port ID */
+};
+\end{lstlisting}
+
+The request header contains the following device-readable fields:
+
+\begin{description}
+\item[\field{code}] Specifies a host role command request type
+(VIRTIO_USB_CMD_HOST_XXX).
+\item[\field{port}] Specifies a destination port ID.
+\end{description}
+
+A response part has, or consists of, a common header which uses the
+following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_cmd_status {
+	le32 code; /* VIRTIO_USB_S_XXX */
+};
+\end{lstlisting}
+
+The response header contains the following device-writable fields:
+
+\begin{description}
+\item[\field{code}] Indicates the command status (VIRTIO_USB_S_XXX).
+\end{description}
+
+\paragraph{Host Cancel command}
+
+A special command is used to cancel a previously submitted data
+request on the host data queue.
+
+The request part uses the following structure definition:
+
+\begin{lstlisting}
+struct virtio_usb_host_cmd_cancel {
+	struct virtio_usb_host_cmd_hdr hdr; /* .code = VIRTIO_USB_CMD_HOST_CANCEL */
+	le64 tag;
+};
+\end{lstlisting}
+
+The request contains the following device-readable fields:
+
+\begin{description}
+\item[\field{hdr}] Specifies command header with command code and port ID.
+\item[\field{tag}] Specifies the unique identifier of the data message to be
+cancelled.
+\end{description}
+
+The response consists of the virtio_usb_cmd_status structure indicating the
+result of the cancellation attempt.
+
+\devicenormative{\subparagraph}{Host Cancel command}{Device Types / USB Device / Device Operation: Host role / Host Cancel command}
+
+If the data request for the specified \field{tag} is not completed
+in the device, it MUST complete it with a virtio_usb_response
+with \field{status} VIRTIO_USB_S_ERR_CANCELLED before or after
+completing the cancel command.
+If the data request for the specified \field{tag} is not found or has
+already completed, the device MUST set the cancel response
+\field{status} to VIRTIO_USB_S_OK.
+
+\drivernormative{\subsubsection}{Device Operation: Host role}{Device Types / USB Device / Device Operation: Host role}
+
+\begin{itemize}
+\item The driver MUST NOT submit data requests on the host data queue
+  for a port that has not received
+  VIRTIO_USB_EVT_HOST_PORT_CONNECTED, or that has received
+  VIRTIO_USB_EVT_HOST_PORT_DISCONNECTED.
+\item For \field{transfer_type} VIRTIO_USB_EP_CONTROL, the driver MUST
+  set the \field{setup} field to a valid 8-byte USB SETUP packet as
+  defined in USB 2.0 (\hyperref[intro:USB2]{USB2}) Table 9-2.
+\item For \field{transfer_type} VIRTIO_USB_EP_ISOCHRONOUS, the driver
+  MUST set \field{number_of_packets} to match the number of
+  virtio_usb_iso_packet entries in the request.
+\end{itemize}
+
+\subsection{Device Operation: Device role}\label{sec:Device Types / USB Device / Device Operation: Device role}
+
+All command messages are placed into the device command queue by the
+driver and all notifications are placed into the device event queue by
+the device. The following enumeration definitions define the types of
+device commands and events.
+
+\begin{lstlisting}
+enum {
+	/* device command types */
+	VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT = 0,
+	VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO,
+	VIRTIO_USB_CMD_DEV_PULLUP,
+	VIRTIO_USB_CMD_DEV_VBUS_DRAW,
+	VIRTIO_USB_CMD_DEV_EP_ENABLE,
+	VIRTIO_USB_CMD_DEV_EP_DISABLE,
+	VIRTIO_USB_CMD_DEV_EP_SET_HALT,
+	VIRTIO_USB_CMD_DEV_EP_SET_WEDGE,
+	VIRTIO_USB_CMD_DEV_CANCEL,
+	VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER,
+	VIRTIO_USB_CMD_DEV_SET_SELF_POWERED,
+};
+
+enum {
+	/* device event types */
+	VIRTIO_USB_EVT_DEV_CONNECTED = 0,
+	VIRTIO_USB_EVT_DEV_DISCONNECTED,
+	VIRTIO_USB_EVT_DEV_SETUP,
+	VIRTIO_USB_EVT_DEV_RESET,
+	VIRTIO_USB_EVT_DEV_SUSPEND,
+	VIRTIO_USB_EVT_DEV_RESUME,
+};
+\end{lstlisting}
+
+\paragraph{Device notifications}
+
+Generic device notifications consist of a virtio_usb_dev_event
+structure, which use the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_event {
+	le32 code; /* VIRTIO_USB_EVT_DEV_XXX */
+	u8 padding[12];
+};
+\end{lstlisting}
+
+virtio_usb_dev_event structure, which has the following
+device-writable fields:
+
+\begin{description}
+\item[\field{code}] Indicates the USB device role event type:
+\begin{itemize}
+\item VIRTIO_USB_EVT_DEV_CONNECTED - The USB gadget is bound to the USB
+device controller.
+\item VIRTIO_USB_EVT_DEV_DISCONNECTED - The USB gadget got disconnected.
+\item VIRTIO_USB_EVT_DEV_SETUP - A USB SETUP packet has been received
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Setup event}).
+\item VIRTIO_USB_EVT_DEV_RESET - The USB bus has reset.
+\item VIRTIO_USB_EVT_DEV_SUSPEND - The USB gadget has suspended by the
+USB host.
+\item VIRTIO_USB_EVT_DEV_RESUME - The USB gadget has been resumed by the
+USB host.
+\end{itemize}
+\end{description}
+
+\devicenormative{\subparagraph}{Device events}{Device Types / USB Device / Device Operation: Device role / Device events}
+
+\begin{itemize}
+\item The device MUST NOT set undefined event code values.
+\item The device MUST initialize the \field{padding} bytes to 0.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_EVT_DEV_SETUP}
+
+A special event notification virtio_usb_dev_setup_event, is sent to the
+USB device role event queue when a USB SETUP event is received for a USB
+device controller port.
+
+For SET_ADDRESS requests (bRequest = 5), the virtio device programs the
+USB device controller address transparently. The driver completes the
+status stage by sending a zero-length data message for Endpoint 0, as
+required for all zero-wLength SETUP requests.
+
+virtio_usb_dev_setup_event has the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_setup_event {
+	le32 code; /* VIRTIO_USB_EVT_DEV_SETUP */
+	u8 setup[8]; /* setup packet contents */
+	u8 padding[4];
+};
+\end{lstlisting}
+
+virtio_usb_dev_setup_event has following device-writable fields:
+
+\begin{description}
+\item[\field{code}] Indicates the USB device event type
+(VIRTIO_USB_EVT_DEV_SETUP).
+\item[\field{setup}] Contains the setup packet in the raw USB wire
+format defined by USB 2.0 (\hyperref[intro:USB2]{USB2}) Table 9-2.
+The wValue, wIndex, and wLength sub-fields are in little-endian byte
+order.
+\end{description}
+
+\drivernormative{\subparagraph}{Device Setup event}{Device Types / USB Device / Device Operation: Device role / Device Setup event}
+
+\begin{itemize}
+\item If the setup event is processed successfully, the driver MUST send
+a data message on the USB device role data queue for the endpoint zero.
+\item If an error occurs, the driver MUST send a
+VIRTIO_USB_CMD_DEV_EP_SET_HALT command for endpoint zero to the USB
+device role command queue.
+\end{itemize}
+
+\devicenormative{\subparagraph}{Device Setup event}{Device Types / USB Device / Device Operation: Device role / Device Setup event}
+
+\begin{itemize}
+\item The device MUST NOT set undefined event code values.
+\item The device MUST initialize the \field{padding} bytes to 0.
+\end{itemize}
+
+\paragraph{Device Commands}\label{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}
+
+A device command request has, or consists of, a common header with the
+following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_cmd_hdr {
+	le32 code; /* VIRTIO_USB_CMD_DEV_XXX */
+	le16 port; /* Port ID */
+	le16 endpoint; /* Endpoint ID */
+};
+\end{lstlisting}
+
+The request contains the following device-readable fields:
+
+\begin{description}
+
+\item[\field{code}]
+Specifies a USB device role command type (VIRTIO_USB_CMD_DEV_XXX).
+
+\item[\field{port}]
+Specifies the destination port ID.
+
+\item[\field{endpoint}]
+Specifies the target endpoint ID.
+\end{description}
+
+Device role commands fall into two categories:
+
+\begin{enumerate}
+
+\item Endpoint management commands - These commands are essential for
+managing USB endpoints.
+
+\begin{itemize}
+\item VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT - Retrieves the number of
+available USB device controller endpoints.
+\item VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO - Provides detailed
+information about the endpoints.
+\item VIRTIO_USB_CMD_DEV_EP_ENABLE - Enables a specified endpoint.
+\item VIRTIO_USB_CMD_DEV_EP_DISABLE - Disables a specified endpoint.
+\item VIRTIO_USB_CMD_DEV_EP_SET_HALT - Sets or clears a halt condition on
+a specific endpoint.
+\item VIRTIO_USB_CMD_DEV_EP_SET_WEDGE - Wedges an endpoint, preventing
+further data transfers until the condition is cleared.
+\end{itemize}
+
+\item Device Control Commands - Commands which are needed for managing
+USB device role functionality.
+
+\begin{itemize}
+\item VIRTIO_USB_CMD_DEV_PULLUP -  Controls the pull-up resistor on the
+USB device controller.
+\item VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER - Retrieves the current frame
+number from the USB device controller.
+\item VIRTIO_USB_CMD_DEV_VBUS_DRAW - Sets the amount of current the USB
+device will draw from the USB bus.
+\item VIRTIO_USB_CMD_DEV_SET_SELF_POWERED - Configures the USB device
+controller as self-powered or bus-powered.
+\item VIRTIO_USB_CMD_DEV_CANCEL - Cancels a previously submitted data
+request.
+\end{itemize}
+\end{enumerate}
+
+Device commands which set a value use the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_cmd_set_value {
+	struct virtio_usb_dev_cmd_hdr hdr;
+	le32 value;
+	le32 padding;
+};
+\end{lstlisting}
+
+The request contains the following device-readable fields:
+
+\begin{description}
+\item[\field{hdr}] Specifies the command header with command code, port
+ID and endpoint ID.
+\item[\field{value}] Specifies value specific to the command.
+\end{description}
+
+\drivernormative{\subparagraph}{Device Commands}{Device Types / USB Device / Device Operation: Device role / Device Commands}
+
+The driver MUST initialize the \field{padding} bytes to 0.
+
+\paragraph{VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT}
+
+This command queries the number of endpoints supported by the USB device
+controller.
+
+The request consists of virtio_usb_dev_cmd_hdr structure. The response
+consists of the virtio_usb_dev_ep_count with the following layout
+structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_ep_count {
+	struct virtio_usb_cmd_status status;
+	le32 count;
+};
+\end{lstlisting}
+
+The structure contains the following device-writable fields:
+
+\begin{description}
+\item[\field{status}] Indicates the status of the operation.
+\item[\field{count}] Indicates the total number of endpoints available
+on the USB device controller.
+\end{description}
+
+\drivernormative{\subparagraph}{Get Endpoint Count}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Count}
+
+The driver MUST NOT send this command before receiving
+VIRTIO_USB_EVT_DEV_CONNECTED event from the device role event queue, if
+only USB device role is supported.
+
+\paragraph{VIRTIO_USB_CMD_DEV_GET_ENDPOINT_INFO}
+
+This command queries detailed information about the available endpoints
+supported by the USB device controller.
+
+The request consists of virtio_usb_dev_cmd_hdr structure.
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
+
+The response consists of virtio_usb_cmd_status followed by an array of
+virtio_usb_dev_ep_info structures. The array contains exactly N
+elements, where N is the value of the \field{count} field returned by
+the most recent successful VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT
+command.
+
+virtio_usb_dev_ep_info has the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_ep_info {
+	le16 types; /* supported type bit map (1 << VIRTIO_USB_EP_XXX) */
+	le16 directions; /* supported direction bit map (1 << VIRTIO_USB_DIR_XXX) */
+	le16 maxpacket_limit;
+	le16 max_streams;
+	u8 name[16];
+};
+\end{lstlisting}
+The structure contains the following device-writable fields:
+
+\begin{description}
+\item[\field{types}] Indicates a bit map representing the supported
+endpoint types. Each bit corresponds to a specific endpoint type,
+defined by VIRTIO_USB_EP_XXX. These use the same values as the
+\field{transfer_type} field in virtio_usb_request, as USB endpoint
+type and transfer type are equivalent (USB 2.0
+(\hyperref[intro:USB2]{USB2}) Table 9-13, \field{bmAttributes[1:0]}).
+\item[\field{directions}] Indicates a bit map representing the supported
+data transfer directions. Each bit corresponds to a specific direction,
+defined by VIRTIO_USB_DIR_XXX.
+\item[\field{maxpacket_limit}] Indicates the maximum packet size that
+the endpoint can handle.
+\item[\field{max_streams}] Indicates the maximum number of streams that
+the endpoint can support.
+\item[\field{name}] Indicates the human-readable name of the USB device
+controller endpoint.
+\end{description}
+
+\drivernormative{\subparagraph}{Get Endpoint Info}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
+
+The driver MUST NOT send this command before getting the available
+number of endpoints using VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT command.
+
+\devicenormative{\subparagraph}{Get Endpoint Info}{Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
+
+\begin{itemize}
+\item The device MUST NOT set undefined values in \field{types} or
+  \field{directions}.
+\item The device MUST return exactly \field{count} virtio_usb_dev_ep_info
+  entries in the response, where \field{count} is the value from the
+  most recent successful VIRTIO_USB_CMD_DEV_GET_ENDPOINT_COUNT response
+  for the same port.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_CMD_DEV_PULLUP}
+
+This command enables or disables data line pullup on the USB device
+controller. The request consists of virtio_usb_dev_cmd_set_value
+structure
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
+The \field{value} field specifies whether to enable or disable the pullup.
+
+The response consists of virtio_usb_cmd_status structure indicating the result.
+
+\devicenormative{\subparagraph}{PULLUP command}{Device Types / USB Device / Device Operation: Device role / PULLUP command}
+
+\begin{itemize}
+\item When \field{value} is non-zero, the device MUST assert the USB
+  data line pullup, making the device visible on the bus.
+\item When \field{value} is zero, the device MUST deassert the pullup,
+  disconnecting the device from the bus.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_CMD_DEV_VBUS_DRAW}
+
+Sets the amount of current the USB device will draw from the USB bus.
+The request consists of virtio_usb_dev_cmd_set_value structure
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
+The \field{value} field specifies the current draw in milliamperes.
+
+The response consists of virtio_usb_cmd_status structure indicating the
+result.
+
+\devicenormative{\subparagraph}{VBUS Draw command}{Device Types / USB Device / Device Operation: Device role / VBUS Draw command}
+
+\begin{itemize}
+\item The device MUST configure the USB device controller to draw no
+  more than \field{value} milliamperes from VBUS.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_CMD_DEV_SET_SELF_POWERED}
+
+Configures the USB device to indicate it as self-powered or bus-powered.
+The request consists of virtio_usb_dev_cmd_set_value structure
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
+
+The \field{value} field specifies the power source:
+\begin{itemize}
+\item A non-zero value indicates that the USB device is self-powered.
+\item A value of zero indicates that the USB device is bus-powered.
+\end{itemize}
+
+The response consists of virtio_usb_cmd_status structure indicating the
+result.
+
+\devicenormative{\subparagraph}{Set Self Powered command}{Device Types / USB Device / Device Operation: Device role / Set Self Powered command}
+
+\begin{itemize}
+\item When \field{value} is non-zero, the device MUST report self-powered
+  status in the USB GET\_STATUS response.
+\item When \field{value} is zero, the device MUST report bus-powered
+  status in the USB GET\_STATUS response.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_CMD_DEV_GET_FRAME_NUMBER}
+
+Retrieves the current frame number from the USB device controller.
+The request consists of virtio_usb_dev_cmd_hdr structure.
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands})
+
+The response consists of virtio_usb_dev_frame_number which has
+following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_dev_frame_number {
+	struct virtio_usb_cmd_status status;
+	le32 frame_number;
+};
+\end{lstlisting}
+
+The structure contains the following device-writable fields:
+
+\begin{description}
+\item[\field{status}] Indicates the result of the operation.
+\item[\field{frame_number}] Indicates the current USB SOF frame number
+as reported by the USB device controller, using an 11-bit counter
+(0--2047) that wraps to 0 after reaching 2047.
+\end{description}
+
+\devicenormative{\subparagraph}{Device Get Frame number command}{Device Types / USB Device / Device Operation: Device role / Device Get Frame number command}
+
+If the \field{code} of \field{status} field in the
+virtio_usb_dev_frame_number is VIRTIO_USB_S_OK, the device MUST
+set \field{frame_number} of virtio_usb_dev_frame_number to
+current frame number reported by the USB device controller.
+
+\paragraph{VIRTIO_USB_CMD_DEV_CANCEL}
+
+A special command message is used to cancel a data request which has
+been sent through the device role data queue.
+
+The request part uses the following structure definition:
+
+\begin{lstlisting}
+struct virtio_usb_dev_cmd_cancel {
+	struct virtio_usb_dev_cmd_hdr hdr; /* .code = VIRTIO_USB_CMD_DEV_CANCEL */
+	le64 tag;
+};
+\end{lstlisting}
+
+The request contains the following device-readable fields:
+
+\begin{description}
+\item[\field{hdr}] Specifies the command header with command code, port
+ID and endpoint ID.
+\item[\field{tag}] Specifies the unique identifier of the data message
+to be cancelled.
+\end{description}
+
+The response consists of the virtio_usb_cmd_status structure, which
+includes the status code indicating the result of the cancellation
+attempt, success is indicated by VIRTIO_USB_S_OK, and specific error
+code in case of error.
+
+\devicenormative{\subparagraph}{Device Cancel command}{Device Types / USB Device / Device Operation: Device role / Device Cancel command}
+
+If the data request for the specified \field{tag} has not yet completed
+in the device, the device MUST complete it with returning data response
+virtio_usb_response with field \field{status} set to
+VIRTIO_USB_S_ERR_CANCELLED, before completing the cancel command.
+If the data request for the specified \field{tag} is not found or has
+already completed, the device MUST set the cancel response
+\field{status} to VIRTIO_USB_S_OK.
+
+
+\paragraph{VIRTIO_USB_CMD_DEV_EP_ENABLE}
+
+Enables a specific endpoint in the USB device controller.
+
+The request consists of virtio_usb_dev_cmd_hdr followed by the USB
+endpoint descriptor as defined in USB 2.0
+(\hyperref[intro:USB2]{USB2}) Table 9-13.
+
+The response consists of virtio_usb_cmd_status structure indicating the
+result of the command.
+
+\paragraph{VIRTIO_USB_CMD_DEV_EP_DISABLE}
+
+Disables a specific endpoint in the USB device controller.
+
+The request consists of virtio_usb_dev_cmd_hdr structure, which
+identifies the target port and endpoint to be disabled.
+
+The response consists of virtio_usb_cmd_status structure, which indicates
+the result of the command execution.
+
+\devicenormative{\subparagraph}{Endpoint Disable}{Device Types / USB Device / Device Operation: Device role / Endpoint Disable}
+
+The device MUST complete all pending data messages for the specified
+endpoint before completing this command.
+
+\paragraph{VIRTIO_USB_CMD_DEV_EP_SET_HALT}
+
+Sets or clear a halt condition on a specific endpoint in the USB device
+controller. The request consists of virtio_usb_dev_cmd_set_value
+structure
+(see \nameref{sec:Device Types / USB Device / Device Operation: Device role / Device Commands}).
+
+The response consists of virtio_usb_cmd_status structure, which indicates
+the result of the command execution.
+
+\devicenormative{\subparagraph}{Endpoint Set Halt command}{Device Types / USB Device / Device Operation: Device role / Endpoint Set Halt command}
+
+\begin{itemize}
+\item When \field{value} is non-zero, the device MUST set a STALL
+  condition on the specified endpoint.
+\item When \field{value} is zero, the device MUST clear the STALL
+  condition on the specified endpoint.
+\item The device MUST return VIRTIO_USB_S_ERR_BAD_MSG for isochronous
+  endpoints.
+\end{itemize}
+
+\paragraph{VIRTIO_USB_CMD_DEV_EP_SET_WEDGE}
+
+This command sets the wedge condition on a specific endpoint of the USB
+device controller. The request consists of virtio_usb_dev_cmd_hdr
+structure, which identifies the target port and endpoint to be disabled.
+
+The response consists of virtio_usb_cmd_status structure, which
+indicates the result of the command execution.
+
+\devicenormative{\subparagraph}{Endpoint Set Wedge command}{Device Types / USB Device / Device Operation: Device role / Endpoint Set Wedge command}
+
+\begin{itemize}
+\item The device MUST set a persistent STALL condition on the endpoint
+  that is not cleared by a ClearFeature(HALT) request from the USB host.
+\item The device MUST return VIRTIO_USB_S_ERR_BAD_MSG for isochronous
+  endpoints.
+\end{itemize}
+
+\subsection{Device Operation: Role switch}\label{sec:Device Types / USB Device / Device Operation: Role switch}
+
+USB OTG (On-The-Go) is an extension of the USB standard that allows a device to
+act either as a USB host or as a USB peripheral. The role is determined by the
+driver using command messages. In turn, if the device changes its role, it
+notifies the driver through notifications.
+
+Throughout this section, "role-switch" and "OTG" are used
+interchangeably. The virtqueues commandq(role-switch) and
+eventq(role-switch) carry these operations; their protocol constants
+use the VIRTIO_USB_CMD_OTG_* and VIRTIO_USB_EVT_OTG_* prefixes.
+
+All command messages are placed into the role-switch command queue by the
+driver and all notifications are placed into the role-switch event queue by
+the device. The following enumeration definitions define the types of
+device commands and events.
+
+\begin{lstlisting}
+enum {
+	/* OTG command message types */
+	VIRTIO_USB_CMD_OTG_GET_ROLE = 0,
+	VIRTIO_USB_CMD_OTG_SWITCH_ROLE,
+};
+
+enum {
+	/* USB roles */
+	VIRTIO_USB_ROLE_HOST = 0,
+	VIRTIO_USB_ROLE_DEVICE,
+};
+
+enum {
+	/* OTG Event Messages */
+	VIRTIO_USB_EVT_OTG_CHANGE_ROLE = 0,
+};
+\end{lstlisting}
+
+\paragraph{Role switch commands}
+
+Both Role switch commands use the following common request header:
+
+\begin{lstlisting}
+struct virtio_usb_otg_cmd_hdr {
+	le32 code; /* VIRTIO_USB_CMD_OTG_XXX */
+	le32 port; /* Port ID */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{code}] Specifies an OTG command message type
+(VIRTIO_USB_CMD_OTG_XXX_ROLE).
+\item[\field{port}] Specifies a destination port ID.
+\end{description}
+
+\subparagraph{VIRTIO_USB_CMD_OTG_GET_ROLE}
+
+This command queries the current USB role enabled in USB controller.
+
+The request consists of virtio_usb_otg_cmd_hdr.
+
+The response from the device uses the following layout structure:
+
+\begin{lstlisting}
+struct virtio_usb_otg_cmd_role {
+	struct virtio_usb_cmd_status status;
+	le32 role; /* VIRTIO_USB_ROLE_XXX */
+	le32 supported_role; /* supported roles bitmask (VIRTIO_USB_F_XXX) */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{status}] See the virtio_usb_cmd_status type description in
+  \nameref{sec:Device Types / USB Device / Device Operation: Host role / Host commands}.
+\item[\field{role}] USB role: USB device or USB Host (VIRTIO_USB_ROLE_XXX).
+\item[\field{supported_role}] Bitmask indicating the roles supported by the
+  port, using the same bit positions as \field{VIRTIO_USB_F_HOST},
+  \field{VIRTIO_USB_F_DEVICE}, and \field{VIRTIO_USB_F_SWITCH_ROLE}.
+\end{description}
+
+\drivernormative{\subparagraph}{Get Role command}{Device Types / USB Device / Device Operation: Role switch / Get Role command}
+
+\begin{itemize}
+\item The driver MUST set the \field{code} field to VIRTIO_USB_CMD_OTG_GET_ROLE.
+\end{itemize}
+
+\devicenormative{\subparagraph}{Get Role command}{Device Types / USB Device / Device Operation: Role switch / Get Role command}
+
+\begin{itemize}
+\item If the request is successfully executed, the device MUST set the \field{status}
+  field to VIRTIO_USB_S_OK and MUST set the \field{role} field to
+  VIRTIO_USB_ROLE_HOST or VIRTIO_USB_ROLE_DEVICE.
+\item If the request fails, the device MUST set the \field{status} field to a
+  corresponding error code. The driver MUST ignore the \field{role} field
+  when \field{status} is not VIRTIO_USB_S_OK.
+\end{itemize}
+
+\subparagraph{VIRTIO_USB_CMD_OTG_SWITCH_ROLE}
+
+This command toggles the current USB role of the specified port. If the
+port is currently in the USB Host role, the device switches it to the USB
+Device role, and vice versa.
+
+The request consists of virtio_usb_otg_cmd_hdr.
+
+This command carries no response payload. The device notifies the driver of
+the completed role change via VIRTIO_USB_EVT_OTG_CHANGE_ROLE on the role
+switch event queue.
+
+\drivernormative{\subparagraph}{Switch Role command}{Device Types / USB Device / Device Operation: Role switch / Switch Role command}
+
+\begin{itemize}
+\item The driver MUST set the \field{code} field to VIRTIO_USB_CMD_OTG_SWITCH_ROLE.
+\item The driver SHOULD complete or cancel all outstanding transfers on the
+  current role's data queue before issuing this command.
+\end{itemize}
+
+\devicenormative{\subparagraph}{Switch Role command}{Device Types / USB Device / Device Operation: Role switch / Switch Role command}
+
+\begin{itemize}
+\item If the role switch is successful, the device MUST send
+  VIRTIO_USB_EVT_OTG_CHANGE_ROLE on the role switch event queue.
+\item The device MUST NOT send VIRTIO_USB_EVT_OTG_CHANGE_ROLE if the role
+  switch fails.
+\end{itemize}
+
+\paragraph{Role switch events}
+
+The device notifies the driver about role switching events via corresponding
+virtio queue using the following structure:
+
+\begin{lstlisting}
+struct virtio_usb_otg_event {
+	le32 code; /* VIRTIO_USB_EVT_OTG_XXX */
+	le32 port; /* Port ID */
+};
+\end{lstlisting}
+
+\begin{description}
+  \item[\field{code}] Specifies an USB role switch event type
+    (VIRTIO_USB_EVT_OTG_XXX)
+\item[\field{port}] Indicates the port ID for which the role switch
+  event occurred.
+\end{description}
+
+\subparagraph{VIRTIO_USB_EVT_OTG_CHANGE_ROLE}
+
+The device notifies the driver about a role-switching event by sending a
+message with the virtio_usb_otg_event structure, with the code field set to
+VIRTIO_USB_EVT_OTG_CHANGE_ROLE.
+
+\devicenormative{\subparagraph}{Role switch events}{Device Types / USB Device / Device Operation: Role switch / Role switch events}
+
+\begin{itemize}
+\item The device MUST NOT set undefined event code values.
+\item The device MUST send VIRTIO_USB_EVT_OTG_CHANGE_ROLE whenever the
+  role of a port changes, whether triggered by
+  VIRTIO_USB_CMD_OTG_SWITCH_ROLE or autonomously.
+\end{itemize}
diff --git a/device-types/usb/device-conformance.tex b/device-types/usb/device-conformance.tex
new file mode 100644
index 0000000..23d12d6
--- /dev/null
+++ b/device-types/usb/device-conformance.tex
@@ -0,0 +1,26 @@
+\conformance{\subsection}{USB Device Conformance}\label{sec:Conformance / Device Conformance / USB Device Conformance}
+
+A USB device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / USB Device / Device configuration layout}
+\item \ref{devicenormative:Device Types / USB Device / Device Initialization}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Data queues}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Host role / Host Notifications}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Host role / Host Cancel command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device events}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Setup event}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Get Frame number command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Device Cancel command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Disable}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / PULLUP command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / VBUS Draw command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Set Self Powered command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Set Halt command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Device role / Endpoint Set Wedge command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Get Role command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Switch Role command}
+\item \ref{devicenormative:Device Types / USB Device / Device Operation: Role switch / Role switch events}
+\end{itemize}
+
diff --git a/device-types/usb/driver-conformance.tex b/device-types/usb/driver-conformance.tex
new file mode 100644
index 0000000..3417520
--- /dev/null
+++ b/device-types/usb/driver-conformance.tex
@@ -0,0 +1,17 @@
+\conformance{\subsection}{USB Driver Conformance}\label{sec:Conformance / Driver Conformance / USB Driver Conformance}
+
+A USB driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / USB Device / Virtqueues}
+\item \ref{drivernormative:Device Types / USB Device / Device configuration layout}
+\item \ref{drivernormative:Device Types / USB Device / Device Initialization}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Data queues}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Host role}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Device Setup event}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Device Commands}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Count}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Device role / Get Endpoint Info}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Role switch / Get Role command}
+\item \ref{drivernormative:Device Types / USB Device / Device Operation: Role switch / Switch Role command}
+\end{itemize}
diff --git a/introduction.tex b/introduction.tex
index 9a9cbde..02db7cc 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -113,6 +113,12 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:SEC1}\textbf{[SEC1]} &
     Standards for Efficient Cryptography Group(SECG), ``SEC1: Elliptic Cureve Cryptography'', Version 1.0, September 2000.
 	\newline\url{https://www.secg.org/sec1-v2.pdf}\\
+	\phantomsection\label{intro:USB2}\textbf{[USB2]} &
+	Universal Serial Bus Revision 2.0 Specification,
+	\newline\url{https://www.usb.org/document-library/usb-20-specification}\\
+	\phantomsection\label{intro:USB3.2}\textbf{[USB3.2]} &
+	Universal Serial Bus Revision 3.2 Specification,
+	\newline\url{https://www.usb.org/document-library/usb-32-revision-11-june-2022}\\
 
 	\phantomsection\label{intro:rfc2784}\textbf{[RFC2784]} &
     Generic Routing Encapsulation. This protocol is only specified for IPv4 and used as either the payload or delivery protocol.
-- 
2.34.1

