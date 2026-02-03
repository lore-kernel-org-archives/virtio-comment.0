Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D700D3D3010
	for <virtio-comment@lists.linux.dev>; Tue,  3 Feb 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135708; cv=fail; b=ro0ngrGv3nBseXr3mpfGPavFnATrHP/y4qCuVUCdzF8DJpd3dbqZ9fEaPyweT+hytXHDdQOPWIXBRBu9q+kh75gyUlT/tcsZMf6Q4he1wx2aZo1utR4HPr4qrteCjIKP+7lxHpdNEYphPIRLHm4P/C/EAQ9TcMZMZM0si2wAqM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135708; c=relaxed/simple;
	bh=OtfLzsZRDzVWxX3/ejw/JyBmdbJf4owGfhHPzyDUHvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SThhim78pBI1jb2bi6tGmvPMiKvwZ5vgN03T2B1STil00oWBseUHiPMYQ1FOjK3OL7wQxJIU0FZqwr4I8n0FE0g0mOBHfkprbShmUHhR7faYqtFHkAlIyyu4GuRU9N5pJ7yc27aCaKiZHzqCLIYm/a6w3ajGi56Dr5xLIIdkyZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com; spf=fail smtp.mailfrom=nokia-bell-labs.com; dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b=YxjUPGeO; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nokia-bell-labs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nokia-bell-labs.com header.i=@nokia-bell-labs.com header.b="YxjUPGeO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FzkbG6z3KocvTrhg6x6xtFnIgXxSi56cvPSlYNknFPhNdK0uuW3wmovMP9CX2HaNshIoUpSEsKEWq3HHDfw1OcohCCHmwfoBbssBW6+Cmd9/kgnQGJf8qUIyzMgxWJxqyV0YwXZQpfBUDcqqCezNfyOyQgvrsLwBrnVDCcN7FxMn/UQ8SSusJNOzJa5UD7Q624ETUZkoGAWdmVhNI5WRA4iqg58O/qcRWHPRt+qju1+dftp4gF3m2TUHGYkP4O7CzGET6b36hTvUvoPbgUMPKWwul+J+9H6k0wltH1Inzd6Rx3KoIhCeSo3QrSk7jsrPUnwW1w6BcLXcODf6dH0dWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YNIcpn0siHBcWcqS4MsxJsIrQCDJCHn+sSDthsjderw=;
 b=tfgwtfoMT7n6hZFQtVeUrJJ4BFK+ucV/s17n23L+q56C/HVPu0OSLyYR2I3Dakk0nHhIDbijLqjYyvHA6XCeJtcYjgg15OKCpDRYnOVCQn1ujaZPMeD59k8ROFj1oZsCglGa2EN8pJAyrRgYnX601m8AlnEZegiF2j0MkR9a7POmNJTUkFPuv+mw6dWttVqrAVqkf7sFaVjcOEXl72gcm//zS0uOI144Pc8ESKhdQWjvsLHiQNCSX8dpLT78zrPr5ut3AiDGeDxhVXNzasu0guOgQO5ZXg93BH0VKDd7u3PM/2vvc5Ocw4FShFSyxV3HhyDNJ/IOte8LZwsAFYYizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 131.228.2.241) smtp.rcpttodomain=apple.com smtp.mailfrom=nokia-bell-labs.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nokia-bell-labs.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia-bell-labs.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNIcpn0siHBcWcqS4MsxJsIrQCDJCHn+sSDthsjderw=;
 b=YxjUPGeOvl58jadSegL6B9fTZQ+J+Kd7Ceu5AaeIvjbgfvuGsRJDn72C9Abw0BtNtsyHjunIaBN3SShQOFqx3Q8ovg4/q3Jb8fSCT0YImQYeRSEi/9M0rSDMI42uTy6MKwKf1vZ3GWbigGhjPP72nFdteYp2YojoMDsxlPMsamAfCGfB9p4UTKpRuDHGzzg+PaKXyCjEEzK5KrkjAfIhPzBr1ATWPgqKMWAap92C5/uYF8g/JrDVaGFTlJx0BF8MCPk1VuceNx5mB0zG8PitSNxDruVIprOpDpNnkQv3vOB1FRNrk+PJ3xyNAf9qguF0u+SrVVYjVmo2sFX8KZg2XA==
Received: from AM9P195CA0026.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::31)
 by AM7PR07MB6611.eurprd07.prod.outlook.com (2603:10a6:20b:18f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 16:21:41 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21f:cafe::46) by AM9P195CA0026.outlook.office365.com
 (2603:10a6:20b:21f::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Tue,
 3 Feb 2026 16:21:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 131.228.2.241)
 smtp.mailfrom=nokia-bell-labs.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nokia-bell-labs.com;
