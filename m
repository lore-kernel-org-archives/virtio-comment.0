Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D882566D5
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281577; cv=fail; b=cVfbbdP7lJOQxkVZxBY8M8udLraFAh0mj+a+1qkXaPBEAjD3onXPkobWQ9eCWY9dtGuRNtkDOK8w+w90xQWW6eHrD0zKDFLM/pCmh+qeH/K/jzNGqRamEUVFc3WiY8de74fVmpUmhEk/R6HqLoBpXqLQdfskMB5lzcTuMBN0UPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281577; c=relaxed/simple;
	bh=OQ5f2GKc/s+i3gKmzFPha1+PdbBchh+4F6fSia4V89U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j2HGuq2pbtfZ7I6/lgCDgfo6EhPzGS7glxV8l8HxBqsYDuYQ8quuGR4VNWjEumWiHpxNiAXoXEwxz/H+xSXA8COO/zSMt2Y6gjs+4Qpw46+S8gBb/nIeR0WUQetp6pXNiv89qPO0QRZeQplhzQDQUygcenEyv1DxuhLJ47mLQco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=fMeT3c7u; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="fMeT3c7u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIGukbY4vldNzPtG+yMHRdpuAWu1ud60tlZsB4bKnjrAi1WI7/9+3e89L0Mru5kcEvHpePBaMmgoj+nJa1K9BpU13VJTuAqrDI5++A6CzcNGy4s+20frfQp73hqUYXu12dcCwJZ/nAg1yMjdbmMjPVHMDah2+ZQjxDxh8J26Z0VUXEweUe447MmYn5dW/tqDBB+IhB3EIr8uOGErdjEtItmfMvoGzSsqncfVo2wiLx8IqgsTUUgP5ZsK46b/Kld6UHVqL6ASrf0e8twNIlwuvuj/qumRXTG4PAg/n5w/2kUtrHogC5mwUfTOWo5HEGCWBSxPof0Av5a6KFoWwmjNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=erjk2GevRZ7oMEoPmD0ndVWuyRIq9rxr0RCHQmdNYg4Fwlhhv0iBZ80iWZkywsMucjdKOl1yq32CpWtyMn7x+xHW1hRyf9rGAIOLlGMwLPnbUbCJQfTObPIa1xMo7Yzz7mKhaqmxZguepRMp5/YTvjdvENFYeP3HSHLbWQe6hG2SUc6ZqEYD5CnQi7OJEFISHfwHHiWCfJOQNPbgp7MGutM026lhibII8Pd/cAuecidah7CnI/y/J5gVA+L3Bq/7HakFN7n9h3+Mg7Fcd8GLxjSJVQx54pur2PmsbIzOhTwyR4R2rABq2m20PyU8K8+Wew75ee+QOLkbF8Ox+8bkYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 131.228.6.101) smtp.rcpttodomain=nokia-bell-labs.com
 smtp.mailfrom=nokia-bell-labs.com; dmarc=temperror action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FAgboqN1w3WHy6O+h1YU55M/QFbm4vRBjHljaIJcb34=;
 b=fMeT3c7uhWK2Nmyhw8Ju2rSngKb8dZnYfKayMn9ezCHSoHi0IL/26cFORRQUWiEZCUcvcRqGE0EPV9lvJzxhW0ZloFcPOxAV4TD07nZcshMnlkpT9yGSUg3/4yI30tzn9az4moDCcJej2PE3HNpiXeXLuaBYnnpAnGPXFSplvg1TEM44WezbIPAMCmDDXqrR38cm3kkweiJyDd6iU1yklaKDUSQvi7F9wPzY+Wk4OOsX9r0vEsYeuPWipxyuFrDErCDviIHPc/lNfQJKd8Xnx9NSxXxP0iXLnMspPpR5AyhKdvD5ATjTb7ktu2enuDFQNCE/uEMdvoNQU0y3SmGywg==
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by AS5PR07MB9914.eurprd07.prod.outlook.com
 (2603:10a6:20b:67f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 17:19:26 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::1e) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 17:19:26 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 131.228.6.101) smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not
 signed) header.d=none;dmarc=temperror action=none
 header.from=nokia-bell-labs.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of nokia-bell-labs.com: DNS Timeout)
