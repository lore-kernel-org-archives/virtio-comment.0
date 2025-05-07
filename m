Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4D928C2A0
	for <virtio-comment@lists.linux.dev>; Wed,  7 May 2025 15:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633079; cv=none; b=ik7wqi9uduaIQGVggRwsDxHUFrLgE3tldjuVEQIu6z2gIW7Cnm+baE3fEktTo/Doluu5Bc7umGJAgxDRlEd23tUlLYZNnXJDtM6FOgV2lyQvMgkMQ1qG5kegJZT3+MxFDmeAkpYcNr7U4KAKK4BSxIA4jphHLewLhSF1jMmA55M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633079; c=relaxed/simple;
	bh=zPE77YKPPJPADAWihacZTy6iMztQR0PMaryQyXB6NfA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRgTxbeYx+ckPv2NNksWM8gRoyWgIp6ZJZh8ihV2ykl+R7xetnqGNx84XVvo1UXv4hodHuSWLzCSrhx/MUpZyZ1NOefFRglMN62ubOcLcDT7fAsVPteWtACz5lzLRapPvOvsuH+XgZ3HrkMCEfHvTiryFbAsdPp9J+KYrJ8wpes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=laKqaGLK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="laKqaGLK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547AiCPf009569;
	Wed, 7 May 2025 15:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xQNGBLDItCD9mjKkXU2uhwJSKlqMTaZ8GRUprWAgdSQ=; b=laKqaGLKrk8O4a1i
	qZnOPI59PzVEtHa/U8sP32QBxyCDKqkpXKoH5nhz6jwPQ/OFwEb+Glg3SCTdYGpI
	wEMqHtEBgvQOYUzOSikuohqi/j9xNsprF8zEgInyEKjwca5IztNgzjqesxOqq8XP
	OjlGLKu6EcdH+m5HkQF2XERaYRb37o0C11ynwp/EJyoUN6WHkefGLjdXPBCMBepV
	q7CMp2FZvgR9dOX/q2zBhLecSAPb+ZZY+cD5+1vTMqffVGwhlyy8uPBKd1CMOFqL
	e6+SQVNpZD4YKsfSnBKgd5sikwSneEtXEmucu9h2II8Zv1/Z3O3XglbEpmxf0zEx
	H/Yt2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fnm1kfvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 15:51:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 547FpDEc015216
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 15:51:13 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 08:51:10 -0700
From: Peter Hilber <quic_philber@quicinc.com>
To: <virtio-comment@lists.linux.dev>
CC: Cornelia Huck <cohuck@redhat.com>, Parav Pandit <parav@nvidia.com>,
        "Jason
 Wang" <jasowang@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        "Ridoux,
 Julien" <ridouxj@amazon.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        "Michael S. Tsirkin"
	<mst@redhat.com>,
        Peter Hilber <quic_philber@quicinc.com>
Subject: [PATCH v9 2/4] virtio-rtc: Add initial normative statements
Date: Wed, 7 May 2025 17:50:34 +0200
Message-ID: <20250507155036.1489-3-quic_philber@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507155036.1489-1-quic_philber@quicinc.com>
References: <20250507155036.1489-1-quic_philber@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IShUQNGLRQrkzYcLK1MDVO8MfKvykkny
X-Proofpoint-ORIG-GUID: IShUQNGLRQrkzYcLK1MDVO8MfKvykkny
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=681b8172 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=bs-e4Z8cAAAA:8
 a=COk6AnOGAAAA:8 a=OX6zOO1yqlZ58KVMcmoA:9 a=YFpLQiK6rFjqGb8m0bXF:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDE0OCBTYWx0ZWRfX5No9l4JYrALG
 Y9Pe9nKkJf81smSaQXyuD347ukXSoKJTYKQ5jxu5SzlKSxV+ge8lJ2gEWsncyDdcIAkLlflYEnU
 uijd8rxbg/UUDRsK+zmBA2HMmvylXt4/uEnSpfZFVp/oB+PomhD9BTegKjQYoh8SCMubR4xq/nB
 GtMyoyoEXWKFUweYsUuGBUCeAIYI+aai0pMQ2lXU7OPBLyOpUHYV4RVrNH3G4NOqAw+A3DcUEGa
 kYll1UD7WkJXJyxnf/uC5bF9Gb+sO68Ij7SgRRW1aIZBnXrzuAJutj1x9UzOeKAFvV3i18upA8j
 SjYoxD73tKS4/CNceeFWtwFu6ZTkIf2beDftjuyObsfGBMhC87wlVP3sRyIN9D6xKfOcjGhafrk
 8hRlQfAxl3bAF+Y7RRU18BrOd5sesPyzS09a61carSYxRtmym41SfUe9G0ZwbV3JhoqLQE6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_05,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070148

