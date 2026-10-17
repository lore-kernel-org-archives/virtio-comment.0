Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010058.outbound.protection.outlook.com [40.93.198.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AD47C10D
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237621; cv=fail; b=B95UOBmwNPQ9C6ZclMP6Ck8LlDGwCMHPVsyOEAQViCGXR7a2BmajsgZn/4T1gH5zXtmaExH4w5VAOdc4Qr1hmgZx2Aa6igC7RYL0kHkEm31oos/GQZS5l/13t6jh6YbM3jM0MHYbGFCSoyaZP8rxHM6I2Q+atnJch+iF7V8mpnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237621; c=relaxed/simple;
	bh=bKemFRgyXkxaV1Q6XjI94UX+JHJMYHaS6JM/rPEBHoU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PtsszW+mSb1rYsE15F7KjeFJ4bN2bpzd+rCbSJnpIfWMwI1Dgu0LG4qwwJLVx9mnaTc3Ws//QdWuE+g+4aKbtyA8E35ScfSn/e2v2DtPBk/5px95+rfdLy1E4Pf6oZ7RUXstua45S6+JZ0Yxad3RHvhEMQWPP5smHZfsZAsjFZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Re1EG0w8; arc=fail smtp.client-ip=40.93.198.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Re1EG0w8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdLY5qnUHjPJIYdgRcmamqG04AoFdDfzBys9mjoTo4Q1Gh/d8GLDx3q/OfqUGbdRivzfPR53GFUEtnUpLyA9GhYc+SNDxUa3p1mIMTm+9Khp0wrkiOG0NsH9fTAesaHhQBi8EVoNI09FlY77YigtqjqUNqoyA9zCLCtdi89S2J82BWK/6TXcFV9jo9EUVwcNhEXiLNdqE7Csc6KRjuCYdAUDIoj8cPePHuascb3RdXV2YepiGDDpneH/GjsmEfXZm70EvHmOwrrcpRwRqZCKGBpe4X0dIA7dzQoE8CLkKsGC6p6G78dDHljUOxPPMzM0n+UJty2M4wp2/23yBpTjpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PHFuLHkPbXzjozBfHVZ0mzjXdNmWAkKQyOGOPs5xrQ=;
 b=VTTYcPLkegTETmXqpzvzDm1OC8TGHkjlp/smIhgfEaRHjDShFszUQPKNPqreCudImkP7fufiD67l5ihvQ67s6rSRNwuHGycz2ResABHC2+oi/HfY0RGgl9NMYyyOpNTvZR/EKM0O0D0eDwsslSVNE5QCkmEvP78oU8ErIV9vQ1eXY/q2kQYLAQlBEEjMp1Lv5OYjfBwPhVikMzrUFZez+ytyth9LjdOI1IA9oa9gBhpUgCw0bN2EY/cEGklX108aXzjhTrqgEi/KVSCxCrvgCYerz+eKRUqzjd9PS5Xl+zRC+Pwr8FhW2gRPDVsAuniccUS3jn3uoKIMuLWf2B5t8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PHFuLHkPbXzjozBfHVZ0mzjXdNmWAkKQyOGOPs5xrQ=;
 b=Re1EG0w84SCYoOMaEM1HdUho252mrHkJyGLEl2q8v5GCG71oWjoNrZibSU8/ukIME8Gx7Eco67FX52m8iMsVPBXgVe2TtpYVjJCa3SN7/hkpQYE8RVnH8L2AAFisPqYTlGTHoD6Mu3+2Mu2EfSboUcB07A57H4O+INIImmSz8JOPyuJuJ2dFLs9iSA9RthgZPMXLqDf7azQOmJ+BhrY3CmFeCvsqmpGvEAd/EMo4mwAdemZ9H5qpGHgvkKzRCDAaoPZFipuASXYUQ1gGegOf+8wiJ7WC2ZeZPb6+V4s8a61qcAVcOyxCLuef4k61EqTNfb5Ti5P91Nv12B6ElckrXQ==
Received: from SJ0PR03CA0211.namprd03.prod.outlook.com (2603:10b6:a03:39f::6)
 by CYYPR12MB9016.namprd12.prod.outlook.com (2603:10b6:930:c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Sat, 17 Oct
 2026 11:46:45 +0000
Received: from CO1PEPF00018865.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::85) by SJ0PR03CA0211.outlook.office365.com
 (2603:10b6:a03:39f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 11:46:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018865.mail.protection.outlook.com (10.167.249.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:31 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:28 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 3/6] transport-mmio: Remove ADMIN_VQ from features reserved for future use
Date: Sat, 17 Oct 2026 14:45:53 +0300
Message-ID: <20261017114556.1701355-4-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018865:EE_|CYYPR12MB9016:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f069db1-ba08-417a-0d54-08df2c4451f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|11063799006|22082099003|18002099003|10067099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	hIs3mAfaSvHHTMYesoPB6dGplKtfCGmwvnBoZRwy1NosKPuP4uw4+P97e1Ov5gmb0g4E9RUY0nMJuQMSwJi5biH2fc+b5MU1B7Ei8nTKl8lYtd1Qoj+qf2S3MOB1KMLGManXBRTur7Y57wxxkvgkrYL0gdIpD/a+AwmPL30EkNtI5GIHlVjPg73e0LdFufQQLdE7k7TxIG5MqsXkwuzwMlGk4QnSrXsoWm9XdyJAyKEgZHUNxj5EMVu703z59Ia7HPq0Ks32N/VRyM43ePGuQzcXqDEGIKkn43XphefKPkie4B2MN7muKo2agunPc5NMSgEBlVB33H+dUNj1n1iHPS6pyeoyW7MQ44a47NJemFP3Z5yAvsiIqiiJUbA0anM6boqhXCpznHfYjQrvfA+cvvctfVPuDa1qJ3JiXFglb5dqUnoL9nG2VUiDvWUMaycsIYplvW8pkjp193UUZGaMwjtFurd27QGg5q/r+uIRQwtaFGeSQGGdiNfZOsjRBjODbP8KlcFFZM9xfCjQwLXahxe+DgGsQ89kpIYlRSybf4eWzkKaGq745kX4mcPkJWcIDKkjeZE8hx1ylw+bezaOoRy5/LE908M8H7159jrcSs966NefHxDRmesNldI4jPfnn36n13WBh6M+bmo6/+yjHVsGfziX0yTq/O8H32EizfpJ+4Z2oHK4kzuJjK8ED/hV4DfPQQ6WPgmiMkx3zg3J4Q==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vaYqMMGAplze7G7WTQZZNkI/ImC4jOrT/sgQ5i3y1t+aKRnyc3dSlfVjHTn1hXXai9gKd9O5qKSkHzd5iBeWr6i4ZLNPMmb8HgtyM/fSSEuD7dsgfPCFJ/90/Vi2mkJBzvnOy6Rm/Ggh0OO/C7u7ZsP6OTRVPtWrC8afCdp5OqKmiLIDozNL9RspZHEI65Or1coT7PAOolkUt5MkXTeC8FXCAQbfPQXsgYX8rINLU7ux7FYMS41SOThYObo9hKelgb+zpPBZlS9Hmcgj+AtbpKnwiPaCQxpri6Kdly4kok03JBmabL4m5u1NslXaISehiE/mtc5DUtm5fGGJkkKbeS0sOxSqOwv5Wa1YpFMYexU1gvk1Jk3YkjPV4Z6tXsrieY9BQgL0xQvDNdPR6jO+oFO7lae9Yp0JHrC+HKUEwAw7mggw+u51DNbtIyFYKeQ9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:45.3104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f069db1-ba08-417a-0d54-08df2c4451f8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018865.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB9016

Commit a9a59f70be46 ("mmio: document ADMIN_VQ as reserved") listed
VIRTIO_F_ADMIN_VQ as reserved for devices and drivers using the MMIO
transport, because MMIO had no registers to expose administration
virtqueues.

Now that the MMIO transport defines AdminQueueIndex and AdminQueueNum,
VIRTIO_F_ADMIN_VQ is no longer reserved for MMIO. Remove it from the
MMIO list of features reserved for future use; as it was the only
entry, remove the whole section.

Also update the VIRTIO_F_ADMIN_VQ description to state that the feature
is supported for both the PCI and the MMIO transports, and remains
reserved for other transports.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 content.tex        |  3 +++
 transport-mmio.tex | 12 ------------
 2 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/content.tex b/content.tex
index 243ce2d..3af0b30 100644
--- a/content.tex
+++ b/content.tex
@@ -935,6 +935,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
   At the moment this feature is only supported for devices using
   \ref{sec:Virtio Transport Options / Virtio Over PCI
 	  Bus}~\nameref{sec:Virtio Transport Options / Virtio Over PCI Bus}
+	  or
+  \ref{sec:Virtio Transport Options / Virtio Over
+	  MMIO}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO}
 	  as the transport and is reserved for future use for
 	  devices using other transports (see
 	  \ref{drivernormative:Basic Facilities of a Virtio Device / Feature Bits}
diff --git a/transport-mmio.tex b/transport-mmio.tex
index 3c5aa6b..c537e85 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -664,15 +664,3 @@ \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over M
 \end{enumerate}
 
 Notification mechanisms did not change.
-
-\subsection{Features reserved for future use}\label{sec:Virtio Transport Options / Virtio Over MMIO / Features reserved for future use}
-
-Devices and drivers utilizing Virtio Over MMIO
-do not support the following features:
-\begin{itemize}
-
-\item VIRTIO_F_ADMIN_VQ
-
-\end{itemize}
-
-These features are reserved for future use.
-- 
2.43.0