Received-SPF: Pass (protection.outlook.com: domain of nokia-bell-labs.com
 designates 131.228.2.241 as permitted sender)
 receiver=protection.outlook.com; client-ip=131.228.2.241;
 helo=fihe3nok0734.emea.nsn-net.net; pr=C
Received: from fihe3nok0734.emea.nsn-net.net (131.228.2.241) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Tue, 3 Feb 2026 16:21:41 +0000
Received: from sarah.nbl.nsn-rdnet.net (sarah.nbl.nsn-rdnet.net [10.0.73.150])
	by fihe3nok0734.emea.nsn-net.net (Postfix) with ESMTP id 1DC2E201F6;
	Tue,  3 Feb 2026 18:21:40 +0200 (EET)
From: chia-yu.chang@nokia-bell-labs.com
To: parav@nvidia.com,
	virtio-comment@lists.linux.dev,
	jasowang@redhat.com,
	mst@redhat.com,
	cohuck@redhat.com,
	mvaralar@redhat.com,
	xuanzhuo@linux.alibaba.com,
	eperezma@redhat.com,
	ij@kernel.org,
	ncardwell@google.com,
	koen.de_schepper@nokia-bell-labs.com,
	g.white@cablelabs.com,
	ingemar.s.johansson@ericsson.com,
	mirja.kuehlewind@ericsson.com,
	cheshire@apple.com,
	rs.ietf@gmx.at,
	Jason_Livingood@comcast.com,
	vidhi_goel@apple.com
Cc: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
Subject: [PATCH v11 1/2] virtio-net: Clarify ECN and GSO_ECN descriptions
Date: Tue,  3 Feb 2026 17:21:33 +0100
Message-Id: <20260203162134.2765-2-chia-yu.chang@nokia-bell-labs.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
References: <20260203162134.2765-1-chia-yu.chang@nokia-bell-labs.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|AM7PR07MB6611:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d69c3b8a-f2fc-4bb1-a388-08de63405074
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9MorjiNi9fKcZRw6ThL78THQeKnd9MozmcuQueosCiETcChe0a8oaz6fs+W5?=
 =?us-ascii?Q?qBwYCv4T35Z+NvISuGkeURSGJQUW0VlhvLoWHFua2OM1yvcM/5QHH8qRFv26?=
 =?us-ascii?Q?MyPoHtfnn5oIwho6svJm+MpcLEtg5ol9YiXGWzYGHG3HPHVSJ0HoxDB7Uhxt?=
 =?us-ascii?Q?Tmo2vcMWm+3Ai+vd7ILRi1XHV+WlCpHP/ky1qzCwNVkZzzrxIFHHGxL1Gv89?=
 =?us-ascii?Q?bW0WSQdXSOR50rj94UZ+xt5BWyxQ+lGaik4iHpCaNVerznzSjaIrcEhM0YCI?=
 =?us-ascii?Q?f9Cza+4uepk8prtm5M67dzj+ZNiJqsg9scH4Ns9po4i9r1HAdUxZb3DZdGSL?=
 =?us-ascii?Q?5k2mbyekkPrAaJ3c0vpopDg673m3sO201L0U2OvQK+ucprLbtQQsYnK+mImw?=
 =?us-ascii?Q?2IRg/z5C94tBfZmGESkD7Vwg802TIrUuikc5IG+4h0aJuC1py0xtkdPBkbAT?=
 =?us-ascii?Q?1Yde+WGrOGeUcvnsLaYHKVsK/OCim6xOqHilVGmBgeIBtkC5kp8pEj6CmvOF?=
 =?us-ascii?Q?fDChl8PARew0y07nNdDIdLWyQsbtNV0f9XeKN88rlfWjcd5tKC8Q5U95W5MN?=
 =?us-ascii?Q?aIEY3/QvgJBBdKWN8OOdrvw/1WSAeZTz1HDaPd0KvxvIXUXFFfg9eLeMtbhc?=
 =?us-ascii?Q?7hdNsJVAigY2/XQCWJsXp1izH4f8AG2ztus0GhdQo+nI/Fi/GIBWqQwQiRuj?=
 =?us-ascii?Q?KfzM70RizLPjsB5MUdy+bTcpA931hoYyw/2HcKIfuk+iON71eNsCmNF/ZGpa?=
 =?us-ascii?Q?mlwJ4oF4ibmYRvD4zRpFLUh27yhZ6/Cb2fOwMIRO00c0YYzWkRhtNTGj1SxX?=
 =?us-ascii?Q?EB4l9yH+Mk4bj2rjMWs4QkP+i6B6m3X/wQdzfslkkMnLQDD0uzXqqQ+tXPvt?=
 =?us-ascii?Q?O067/QGc7zCegoyajxjsQkKhhHwsFlwXpAL723v7Gcgi/E8rtfEdte1jeDrb?=
 =?us-ascii?Q?7Xgd+eC3PH10nLejTrUd4Mitur5/juZjOZVOaKEv9LZ+k5IHRwdojFHMjvXz?=
 =?us-ascii?Q?OPj9wxGPdzxOezPRBFE1i9Hg3uz/ZwuizukuIxFNilLKAQ8h6iU2GzxBWLK4?=
 =?us-ascii?Q?SUT+DHbgsYCvmhUAHk6Pmrb2servgqOzZtjv8G84epZHqom3RSgq6ZSRlx/S?=
 =?us-ascii?Q?h01PPJ+lmE1jDdN+2ZcECfHA09Cg2+CZGkZyMg74XuPhJMfnxY7l+d5pz+K6?=
 =?us-ascii?Q?JR91u8v0HBvSwvrXww3tZD+2aNLXTX2nQnlNAaI5udyOwXc6B+Dnf9QwTkPH?=
 =?us-ascii?Q?Jpu6VTPT5YYVAS38U2ngG+wjsHsWUlK8jp+OddXbsFah5xLT+Fpbw98STvW3?=
 =?us-ascii?Q?S5mPZD5frLtENVH1J3yJbbcQMhMj5ZD0ufJ0qlBsnCg1uLYPUIfaZonT3y77?=
 =?us-ascii?Q?IcptPHyNUUre/kNPodJuZX269O99WW8sadUH6SsFl1UHhaJZYTRuJr5vsWgT?=
 =?us-ascii?Q?L1tvHLLIM53jp95iwwt3TW8tgIkT2TWTty6v8MH7EkACjGtn+0PoBrYCogwO?=
 =?us-ascii?Q?GRatO0BMRIoMB+oh98Y8f7BMefuJ9zkig4mg59iJ9RGwmFx7P6Gw90UJzYdc?=
 =?us-ascii?Q?gdwDqcS1WElXcIlcXzp9yn51XZKlpqZhl144zDJVoZJZfOFiU14CxJuMpqYV?=
 =?us-ascii?Q?g7WbPUe2bsygqLiUklr8TmN49ARTT1F6K1kHUQ3CXi2W?=
