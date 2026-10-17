Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011054.outbound.protection.outlook.com [40.93.194.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9589A48380C
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237626; cv=fail; b=c477ZvDf1YqIUIuPZq79FkFhjWJ/VRxnEoEDuMseufNlbEZc7ajDbaoD0256EId0aibpCVDPg8OK3shyhrx6qpJjcHefG86FiTHJo7R2Mghr7evZC89/077BWGkwkUhuX9gVM/wXz2pxzpT6QYRDS0Fxw1h3OdwBpaJqK/cyj8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237626; c=relaxed/simple;
	bh=XYYczn5GCmIMoIiU8oOGR9NRZPM4xa3Z9Tya4y+wm6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YsX9G1fvd0iNnPvQ/Ka3jnStSw8B1g1SrtCdz+eGJzrKKMKk1iTzmi8w//azuP+JoxcDT9NQ/fM2AjgiaZerpCJxmQLEZnX8WUWTLbtbtnSaglpRP4OMbyeUHevKi1Q8GLEoxe2VpCvxh6XB7n56x1RfDwYY+vWNHFO7y5bbIE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oZF6qrY4; arc=fail smtp.client-ip=40.93.194.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oZF6qrY4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sa5tagyjaoBtWjeKoeRuk6dz2W7QVvpxs6GOoEywRtaWXBL+K6gYdg8EafcfYFpGmydbZ9L+P6/KKEL8WTdqU6GSOXzKEhp20cD9BhGgSjev0X1m4VhPKB04EajH4o5h6kQmdCX/32haSQ0z9+rk1aCCwNDI0Px89/c8MDx6aBLvfDNQ6f/4gKAKNC3Iosy98OsydOXAKIOPsdK4MprW4jd0LZP1cHNNnFyUMX5GDSYdoDnmnN/Esv8L8mMywqN8u85wBdEPY7lI4x1X1jTkJaXpSQw3zqIlgDYr2T92fuR8KELG1xsghDHeBstZTB0YM4oj/sH/P3Py+/kqOPNwyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvbG57wTf5bAI1pr7d1MC7rV6gLY1lmPPpzuooF48+g=;
 b=metFIF4AyVxRLIOStc50xF/WIic9JlJWifDl2RAuDHQPOB82icU2m+blliuYJMj1jZU8cjy5BFsYvOBQwLlw1SXpkoMAnsLiTK8hTHFpMyHi+lt6dPq7qJonb03YuSChF1eGTsP2zf/ZHTEp5mD4N2Wi1X08Xb50VLPZaOw0uk0BirStlX9i7lqewwKYApYf5/yZxkNysji9+5ipt24OFacsQYM2/uL7P9SWzbWiWRizigvHzgQjiFKK4XFwo8zFHRTGEZIgPsvCf6VOneqwt6B5wpGGUg2yIpA1oViDuwdTYOyUcepxkM/Ij8H+utivDb6KnHn8gMH+vjzh5mEPuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvbG57wTf5bAI1pr7d1MC7rV6gLY1lmPPpzuooF48+g=;
 b=oZF6qrY4bJmMKpZoG9p6/ztx7Z6ygQfPE/0jh4t9E6ZO/98Vc2f8qTqWQhToGg9IhqN6A08kBvydr0Py1eRD6hRaOCCIiYGAaHHskLtYRQ9S471SS9DpGAftM9JGIRu5ycaf1zjFsIbxY4u9X8C6dgYUBNptkHzLVgGcdiM1EQZ38hN1wYP+RaT96qbd6wUlB5xPRvn0FfLfk1/UbGYDvMrlPlNwuw5Xf3DMfTGBMA15GtXZAA29Npg1IRa8VZtAqgQhcRgjIHSyan/YE8OG1gDIRfnqR2M20m/5ZymZ+9bL8zCf18KwVErzXRPkOWYbAR8YLQ7Xpc0a0EoB7MXqEQ==
Received: from BY5PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:1d0::19)
 by IA1PR12MB6284.namprd12.prod.outlook.com (2603:10b6:208:3e4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 11:46:57 +0000
Received: from CO1PEPF00018863.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::b) by BY5PR04CA0009.outlook.office365.com
 (2603:10b6:a03:1d0::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 17
 Oct 2026 11:46:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018863.mail.protection.outlook.com (10.167.249.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:39 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:36 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 6/6] transport-mmio: Add administration virtqueue requirements
Date: Sat, 17 Oct 2026 14:45:56 +0300
Message-ID: <20261017114556.1701355-7-parav@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017114556.1701355-1-parav@nvidia.com>
References: <20261017114556.1701355-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018863:EE_|IA1PR12MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: b4244ee3-5649-49fd-7d84-08df2c44586b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|56012099006|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	vMerp0kzrXAP4QJPGEayHEQUeqqBDd5tQu6S5MtWcwl9Ll4bFLBLWL2aAd82IINOit+cJJlLC6uLygU2KU/C5yAIDIgvRgL1kI6+TnlEPFfMZTgruTwb80Kkg++dZ8Z30mDzCBTIEdENXYZzNH7hyG3Jxo6uKkN/ei1cURAOrOb0qvSGnZNTNC7SQljNeghCvney2E1iX+a9IG+peq45z523gKQS+zj4JP8jySqN0hPXhgY32Q2m+1cDY7+iw5LCPj95Tp0H2vTOim0v5rLmlqvT8LoXX7XV/Q9T/b9tt3iC0P5QY4WW1gGEQaPbSEXo7AICBWw/TtTQaRDSqPS8ZfVWy3dthlBtC8Np2gdiiTI/dNt2NKabq4ey95nI0cYsgQ7DJL+qSApxRE1hXcVh7nQ1ucbKVqxlDtGVAn7UPJkJporUDDkYSbkS8zgakr6xhY3AF2R1woTRnvsqyg0v87UwbFW68k49jcUUG1QfmbxDUyCf+IkjP60LxWQ+JKNaygfM2j0sr6JQOte47DmUQBARbaJof2ahczz7Up6VX+2smPzejPp5QATSPVHr9E1PVFMODUomjdqH3fV+ssi6v0RicjPMO2heH6s4ah7LHxWqAALsYcvnD9Pyb6OTTTuVIJtwuCVMuqF4t6z+pIyqcda7tpNpdyvCbbvPu0NP2l5dzQ4fKh+/zYs+ZG0tIP8YGdkUbswkr73cEukZjdTHWg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wL4oYqtE0Y25vMs4tN0JOQiqbCv7JUzpXICStO5Ti8G4SkdULnx02WhgqwWyWgqKolWX6R+SjfA9z0i8ldPcrS/HqtHOtkcInvMx11Z/D5SXJHYVt48y6PfF3txUrYGE/WW3u8/3cr5olkBMistvxiogotFbzzZ8rw48PpzlidxmOMsnkcg03lfQh0gm/SeXVD9JYfAjs39+Hiw0YjRbxxyHZ4S77K+V6MCH7/Tcy/MreVli/ejt0a20ju2WtWIpOUI8nBTvy4btby+Bbr+/aklGY5zgXhyf9C02fn8LzVGn+AyMjMLYDGEd5RCbpOUu/0nmpaWNfDJ/OljWSgubUcrSfKEa1LkvKemTtA+oOtrS3XSRHneHE7aQ6ve8seRmY7iDZhAo5BubWf/G+7cGvETVtwZHMGGN/ZzalcgsCpUwVibZHmWrcVdDxO3j69eO
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:56.1034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4244ee3-5649-49fd-7d84-08df2c44586b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018863.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6284

Add device and driver normative statements for administration
virtqueues over the MMIO transport, and reference them from the MMIO
device and driver conformance clauses.

Device requirements:
- AdminQueueIndex is beyond all other virtqueues.

Driver requirements:
- AdminQueueIndex and AdminQueueNum are only accessed when
  VIRTIO_F_ADMIN_VQ has been negotiated, so that drivers never read
  these registers on devices which do not implement them.
- Administration virtqueues are configured only within the reported
  range; the driver may use fewer than supported, same as for PCI.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 conformance.tex    |  2 ++
 transport-mmio.tex | 20 ++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/conformance.tex b/conformance.tex
index 9af31e2..b1dd83a 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -132,6 +132,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \item \ref{drivernormative:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
 \item \ref{drivernormative:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Device Initialization}
 \item \ref{drivernormative:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Notifications From The Device}
+\item \ref{drivernormative:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
 \end{itemize}
 
 \conformance{\subsection}{Channel I/O Driver Conformance}\label{sec:Conformance / Driver Conformance / Channel I/O Driver Conformance}
@@ -224,6 +225,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 
 \begin{itemize}
 \item \ref{devicenormative:Virtio Transport Options / Virtio Over MMIO / MMIO Device Register Layout}
+\item \ref{devicenormative:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
 \end{itemize}
 
 \conformance{\subsection}{Channel I/O Device Conformance}\label{sec:Conformance / Device Conformance / Channel I/O Device Conformance}
diff --git a/transport-mmio.tex b/transport-mmio.tex
index c537e85..40fda97 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -510,6 +510,26 @@ \subsubsection{Administration Virtqueues}\label{sec:Virtio Transport Options / V
    \ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}.
 \end{enumerate}
 
+\devicenormative{\paragraph}{Administration Virtqueues}{Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
+
+If VIRTIO_F_ADMIN_VQ has been negotiated, the device MUST present
+in \field{AdminQueueIndex} a value which is bigger than the index of
+any virtqueue of the device that is not an administration virtqueue.
+
+\drivernormative{\paragraph}{Administration Virtqueues}{Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
+
+The driver MUST NOT access \field{AdminQueueIndex} and
+\field{AdminQueueNum} unless VIRTIO_F_ADMIN_VQ has been negotiated.
+
+If VIRTIO_F_ADMIN_VQ has been negotiated, and if the driver
+configures any administration virtqueues, the driver MUST
+configure the administration virtqueues using the index
+in the range \field{AdminQueueIndex} to
+\field{AdminQueueIndex} + \field{AdminQueueNum} - 1 inclusive.
+
+The driver MAY configure fewer administration virtqueues than
+supported by the device.
+
 \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}
 
 The legacy MMIO transport used page-based addressing, resulting
-- 
2.43.0