Received: from fr712usmtp1.zeu.alcatel-lucent.com (131.228.6.101) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 17:19:24 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fr712usmtp1.zeu.alcatel-lucent.com (GMO) with ESMTP id 526HJJ0F004528;
	Thu, 6 Mar 2025 17:19:23 GMT
From: chia-yu.chang@nokia-bell-labs.com
To: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com,
        mvaralar@redhat.com, jasowang@redhat.com, xuanzhuo@linux.alibaba.com,
        eperezma@redhat.com, ij@kernel.org, ncardwell@google.com,
        koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com,
        vidhi_goel@apple.com, ingemar.s.johansson@ericsson.com,
        mirja.kuehlewind@ericsson.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v5 1/2] virtio-net: Fix ECN feature descritpion
Date: Thu,  6 Mar 2025 18:19:16 +0100
Message-Id: <20250306171917.90460-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
References: <20250306171917.90460-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B92:EE_|AS5PR07MB9914:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 876b70ac-c3c7-4abb-80b8-08dd5cd30ae3
X-LD-Processed: 5d471751-9675-428d-917b-70f44f9630b0,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?ZlikdCMMxIZi8blUftJi6AI58cp/t1HRCg//qiG7S4tpl+D2C3IOtPk2qL0D?=
 =?us-ascii?Q?/ql4p/LKjv1ZbZoji4YrGCLd8aiGUvmYyCeXPUgMIXcCKglDw2eJoEcQA5yG?=
 =?us-ascii?Q?BvjhOTcU5S73H3KvU/J2AAwwBT0+IMHq915gzAcXGM6t2ZRRKrbIids26FnR?=
 =?us-ascii?Q?4ZscKtIkAE8RHwqKxeFIjbLjM5msQvbt2MRdqfN1CcUNMzN5+U/TTdhqU9H5?=
 =?us-ascii?Q?uebUFvv5mHF00XU/2xBaTrcBoZETUz3Izxr8P/YTtFznxoDAvfuqtV5XzKPT?=
 =?us-ascii?Q?C0SJbt+3XksrArkFeS4hQZOLCxLVKenrvDyOvp7j30zXyQ5lGp5mPHGegIaF?=
 =?us-ascii?Q?W4AFdoBXBN92MZaJDDDgLykf/W6WXus6J/cksTMkesMB7u7IjpDJlZMTGy6i?=
 =?us-ascii?Q?G1mbTRTl/sHB4j1pUtRsDLw5N/8sI6j9lksJzSqh8yhtnOSBpJCJSBif8d3I?=
 =?us-ascii?Q?xFNeRlmR0S8v4d+Y3kkmOTnlCTldf45bdgdKn+li/Lu80lmhIg6iXZ0nzOzZ?=
 =?us-ascii?Q?uvl2eHgVkKmXozPOYBDKLVLlaQI4Cb8wXsT+LdkPYjIAtxUq9a9/M2vwbS3q?=
 =?us-ascii?Q?XRncK1Ewp74S12OjuaGi7lvpZicqJuAyYfT8mUGJKiS775tSgjb7eQ4V02pv?=
 =?us-ascii?Q?rpC0gytfAXWfjO0ZMcsrK4i3URvsC47lk/Ll3MSPMuFH1TYh0kk1Xh23wE4S?=
 =?us-ascii?Q?lwcHsSrjz2BZt3OUpqMelmGxDsIqd8jkfMY6JwuWurcKthGBRunL3l3tR23/?=
 =?us-ascii?Q?lQoTWpX47giSBT4lIf2bqV+4HexxnRIVoW2cIMaP/vLrxbeGRrFCcSsYwbeo?=
 =?us-ascii?Q?w1Sf4j/Yhw1VGxT04A4Gk9nuxRHj4cHd9/2PHRMgizNO1A5ZhINRz2AdL8NS?=
 =?us-ascii?Q?DCbwINLemmEKkqTOpmk/xmUQilrYLnluU5Kdh+0IWLwW+E6c6IuFd3zR6vYX?=
 =?us-ascii?Q?1azg1dPxktlNUKNnwti54lIfU84blm6bzsV4UW856h3AuCz6aBPdC1Uv+23j?=
 =?us-ascii?Q?8JLZmF9v4J8D9/xRxa3vrta3JEsUyDz7u88aCxGHzZSaLU1MzhLwn8Kmmb0l?=
 =?us-ascii?Q?P6Hw+823toPhtrv/8wZ10zOZHQQWUEkrQjB7vgog1rPNVDYeg+VmUYRRglcj?=
 =?us-ascii?Q?uBrJkq/ut4ue+ZEpsWuZBBN3iYOEVKnA3sM7o+d7u277Maf0qu/ht1VpN/2S?=
 =?us-ascii?Q?TPvu+/6LxkTmxO7b1iOpsh1TN/AAzSWF5fT1QiknKD7MUBKD9gYTCD1oAr8i?=
 =?us-ascii?Q?xEdysW9o3Udha6VpQY6urArPTuyTsL12TDv8QE+GrVRvcr/OQqzxKtJKkW7K?=
 =?us-ascii?Q?+WaZPS5NHpB9RQ0pwYLXUqeN1kU6tAviVSUJAOOxzgmZ9dX+kDbLc3aHfXUy?=
 =?us-ascii?Q?XP21fl+5V8ZuXPedEQwY5NCr1Np4834heMRyZBqj3fDqNmYv0nJgZmPDSv2D?=
 =?us-ascii?Q?2jowjs5wvCSrxUjbyE6bcsIC+L+wMa/VTSgPYzXV/b8Kh9rHVo+oN7emMLDr?=
 =?us-ascii?Q?YJNRCZM/Rf5b8maacCok9Lg146T1pEQpV/rL?=