X-Forefront-Antispam-Report:
	CIP:131.228.2.241;CTRY:FI;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:fihe3nok0734.emea.nsn-net.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6SJOvNeoJS7/LmSsMi6wRFO7OQ8JG9o8hzRJVsePEoZROU3gNebK2htt0aRHapzXCsu+ro5z2xpe1wrSMwJ0o9g2hhgXTAxgUi7JFrHHV64SiUYAa6D7PAPwG0pevMfxJ6yVx5Ju5qYRVz/PQ5QW9yg4ma8vYNaAg1MFcEIue9Ag4Ho+JRZvLaH/V3/Fv8N4uuOesIx7jnL3NTdyhJFZaDZW6P90ad3mrjCfgsT0F2Kuy+pVB4xDCgOnhcmloI32GZENaYdDbARiz+nKzqfksTKgxKAVz52wRPec+PIfVhk4IbFg1cNsXLGZzElXUF5dGE4ytyz5CmHSAFo1Ap+k5eB89B0cb+NL/JO0uWkFo1Wt6Q6PO2AAoZxxMk0TfhGEHU8url/fRQtSw+ai9ZLNaZVtv8u/Edc2NYlKBYPobWCu+V3uGUkkDZkb4YjRcU4k
X-OriginatorOrg: nokia-bell-labs.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 16:21:41.1172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d69c3b8a-f2fc-4bb1-a388-08de63405074
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5d471751-9675-428d-917b-70f44f9630b0;Ip=[131.228.2.241];Helo=[fihe3nok0734.emea.nsn-net.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6611

From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>

The existing specification that describing VIRTIO_NET_F_*_ECN and
VIRTIO_NET_HDR_GSO_ECN can be misinterpreted as reffering to the IP ECN
field. In reality, VIRTIO_NET_HDR_GSO_ECN corresponds to the TCP CWR flag
and indicates that segment offload must follow the rules defined in
RFC3168 Section 6.1.2: the first emitted segment retains the CWR flag,
and all subsequent segments must clear it.

This patch updates ECN feature descriptions and the transmit/receive
requirements to accurately reflect the intended behavior explicitly
specified in RFC3168.

For detailed requirements, see RFC3168:
https://datatracker.ietf.org/doc/html/rfc3168

Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
---
 device-types/net/description.tex | 35 +++++++++++++++++---------------
 introduction.tex                 |  3 +++
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/device-types/net/description.tex b/device-types/net/description.tex
index da9ff17..0da8f9f 100644
--- a/device-types/net/description.tex
+++ b/device-types/net/description.tex
@@ -54,7 +54,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_GUEST_TSO6 (8)] Driver can receive TSOv6.
 
