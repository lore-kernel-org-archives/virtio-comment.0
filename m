Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010007.outbound.protection.outlook.com [52.101.85.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA947F2F9
	for <virtio-comment@lists.linux.dev>; Sat, 17 Oct 2026 11:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237605; cv=fail; b=hcuDpxHqDKEQF32X82YjnAb8fN+YlItili6cVG9s+Mfyflb3u9Un3AQ5ynAKm09C3CEQbo6j/eiWRpWyixZkz5C3eviUHZfzNg6a1vXekdlEw/SlvvTUWKjN8uZRHeuq6qwOpbAtqYHBOQFpg7WJ810LZpgjvIHQQVXUINH1kn0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237605; c=relaxed/simple;
	bh=MqibzXH0RG6KhZfGe99YDSB0JtkBpEcHwmE8yYUqk6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g+FGwEmDuc+QB/OkBXfddrg8h85XOtMH++MAkEPSrMURyvUWMivamVIRV4n7QUDn8BcVlDysdHNRcr2iasiDaPGlDWmhz6kn5J9hq80GNhOq0OR1hcmp1p2cmqiLf8EqWZVIR34tR2nev3X6cxxil2iZsE88GWiybMZeqSOO+ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PsKxqJ6l; arc=fail smtp.client-ip=52.101.85.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PsKxqJ6l"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SLrwK96GD0iwVyj1nOuHc5Xp7Fhn2LDyNIuhd9FfJJhF9pDHIccCs96scCvDHS+oiP7vxK0LpWgK6QTM9g/fvj/u5VUIKnyfrKYNCxdN5fYIOUJp3jjiOISmtVEGqIDcjI7uAqIO92Pc35SNJ1ZnNtRKLsGz0XyjtPA5VLUh6DSPxJnWT71AkoJB7gZjhVLLUx9jSI1jq3qbib3Qxkk6mmC1YFCnHKHH0dCUY1PxWO/42CfhknPOwnUXCiUzq5O5ZUEHhn6+4CknXnfrIaLnZeYBkxYs6V/gOTLhL9zetz4WE41UYWJR1fGK5udHef6A3bKvfKId7zhGSfDc5jsJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE5sDMo3/Z02I/wTpQyRvG4GlvDHFAYR6/VrTgtGPto=;
 b=qgOwiHJGuHaFAkHWi2g+cCmzfQ8kkXSeyFSC1SBN0le/9by19Ntc9hF/fvkit3SU4mOx9ZaWlX8+OwYKQvaUnI76q3shPTVA5+yPkmUaZY24vceaZjbgShvEc+z5wOe6pd+/Cen7cyOmMCqrl5ME9u4G71Z82D4eDeYKd4DR3cRDbe13Oyj0/+1fBykSrVwW6fMsLSHcxHUMb1Ixr5s3ryZaQQXCYDdeACEu5vfK3njiqq0Fo60GvZR1smBNI8cFbtI2sdP2OxnTCsO25BzyP9gGewZcEQoKKkS+ZOppyb5dUeAXHvi1MPOAoF7wTe+CmzQGlLPCDD7r11IR4u+e9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GE5sDMo3/Z02I/wTpQyRvG4GlvDHFAYR6/VrTgtGPto=;
 b=PsKxqJ6l0AKTLOK3gmiRB9Y/HjOxtSmm4TMKraATsy59oM1MGaa/6o3GslIH4syBuTanS8oyaid7WN1vCCujB4jMilCRX2MTlWco3ir9p8B6grDQ8m37MGaiJiSOr6Cu+ieT/JBryIOOgPHwmuLw29FUg940SkaZXjosmBimtSlWFbmFtoZTEWL1wffGsi0yG+Qa0XtU9z0niQi99I4viAgZvQZePb73XlwGivqqdgB1zvXd2BXIdgwzRP/DJU0nbtYrl9i1ssmjTUK2lEEFG2E8kw66R1ggGA5xjMcxGw0CDo03kCv6DtcEH+X7Lx48MSyS0xoci5f2QnBF1axKVA==
Received: from MW4PR04CA0354.namprd04.prod.outlook.com (2603:10b6:303:8a::29)
 by PH7PR12MB6537.namprd12.prod.outlook.com (2603:10b6:510:1f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Sat, 17 Oct
 2026 11:46:39 +0000
Received: from CO1PEPF00018868.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::b) by MW4PR04CA0354.outlook.office365.com
 (2603:10b6:303:8a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.18 via Frontend Transport; Sat,
 17 Oct 2026 11:46:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF00018868.mail.protection.outlook.com (10.167.249.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 17 Oct 2026 11:46:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Sat, 17 Oct
 2026 04:46:26 -0700
Received: from mec-arch-host11.tlv01.nbulabs.nvidia.com (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 17 Oct 2026 04:46:23 -0700
From: Parav Pandit <parav@nvidia.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment
	<virtio-comment@lists.linux.dev>, Cornelia Huck <cohuck@redhat.com>
CC: Max Gurtovoy <mgurtovoy@nvidia.com>, Linlin Zhang
	<linlin.zhang@oss.qualcomm.com>, <neeraj.soni@oss.qualcomm.com>, "Stefan
 Hajnoczi" <stefanha@redhat.com>, Parav Pandit <parav@nvidia.com>
Subject: [PATCH 1/6] transport-mmio: Introduce administration virtqueues
Date: Sat, 17 Oct 2026 14:45:51 +0300
Message-ID: <20261017114556.1701355-2-parav@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00018868:EE_|PH7PR12MB6537:EE_
X-MS-Office365-Filtering-Correlation-Id: 55680adc-f7fd-4ff7-8375-08df2c444e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|6133799003|10067099003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	FAcb2QrzOd3jegxtYsqG/LFap+sjVncxc8Rpwp5LDVWGEfZX6u8Ep6ZvvFu/vYdRVed8l/t6fSRh4FIM0GwNP7sbeXu4MJrNSdsD/nD4e5+Uut/b5V/0LWQGB+Xo10tvYti56FUgqtZwVqHvBKEv+tXujOG1ilbquG/zhPSDW0Q379tv6FzRE/aF/uI22QZnj6PiUB6t7wfMz/BosJzlrSQUyp82rxAACgiBx5j/goL6tWXxImcsVslJyjwgjZaczRtVCDhYmlMiox+mX1Cu+8J3vy8UpyS9lZxHUMjfDXInx5DB/iHkYVVVGm/mSlNu30z62/EvCD+dsTxjG2gXopMzUcSobkA12q0Jgw7aLefibSgFf8QdJCQH/uf4t6iCKtCastEAQ3p1uQYKGTwXK98Nf3Xr2bquk8htbLKWvgaRqEwjIIeCByQFijMP/uuXuTOjKVTE1zQv56LpP1NCYKCwNBx3lqQF1ZVW6Vhvv6LELlGn3P7GvLWjKRgVFqKMnqXmwjdQDZyGmj2JczXiMdO+LqQ0UUKPA3Pt0E8hDqp6zPIQM4nKMeg1sWBfjbh2qeF42jI0Spp5VTbouHCsOeozY04yo+SW38eppf31919no6dXeJZ2xOXvwuJ+GOgZ4doLRwWIvZ/+w78MaczQyXGONWGAsFOFha2KE+aSO8D3If402i4zfHVGhNJdyqexNCfgZcmshkHJCxCDolQQrA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(6133799003)(10067099003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ha9OWLCvvbYfCPj9hUmhpHK/DpBBpL3AyZFbSVGKcRW905t3eK1ShQEPkOdrgnNjLpLUWlRnPG/4JxnxX4KgcIqevclVbQCjq8lEl5RcxR/Tv8HiX3OaIaQt3at3+ofhLVnkvdqv7ka+XlnKXSvOk1z6/g9/WoVP31iRUwJqChKPFHokZoeXPCzY1fdlKH1TKqLDGr7g+h6+9Bfo6BZ6TOymcFnPR0vURU0lbwdI7fZ6jZLY2XcL4RX4g2rQ21DOO7nwCx0piB+EQADDbEBuPpy8YAQwPEYBvBX/ncXME+Vz4mDYgvQ0Us85Xv8CshiC6ColvtpeTCNNHhaCbGiJTjd4Nb9TKiVOLihd4mBt0qDWRrafPH33L4P2EWszSD2maT0vBImYqDEfPDv9LQq38sjeT1u9/LG5tXCml5Q5iZCi1S9DJyR1cZ7pmM23AEl5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2026 11:46:38.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55680adc-f7fd-4ff7-8375-08df2c444e0b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018868.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6537

Administration virtqueues and group administration commands are
defined in a transport independent way, but so far only the PCI
transport describes how a device exposes administration virtqueues.

As the first step towards supporting them over MMIO, describe how
administration virtqueues fit into the MMIO transport: they are
regular virtqueues identified by an index, which are configured,
enabled, reset and notified like any other virtqueue, and which occupy
a contiguous range of indices beyond all other virtqueues.

Only the Self group type is applicable to the MMIO transport; state
this explicitly.

Subsequent patches add the registers to discover the administration
virtqueues and the related requirements.

Signed-off-by: Parav Pandit <parav@nvidia.com>
---
 transport-mmio.tex | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/transport-mmio.tex b/transport-mmio.tex
index cddbcc9..e015bd7 100644
--- a/transport-mmio.tex
+++ b/transport-mmio.tex
@@ -446,6 +446,27 @@ \subsubsection{Notifications From The Device}\label{sec:Virtio Transport Options
 it by writing a bit mask corresponding to the handled events to the
 InterruptACK register.
 
+\subsubsection{Administration Virtqueues}\label{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Administration Virtqueues}
+
+A memory mapped virtio device can expose one or more administration
+virtqueues (see
+\ref{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}~\nameref{sec:Basic Facilities of a Virtio Device / Administration Virtqueues}),
+which the driver uses to submit group administration commands (see
+\ref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands}~\nameref{sec:Basic Facilities of a Virtio Device / Device groups / Group administration commands}).
+
+Only group administration commands of the Self group type are
+applicable to a memory mapped virtio device.
+
+An administration virtqueue is a virtqueue like any other: it is
+identified by its virtqueue index and
+the driver configures, enables, resets and notifies it using the same
+registers and procedures as for any other virtqueue of the device, see
+\ref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}~\nameref{sec:Virtio Transport Options / Virtio Over MMIO / MMIO-specific Initialization And Device Operation / Virtqueue Configuration}.
+
+The device reports a contiguous range of administration virtqueues.
+This range is located beyond the indices of all other virtqueues of
+the device.
+
 \subsection{Legacy interface}\label{sec:Virtio Transport Options / Virtio Over MMIO / Legacy interface}
 
 The legacy MMIO transport used page-based addressing, resulting
-- 
2.43.0