X-Forefront-Antispam-Report:
 CIP:131.228.6.101;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fr712usmtp1.zeu.alcatel-lucent.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:19:24.4515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 876b70ac-c3c7-4abb-80b8-08dd5cd30ae3
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.6.101];Helo=[fr712usmtp1.zeu.alcatel-lucent.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR07MB9914

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

Clarify that the VIRTIO_NET_HDR_GSO_ECN gso_type flag does not mean that
TCP has IP-ECN set, instead it identifies TCP CWR flag is set and will be
cleared from the second segment. This is used to offload TCP CWR flag in a
way that is compatible with RFC3168 ECN but is problematic for non-RFC3168
use of CWR flag.

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 35 ++++++++++++++++++--------------
 introduction.tex                 |  3 +++
 2 files changed, 23 insertions(+), 15 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index 8d30673..50b1372 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioned in
+    \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with TCP CWR flag set
+    and follow the ACE bits handling approach mentioend in
+    \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -695,8 +699,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
     the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    indicates that the TCP packet has TCP CWR flag set and the flag will be applied to the 1st segment of an
+    aggregated segment and be cleared from the 2nd segment of an aggregated
+    segment\footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -788,10 +793,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be applied to the 1st segment of
+an aggregated segment and be clared from the 2nd segment of an aggregated segment,
+unless the VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the driver MUST
+set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
@@ -1105,9 +1110,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 \end{enumerate}
 
 Additionally, VIRTIO_NET_F_GUEST_CSUM, TSO4, TSO6, UDP, UDP_TUNNEL
-and ECN features enable receive checksum, large receive offload and ECN
-support which are the input equivalents of the transmit checksum,
-transmit segmentation offloading and ECN features, as described
+and ECN features enable receive checksum, large receive offload and RFC3168
+ECN support which are the input equivalents of the transmit checksum,
+transmit segmentation offloading and RFC3168 ECN features, as described
 in \ref{sec:Device Types / Network Device / Device Operation /
 Packet Transmission}:
 \begin{enumerate}
@@ -1210,10 +1215,10 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which have the TCP CWR flag set and require the flag be applied to the 1st segment
+of an aggregated segment and be cleared from the 2nd segment of an aggregated segment,
+unless the VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the device MUST
+set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If the VIRTIO_NET_F_GUEST_CSUM feature has been negotiated, the
 device MAY set the VIRTIO_NET_HDR_F_NEEDS_CSUM bit in
diff --git a/introduction.tex b/introduction.tex
index e60298a..d52622e 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -168,6 +168,9 @@ \section{Normative References}\label{sec:Normative References}
     Leiba, B., "Ambiguity of Uppercase vs Lowercase in RFC 2119 Key Words", BCP
     14, RFC 8174, DOI 10.17487/RFC8174, May 2017
         \newline\url{http://www.ietf.org/rfc/rfc8174.txt}\\
+	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
+    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
+	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