-\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with ECN.
+\item[VIRTIO_NET_F_GUEST_ECN (9)] Driver can receive TSO with the CWR flag set
+    and follow the requirements of the CWR bit described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_GUEST_UFO (10)] Driver can receive UFO.
 
@@ -62,7 +64,9 @@ \subsection{Feature bits}\label{sec:Device Types / Network Device / Feature bits
 
 \item[VIRTIO_NET_F_HOST_TSO6 (12)] Device can receive TSOv6.
 
-\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with ECN.
+\item[VIRTIO_NET_F_HOST_ECN (13)] Device can receive TSO with the CWR flag set
+    and follow the requirements of the CWR bit described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
 
 \item[VIRTIO_NET_F_HOST_UFO (14)] Device can receive UFO.
 
@@ -729,9 +733,10 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
     header (ie. MSS).
 
   \item If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature,
-    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}
-    indicates that the TCP packet has the ECN bit set\footnote{This case is not handled by some older hardware, so is called out
-specifically in the protocol.}.
+    the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type} indicates that the TCP packet
+    has the CWR flag set and follows the requirements of the CWR flag described in
+    ``Section 6.1.2. The TCP Sender'' of \hyperref[intro:rfc3168]{[RFC3168]}.
+    \footnote{This case is not handled by some older hardware, so is called out specifically in the protocol.}.
    \end{itemize}
 
 \item If the driver negotiated the VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO feature and the
@@ -828,10 +833,9 @@ \subsubsection{Packet Transmission}\label{sec:Device Types / Network Device / De
 \field{gso_type} to VIRTIO_NET_HDR_GSO_UDP_L4.
 
 The driver SHOULD NOT send to the device TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
-driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which need to follow the CWR flag requirements described in ``Section 6.1.2. The TCP Sender''
+of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_HOST_ECN feature is
+negotiated, in which case the driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO is negotiated, the driver MAY set
 VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV4 bit or the VIRTIO_NET_HDR_GSO_UDP_TUNNEL_IPV6 bit
@@ -1168,9 +1172,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
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
@@ -1273,10 +1277,9 @@ \subsubsection{Processing of Incoming Packets}\label{sec:Device Types / Network
 the VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM bit in \field{flags}.
 
 The device SHOULD NOT send to the driver TCP packets requiring segmentation offload
-which have the Explicit Congestion Notification bit set, unless the
-VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
-device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in
-\field{gso_type}.
+which need to follow the CWR flag requirements described in ``Section 6.1.2. The TCP Sender''
+of \hyperref[intro:rfc3168]{[RFC3168]}, unless the VIRTIO_NET_F_GUEST_ECN feature is
+negotiated, in which case the device MUST set the VIRTIO_NET_HDR_GSO_ECN bit in \field{gso_type}.
 
 If VIRTIO_NET_F_OUT_NET_HEADER has been negotiated, the device MAY
 set the \field{outer_nh_offset} to nonzero value to indicate outer network header offset,
diff --git a/introduction.tex b/introduction.tex
index 9a9cbde..ddbad93 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -186,6 +186,9 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:UTC-SLS}\textbf{[UTC-SLS]} &
     UTC with Smoothed Leap Seconds (UTC-SLS)
 	\newline\url{https://www.cl.cam.ac.uk/~mgk25/time/utc-sls/}\\
+	\phantomsection\label{intro:rfc3168}\textbf{[RFC3168]} &
+    S. Floyd., ``The Addition of Explicit Congestion Notification (ECN) to IP'', September 2001.
+	\newline\url{http://www.ietf.org/rfc/rfc3168.txt}\\
 \end{longtable}
 
 \section{Non-Normative References}
-- 
2.34.1