Add the normative statements for the initial device specification.

Signed-off-by: Peter Hilber <quic_philber@quicinc.com>
---

Notes:
    v9:
    
    - Allow more implementation-specific behavior when alarm actions become
      obsolete (Matias Ezequiel Vara Larsen).
    
    - Reword multiple sentences (Matias Ezequiel Vara Larsen).
    
    - Change "feature was negotiated" to "feature has been negotiated"
      (Matias Ezequiel Vara Larsen).
    
    - Clarify that notification structs also contain clock ids (Michael S.
      Tsirkin).
    
    - Reduce ambiguity in how a statement refers to multiple enumeration
      items (Michael S. Tsirkin).
    
    v8:
    
    - Explicitly describe alarm enabled status, where relevant (Matias
      Ezequiel Vara Larsen).
    
    - Change word order from "field X" to "the X field" (Matias Ezequiel
      Vara Larsen).
    
    - Change word order from "flag X" to "the X flag" or "X".
    
    - Change "once" to "when" (Matias Ezequiel Vara Larsen).
    
    v7:
    
    - Change flag numeric value due to removing leap second indication.
    
    v5:
    
    - Reformat.
    
    v4:
    
    - Change requirements so that driver can reset alarm to clean slate, and
      document how driver can achieve this (Cornelia Hell, Jason Wang) [1].
    
    - Require device to support all expressible alarm times.
    
    - Formatting and wording improvements.
    
    [1] https://lore.kernel.org/all/2ae67401-a8f5-4686-9321-cb3105df594d@opensynergy.com/

 conformance.tex                         |   2 +
 device-types/rtc/description.tex        | 269 ++++++++++++++++++++++++
 device-types/rtc/device-conformance.tex |   9 +
 device-types/rtc/driver-conformance.tex |   9 +
 4 files changed, 289 insertions(+)
 create mode 100644 device-types/rtc/device-conformance.tex
 create mode 100644 device-types/rtc/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index d92a2369488e..4ce86a525e84 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -162,6 +162,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/driver-conformance.tex}
 \input{device-types/can/driver-conformance.tex}
 \input{device-types/spi/driver-conformance.tex}
+\input{device-types/rtc/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -254,6 +255,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/device-conformance.tex}
 \input{device-types/can/device-conformance.tex}
 \input{device-types/spi/device-conformance.tex}
+\input{device-types/rtc/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/device-types/rtc/description.tex b/device-types/rtc/description.tex
index ae4b3021c1ac..3339becf4bc2 100644
--- a/device-types/rtc/description.tex
+++ b/device-types/rtc/description.tex
@@ -99,6 +99,110 @@ \subsection{Device Operation}\label{sec:Device Types / RTC Device / Device Opera
 zero-based, dense indices. In request structures, all fields named
 \field{clock_id} contain clock identifiers.
 
+\drivernormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+The driver MUST interpret response fields other than the \field{struct
+virtio_rtc_resp_head} field \field{status} only when \field{status} is
+VIRTIO_RTC_S_OK.
+
+The driver MUST set \emph{reserved} fields in a device-readable buffer
+to zero.
+
+The driver MUST NOT set bits in \emph{flags} fields in a device-readable
+buffer which are not allowed according to the negotiated features.
+
+The driver MUST NOT interpret \emph{reserved} fields in a
+device-writable buffer.
+
+The driver MUST only interpret these bits in \emph{flags} fields in a
+device-writable buffer which are allowed according to the negotiated
+features.
+
+The driver MUST allocate enough space for the response in a
+device-writable requestq buffer.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / RTC Device / Device Operation}
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_OK if the device successfully
+executed the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to a status other than VIRTIO_RTC_S_OK if the
+device did not successfully execute the request.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP if the device could not
+execute the specific request due to an implementation limitation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{msg_type} field which is not described in this
+specification.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EOPNOTSUPP for a request with a
+value of the \field{hw_counter} field which is neither described in this
+specification nor otherwise known to the implementation.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_ENODEV if the \field{clock_id}
+field value supplied with the request does not identify a clock.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request values are
+inconsistent with the specification and if the inconsistence is not
+described by the requirements which stipulate status
+VIRTIO_RTC_S_EOPNOTSUPP or VIRTIO_RTC_S_ENODEV.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the request specified in
+the request header through the \field{msg_type} field does not fit into
+the device read-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EINVAL if the response specified in
+the request header through the \field{msg_type} field does not fit into
+the device write-only buffer, unless the \field{status} field does not
+fit into the device write-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST NOT set the
+\field{status} field if the \field{status} field does not fit into the
+device write-only buffer.
+
+For \field{struct virtio_rtc_resp_head}, the device MUST set the
+\field{status} field to VIRTIO_RTC_S_EIO if none of the previous
+requirements in this document stipulated another \field{status}.
+
+If the device read-only buffer is bigger than the size of the request
+specified in the request header, the device MUST ignore the additional
+space.
+
+If the device write-only buffer is bigger than the size of the response
+corresponding to the request header, the device MUST ignore the
+additional space.
+
+The device MUST set \emph{reserved} fields in a device-writable buffer
+to zero.
+
+The device MUST NOT set bits in \emph{flags} fields in a device-writable
+buffer which are not allowed according to the negotiated features.
+
+During any period where the device remains live (keeps the DRIVER_OK
+\field{device status} bit set), the device MUST emit the same response
+for all repetitions of any specific request of type VIRTIO_RTC_REQ_CFG,
+VIRTIO_RTC_REQ_CLOCK_CAP, or VIRTIO_RTC_REQ_CROSS_CAP.
+
+Whenever the device has a specific set of negotiated features, the
+device SHOULD emit the same response for all repetitions of any specific
+request of type VIRTIO_RTC_REQ_CFG, VIRTIO_RTC_REQ_CLOCK_CAP, or
+VIRTIO_RTC_REQ_CROSS_CAP, irrespective of any intermediate device
+resets.\footnote{Failure to do so would interfere with resuming from
+suspend and error recovery.}
+
+The device MUST use non-negative integers, which are smaller than the
+number of clocks, as clock identifiers.
+
 \subsubsection{Common Definitions}\label{sec:Device Types / RTC Device / Device Operation / Common Definitions}
 
 This section makes common definitions.
@@ -320,6 +424,102 @@ \subsubsection{Control Requests}\label{sec:Device Types / RTC Device / Device Op
 
 \end{description}
 
+\drivernormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For VIRTIO_RTC_REQ_CROSS_CAP, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value between 0xF0 and 0xFE.
+
+\devicenormative{\paragraph}{Control Requests}{Device Types / RTC Device / Device Operation / Control Requests}
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST use the UTC
+time standard (Coordinated Universal Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC_SMEARED or
+VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MUST use the UTC time
+standard, insofar as the following requirements do not say otherwise.
+
+For any UTC-like clock, the device MUST use the time epoch of January 1,
+1970, 00:00 UTC.
+
+For any UTC-like clock, the device MUST count seconds since the epoch
+according to \hyperref[intro:EPOCH]{EPOCH}.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
+positive leap second according to the UTC time standard by
+instantaneously stepping the clock backwards by 1 s at the start of the
+leap second.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC, the device MUST apply a
+negative leap second according to the UTC time standard by
+instantaneously stepping the clock forward by 1 s at the start of the
+leap second.
+
+For any leap smearing clock, the device MUST NOT step the clock due to a
+leap second.
+
+For any leap smearing clock, on a positive leap second, the device MUST
+slow down the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any leap smearing clock, on a negative leap second, the device MUST
+speed up the clock during part of the day containing the leap second
+and/or part of the day after the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, on a
+leap second, the device MUST change the frequency of the clock exactly
+from noon prior to the leap second until noon after the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a positive leap second, the
+device MUST decrease the frequency of the clock by $1/86400$.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_NOON_LINEAR, while
+changing the frequency of the clock due to a negative leap second, the
+device MUST increase the frequency of the clock by $1/86400$.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, on a leap
+second, the device MUST change the frequency of the clock exactly during
+the last 1000 seconds of the day with the leap second.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
+changing the frequency of the clock due to a positive leap second, the
+device MUST decrease the frequency of the clock by 0.1\%.
+
+For any clock with smearing variant VIRTIO_RTC_SMEAR_UTC_SLS, while
+changing the frequency of the clock due to a negative leap second, the
+device MUST increase the frequency of the clock by 0.1\%.
+
+For any clock of type VIRTIO_RTC_CLOCK_UTC_MAYBE_SMEARED, the device MAY
+deviate from the UTC standard with respect to leap second introduction.
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the TAI
+time standard (International Atomic Time).
+
+For any clock of type VIRTIO_RTC_CLOCK_TAI, the device MUST use the time
+epoch of January 1, 1970, 00:00 TAI.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use SI
+seconds subdivisions.
+
+For any clock of type VIRTIO_RTC_CLOCK_MONOTONIC, the device MUST use an
+epoch at a time instant before or during device reset.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock types other than
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
+\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED.
+
+For VIRTIO_RTC_REQ_CLOCK_CAP, and clock type
+VIRTIO_RTC_CLOCK_UTC_SMEARED, the device MUST set the
+\field{leap_second_smearing} field to VIRTIO_RTC_SMEAR_UNSPECIFIED,
+VIRTIO_RTC_SMEAR_NOON_LINEAR, VIRTIO_RTC_SMEAR_UTC_SLS, or to a value
+greater than or equal to 0xF0.
+
+The device SHOULD set the VIRTIO_RTC_FLAG_CROSS_CAP flag in the
+VIRTIO_RTC_REQ_CROSS_CAP response if and only if the device would set
+status VIRTIO_RTC_S_OK for a VIRTIO_RTC_REQ_READ_CROSS response with the
+same \field{hw_counter} and \field{clock_id} request values.
+
 \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Operation / Read Requests}
 
 Through \emph{read requests}, the driver requests clock readings from
@@ -436,3 +636,72 @@ \subsubsection{Read Requests}\label{sec:Device Types / RTC Device / Device Opera
 \ref{sec:Device Types / RTC Device / Device Operation / Common Definitions / Hardware Counters}.
 
 \end{description}
+
+\drivernormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+For VIRTIO_RTC_REQ_READ_CROSS, the driver MUST set \field{hw_counter} to
+one of the hardware counter identifiers defined in this specification,
+or to a value between 0xF0 and 0xFE.
+
+\devicenormative{\paragraph}{Read Requests}{Device Types / RTC Device / Device Operation / Read Requests}
+
+After DRIVER_OK has been set, the device SHOULD continuously support
+reading of all clocks.
+
+For any two read requests to the same clock, the device MUST either
+obtain the \field{clock_reading} response value for the request which
+the driver makes available first before obtaining the
+\field{clock_reading} response value for the other request, or the
+device MUST return the same \field{clock_reading} values.
+
+For any clock C, the device MUST mark all read requests reading C as
+used in the total order in which the driver marked these requests as
+available.
+
+For any clock C of type VIRTIO_RTC_CLOCK_MONOTONIC and read requests
+\emph{A} and \emph{B} which read C, \emph{A} being the request which the
+driver marks as available before \emph{B}, the device MUST set the
+\field{clock_reading} response value for request \emph{B} to a value
+greater than or equal to the \field{clock_reading} response value for
+request \emph{A}.
+
+For every clock, the device MUST support VIRTIO_RTC_REQ_READ.
+
+For VIRTIO_RTC_REQ_READ and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{clock_reading} field.
+
+For read requests, the device MUST obtain the \field{clock_reading}
+response value after the driver made the read request available.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set
+\field{counter_cycles} to a value which approximates the value which the
+driver would have read from the hardware counter identified by
+\field{hw_counter} at the time instant when the device read the
+\field{clock_reading} value.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device SHOULD assume that the driver
+reads the hardware counter identified by \field{hw_counter} through the
+CPU which the driver enumerates as the first.
+
+For VIRTIO_RTC_REQ_READ_CROSS, the device MUST set \field{status} to a
+value other than VIRTIO_RTC_S_OK if the device cannot determine the
+approximate value which the driver would have read from the hardware
+counter identified by \field{hw_counter} at the time instant when the
+device read the \field{clock_reading} value.
+
+If two VIRTIO_RTC_REQ_READ_CROSS requests read the same clock and the
+same hardware counter, and one request is made available before the
+other, the device MUST either
+
+\begin{itemize}
+\item set the later request's \field{counter_cycles} response to a value
+that the hardware counter shows after the earlier request's
+\field{counter_cycles} response, or
+
+\item set the same \field{counter_cycles} value in both responses.
+\end{itemize}
+
+For VIRTIO_RTC_REQ_READ_CROSS and for any clock type listed in this
+specification, the device MUST use the nanosecond as unit for the
+\field{clock_reading} field.
diff --git a/device-types/rtc/device-conformance.tex b/device-types/rtc/device-conformance.tex
new file mode 100644
index 000000000000..4303cd450542
--- /dev/null
+++ b/device-types/rtc/device-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Device Conformance}\label{sec:Conformance / Device Conformance / RTC Device Conformance}
+
+An RTC device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{devicenormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
diff --git a/device-types/rtc/driver-conformance.tex b/device-types/rtc/driver-conformance.tex
new file mode 100644
index 000000000000..689c18d158d0
--- /dev/null
+++ b/device-types/rtc/driver-conformance.tex
@@ -0,0 +1,9 @@
+\conformance{\subsection}{RTC Driver Conformance}\label{sec:Conformance / Driver Conformance / RTC Driver Conformance}
+
+An RTC driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Control Requests}
+\item \ref{drivernormative:Device Types / RTC Device / Device Operation / Read Requests}
+\end{itemize}
-- 
2.43.0

